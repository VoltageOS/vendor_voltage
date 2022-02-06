TARGET_BOOT_ANIMATION_RES ?= undefined

ifeq ($(TARGET_BOOT_ANIMATION_RES),1280)
     PRODUCT_COPY_FILES += vendor/voltage/bootanimation/1280.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1920)
     PRODUCT_COPY_FILES += vendor/voltage/bootanimation/1920.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1280-48)
     PRODUCT_COPY_FILES += vendor/voltage/bootanimation/1280-48.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),2160)
     PRODUCT_COPY_FILES += vendor/voltage/bootanimation/2160.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),2560)
     PRODUCT_COPY_FILES += vendor/voltage/bootanimation/2560.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),undefined)
     $(warning Target bootanimation res is undefined, using 1080p bootanimation )
     PRODUCT_COPY_FILES += vendor/voltage/bootanimation/1920.zip:system/media/bootanimation.zip
else
     $(warning Defined bootanimation res is wrong, using 1080p bootanimation )
     PRODUCT_COPY_FILES += vendor/voltage/bootanimation/1920.zip:system/media/bootanimation.zip
endif
