################################################################################
#
# model2emu
#
################################################################################
# Version: Commits on Jan 02, 2014
MODEL2EMU_VERSION = 1.1a
MODEL2EMU_SOURCE = m2emulator.zip
# Closed source not developed since 2014, source location updated since previous website is now unavailable
MODEL2EMU_SITE = https://github.com/batocera-linux/model2emu/raw/main

MODEL2EMU_EXTRAS = $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/model2emu

define MODEL2EMU_EXTRACT_CMDS
	mkdir -p $(@D) && cd $(@D) && unzip -x \
		$(DL_DIR)/$(MODEL2EMU_DL_SUBDIR)/$(MODEL2EMU_SOURCE)
endef

define MODEL2EMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/model2emu
	cp -pvr $(@D)/* $(TARGET_DIR)/usr/bin/model2emu
	# extra files
	unzip -uo $(MODEL2EMU_EXTRAS)/model2scripts.zip \
		-d $(TARGET_DIR)/usr/bin/model2emu/
	# important that this is extracted after the script above ^
	unzip -uo $(MODEL2EMU_EXTRAS)/sindenborderscripts.zip \
		-d $(TARGET_DIR)/usr/bin/model2emu/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(MODEL2EMU_EXTRAS)/model2.model2emu.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
