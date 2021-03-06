#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FORCE_32_BIT := true

include device/cyanogen/msm8916-common/BoardConfigCommon.mk

DEVICE_PATH := device/DEXP/MLTE5

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Kernel
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
TARGET_KERNEL_CONFIG := lineageos_MLTE5_defconfig
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# Bootchart
ifeq ($(strip $(INIT_BOOTCHART)),true)
BOARD_KERNEL_CMDLINE += androidboot.bootchart=120
endif

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
BOARD_CAMERA_SENSORS := ov8865_cm9462 ov2680
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Camera Flags
BOARD_GLOBAL_CFLAGS += \
    -DCONFIG_MLTE5_CAMERA \
    -DCAMERA_VENDOR_L_COMPAT

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    WITH_DEXPREOPT_COMP ?= false
  endif
endif

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1000000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5501811200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

BLOCK_BASED_OTA := false

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/DEXP/MLTE5/sepolicy

# Wifi
TARGET_PROVIDES_WCNSS_QMI := true

# inherit from the proprietary version
-include vendor/DEXP/MLTE5/BoardConfigVendor.mk
