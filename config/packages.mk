# VoltageOS packages
PRODUCT_PACKAGES += \
    Covers \
    Eleven \
    Etar \
    ThemePicker \
    ThemesStub

# VoltageOS packages
#PRODUCT_PACKAGES += \
    # GameSpace \
    # OmniJaws \
    # ParallelSpace \
    # SetupWizard \
    # Seedvault \
    # WeatherIcons \

#ifeq ($(VOLTAGE_BUILD_TYPE), OFFICIAL)
#    PRODUCT_PACKAGES += \
#	Updater
#endif

# Browser
PRODUCT_PACKAGES += \
    Jellyfish

# Camera
ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Flash
endif

# BtHelper
#PRODUCT_PACKAGES += \
#    BtHelper

# VoltageOS UDFPS icon animations
#EXTRA_UDFPS_ANIMATIONS ?= false
#ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
#PRODUCT_PACKAGES += \
#    UdfpsResources
#endif

# Extra tools in Voltage
PRODUCT_PACKAGES += \
    awk \
    bzip2 \
    curl \
    getcap \
    libsepol \
    setcap \

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mke2fs \
    mkfs.exfat \
