# Copyright (C) 2025 VoltageOS
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

ANDROID_VERSION := 17
VOLTAGEVERSION := 6.1

VOLTAGE_BUILD_TYPE ?= UNOFFICIAL
VOLTAGE_GPG_KEY :=
VOLTAGE_GPG_UID :=
VOLTAGE_DATE_YEAR := $(shell date -u +%Y)
VOLTAGE_DATE_MONTH := $(shell date -u +%m)
VOLTAGE_DATE_DAY := $(shell date -u +%d)
VOLTAGE_DATE_HOUR := $(shell date -u +%H)
VOLTAGE_DATE_MINUTE := $(shell date -u +%M)
VOLTAGE_BUILD_DATE := $(VOLTAGE_DATE_YEAR)$(VOLTAGE_DATE_MONTH)$(VOLTAGE_DATE_DAY)-$(VOLTAGE_DATE_HOUR)$(VOLTAGE_DATE_MINUTE)
TARGET_PRODUCT_SHORT := $(subst voltage_,,$(VOLTAGE_BUILD))

ifeq ($(VOLTAGE_BUILD_TYPE), OFFICIAL)

  DEVICES_TEMP_FILE := $(shell mktemp)

  $(shell /usr/bin/curl -sLk --connect-timeout 10 https://raw.githubusercontent.com/VoltageOS/vendor_voltage/17/voltage.devices -o $(DEVICES_TEMP_FILE))

  ifeq ($(shell stat -c %s $(DEVICES_TEMP_FILE) 2>/dev/null), 0)
    $(error Failed to download the official devices list. Please check your network connection.)
  endif

  DEVICE_ENTRY := $(shell grep "^$(VOLTAGE_BUILD):" $(DEVICES_TEMP_FILE) 2>/dev/null)
  
  ifneq ($(strip $(DEVICE_ENTRY)),)
    REQUIRED_GPG_KEY := $(shell echo $(DEVICE_ENTRY) | cut -d: -f2 | tr -d '[:space:]')
    GPG_CACHE_FILE := $(OUT_DIR)/.voltage_gpg_keys.cache

    LOCAL_GPG_KEYS := $(shell cat $(GPG_CACHE_FILE) 2>/dev/null | tr -d '[:space:]')

    ifeq ($(strip $(LOCAL_GPG_KEYS)),)
      DISCOVERED_KEYS := $(shell gpg2 --list-secret-keys --with-colons --fingerprint 2>/dev/null | grep "^fpr" | cut -d: -f10 | tr -d '[:space:]')
      ifneq ($(strip $(DISCOVERED_KEYS)),)
        LOCAL_GPG_KEYS := $(DISCOVERED_KEYS)
        $(shell mkdir -p $(dir $(GPG_CACHE_FILE)) && echo '$(LOCAL_GPG_KEYS)' > $(GPG_CACHE_FILE))
      endif
    endif

    ifeq ($(strip $(LOCAL_GPG_KEYS)),)
      $(warning No GPG keys found in local keyring. Building as UNOFFICIAL.)
      VOLTAGE_BUILD_TYPE := UNOFFICIAL
    else
      KEY_FOUND := $(findstring $(REQUIRED_GPG_KEY),$(LOCAL_GPG_KEYS))

      ifeq ($(strip $(KEY_FOUND)),)
        $(warning GPG key $(REQUIRED_GPG_KEY) not found in local keyring for device $(VOLTAGE_BUILD). Building as UNOFFICIAL.)
        VOLTAGE_BUILD_TYPE := UNOFFICIAL
      else
        $(warning GPG authentication successful for device $(VOLTAGE_BUILD). Building as OFFICIAL.)
        VOLTAGE_GPG_KEY := $(REQUIRED_GPG_KEY)
        VOLTAGE_GPG_UID := $(shell gpg2 --list-keys --with-colons '$(REQUIRED_GPG_KEY)' 2>/dev/null | awk -F: '/^uid/ {print $$10; exit}' | xxd -p | tr -d '\n')
        ifeq ($(strip $(VOLTAGE_GPG_UID)),)
            VOLTAGE_GPG_UID := "Could not parse User ID"
        endif
      endif
    endif
  else
    DEVICE_IN_OLD_FORMAT := $(shell grep "^$(VOLTAGE_BUILD)$$" $(DEVICES_TEMP_FILE) 2>/dev/null)

    ifneq ($(strip $(DEVICE_IN_OLD_FORMAT)),)
      $(warning Device $(VOLTAGE_BUILD) is in the list but has no GPG key configured. Building as UNOFFICIAL.)
      $(warning Maintainer must provide GPG key in format: $(VOLTAGE_BUILD):GPG_FINGERPRINT)
      VOLTAGE_BUILD_TYPE := UNOFFICIAL
    else
      $(warning Device $(VOLTAGE_BUILD) is not in the official devices list. Building as UNOFFICIAL.)
      VOLTAGE_BUILD_TYPE := UNOFFICIAL
    endif
  endif

  $(shell rm -f $(DEVICES_TEMP_FILE))

endif

VOLTAGE_VERSION := $(VOLTAGEVERSION)-$(VOLTAGE_BUILD)-$(VOLTAGE_BUILD_DATE)-$(VOLTAGE_BUILD_TYPE)
VOLTAGE_MOD_VERSION :=$(ANDROID_VERSION)-$(VOLTAGEVERSION)
VOLTAGE_DISPLAY_VERSION := VoltageOS-$(VOLTAGEVERSION)-$(VOLTAGE_BUILD_TYPE)
VOLTAGE_DISPLAY_BUILDTYPE := $(VOLTAGE_BUILD_TYPE)
VOLTAGE_FINGERPRINT := VoltageOS/$(VOLTAGE_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(VOLTAGE_BUILD_DATE)
VOLTAGE_PLATFORM_RELEASE_OR_CODENAME := 17.0

# Voltageos System Version
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.voltage.version=$(VOLTAGE_DISPLAY_VERSION) \
  ro.voltage.build.status=$(VOLTAGE_BUILD_TYPE) \
  ro.voltageversion=$(VOLTAGE_MOD_VERSION) \
  ro.voltage.build.date=$(VOLTAGE_BUILD_DATE) \
  ro.voltage.buildtype=$(VOLTAGE_BUILD_TYPE) \
  ro.voltage.fingerprint=$(VOLTAGE_FINGERPRINT) \
  ro.voltage.device=$(VOLTAGE_BUILD) \
  ro.voltage.platform_release_or_codename=$(VOLTAGE_PLATFORM_RELEASE_OR_CODENAME) \
  org.voltage.version=$(VOLTAGEVERSION) \
  ro.voltage.maintainer.gpg_key=$(VOLTAGE_GPG_KEY) \
  ro.voltage.maintainer.gpg_uid="$(VOLTAGE_GPG_UID)"
