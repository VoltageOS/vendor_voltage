#
# Copyright (C) 2021 VoltageOS
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
#
PLATFORM_VOLTAGE_RELEASE := 11v
PLATFORM_VOLTAGE_VERSION := $(PLATFORM_VOLTAGE_RELEASE).$(shell date +%m%d%H%M)

TARGET_PRODUCT_SHORT := $(subst VOLTAGE_,,$(TARGET_DEVICE))

ifeq ($(TARGET_BUILD_VARIANT),OFFICIAL)
    PLATFORM_VOLTAGE_VERSION := $(PLATFORM_VOLTAGE_RELEASE)
else
    PLATFORM_VOLTAGE_VERSION := $(PLATFORM_VOLTAGE_RELEASE)
endif

PRODUCT_PRODUCT_PROPERTIES += \
    ro.system.voltage.version=$(PLATFORM_VOLTAGE_VERSION)

