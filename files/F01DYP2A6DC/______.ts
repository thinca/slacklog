import { execute, GraphQLRequest, makePromise } from "apollo-link";
import { HttpLink } from "apollo-link-http";
import fetch from "cross-fetch";
import fs from "fs";
import gql from "graphql-tag";
import { chunk, uniqWith } from "lodash";

const link = new HttpLink({
  uri: "https://api.github.com/graphql",
  headers: {
    authorization: "Bearer ****************************************",
  },
  fetch,
});

const main = async () => {
  const repos = fs
    .readFileSync("./pluginlist")
    .toString()
    .split("\n")
    .filter((line) => line !== "")
    .map((line) => {
      const [user, repo] = line.split("/");
      const alias = `${user}_${repo}`.replace(/-|\./g, "_");
      return `
        ${alias}: repository(owner: "${user}", name: "${repo}") {
          ...repository
        }
      `;
    });

  const reposArray = chunk(repos, 1000);

  const resultArray = reposArray.map(async (repos) => {
    const query = gql`
        query {
          ${repos.join("")}
        }

        fragment repository on Repository {
          nameWithOwner
          stargazerCount
          description
        }
      `;

    const operation: GraphQLRequest = {
      query,
    };

    try {
      const result = await makePromise(execute(link, operation));
      return Object.entries(result.data!)
        .filter(([_, v]) => v != null)
        .map(([_, v]) => ({
          repo: v.nameWithOwner as string,
          star: v.stargazerCount as number,
          description: v.description != null ? (v.description as string) : "",
        }));
    } catch (e) {
      console.error(e);
    }
  });

  const result = (await Promise.all(resultArray.map(async (v) => await v)))
    .flat()
    .sort((a, b) => b!.star - a!.star);

  const uniqRepos = uniqWith(result, (a, b) => a!.repo === b!.repo);
  console.log(JSON.stringify(uniqRepos));
};

main();