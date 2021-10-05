BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)

BUILD_SIGNATURE_KEYS := release-keys

BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(TARGET_DEVICE)/$(TARGET_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# Voltageos System Version
ADDITIONAL_BUILD_PROPERTIES += \
  ro.voltage.version=$(VOLTAGE_DISPLAY_VERSION) \
  ro.voltage.build.status=$(VOLTAGE_BUILD_TYPE) \
  ro.modversion=$(VOLTAGE_MOD_VERSION) \
  ro.voltage.build.date=$(BUILD_DATE) \
  ro.voltage.buildtype=$(VOLTAGE_BUILD_TYPE) \
  ro.voltage.fingerprint=$(VOLTAGE_FINGERPRINT) \
  ro.voltage.device=$(VOLTAGE_BUILD) \
  org.voltage.version=$(VOLTAGEVERSION)
