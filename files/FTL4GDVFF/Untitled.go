var v map[string]interface{}
var w io.Writer

zw := gzip.NewWriter(w)
err := json.NewEncoder(zw).Encode(&v)
if err != nil {
    return nil
}
zw.Close()