################################################################################
#
# libglu
#
################################################################################
# Version.: Commits on Apr 15, 2018
GLU_VERSION = 2fed2bda2b725d2b9e32c435b48d5141cc95827f
GLU_SITE = $(call github,ptitSeb,GLU,$(GLU_VERSION))
GLU_LICENSE = SGI-B-2.0

ifeq ($(!BR2_PACKAGE_BATOCERA_XORG),y)
GLU_DEPENDENCIES += gl4es
endif


define GLU_INSTALL_TARGET_CMDS
    cp -pvr $(@D)/include/GL/*.h $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/GL
    cp -pvr $(@D)/.libs/libGLU.so* $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib
    cp -pvr $(@D)/.libs/libGLU.so* $(TARGET_DIR)/usr/lib/
endef

$(eval $(autotools-package))
