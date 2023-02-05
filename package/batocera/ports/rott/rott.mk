################################################################################
#
# rott
#
################################################################################
# Version: Commits on Jan 04, 2021
ROTT_VERSION = 407e3d8b07eaa968e8ed7d52a03fd3199dccdddf
ROTT_SITE = $(call github,LTCHIPS,rottexpr,$(ROTT_VERSION))

ROTT_DEPENDENCIES = sdl2 sdl2_mixer
ROTT_LICENSE = GPLv2

define ROTT_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC) -fPIC" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)/src -f Makefile DATADIR="/userdata/roms/ports/rott"
endef

define ROTT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/src/rott -D $(TARGET_DIR)/usr/bin/rott-darkwar
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rott/rott.keys $(TARGET_DIR)/usr/share/evmapy/rott.keys
endef

$(eval $(generic-package))
