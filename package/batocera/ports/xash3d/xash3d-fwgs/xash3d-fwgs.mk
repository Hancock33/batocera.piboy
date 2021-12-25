################################################################################
#
# xash3d-fwgs
#
################################################################################
# Version.: Commits on Dec 24, 2021
XASH3D_FWGS_VERSION = f3dfbc92195cc8352285437c26401583ef2b1c1f
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
XASH3D_FWGS_DEPENDENCIES += libgl
else
ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
XASH3D_FWGS_DEPENDENCIES += libgles
XASH3D_FWGS_CONF_OPTS += --disable-gl
else
XASH3D_FWGS_CONF_OPTS += --disable-gl
endif
endif

define XASH3D_FWGS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/mainui/libmenu.so $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/ref_soft/libref_soft.so $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/engine/libxash.so $(TARGET_DIR)/usr/lib/xash3d/
	cp -pvr $(@D)/build/game_launch/xash3d $(TARGET_DIR)/usr/lib/xash3d/
endef

$(eval $(waf-package))
