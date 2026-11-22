################################################################################
#
# demul
#
################################################################################
# version: DEmul x86 v0.7 BUILD 251220 - closed source
DEMUL_VERSION = demul_251220
DEMUL_SOURCE = $(DEMUL_VERSION).7z
DEMUL_SITE = $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/demul
DEMUL_SITE_METHOD = file
DEMUL_LICENSE = PROPRIETARY

DEMUL_DEPENDENCIES = xdotool

$(eval $(call register,demul.emulator.yml))

define DEMUL_EXTRACT_CMDS
	mkdir -p $(@D) && cd $(@D) && 7zr x -y $(DL_DIR)/$(DEMUL_DL_SUBDIR)/$(DEMUL_SOURCE)
endef

define DEMUL_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/demul
	mkdir -p $(TARGET_DIR)/usr/bin/demul
	cp -av $(@D)/* $(TARGET_DIR)/usr/bin/demul

	# copy evmapy configs
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(DEMUL_PKGDIR)/*.keys

	# copy modified pad ini file for 2 players
	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/bin/demul $(DEMUL_PKGDIR)/padDemul.ini
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
