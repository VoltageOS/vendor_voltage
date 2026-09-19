# SPDX-FileCopyrightText: 2026 VoltageOS
# SPDX-License-Identifier: Apache-2.0

SEPOLICY_MARKER_FILTER := vendor/voltage/build/sepolicy-clean/strip_markers.py
SEPOLICY_CLEAN_STAMP := $(PRODUCT_OUT)/obj/PACKAGING/voltage_sepolicy_clean.stamp

SEPOLICY_CLEAN_KNOWN_INPUTS := \
    $(TARGET_OUT_VENDOR)/etc/selinux/vendor_sepolicy.cil \
    $(TARGET_OUT_VENDOR)/etc/selinux/plat_pub_versioned.cil \
    $(TARGET_OUT_SYSTEM_EXT)/etc/selinux/system_ext_sepolicy.cil \
    $(TARGET_OUT)/etc/selinux/plat_property_contexts \
    $(TARGET_OUT_SYSTEM_EXT)/etc/selinux/system_ext_property_contexts \
    $(TARGET_OUT_PRODUCT)/etc/selinux/product_property_contexts \
    $(TARGET_OUT_VENDOR)/etc/selinux/vendor_property_contexts \
    $(TARGET_OUT_ODM)/etc/selinux/odm_property_contexts

SEPOLICY_CLEAN_DISCOVERED_INPUTS := $(wildcard \
    $(TARGET_OUT_VENDOR)/etc/selinux/*.cil \
    $(TARGET_OUT_SYSTEM_EXT)/etc/selinux/*.cil \
    $(TARGET_OUT)/etc/selinux/*contexts \
    $(TARGET_OUT_SYSTEM_EXT)/etc/selinux/*contexts \
    $(TARGET_OUT_PRODUCT)/etc/selinux/*contexts \
    $(TARGET_OUT_VENDOR)/etc/selinux/*contexts \
    $(TARGET_OUT_ODM)/etc/selinux/*contexts)

SEPOLICY_CLEAN_INPUTS := $(sort $(SEPOLICY_CLEAN_KNOWN_INPUTS) $(SEPOLICY_CLEAN_DISCOVERED_INPUTS))

$(SEPOLICY_CLEAN_STAMP): $(SEPOLICY_CLEAN_INPUTS)
	@python3 $(SEPOLICY_MARKER_FILTER) \
	    "$(TARGET_OUT_VENDOR)/etc/selinux/*.cil" \
	    "$(TARGET_OUT_SYSTEM_EXT)/etc/selinux/*.cil" \
	    "$(TARGET_OUT)/etc/selinux/*contexts" \
	    "$(TARGET_OUT_SYSTEM_EXT)/etc/selinux/*contexts" \
	    "$(TARGET_OUT_PRODUCT)/etc/selinux/*contexts" \
	    "$(TARGET_OUT_VENDOR)/etc/selinux/*contexts" \
	    "$(TARGET_OUT_ODM)/etc/selinux/*contexts"
	@mkdir -p $(dir $@) && touch $@

droidcore: $(SEPOLICY_CLEAN_STAMP)
