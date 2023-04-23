################################################################################
#
# soniccd
#
################################################################################
# Version: Commits on Apr 22, 2023
SONICCD_VERSION = 678fe281e1c7b5af1f7380bcff6f7a7b47aa3e92
SONICCD_SITE = https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation.git
SONICCD_SITE_METHOD = git
SONICCD_GIT_SUBMODULES = YES

SONICCD_DEPENDENCIES = sdl2 libogg libvorbis libtheora
SONICCD_LICENSE = Custom

ifeq ($(BR2_PACKAGE_XORG7),y)
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
