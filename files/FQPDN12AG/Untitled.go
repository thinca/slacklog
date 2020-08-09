rv := reflect.ValueOf(v)
if rv.Type().ConvertibleTo(mapType) {
	converted, _ := rv.Convert(mapType).Interface().(map[string]interface{})
	// TODO: work with `converted`
}