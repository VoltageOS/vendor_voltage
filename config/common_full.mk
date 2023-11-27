# Inherit common Voltage stuff
$(call inherit-product, vendor/voltage/config/common_mobile.mk)

PRODUCT_SIZE := full

ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif
