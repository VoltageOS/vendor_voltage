# VoltageOS packages
PRODUCT_PACKAGES += \
    SimpleDeviceConfig \
    Covers \
    Etar \
    ThemePicker \
    ThemesStub \
    Jellyfish \
    LogViewer \
    Gramophone \
    VoltageCrimson \
    GameSpace \
    VoltageSetupWizard \
    Seedvault \
    Datura \
    ExactCalculator \
    Glimpse \
    LMOFreeform \
    LMOFreeformSidebar \
    OmniJaws \
    AppCompatConfig \
    AppDataBackup

ifeq ($(VOLTAGE_BUILD_TYPE),OFFICIAL)
    PRODUCT_PACKAGES += \
        Updater
endif

ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

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
    mkfs.exfat

# VoltageOS UDFPS animations
ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    UdfpsIcons \
    UdfpsAnimations
endif
