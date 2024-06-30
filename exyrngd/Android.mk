LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := exyrngd
LOCAL_PROPRIETARY_MODULE := true
ifeq ($(BOARD_USES_FIPS_COMPLIANCE_RNG_DRV),true)
	LOCAL_CFLAGS += -DUSES_FIPS_COMPLIANCE_RNG_DRV
endif
LOCAL_SRC_FILES := \
		exyrngd.c
LOCAL_SHARED_LIBRARIES := libc libcutils
LOCAL_HEADER_LIBRARIES := libcutils_headers
#LOCAL_CFLAGS := -DANDROID_CHANGES
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

