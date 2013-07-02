#
# Copyright (C) 2012 The CyanogenMod Project
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

-include device/samsung/smdk4412-common/common.mk
DEVICE_PACKAGE_OVERLAYS += device/samsung/n80xx-common/overlay-common

PRODUCT_AAPT_CONFIG := xlarge mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    device/samsung/n80xx-common/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc \
    device/samsung/n80xx-common/fstab.smdk4x12:root/fstab.smdk4x12

# DEMENTED build.prop tweaks
PRODUCT_PROPERTY_OVERIDES += \
    windowsmgr.max_events_per_sec=350 \
    ro.kernel.android.checkjni=0 \
    ro.media.enc.jpeg.quality=100 \
    ro.config.nocheckin=1 \
    debug.performance.tuning=1 \
    persist.service.swiqi.enable=1 \
    video.accelerate.hw=1 \
    ro.ril.hep=1 \
    ro.ril.hsxpa=3 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.enable.a53=1 \
    ro.ril.hsupa.category=5 \
    persist.sys.purgeable_assets=1 \
    ro.home_app_adj=1 \
    ro.ext4fs=1 \
    persist.sys.use_dithering=0 \
    ro.ril.disable.power.collapse=0 \
    dalvik.vm.heapstartsize=128m \
    dalvik.vm.heapgrowthlimit=320m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heaputilization=0.05 \
    dalvik.vm.heapidealfree=8388608 \
    dalvik.vm.heapconcurrentstart=2097152 \
    dalvik.vm.verify-bytecode=false \
    dalvik.vm.dexopt-data-only=1 \
    ro.config.hw_quickpoweron=true \
    ro.dalvik.vm.checkjni=0 \
    dalvik.vm.dexopt-flags=v=n,o=v \
    debug.composition.type=gpu \
    ro.max.fling_velocity=15000 \
    ro.min.fling_velocity=8000 \
    ro.config.hw_fast_dormancy=1 \
    net.dns1=8.8.4.4 \
    net.dns2=8.8.8.8 \
    ro.semc.sound_effects_enabled=true \
    ro.semc.xloud.supported=true \
    htc.audio.alc.enable=1 \
    htc.audio.swalt.enable=1 \
    htc.audio.swalt.mingain=14512 \
    persist.service.xloud.enable=1 \
    persist.service.enhance.enable=1 \
    ro.semc.clearaudio.supported=true \
    persist.service.clearaudio.enable=1 \
    ro.sony.walkman.logger=1 \
    ro.somc.clearphase.supported=true \
    persist.service.clearphase.enable=1

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/configs/audio_policy.conf:system/etc/audio_policy.conf

# DEMENTED bootanimation...Credit JaeKar
PRODUCT_COPY_FILES +=  \
    vendor/DEMENTED/prebuilt/common/media/mdpi/bootanimation.zip:system/media/bootanimation.zip

# Packages
PRODUCT_PACKAGES += \
    libsecril-client \
    GalaxyNoteTabSettings \
    TVOutDummy

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/samsung/n80xx/n80xx-vendor.mk)
