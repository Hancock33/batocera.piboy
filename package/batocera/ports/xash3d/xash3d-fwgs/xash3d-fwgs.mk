################################################################################
#
# xash3d-fwgs
#
################################################################################
# Version.: Commits on Mar 11, 2022
XASH3D_FWGS_VERSION = d2f3b1974ef9382cea2a0ebcfae1f2521a93bd7d
XASH3D_FWGS_SITE = https://github.com/FWGS/xash3d-fwgs.git
XASH3D_FWGS_SITE_METHOD = git
XASH3D_FWGS_GIT_SUBMODULES = yes
XASH3D_LICENSE = GPL-3.0+
XASH3D_FWGS_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf freetype hlsdk-xash3d fontconfig

XASH3D_FWGS_CONF_OPTS += --build-type=release \
  --sdl2=$(STAGING_DIR)/usr/ \
  --disable-vgui \
  --disable-menu-changegame \
  --disable-werror

ifeq ($(BR2_ARCH_IS_64),y)
XASH3D_FWGS_CONF_OPTS += --64bits
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
# Batocera - RPi4 prefer GLES
  ifeq ($(!BR2_PACKAGE_BATOCERA_RPI4_WITH_XORG),y)
    XASH3D_FWGS_DEPENDENCIES += libgl
  endif
else
ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
XASH3D_FWGS_DEPENDENCIES += libgles
XASH3D_FWGS_CONF_OPTS += --disable-gl --enable-gl4es
else
XASH3D_FWGS_CONF_OPTS += --disable-gl
endif
endif

define XASH3D_FWGS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/mainui/libmenu.so $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/ref_soft/libref_soft.so $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/ref_gl/libref_gl*.so $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/engine/libxash.so $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/game_launch/xash3d $(TARGET_DIR)/usr/lib/xash3d/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/xash3d/xash3d-fwgs/xash3d_fwgs.keys $(TARGET_DIR)/usr/share/evmapy/xash3d_fwgs.keys
endef

$(eval $(waf-package))
