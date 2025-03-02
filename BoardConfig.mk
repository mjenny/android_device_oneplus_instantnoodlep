#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from oneplus sm8250-common
-include device/oneplus/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/instantnoodlep

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# PowerShare
SOONG_CONFIG_NAMESPACES += ONEPLUS_POWERSHARE
SOONG_CONFIG_ONEPLUS_POWERSHARE := WIRELESS_TX_ENABLE_PATH
SOONG_CONFIG_ONEPLUS_POWERSHARE_WIRELESS_TX_ENABLE_PATH := /proc/wireless/enable_tx

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Partitions
ifeq ($(CALYX_BUILD),)
ifneq ($(WITH_GMS),true)
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1156055040
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 660602880
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 660602880
endif
endif
BOARD_ONEPLUS_DYNAMIC_PARTITIONS_SIZE := 7511998464
BOARD_SUPER_PARTITION_SIZE := 15032385536

# Recovery
TARGET_RECOVERY_DENSITY := xxhdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 121

# inherit from the proprietary version
-include vendor/oneplus/instantnoodlep/BoardConfigVendor.mk
