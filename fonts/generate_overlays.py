#!/usr/bin/env python3

import sys
import os
import shutil

DEST_DIR = f"{os.path.dirname(os.path.realpath(__file__))}/overlays"

# (user-facing name, font family name)
FONTS = {
    "Manrope": "manrope",
    "Noto Sans": "noto-sans",
    "Recursive Casual": "recursive-casual",
    "Recursive Linear": "recursive",
    "Roboto": "roboto-system",
    "Source Sans": "source-sans",
    "Source Serif": "serif",
}

# Android.bp
ANDROID_BP_TEMPLATE = """//
// Copyright (C) 2021 The Proton AOSP Project
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

runtime_resource_overlay {{
    name: "Font{apk_name}Overlay",
    theme: "Font{apk_name}",
    product_specific: true,
}}
"""

# AndroidManifest.xml
ANDROID_MANIFEST_TEMPLATE = """<!--
    Copyright (C) 2021 The Proton AOSP Project

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="org.protonaosp.theme.font.{pkg_name}">

    <overlay android:targetPackage="android"
        android:category="android.theme.customization.font"
        android:priority="1" />

    <application
        android:label="{user_name}"
        android:hasCode="false" />

</manifest>
"""

# config.xml
CONFIG_XML_TEMPLATE = """<?xml version="1.0" encoding="UTF-8"?>
<!--
    Copyright (C) 2021 The Proton AOSP Project

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->
<resources>
    <string name="config_bodyFontFamily" translatable="false">{font_name}</string>
    <string name="config_bodyFontFamilyMedium" translatable="false">{font_name}-medium</string>
    <string name="config_headlineFontFamily" translatable="false">{font_name}</string>
    <string name="config_headlineFontFamilyMedium" translatable="false">{font_name}-medium</string>
</resources>
"""

def main():
    for user_name, family_name in FONTS.items():
        pkg_apk_name = user_name.replace(" ", "").replace("+", "Plus")
        pkg_name = user_name.lower().replace(" ", "_").replace("+", "plus_")
        apk_name = f"Font{pkg_apk_name}Overlay"
        pkg_dir = f"{DEST_DIR}/{apk_name}"

        print(apk_name)
        shutil.rmtree(pkg_dir, ignore_errors=True)

        xml_dir = f"{pkg_dir}/res/values"
        os.makedirs(xml_dir, exist_ok=True)
        with open(f"{xml_dir}/config.xml", "w+") as f:
            f.write(CONFIG_XML_TEMPLATE.format(font_name=family_name))

        with open(f"{pkg_dir}/Android.bp", "w+") as f:
            f.write(ANDROID_BP_TEMPLATE.format(apk_name=pkg_apk_name))

        with open(f"{pkg_dir}/AndroidManifest.xml", "w+") as f:
            f.write(ANDROID_MANIFEST_TEMPLATE.format(pkg_name=pkg_name, user_name=user_name))

if __name__ == '__main__':
    main()
