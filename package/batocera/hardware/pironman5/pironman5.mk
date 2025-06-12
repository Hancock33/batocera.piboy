################################################################################
#
# pironman5
#
################################################################################
# Version: Commits on Jun 12, 2025
PIRONMAN5_VERSION = b8f44c63437cae7ad9ea665bcd04f14c1c3ee852
PIRONMAN5_SITE = $(call github,sunfounder,pironman5,$(PIRONMAN5_VERSION))
PIRONMAN5_SETUP_TYPE = setuptools
PIRONMAN5_LICENSE = GPL-2.0
PIRONMAN5_LICENSE_FILE = LICENSE

PIRONMAN5_DEPENDENCIES += python-influxdb freetype i2c-tools kmod python-numpy
PIRONMAN5_DEPENDENCIES += python-gpiozero pm_auto sf_rpi_status rpi-eeprom

define PIRONMAN5_INSTALL_OVERLAY
	$(INSTALL) -D -m 0755 $(@D)/bin/pironman5 $(TARGET_DIR)/usr/bin/
	mkdir -p $(BINARIES_DIR)/pironman5/
	$(INSTALL) -D -m 0644 $(@D)/sunfounder-pironman5.dtbo $(BINARIES_DIR)/pironman5/
	# move the config.json
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/pironman5
	mv $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pironman5/config.json \
		$(TARGET_DIR)/usr/share/batocera/datainit/system/configs/pironman5/
endef

PIRONMAN5_POST_INSTALL_TARGET_HOOKS = PIRONMAN5_INSTALL_OVERLAY

$(eval $(python-package))
