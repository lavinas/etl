package pkg

import (
	"math"
	"time"

	"reflect"
)

var (
	// EmptyMap is a map with no elements
	EmptyMap = map[interface{}]interface{}{
		reflect.TypeOf(int64(0)):    int64(math.MinInt64),
		reflect.TypeOf(int32(0)):    int32(math.MinInt32),
		reflect.TypeOf(int16(0)):    int16(math.MinInt16),
		reflect.TypeOf(int8(0)):     int8(math.MinInt8),
		reflect.TypeOf(int(0)):      int(math.MinInt),
		reflect.TypeOf(float64(0)):  "NaN",
		reflect.TypeOf(time.Time{}): time.Time{},
		reflect.TypeOf(""):          "",
	}
)

// IsEmpty returns true if the interface is empty
func IsEmpty(i interface{}) bool {
	if i == nil {
		return true
	}
	t := reflect.TypeOf(i)
	v := reflect.ValueOf(i)
	if t.Kind() == reflect.Ptr {
		if v.IsNil() {
			return true
		}
		t = t.Elem()
		v = v.Elem()
	}
	if u, ok := EmptyMap[t]; ok {
		if EmptyMap[t] == "NaN" {
			return math.IsNaN(v.Float())
		}
		if v.Interface() == u {
			return true
		}
	}
	return false
}

// GetEmpty
func GetEmpty(i interface{}) interface{} {
	v := reflect.TypeOf(i)
	if u, ok := EmptyMap[v]; ok {
		return u
	}
	return nil
}
