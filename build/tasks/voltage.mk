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

TARGET_FILES_PACKAGE := $(PRODUCT_OUT)/$(PROD_VERSION).zip

.PHONY: voltage-prod
voltage-prod: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(TARGET_FILES_PACKAGE)
	@echo "Package Complete: $(TARGET_FILES_PACKAGE)" >&2
