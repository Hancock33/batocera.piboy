################################################################################
#
# xash3d-fwgs
#
################################################################################
# Version: Commits on Feb 04, 2023
XASH3D_FWGS_VERSION = 0ffd1b9ff101697bf2132a22e080cd2b5ed66e24
XASH3D_FWGS_SITE = https://github.com/FWGS/xash3d-fwgs.git
XASH3D_FWGS_SITE_METHOD = git
XASH3D_FWGS_GIT_SUBMODULES = yes
XASH3D_LICENSE = GPL-3.0+
XASH3D_FWGS_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf freetype fontconfig hlsdk-xash3d

XASH3D_FWGS_CONF_OPTS += --build-type=release \
  --enable-packaging \
  --sdl2=$(STAGING_DIR)/usr/ \
  --disable-vgui \
  --disable-menu-changegame

ifeq ($(BR2_ARCH_IS_64),y)
  XASH3D_FWGS_CONF_OPTS += --64bits
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
# Batocera - SBC prefer GLES
	ifneq ($(BR2_PACKAGE_LIBGLVND),y)
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


$(eval $(waf-package))
