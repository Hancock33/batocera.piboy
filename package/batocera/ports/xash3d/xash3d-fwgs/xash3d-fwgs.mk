################################################################################
#
# xash3d-fwgs
#
################################################################################
# Version: Commits on Nov 21, 2024
XASH3D_FWGS_VERSION = 9244bdc7dbf9e754be48e3351e6fbbc642904f11
XASH3D_FWGS_SITE = https://github.com/FWGS/xash3d-fwgs.git
XASH3D_FWGS_SITE_METHOD = git
XASH3D_FWGS_GIT_SUBMODULES = yes
XASH3D_FWGS_LICENSE = GPL-3.0+
XASH3D_FWGS_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image sdl2_ttf
XASH3D_FWGS_DEPENDENCIES += freetype fontconfig hlsdk-xash3d

XASH3D_FWGS_CONF_OPTS += --build-type=release
XASH3D_FWGS_CONF_OPTS += --enable-packaging
XASH3D_FWGS_CONF_OPTS += --sdl2=$(STAGING_DIR)/usr
XASH3D_FWGS_CONF_OPTS += --disable-vgui
XASH3D_FWGS_CONF_OPTS += --disable-menu-changegame
XASH3D_FWGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC" CXXFLAGS="$(TARGET_CXXFLAGS) -fPIC"

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

define XASH3D_FWGS_EVMAPY
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/xash3d/xash3d-fwgs/xash3d_fwgs.keys $(TARGET_DIR)/usr/share/evmapy
endef

XASH3D_FWGS_POST_INSTALL_TARGET_HOOKS += XASH3D_FWGS_EVMAPY

$(eval $(waf-package))
