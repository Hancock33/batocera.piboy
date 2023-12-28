################################################################################
#
# srb2
#
################################################################################
# Version: Commits on Dec 26, 2023
SRB2_VERSION = 5d7ee3974fe376cc49e40a8f66cecb4477622f68
SRB2_SITE = $(call github,STJr,SRB2,$(SRB2_VERSION))

SRB2_DEPENDENCIES = sdl2 sdl2_mixer libgme libopenmpt
SRB2_LICENSE = GPL-2.0
SRB2_SUPPORTS_IN_SOURCE_BUILD = NO

define SRB2_ASSETS
	mkdir -p $(@D)/assets/installer
	cp -avr /home/lee/srb2-assets/* $(@D)/assets/installer
endef

SRB2_POST_EXTRACT_HOOKS += SRB2_ASSETS

define SRB2_BUILD_CMDS
	$(SED) "s|^comptime\.c ::|comptime.c :|" $(@D)/src/Makefile
	$(SED) "s|-DCOMPVERSION||g" $(@D)/src/Makefile
	$(SED) "s|illegal|BATOCERA|g" $(@D)/src/comptime.c
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile DEBUGMODE=0 LINUX64=1 NOHW=1
endef

define SRB2_INSTALL_TARGET_CMDS
	cp -L $(@D)/bin/debug/lsdl2srb2.debug $(TARGET_DIR)/usr/bin/srb2
	chmod 754 $(TARGET_DIR)/usr/bin/srb2
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.srb2
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/srb2/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.srb2/
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/sonic/srb2/srb2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
