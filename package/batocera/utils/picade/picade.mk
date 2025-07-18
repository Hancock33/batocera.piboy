################################################################################
#
# picade
#
################################################################################
# Version: Commits on Jul 17, 2025
PICADE_VERSION = 1b6fdfb4fd10f0dc2e797f681922a371c36b6ab0
PICADE_SITE = $(call github,pimoroni,picade-hat,$(PICADE_VERSION))

define PICADE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define PICADE_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)/rpi-firmware/overlays
	cp $(@D)/picade.dtbo $(BINARIES_DIR)/rpi-firmware/overlays/picade.dtbo
endef

$(eval $(generic-package))
