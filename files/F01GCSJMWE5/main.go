package main

import (
	"crypto/md5"
	"embed"
	"fmt"
	"net/http"
)

//go:embed "static"
var static embed.FS

func main() {
	server := http.Server{
		Addr:    ":1029",
		Handler: AssetHandler{static, "static"},
	}
	fmt.Println("serve")
	server.ListenAndServe()
}

type AssetHandler struct {
	Asset  embed.FS
	Prefix string
}

func (a AssetHandler) ServeHTTP(res http.ResponseWriter, req *http.Request) {
	buf, err := a.Asset.ReadFile(a.Prefix + req.RequestURI)
	if err != nil {
		fmt.Println("not found")
		res.WriteHeader(http.StatusNotFound)
		return
	}
	serverTag := fmt.Sprintf("%x", md5.Sum(buf))
	clientTag := req.Header.Get("If-None-Match")
	if serverTag == clientTag {
		fmt.Println("use cache")
		res.WriteHeader(http.StatusNotModified)
		return
	}
	fmt.Println("send asset")
	res.Header().Add("ETag", serverTag)
	res.WriteHeader(http.StatusOK)
	res.Write(buf)
}