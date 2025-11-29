################################################################################
#
# mupen64plus-gliden64
#
################################################################################
# Version: Commits on Nov 16, 2025
MUPEN64PLUS_GLIDEN64_VERSION = a249be101870db681feb419d647c3e3031d0e057
MUPEN64PLUS_GLIDEN64_SITE = $(call github,gonetz,GLideN64,$(MUPEN64PLUS_GLIDEN64_VERSION))
MUPEN64PLUS_GLIDEN64_LICENSE = GPLv2
MUPEN64PLUS_GLIDEN64_DEPENDENCIES = alsa-lib libpng mupen64plus-core sdl2 zlib
MUPEN64PLUS_GLIDEN64_SUBDIR = /src/

MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DMUPENPLUSAPI=ON -DMUPENPLUSAPI_GLIDENUI=OFF -DUSE_SDL=ON
MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DUSE_SYSTEM_LIBS=ON

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
    MUPEN64PLUS_GLIDEN64_DEPENDENCIES += rpi-userland
endif

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
    MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DEGL=ON -DGL_PROFILE=ON
    ifneq ($(BR2_PACKAGE_XORG7),y)
        MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DCMAKE_C_FLAGS="-DEGL_NO_X11"
        MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DCMAKE_CXX_FLAGS="-DEGL_NO_X11"
    endif
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
    MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DMESA=ON
endif

ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
    MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DCRC_NEON=ON
endif

ifeq ($(BR2_aarch64),y)
    MUPEN64PLUS_GLIDEN64_CONF_OPTS += -DCRC_ARMV8=ON
endif

define MUPEN64PLUS_GLIDEN64_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/mupen64plus/
	$(INSTALL) -D $(@D)/src/plugin/Release/mupen64plus-video-GLideN64.so $(TARGET_DIR)/usr/lib/mupen64plus/mupen64plus-video-gliden64.so
	$(INSTALL) -D $(@D)/ini/* $(TARGET_DIR)/usr/share/mupen64plus/
endef

$(eval $(cmake-package))
