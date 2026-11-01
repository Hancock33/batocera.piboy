################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Oct 26, 2026
SONICCD_VERSION = 2a7fd8b70f1b33553e0d6c67491d07e8290b80c1
SONICCD_SITE = https://github.com/RSDKModding/RSDKv3-Decompilation.git
SONICCD_SITE_METHOD = git
SONICCD_GIT_SUBMODULES = YES
SONICCD_SUPPORTS_IN_SOURCE_BUILD = NO
SONICCD_LICENSE = Custom
SONICCD_EMULATOR_INFO = soniccd.emulator.yml

SONICCD_DEPENDENCIES = libogg libtheora libvorbis sdl2

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    SONICCD_DEPENDENCIES += libglew libglu
endif

define SONICCD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv3 $(TARGET_DIR)/usr/bin/soniccd
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
