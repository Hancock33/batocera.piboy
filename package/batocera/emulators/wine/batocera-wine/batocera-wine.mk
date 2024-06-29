################################################################################
#
# batocera-wine
#
################################################################################

BATOCERA_WINE_VERSION = 1.1
BATOCERA_WINE_LICENSE = GPL
BATOCERA_WINE_SOURCE=
#BATOCERA_WINE_DEPENDENCIES = wine-x86

define BATOCERA_WINE_INSTALL_TARGET_CMDS
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/wine/batocera-wine/batocera-wine			$(TARGET_DIR)/usr/bin/batocera-wine
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/wine/batocera-wine/batocera-wine-runners	$(TARGET_DIR)/usr/bin/batocera-wine-runners
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/wine/batocera-wine/bsod.py					$(TARGET_DIR)/usr/bin/bsod-wine
	ln -fs /userdata/system/99-nvidia.conf $(TARGET_DIR)/etc/X11/xorg.conf.d/99-nvidia.conf

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/wine/batocera-wine/mugen.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
