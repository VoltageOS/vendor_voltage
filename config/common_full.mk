# Inherit common Voltage stuff
$(call inherit-product, vendor/voltage/config/common_mobile.mk)

PRODUCT_SIZE := full

# Include {Lato,Rubik} fonts
$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/rubik/fonts.mk)

# Fonts
PRODUCT_PACKAGES += \
    fonts_customization.xml \
    VoltageLatoFont \
    VoltageRubikFont

# Recorder
PRODUCT_PACKAGES += \
    Recorder
