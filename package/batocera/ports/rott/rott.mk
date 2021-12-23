################################################################################
#
# ROTT
#
################################################################################
# Version.: Commits on Sept 21, 2020
ROTT_VERSION = 72ce197667478745d9a0ed843aa77af45503149a
ROTT_SITE = $(call github,zerojay,RoTT,$(ROTT_VERSION))

ROTT_DEPENDENCIES = sdl sdl_mixer
ROTT_LICENSE = GPLv2

define ROTT_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D) -f Makefile rott-darkwar
endef

define ROTT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/rott-darkwar -D $(TARGET_DIR)/usr/bin/rott-darkwar
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	#cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rott/rott.keys $(TARGET_DIR)/usr/share/evmapy/rott.keys
endef

$(eval $(generic-package))
