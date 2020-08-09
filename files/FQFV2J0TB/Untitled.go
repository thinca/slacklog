var v interface{}

type wrappedMap map[string]interface{}
v = wrappedMap{}
 
// ok == false
 _, ok := v.(map[string]interface{})

mapType := reflect.TypeOf(map[string]interface{}(nil))
typ := reflect.TypeOf(v)

// true
typ.AssignableTo(mapType)

// true
typ.ConvertibleTo(mapType)