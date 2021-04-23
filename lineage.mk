#
# Copyright (C) 2021 The LineageOS Project
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

# Inherit some common AOSP stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from Samsung gtel3g
$(call inherit-product, device/samsung/gtel3g/device.mk)

# Shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_k.mk)

PRODUCT_NAME := lineage_gtel3g
PRODUCT_DEVICE := gtel3g
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T561
PRODUCT_CHARACTERISTICS := tablet

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="gtel3g" \
    PRIVATE_BUILD_DESC="gtel3gxx-user 4.4.4 KTU84P T561XXU0AQA2 release-keys"

BUILD_FINGERPRINT := "samsung/gtel3gxx/gtel3g:4.4.4/KTU84P/T561XXU0AQA2:user/release-keys"
