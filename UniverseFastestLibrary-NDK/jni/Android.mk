LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := UniverseFastestLibrary
LOCAL_LDFLAGS := -Wl,-O1 -Wl,-gc-sections -Wl,--hash-style=sysv -Wl,--as-needed -l:libc.so -l:liblog.so
LOCAL_CFLAGS := -fPIC -pipe -fvisibility=hidden -Wall -Wpedantic -Wshadow -Winline -Wunreachable-code -D__STDINT_LIMITS -DHAVE_INTTYPES_H -Ofast -Dg_JvmPt=g_$(LOCAL_MODULE)JvmPt
LOCAL_CPPFLAGS := -frtti
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_CFLAGS += -mfloat-abi=softfp -mfpu=neon-vfpv4
LOCAL_ARM_NEON := true
LOCAL_CFLAGS += -D__NAME_UNIVERSEFASTESTLIBRARY__ -D__ANDROID_GCC__ -D__ARMAT32__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
#LOCAL_CFLAGS += -mfloat-abi=hard -mfpu=neon-fp-armv8
LOCAL_ARM_NEON := true
LOCAL_CFLAGS += -D__NAME_UNIVERSEFASTESTLIBRARY__ -D__ANDROID_GCC__ -D__ARMA64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
else ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_CFLAGS += -D__NAME_UNIVERSEFASTESTLIBRARY__ -D__ANDROID_GCC__ -D__X86__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
else ifeq ($(TARGET_ARCH_ABI),x86_64)
LOCAL_CFLAGS += -D__NAME_UNIVERSEFASTESTLIBRARY__ -D__ANDROID_GCC__ -D__X64__ -D__RELEASE__ -D__LNKDLL__ -D__COMDLL__
LOCAL_CPPFLAGS += 
endif
LOCAL_C_INCLUDES := ../../Source/UniverseFastestLibrary
LOCAL_SRC_FILES := ../../Source/UniverseFastestLibrary/UniverseFastestLibrary.cpp
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_SRC_FILES += ../../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_ArmAt32.s ../../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_ArmAt32.s
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_SRC_FILES += ../../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_ArmA64.s ../../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_ArmA64.s
else ifeq ($(TARGET_ARCH_ABI),x86)
LOCAL_SRC_FILES += ../../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_x86.s ../../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_x86.s
else ifeq ($(TARGET_ARCH_ABI),x86_64)
LOCAL_SRC_FILES += ../../Source/UniverseFastestLibrary/MutexLock_AndroidGCC_x64.s ../../Source/UniverseFastestLibrary/MemCpy_AndroidGCC_x64.s
endif

$(warning NDK_DEBUG=$(NDK_DEBUG))
$(warning APP_OPTIM=$(APP_OPTIM))
$(warning APP_ABI=$(APP_ABI))
$(warning APP_PLATFORM=$(APP_PLATFORM))
$(warning NDK_PROJECT_PATH=$(NDK_PROJECT_PATH))
$(warning LOCAL_MODULE=$(LOCAL_MODULE))
$(warning NDK_TOOLCHAIN_VERSION=$(NDK_TOOLCHAIN_VERSION))
$(warning LOCAL_CFLAGS=$(LOCAL_CFLAGS))
$(warning LOCAL_CPPFLAGS=$(LOCAL_CPPFLAGS))

include $(BUILD_SHARED_LIBRARY)