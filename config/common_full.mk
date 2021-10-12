# Inherit common Voltage stuff
$(call inherit-product, vendor/voltage/config/common_mobile.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
