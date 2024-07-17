#
# Copyright (C) 2012 The Android Open Source Project
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

ifeq ($(TARGET_SLSI_VARIANT),bsp)

common_exynos_dirs := \
	libexynosutils \
	libcec \
	libcsc \
	libv4l2 \
	libswconverter \
	libvideocodec \
	libstagefrighthw \
        exyrngd \
	rpmbd

ifeq ($(TARGET_USES_UNIVERSAL_LIBHWJPEG), true)
common_exynos_dirs += libhwjpeg
endif

ifeq ($(BOARD_USES_FIMGAPI_V5X), true)
common_exynos_dirs += \
   libfimg5x
else
common_exynos_dirs += \
   libfimg4x
endif


ifeq ($(BOARD_USES_EXYNOS5_COMMON_GRALLOC), true)
common_exynos_dirs += \
    gralloc
endif

ifeq ($(BOARD_USE_ALP_AUDIO), true)
ifeq ($(BOARD_USE_SEIREN_AUDIO), true)
common_exynos_dirs += \
	libseiren
else
common_exynos_dirs += \
	libsrp
endif
endif

ifeq ($(BOARD_USE_COMMON_AUDIOHAL), true)
common_exynos_dirs += \
	libaudio
endif

ifeq ($(BOARD_USES_FIMGAPI_V4L2), true)
common_exynos_dirs += \
	libg2d
endif

ifeq ($(BOARD_BACK_CAMERA_USES_EXTERNAL_CAMERA), true)
common_exynos_dirs += \
	libcamera_external
else
ifeq ($(BOARD_FRONT_CAMERA_USES_EXTERNAL_CAMERA), true)
common_exynos_dirs += \
	libcamera_external
endif
endif

include $(call all-named-subdir-makefiles,$(common_exynos_dirs))

endif # TARGET_SLSI_VARIANT
