################################################################################
#
# img-gpu-powervr
#
################################################################################
# Version: Commits on Mar 06, 2024
IMG_GPU_POWERVR_VERSION = c43d4fab94b0ef3b492a6382e2282fa7a2695b9b
IMG_GPU_POWERVR_SOURCE=img-gpu-powervr-bin-1.19.6345021.tar.gz
IMG_GPU_POWERVR_SITE = https://github.com/starfive-tech/soft_3rdpart/raw/JH7110_VisionFive2_devel/IMG_GPU/out
IMG_GPU_POWERVR_INSTALL_STAGING = YES

IMG_GPU_POWERVR_LICENSE = Strictly Confidential
IMG_GPU_POWERVR_REDISTRIBUTE = NO

IMG_GPU_POWERVR_PROVIDES = libgles libopencl

IMG_GPU_POWERVR_DEPENDENCIES += libdrm img-mesa3d

ifeq ($(BR2_PACKAGE_WAYLAND),y)
IMG_GPU_POWERVR_DEPENDENCIES += wayland
endif

define IMG_GPU_POWERVR_INSTALL_STAGING_CMDS
	cp -rdpf $(@D)/staging/* $(STAGING_DIR)/
endef

define IMG_GPU_POWERVR_INSTALL_TARGET_CMDS
	cp -rdpf $(@D)/target/* $(TARGET_DIR)/
endef

$(eval $(generic-package))
