################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Jan 24, 2026
SONICCD_VERSION = 8f232208c4ec68828737343627316ee9fc75bf12
SONICCD_SITE = https://github.com/RSDKModding/RSDKv3-Decompilation.git
SONICCD_SITE_METHOD = git
SONICCD_GIT_SUBMODULES = YES
SONICCD_SUPPORTS_IN_SOURCE_BUILD = NO
SONICCD_LICENSE = Custom

SONICCD_DEPENDENCIES = libogg libtheora libvorbis sdl2

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    SONICCD_DEPENDENCIES += libglew libglu
endif

define SONICCD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv3 $(TARGET_DIR)/usr/bin/soniccd
endef

$(eval $(cmake-package))
