################################################################################
#
# sonicnexus
#
################################################################################
# Version: Commits on Apr 17, 2022
SONICNEXUS_VERSION = cdfe25cb84998645992a7a123f1bdc0a13eb9d90
SONICNEXUS_SITE = https://github.com/Rubberduckycooly/Sonic-Nexus-Decompilation.git
SONICNEXUS_SITE_METHOD = git
SONICNEXUS_GIT_SUBMODULES = YES

SONICNEXUS_DEPENDENCIES = sdl2 libogg libvorbis
SONICNEXUS_LICENSE = Custom

define SONICNEXUS_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -flto" CXXFLAGS="$(TARGET_CXXFLAGS) -flto" \
	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile USE_HW_REN=1
endef

define SONICNEXUS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/nexus  $(TARGET_DIR)/usr/bin/sonicnexus
endef

define SONICNEXUS_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/sonicnexus/sonicnexus.keys $(TARGET_DIR)/usr/share/evmapy
endef

SONICNEXUS_POST_INSTALL_TARGET_HOOKS += SONICNEXUS_EVMAPY

$(eval $(generic-package))
