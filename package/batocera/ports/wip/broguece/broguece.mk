################################################################################
#
# broguece
#
################################################################################
# Version: Commits on Feb 28, 2023
BROGUECE_VERSION = 1b2e928ef727422b399d558ffa0a293926fba78d
BROGUECE_SITE = $(call github,tmewett,BrogueCE,$(BROGUECE_VERSION))

BROGUECE_DEPENDENCIES = sdl2 sdl2_image
BROGUECE_LICENSE = AGPL-3.0

define BROGUECE_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f Makefile GRAPHICS=YES TERMINAL=NO WEBROGUE=NO
endef

define BROGUECE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/brogue
	$(INSTALL) -D $(@D)/brogue $(TARGET_DIR)/usr/bin/brogue
	chmod 0754 $(TARGET_DIR)/usr/bin/brogue
    cp -av $(@D)/bin/assests $(TARGET_DIR)/usr/share/brogue
endef

$(eval $(generic-package))
