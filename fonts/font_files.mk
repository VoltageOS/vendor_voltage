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

# We have to use PRODUCT_PACKAGES (together with BUILD_PREBUILT) instead of
# PRODUCT_COPY_FILES to install the font files, so that the NOTICE file can
# get installed too.

PRODUCT_PACKAGES += \
    CutiveMono.ttf \
    DroidSansMono.ttf \
    Manrope-VF.ttf \
    NotoSans-Italic-VF.ttf \
    NotoSans-VF.ttf \
    Recursive-VF.ttf \
    RobotoFallback-VF.ttf \
    RobotoSystem-VF.ttf \
    Rubik-Italic-VF.ttf \
    Rubik-VF.ttf \
    FiraSans-BlackItalic.otf \
    FiraSans-Black.otf \
    FiraSans-BoldItalic.otf \
    FiraSans-Bold.otf \
    FiraSans-Italic.otf \
    FiraSans-LightItalic.otf \
    FiraSans-Light.otf \
    FiraSans-MediumItalic.otf \
    FiraSans-Medium.otf \
    FiraSans-Regular.otf \
    FiraSans-ThinItalic.otf \
    FiraSans-Thin.otf \
    HKGrotesk-BlackItalic.otf \
    HKGrotesk-Black.otf \
    HKGrotesk-BoldItalic.otf \
    HKGrotesk-Bold.otf \
    HKGrotesk-Italic.otf \
    HKGrotesk-LightItalic.otf \
    HKGrotesk-Light.otf \
    HKGrotesk-MediumItalic.otf \
    HKGrotesk-Medium.otf \
    HKGrotesk-Regular.otf \
    HKGrotesk-ThinItalic.otf \
    HKGrotesk-Thin.otf \
    Roboto-BlackItalic.ttf \
    Roboto-Black.ttf \
    Roboto-BoldItalic.ttf \
    Roboto-Bold.ttf \
    Roboto-Italic.ttf \
    Roboto-LightItalic.ttf \
    Roboto-Light.ttf \
    Roboto-MediumItalic.ttf \
    Roboto-Medium.ttf \
    Roboto-Regular.ttf \
    Roboto-ThinItalic.ttf \
    Roboto-Thin.ttf \
    SourceSans3-Italic-VF.otf \
    SourceSans3-VF.otf \
    NotoSerif-BoldItalic.ttf \
    NotoSerif-Bold.ttf \
    NotoSerif-Italic.ttf \
    NotoSerif-Regular.ttf \

# Register new fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \

# Include extra addon fonts
-include vendor/proton/fonts/extra/extra.mk
