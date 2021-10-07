include vendor/voltage/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/voltage/config/BoardConfigQcom.mk
endif

include vendor/voltage/config/BoardConfigSoong.mk
