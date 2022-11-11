################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Oct 28, 2022
SONICCD_VERSION = f6d0c7b737fa68718c130fc9e62faea5aa65e293
SONICCD_SITE = https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation.git
SONICCD_SITE_METHOD = git
SONICCD_GIT_SUBMODULES = YES

SONICCD_DEPENDENCIES = sdl2 libogg libvorbis libtheora
SONICCD_LICENSE = Custom

ifeq ($(BR2_PACKAGE_BATOCERA_XORG),y)
	SONICCD_BINNAME = RSDKv3
else
	SONICCD_VERSION = 222caf6
	SONICCD_BINNAME = soniccd
endif

define SONICCD_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile VERBOSE=1
endef

define SONICCD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/$(SONICCD_BINNAME) $(TARGET_DIR)/usr/bin/soniccd
endef

$(eval $(generic-package))
