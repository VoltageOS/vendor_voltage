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

ANDROID_VERSION := 13
VOLTAGEVERSION := 2.6

VOLTAGE_BUILD_TYPE ?= UNOFFICIAL
VOLTAGE_DATE_YEAR := $(shell date -u +%Y)
VOLTAGE_DATE_MONTH := $(shell date -u +%m)
VOLTAGE_DATE_DAY := $(shell date -u +%d)
VOLTAGE_DATE_HOUR := $(shell date -u +%H)
VOLTAGE_DATE_MINUTE := $(shell date -u +%M)
VOLTAGE_BUILD_DATE := $(VOLTAGE_DATE_YEAR)$(VOLTAGE_DATE_MONTH)$(VOLTAGE_DATE_DAY)-$(VOLTAGE_DATE_HOUR)$(VOLTAGE_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst voltage_,,$(VOLTAGE_BUILD))

# OFFICIAL_DEVICES
ifeq ($(VOLTAGE_BUILD_TYPE), OFFICIAL)
  LIST = $(shell cat vendor/voltage/voltage.devices)
    ifeq ($(filter $(VOLTAGE_BUILD), $(LIST)), $(VOLTAGE_BUILD))
      IS_OFFICIAL=true
      VOLTAGE_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
      VOLTAGE_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(VOLTAGE_BUILD)")
    endif
endif

VOLTAGE_VERSION := $(VOLTAGEVERSION)-$(VOLTAGE_BUILD)-$(VOLTAGE_BUILD_DATE)-$(VOLTAGE_BUILD_TYPE)
VOLTAGE_MOD_VERSION :=$(ANDROID_VERSION)-$(VOLTAGEVERSION)
VOLTAGE_DISPLAY_VERSION := VoltageOS-$(VOLTAGEVERSION)-$(VOLTAGE_BUILD_TYPE)
VOLTAGE_DISPLAY_BUILDTYPE := $(VOLTAGE_BUILD_TYPE)
VOLTAGE_FINGERPRINT := VoltageOS/$(VOLTAGE_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(VOLTAGE_BUILD_DATE)
VOLTAGE_PLATFORM_RELEASE_OR_CODENAME := 13.0

# Voltageos System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.voltage.version=$(VOLTAGE_DISPLAY_VERSION) \
  ro.voltage.build.status=$(VOLTAGE_BUILD_TYPE) \
  ro.modversion=$(VOLTAGE_MOD_VERSION) \
  ro.voltage.build.date=$(VOLTAGE_BUILD_DATE) \
  ro.voltage.buildtype=$(VOLTAGE_BUILD_TYPE) \
  ro.voltage.fingerprint=$(VOLTAGE_FINGERPRINT) \
  ro.voltage.device=$(VOLTAGE_BUILD) \
  ro.voltage.platform_release_or_codename=$(VOLTAGE_PLATFORM_RELEASE_OR_CODENAME) \
  org.voltage.version=$(VOLTAGEVERSION)
