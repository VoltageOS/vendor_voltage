package android
type Product_variables struct {
	Target_init_vendor_lib struct {
		Whole_static_libs []string
	}
	Additional_gralloc_10_usage_bits struct {
		Cppflags []string
	}
	Supports_extended_compress_format struct {
		Cflags []string
	}
}

type ProductVariables struct {
	Target_init_vendor_lib  *string `json:",omitempty"`
	Additional_gralloc_10_usage_bits  *string `json:",omitempty"`
	Supports_extended_compress_format  *bool `json:",omitempty"`
}
