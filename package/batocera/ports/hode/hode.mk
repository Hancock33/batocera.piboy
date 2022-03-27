################################################################################
#
# Heart of Darkness
#
################################################################################
# Version: Commits on Mar 27, 2022
HODE_VERSION = ee94cba13a9484be41dbb0c180a3759869e9b67c
HODE_SITE = $(call github,usineur,hode,$(HODE_VERSION))

HODE_DEPENDENCIES = sdl2 sdl2_mixer
HODE_LICENSE = GPLv2

define HODE_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)
endef

define HODE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/hode -D $(TARGET_DIR)/usr/bin/hode

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/hode/hode.keys $(TARGET_DIR)/usr/share/evmapy/hode.keys
endef

$(eval $(generic-package))
