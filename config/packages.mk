# VoltageOS packages
PRODUCT_PACKAGES += \
    Covers \
    Terminal \
    Eleven \
    Etar \
    ThemePicker \
    OmniJaws \
    WeatherIcons \
    ThemesStub \
    GameSpace \
    ParallelSpace \
    SetupWizard \
    Seedvault

ifeq ($(VOLTAGE_BUILD_TYPE), OFFICIAL)
    PRODUCT_PACKAGES += \
	Updater
endif

# Combined icons
PRODUCT_PACKAGES += \
    CombinedIconsOverlay

# Smartcookieweb
SMARTCOOKIEWEB ?= true
ifeq ($(strip $(SMARTCOOKIEWEB)),true)
     PRODUCT_PACKAGES += \
         SmartCookieWeb
endif

# Graphene Apps
ifeq ($(GrapheneApps),true)
     PRODUCT_PACKAGES += \
         Apps
endif

# Camera
ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Flash
endif

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

# VoltageOS UDFPS icon animations
EXTRA_UDFPS_ANIMATIONS ?= false
ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    UdfpsResources
endif

# Extra tools in Voltage
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# turbo
PRODUCT_PACKAGES += \
    Turbo

# rsync
PRODUCT_PACKAGES += \
    rsync
