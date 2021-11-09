# Copyright (C) 2020 The Proton AOSP Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Include Android 9 Material sounds instead of default AOSP ones
$(call inherit-product, frameworks/base/data/sounds/AudioPackage14.mk)

# 2019 Material product sounds (CC-BY 4.0)
# Source:  https://material.io/design/sound/sound-resources.html
LOCAL_PATH := vendor/voltage/audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/alarms/material_gentle.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/material_gentle.ogg \
    $(LOCAL_PATH)/notifications/material_ambient.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_ambient.ogg \
    $(LOCAL_PATH)/notifications/material_decorative_1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_decorative_1.ogg \
    $(LOCAL_PATH)/notifications/material_decorative_2.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_decorative_2.ogg \
    $(LOCAL_PATH)/notifications/material_decorative-celebration_1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_decorative-celebration_1.ogg \
    $(LOCAL_PATH)/notifications/material_decorative-celebration_2.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_decorative-celebration_2.ogg \
    $(LOCAL_PATH)/notifications/material_decorative-celebration_3.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_decorative-celebration_3.ogg \
    $(LOCAL_PATH)/notifications/material_high-intensity-alert.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_high-intensity-alert.ogg \
    $(LOCAL_PATH)/notifications/material_high-intensity.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_high-intensity.ogg \
    $(LOCAL_PATH)/notifications/material_simple_1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_simple_1.ogg \
    $(LOCAL_PATH)/notifications/material_simple_2.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_simple_2.ogg \
    $(LOCAL_PATH)/notifications/material_simple-alert.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_simple-alert.ogg \
    $(LOCAL_PATH)/notifications/material_simple-celebration_1.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_simple-celebration_1.ogg \
    $(LOCAL_PATH)/notifications/material_simple-celebration_2.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_simple-celebration_2.ogg \
    $(LOCAL_PATH)/notifications/material_simple-celebration_3.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/material_simple-celebration_3.ogg \
    $(LOCAL_PATH)/ringtones/material_minimal.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/material_minimal.ogg \

# Plasma Mobile sounds (mixed CC0 / CC BY 4.0 / CC BY-SA 4.0)
# Source: https://invent.kde.org/devinlin/plasma-mobile-sounds/-/tree/master
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/notifications/plasma-mobile_awaken.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/plasma-mobile_awaken.ogg \
    $(LOCAL_PATH)/notifications/plasma-mobile_blip.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/plasma-mobile_blip.ogg \
    $(LOCAL_PATH)/notifications/plasma-mobile_doorbell.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/plasma-mobile_doorbell.ogg \
    $(LOCAL_PATH)/notifications/plasma-mobile_pointed.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/plasma-mobile_pointed.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_arp.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_arp.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_crunch.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_crunch.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_elevated.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_elevated.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_errand.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_errand.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_gentle.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_gentle.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_glazed.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_glazed.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_lightly.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_lightly.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_machine.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_machine.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_miniature.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_miniature.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_morning-rush.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_morning-rush.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_nightlights.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_nightlights.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_on-the-way.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_on-the-way.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_progressive.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_progressive.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_revelation.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_revelation.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_slowly.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_slowly.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_spatial.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_spatial.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_unfamiliar.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_unfamiliar.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_wink.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_wink.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_wubstep.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/plasma-mobile_wubstep.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_arp.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_arp.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_crunch.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_crunch.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_elevated.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_elevated.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_errand.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_errand.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_gentle.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_gentle.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_glazed.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_glazed.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_lightly.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_lightly.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_machine.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_machine.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_miniature.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_miniature.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_morning-rush.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_morning-rush.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_nightlights.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_nightlights.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_on-the-way.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_on-the-way.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_progressive.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_progressive.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_revelation.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_revelation.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_slowly.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_slowly.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_spatial.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_spatial.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_unfamiliar.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_unfamiliar.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_wink.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_wink.ogg \
    $(LOCAL_PATH)/alarm_ringtones/plasma-mobile_wubstep.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/plasma-mobile_wubstep.ogg \

# Use Material product sounds by default
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=material_minimal.ogg \
    ro.config.alarm_alert=material_gentle.ogg \
    ro.config.notification_sound=material_simple_1.ogg \
