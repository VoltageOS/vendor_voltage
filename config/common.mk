PRODUCT_BRAND ?= VoltageOS

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    keyguard.no_require_sim=true \
    media.recorder.show_manufacturer_and_model=true \
    net.tethering.noprovisioning=true \
    persist.sys.disable_rescue=true \
    ro.carrier=unknown \
    ro.com.android.dataroaming=false \
    ro.opa.eligible_device=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.storage_manager.enabled=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google

else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Exclude repos from bp scanning
PRODUCT_SOURCE_ROOT_DIRS += -kernel/platform
PRODUCT_SOURCE_ROOT_DIRS += -prebuilts/misc/protobuf_vendorcompat

# Allow vendor prebuilt repos to exclude themselves from bp scanning
-include $(sort $(wildcard vendor/*/*/exclude-bp.mk))

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1

# Disable extra StrictMode features on all non-engineering builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.strictmode.disable=true

# Disable debug and verbose logging by default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += log.tag=I
endif

# Disable default frame rate limit for games
PRODUCT_PRODUCT_PROPERTIES += \
    debug.graphics.game_default_frame_rate.disabled=true

# Enable Material Design 3 Expressive
PRODUCT_PRODUCT_PROPERTIES += is_expressive_design_enabled=true

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/voltage/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/voltage/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/voltage/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/voltage/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/voltage/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/voltage/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# Enable blur
TARGET_ENABLE_BLUR ?= true
ifeq ($(TARGET_ENABLE_BLUR),true)
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=true \
    persist.sysui.disableBlur=false \
    ro.surface_flinger.supports_background_blur=1
else
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=false \
    persist.sysui.disableBlur=true \
    ro.surface_flinger.supports_background_blur=0
endif

# Pixel features and C2S
PRODUCT_COPY_FILES += \
    vendor/voltage/prebuilt/common/etc/sysconfig/pixel_features.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_features.xml \
    vendor/voltage/prebuilt/common/etc/sysconfig/contextual_search.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/contextual_search.xml \
    vendor/voltage/prebuilt/common/etc/sysconfig/nga.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/nga.xml

# Copy all VOLTAGE-specific init rc files
$(foreach f,$(wildcard vendor/voltage/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Privapp permissions
PRODUCT_COPY_FILES += \
    vendor/voltage/config/permissions/privapp-permissions-custom.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-custom.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    vendor/voltage/prebuilt/google/etc/permissions/privapp-permissions-googleapps-turbo.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-googleapps-turbo.xml

# Credential storage
PRODUCT_PACKAGES += \
    android.software.credentials.prebuilt.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/Vendor_045e_Product_0719.kl

# Component overrides
PRODUCT_PACKAGES += \
    voltage-component-overrides.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.freeform_window_management.xml

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= $(TARGET_SUPPORTS_64_BIT_APPS)

ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlock

# Silence noisy Megvii face unlock logging
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    log.tag.mgulk=S

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Speed profile services and wifi-service to reduce RAM and storage
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false
WITH_DEXPREOPT_DEBUG_INFO := false

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Require all requested packages to exist
$(call enforce-product-packages-exist-internal,$(wildcard device/*/$(VOLTAGE_BUILD)/$(TARGET_PRODUCT).mk),product_manifest.xml)

# Enable whole-program R8 Java optimizations for SystemUI and system_server,
# but also allow explicit overriding for testing and development.
SYSTEM_OPTIMIZE_JAVA ?= true
SYSTEMUI_OPTIMIZE_JAVA ?= true
FULL_SYSTEM_OPTIMIZE_JAVA ?= true

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# These packages are excluded from user builds
PRODUCT_PACKAGES_DEBUG += \
    procmem

# Dex/ART optimization
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings \
    Launcher3QuickStep \
    SystemUI

PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.boot=verify \
    pm.dexopt.first-boot=quicken \
    pm.dexopt.install=speed-profile \
    pm.dexopt.bg-dexopt=everything

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.ab-ota=quicken
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.systemuicompilerfilter=speed

# Non-RRO overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/voltage/overlay/no-rro
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/voltage/overlay/common \
    vendor/voltage/overlay/no-rro

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/fsck.ntfs \
    system/bin/mkfs.ntfs \
    system/bin/mount.ntfs \
    system/%/libfuse-lite.so \
    system/%/libntfs-3g.so

# FRP
PRODUCT_COPY_FILES += \
    vendor/voltage/prebuilt/common/bin/wipe-frp.sh:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/wipe-frp

# Themes
PRODUCT_PACKAGES += \
    AndroidBlackThemeOverlay

# RRO overlays
PRODUCT_PACKAGES += \
    DocumentsUIOverlay \
    NetworkStackOverlay \
    PermissionControllerOverlay

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.theme=glif_expressive \
    setupwizard.feature.day_night_mode_enabled=true

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/voltage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-voltage-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-voltage-product.xml

# Versioning
include vendor/voltage/config/version.mk

# Private keys
ifeq ($(VOLTAGE_BUILD_TYPE),OFFICIAL)
include vendor/voltage-priv/keys/keys.mk
else
-include vendor/voltage-priv/keys/keys.mk
endif

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip \
    bootanimation-dark.zip

# Lineage interfaces
PRODUCT_PACKAGES += \
    framework_compatibility_matrix.lineage.xml

# Fonts
$(call inherit-product, vendor/voltage/fonts/fonts.mk)

# Inherit SystemUI Clocks if they exist
$(call inherit-product-if-exists, vendor/SystemUIClocks/vendor/vendor-vendor.mk)

# Audio
$(call inherit-product, vendor/voltage/audio/audio.mk)

# Charger
PRODUCT_PACKAGES += \
    custom_charger_animation \
    custom_charger_animation_vendor

# Include extra packages
include vendor/voltage/config/packages.mk
