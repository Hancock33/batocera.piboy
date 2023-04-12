################################################################################
#
# sonic2013
#
################################################################################
# Version: Commits on Apr 12, 2023
SONIC2013_VERSION = 72f3296bf006cc96d395ec5d8f0dd37592e65192
SONIC2013_SITE = https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation.git
SONIC2013_SITE_METHOD = git
SONIC2013_GIT_SUBMODULES = YES

SONIC2013_DEPENDENCIES = sdl2 libogg libvorbis
SONIC2013_LICENSE = Custom

define SONIC2013_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile VERBOSE=1
endef

define SONIC2013_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/RSDKv4 $(TARGET_DIR)/usr/bin/sonic2013
endef

$(eval $(generic-package))
