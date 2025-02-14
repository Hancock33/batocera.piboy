################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Feb 13, 2025
SONICCD_VERSION = bcfcd0bfdeea6c5b19d9cc5fb50700d11b62419a
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
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/soniccd/sonicretro.soniccd.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
