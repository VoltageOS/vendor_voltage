# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# VOLTAGE OTA update package

VOLTAGE_TARGET_PACKAGE := $(PRODUCT_OUT)/voltage-$(VOLTAGE_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

CL_RED="\\033[31m"
CL_GRN="\\033[32m"
CL_CYN="\\033[36m"
CL_YLW="\\033[33m"
CL_BLD="\\033[1m"
CL_RST="\\033[0m"

.PHONY: bacon
bacon: $(DEFAULT_GOAL) $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(VOLTAGE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(VOLTAGE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(VOLTAGE_TARGET_PACKAGE).sha256sum

	$(hide) { \
		echo -e "\n${CL_BLD}${CL_GRN}[================= ${CL_YLW}⚡ VoltageOS Build Complete ⚡${CL_GRN} =================]${CL_RST}\n"; \
		echo -e "${CL_BLD}${CL_GRN}▶ Device      :${CL_CYN} $(TARGET_DEVICE)${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ Output File :${CL_CYN} $(VOLTAGE_TARGET_PACKAGE)${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ SHA256      :${CL_CYN} `cut -d' ' -f1 $(VOLTAGE_TARGET_PACKAGE).sha256sum`${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ File Size   :${CL_CYN} `du -sh $(VOLTAGE_TARGET_PACKAGE) | awk '{print $$1}'`${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ Build Date  :${CL_CYN} `grep ro.voltage.build.date $(PRODUCT_OUT)/system/build.prop | cut -d'=' -f2-`${CL_RST}"; \
		if [ "$(VOLTAGE_BUILD_TYPE)" = "OFFICIAL" ]; then \
			echo -e "${CL_BLD}${CL_GRN}✔ Official build detected – generating OTA JSON...${CL_RST}"; \
			./vendor/voltage/build/tools/createjson.sh $(TARGET_DEVICE) $(PRODUCT_OUT) voltage-$(VOLTAGE_VERSION).zip; \
		else \
			echo -e "${CL_BLD}${CL_RED}⚠ Unofficial build – skipping OTA JSON creation.${CL_RST}"; \
		fi; \
		echo -e "\n${CL_BLD}${CL_GRN}[===============================================================]${CL_RST}\n"; \
	}

VOLTAGE_FASTBOOT_PACKAGE := $(PRODUCT_OUT)/voltage-$(VOLTAGE_VERSION)-img.zip

.PHONY: fastbootpkg
fastbootpkg: $(INTERNAL_UPDATE_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_UPDATE_PACKAGE_TARGET) $(VOLTAGE_FASTBOOT_PACKAGE)
	$(hide) $(SHA256) $(VOLTAGE_FASTBOOT_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(VOLTAGE_FASTBOOT_PACKAGE).sha256sum

	$(hide) { \
		echo -e "\n${CL_BLD}${CL_GRN}[============= ${CL_YLW}⚡ VoltageOS Fastboot Package Complete ⚡${CL_GRN} =============]${CL_RST}\n"; \
		echo -e "${CL_BLD}${CL_GRN}▶ Device      :${CL_CYN} $(TARGET_DEVICE)${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ Build Type  :${CL_CYN} $(TARGET_BUILD_VARIANT)${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ Output File :${CL_CYN} $(VOLTAGE_FASTBOOT_PACKAGE)${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ SHA256      :${CL_CYN} `cut -d' ' -f1 $(VOLTAGE_FASTBOOT_PACKAGE).sha256sum`${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ File Size   :${CL_CYN} `du -sh $(VOLTAGE_FASTBOOT_PACKAGE) | awk '{print $$1}'`${CL_RST}"; \
		echo -e "${CL_BLD}${CL_GRN}▶ Build Date  :${CL_CYN} `grep ro.voltage.build.date $(PRODUCT_OUT)/system/build.prop | cut -d'=' -f2-`${CL_RST}"; \
		echo -e "\n${CL_BLD}${CL_GRN}[===============================================================]${CL_RST}\n"; \
	}
