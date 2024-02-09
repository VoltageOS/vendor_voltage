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

LOCAL_PATH := vendor/voltage/fonts

# We have to use PRODUCT_PACKAGES (together with BUILD_PREBUILT) instead of
# PRODUCT_COPY_FILES to install the font files, so that the NOTICE file can
# get installed too.

PRODUCT_PACKAGES += \
    Dosis-VF.ttf \
    Linotte.ttf \
    Fucek.ttf \
    Manrope-VF.ttf \
    OppoSans-En-Regular.ttf \
    Recursive-VF.ttf \
    OnePlusSans-Black.ttf \
    OnePlusSans-Bold.ttf \
    OnePlusSans-BlackItalic.ttf \
    OnePlusSans-BoldItalic.ttf \
    OnePlusSans-Italic.ttf \
    OnePlusSans-Light.ttf \
    OnePlusSans-LightItalic.ttf \
    OnePlusSans-Medium.ttf \
    OnePlusSans-MediumItalic.ttf \
    OnePlusSans-Regular.ttf \
    OnePlusSans-Thin.ttf \
    OnePlusSans-ThinItalic.ttf \
    SanFranciscoDisplayPro.ttf

# Register new fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Include extra addon fonts
-include vendor/voltage/fonts/extra/extra.mk
