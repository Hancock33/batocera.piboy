################################################################################
#
# sonic2013
#
################################################################################
# Version: Commits on May 25, 2025
SONIC2013_VERSION = 98df0e76b212d31bfb465f5e7adb161260d21350
SONIC2013_SITE = https://github.com/RSDKModding/RSDKv4-Decompilation.git
SONIC2013_SITE_METHOD = git
SONIC2013_GIT_SUBMODULES = YES
SONIC2013_SUPPORTS_IN_SOURCE_BUILD = NO
SONIC2013_LICENSE = Custom

SONIC2013_DEPENDENCIES = libogg libvorbis sdl2

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
    SONIC2013_DEPENDENCIES += libglew libglu
endif

define SONIC2013_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/RSDKv4 $(TARGET_DIR)/usr/bin/sonic2013
endef

$(eval $(cmake-package))
