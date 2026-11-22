################################################################################
#
# batocera-wine
#
################################################################################

BATOCERA_WINE_VERSION = 1.5
BATOCERA_WINE_LICENSE = GPL
BATOCERA_WINE_SOURCE =
BATOCERA_WINE_DEPENDENCIES = wine-x86

define BATOCERA_WINE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_WINE_PKGDIR)/batocera-wine $(TARGET_DIR)/usr/bin/batocera-wine
	$(INSTALL) -D -m 0755 $(BATOCERA_WINE_PKGDIR)/batocera-wine-runners $(TARGET_DIR)/usr/bin/batocera-wine-runners
	$(INSTALL) -D -m 0755 $(BATOCERA_WINE_PKGDIR)/bsod.py $(TARGET_DIR)/usr/bin/bsod-wine
	mkdir -p $(TARGET_DIR)/etc/X11/xorg.conf.d
	ln -fs /userdata/system/99-nvidia.conf $(TARGET_DIR)/etc/X11/xorg.conf.d/99-nvidia.conf
	$(INSTALL) -D -m 0644 $(BATOCERA_WINE_PKGDIR)/mugen.keys $(TARGET_DIR)/usr/share/evmapy/mugen.keys
endef

$(eval $(generic-package))
