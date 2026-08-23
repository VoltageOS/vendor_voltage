#!/bin/bash
#
# Copyright (C) 2019 crDroid Android Project
# Copyright (C) 2026 VoltageOS
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the 
# License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#$1=TARGET_DEVICE, $2=PRODUCT_OUT, $3=ZIP_FILENAME (relative to $2)

existingOTAjson=./vendor/ota/$1.json
output=$2/$1.json

if [ ! -f "$existingOTAjson" ]; then
	echo "createjson: no official support for $1 yet, add vendor/ota/$1.json first" >&2
	exit 1
fi

maintainer=$(grep "\"maintainer\"" "$existingOTAjson" | cut -d ":" -f 2 | tr -d '",' | xargs)
oem=$(grep "\"oem\"" "$existingOTAjson" | cut -d ":" -f 2 | tr -d '",' | xargs)
device=$(grep "\"device\"" "$existingOTAjson" | cut -d ":" -f 2 | tr -d '",' | xargs)

filename=$3
version=$(echo "$3" | cut -d'-' -f2)
download="https://sourceforge.net/projects/voltage-os/files/$1/$filename/download"
timestamp=$(grep -m1 "ro.system.build.date.utc" "$2/system/build.prop" | cut -d'=' -f2)
md5=$(md5sum "$2/$3" | cut -d' ' -f1)
size=$(stat -c "%s" "$2/$3")

cat > "$output" <<EOF
{
  "response": [
    {
        "maintainer": "$maintainer",
        "oem": "$oem",
        "device": "$device",
        "filename": "$filename",
        "download": "$download",
        "timestamp": $timestamp,
        "md5": "$md5",
        "size": $size,
        "version": "$version"
    }
  ]
}
EOF

echo "$output"
echo ""
