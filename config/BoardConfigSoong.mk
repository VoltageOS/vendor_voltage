PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += voltageVarsPlugin

SOONG_CONFIG_voltageVarsPlugin :=

define addVar
  SOONG_CONFIG_voltageVarsPlugin += $(1)
  SOONG_CONFIG_voltageVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += voltageGlobalVars
SOONG_CONFIG_voltageGlobalVars += \
    additional_gralloc_10_usage_bits \
    target_init_vendor_lib

SOONG_CONFIG_NAMESPACES += voltageQcomVars
SOONG_CONFIG_voltageQcomVars += \
    supports_extended_compress_format \
    legacy_hw_disk_encryption \
    uses_qti_camera_device

# Only create soong_namespace var if dealing with UM platforms to avoid breaking build for all other platforms
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_voltageQcomVars += \
    qcom_soong_namespace
endif

# Soong bool variables
SOONG_CONFIG_voltageQcomVars_supports_extended_compress_format := $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)
SOONG_CONFIG_voltageQcomVars_uses_qti_camera_device := $(TARGET_USES_QTI_CAMERA_DEVICE)
SOONG_CONFIG_voltageQcomVars_legacy_hw_disk_encryption := $(TARGET_LEGACY_HW_DISK_ENCRYPTION)

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init

# Soong value variables
SOONG_CONFIG_voltageGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_voltageGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
ifneq ($(filter $(UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
SOONG_CONFIG_voltageQcomVars_qcom_soong_namespace := $(QCOM_SOONG_NAMESPACE)
endif
