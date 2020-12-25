export const ImgList = ({ urls }: Props) => {
  const renderItem = (url: string) => {
    return (
      <>
        <img src={url} />
      </>
    );
  };

  const renderedData = useMemo(() => {
    return (
      <List cols={4}>
        {urls.map(url => (
          renderItem(url)
        ))}
      </List>
    );
  }, [urls]);

  return (
    <div>
      {renderedData}
    </div>
  );
}
