# Inherit full common Voltage stuff
$(call inherit-product, vendor/voltage/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Voltage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/voltage/overlay/dictionaries

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

$(call inherit-product, vendor/voltage/config/telephony.mk)
