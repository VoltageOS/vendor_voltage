# VoltageOS packages
PRODUCT_PACKAGES += \
    Covers \
    Eleven \
    Etar \
    ThemePicker \
    ThemesStub \
    BatteryStatsViewer \
    GameSpace \
    OmniJaws \
    WeatherIcons \
    SetupWizard \
    Seedvault \
    ParallelSpace \
    LogViewer

ifeq ($(VOLTAGE_BUILD_TYPE), OFFICIAL)
    PRODUCT_PACKAGES += \
	Updater
endif

# Browser
PRODUCT_PACKAGES += \
    Jellyfish

# BtHelper
#PRODUCT_PACKAGES += \
#    BtHelper

# VoltageOS UDFPS animations
ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    UdfpsAnimations
endif

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
