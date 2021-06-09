#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

cd "$(dirname "$0")"

q='"'

echo '# Copyright (C) 2021 The Proton AOSP Project
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

PRODUCT_PACKAGES += \' > font_files.mk

rm -f */Android.bp

for src in */*.ttf */*.otf
do
    echo "$src"

    font_dir="$(dirname "$src")"
    src_base="$(basename "$(basename "$src" .ttf)" .otf)"
    src_name="$(basename "$src")"
    src_ext="${src##*.}"

    if [[ -f "$font_dir/product.flag" ]]; then
        product_flag="
    product_specific: true,"
    else
        product_flag=""
        src_ext="ttf"
    fi

    if [[ "$src" == *"_"* ]]; then
        # If a name was explicitly specified with an underscore, use it
        android_name="$(cut -d'_' -f2 <<< "$src_base").$src_ext"
    else
        # Use heuristics to construct a name
        android_name="$(sed -e 's/Inter/Roboto/; s/SFUIText/Roboto/; s/SourceSerif4/NotoSerif/' <<< "$src_base").$src_ext"
    fi

    if [[ ! -f "$font_dir/Android.bp" ]]; then
        echo '/**
 * Copyright (C) 2021 The Proton AOSP Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */' > "$font_dir/Android.bp"
    fi

    echo "
prebuilt_font {
    name: ${q}$android_name${q},
    src: ${q}$src_name${q},$product_flag
}" >> "$font_dir/Android.bp"
    echo "    $android_name \\" >> font_files.mk

done

echo '
# Register new fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \

# Include extra addon fonts
-include vendor/proton/fonts/extra/extra.mk' >> font_files.mk
