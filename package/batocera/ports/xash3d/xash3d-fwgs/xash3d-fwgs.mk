################################################################################
#
# xash3d-fwgs
#
################################################################################
# Version: Commits on Sept 20, 2025
XASH3D_FWGS_VERSION = 04dee4e94d5ec66fa2099ce2d67fde5dff750f0c
XASH3D_FWGS_SITE = https://github.com/FWGS/xash3d-fwgs.git
XASH3D_FWGS_SITE_METHOD = git
XASH3D_FWGS_GIT_SUBMODULES = yes
XASH3D_FWGS_LICENSE = GPL-3.0+
XASH3D_FWGS_DEPENDENCIES += fontconfig freetype hlsdk-xash3d
XASH3D_FWGS_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf

XASH3D_FWGS_CONF_OPTS += --build-type=release
XASH3D_FWGS_CONF_OPTS += --enable-packaging
XASH3D_FWGS_CONF_OPTS += --sdl2=$(STAGING_DIR)/usr
XASH3D_FWGS_CONF_OPTS += --disable-menu-changegame
XASH3D_FWGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC -std=gnu17" CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC"

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
