LOCAL_PATH := $(call my-dir)

COMMON_SRC_FILES := \
	setpropex.c \
	system_properties.c \
	system_properties_compat.c

COMMON_CFLAGS := \
	-Wno-implicit-function-declaration \
	-Wno-unused-parameter \
	-Wno-pointer-arith \
	-Wno-sign-compare \
	-std=c99

COMMON_LIBS := \
	liblog \
	libc

COMMON_INCLUDES := \
	$(LOCAL_PATH)/include

include $(CLEAR_VARS)

LOCAL_MODULE := setpropex
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(COMMON_SRC_FILES)
LOCAL_C_INCLUDES := $(COMMON_INCLUDES)
LOCAL_CFLAGS += $(COMMON_CFLAGS)
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_FORCE_STATIC_EXECUTABLE := true

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := setpropex-recovery
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(COMMON_SRC_FILES)
LOCAL_C_INCLUDES := $(COMMON_INCLUDES)
LOCAL_CFLAGS += $(COMMON_CFLAGS)
LOCAL_STATIC_LIBRARIES := $(COMMON_LIBS)
LOCAL_FORCE_STATIC_EXECUTABLE := true

LOCAL_MODULE_STEM := setpropex
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/sbin

include $(BUILD_EXECUTABLE)
