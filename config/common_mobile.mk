# Inherit common mobile Voltage stuff
$(call inherit-product, vendor/voltage/config/common.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    ExactCalculator \

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet
