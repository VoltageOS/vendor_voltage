# Copyright (C) 2021 The Proton AOSP Project
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

LOCAL_PATH := vendor/proton/fonts

# Copy font files
include vendor/proton/fonts/font_files.mk
-include vendor/proton/fonts/extra/extra.mk

# Register custom fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \

# Overlays for UI font styles
PRODUCT_PACKAGES += \
    FontHKGroteskOverlay \
    FontManropeOverlay \
    FontNotoSansOverlay \
    FontRecursiveCasualOverlay \
    FontRecursiveLinearOverlay \
    FontRobotoOverlay \
    FontSourceSansOverlay \
    FontSourceSerifOverlay \
    FontHarmonyOSSansOverlay \
