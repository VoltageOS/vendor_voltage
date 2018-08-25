# Kernel
include vendor/voltage/config/BoardConfigKernel.mk

# Soong
include vendor/voltage/config/BoardConfigSoong.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/voltage/config/BoardConfigQcom.mk
endif
