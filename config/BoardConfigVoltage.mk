# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2026 VoltageOS
# SPDX-License-Identifier: Apache-2.0

# OTA
BUILD_BROKEN_SRC_DIR_RW_ALLOWLIST := $(abspath vendor/ota)

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE ?= true

include vendor/voltage/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/voltage/config/BoardConfigSoong.mk

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += vendor/voltage/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += vendor/voltage/sepolicy/vendor
