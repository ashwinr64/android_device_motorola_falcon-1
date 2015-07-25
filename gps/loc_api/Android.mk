ifneq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE),)

LOCAL_PATH := $(call my-dir)

#add QMI libraries for QMI targets
QMI_BOARD_PLATFORM_LIST := msm8960
QMI_BOARD_PLATFORM_LIST += msm8974
QMI_BOARD_PLATFORM_LIST += msm8226
QMI_BOARD_PLATFORM_LIST += msm8610
QMI_BOARD_PLATFORM_LIST += apq8084
QMI_BOARD_PLATFORM_LIST += msm8916
QMI_BOARD_PLATFORM_LIST += msm8994
QMI_BOARD_PLATFORM_LIST += msm8909

ifneq (,$(filter $(QMI_BOARD_PLATFORM_LIST),$(TARGET_BOARD_PLATFORM)))
include $(call all-subdir-makefiles)
endif #is-board-platform-in-list

# add RPC dirs if RPC is available
ifneq ($(TARGET_NO_RPC),true)

GPS_DIR_LIST += $(LOCAL_PATH)/libloc_api-rpc-50001/

endif #TARGET_NO_RPC

GPS_DIR_LIST += $(LOCAL_PATH)/libloc_api_50001/

#call the subfolders
include $(addsuffix Android.mk, $(GPS_DIR_LIST))

endif#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE
