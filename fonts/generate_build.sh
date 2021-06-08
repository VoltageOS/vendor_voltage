#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

cd "$(dirname "$0")"

q='"'

echo '# Copyright (C) 2020 The Proton AOSP Project
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
' > fonts.mk
echo '# We have to use PRODUCT_PACKAGES (together with BUILD_PREBUILT) instead of
# PRODUCT_COPY_FILES to install the font files, so that the NOTICE file can
# get installed too.

PRODUCT_PACKAGES += \' >> fonts.mk

rm -f */Android.bp

for src in */*.ttf */*.otf
do
    echo "$src"

    font_dir="$(dirname "$src")"
    src_base="$(basename "$(basename "$src" .ttf)" .otf)"
    src_name="$(basename "$src")"
    if [[ "$src" == *"_"* ]]; then
    	# If a name was explicitly specified with an underscore, use it
	android_name="$(cut -d'_' -f2 <<< "$src_base").ttf"
    else
    	# Use heuristics to construct a name
	android_name="$(sed -e 's/Inter/Roboto/; s/SFUIText/Roboto/; s/SourceSerifPro/NotoSerif/' <<< "$src_base").ttf"
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
    src: ${q}$src_name${q},
}" >> "$font_dir/Android.bp"
    echo "    $android_name \\" >> fonts.mk

done

echo '
# Include extra addon fonts
-include vendor/proton/fonts/extra/extra.mk' >> fonts.mk
