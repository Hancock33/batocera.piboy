################################################################################
#
# xpi_gamecon_rpi
#
################################################################################
# Version: Commits on Aug 07, 2022
XPI_GAMECON_RPI_VERSION = f30cea1a30e4e9ad8fcf3b7da48f2770b4ea3368
XPI_GAMECON_RPI_SITE = $(call github,hancock33,piboycontrols,$(XPI_GAMECON_RPI_VERSION))
XPI_GAMECON_RPI_LICENSE = GPL-2.0
XPI_GAMECON_RPI_DEPENDENCIES = linux
define XPI_GAMECON_RPI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(XPI_GAMECON_RPI_PKGDIR)/S19piboy $(TARGET_DIR)/etc/init.d/S19piboy
	$(INSTALL) -D -m 0755 $(XPI_GAMECON_RPI_PKGDIR)/piboy-dmgcontrol.py $(TARGET_DIR)/usr/bin/piboy-dmgcontrol.py
	$(INSTALL) -D -m 0644 $(XPI_GAMECON_RPI_PKGDIR)/piboy_powerswitch.rules $(TARGET_DIR)/etc/udev/rules.d/60-piboy_powerswitch.rules
	$(INSTALL) -D -m 0754 $(XPI_GAMECON_RPI_PKGDIR)/piboy_keys $(TARGET_DIR)/usr/bin/piboy_keys
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/batocera/datainit/system $(XPI_GAMECON_RPI_PKGDIR)/piboy-fan.conf $(XPI_GAMECON_RPI_PKGDIR)/piboy-led.conf $(XPI_GAMECON_RPI_PKGDIR)/piboy-power.conf
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms
	cp -pr $(XPI_GAMECON_RPI_PKGDIR)/roms/piboy $(TARGET_DIR)/usr/share/batocera/datainit/roms
endef

$(eval $(generic-package))
