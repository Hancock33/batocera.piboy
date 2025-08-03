################################################################################
#
# simcoupe
#
################################################################################
# Version: Commits on Aug 01, 2025
SIMCOUPE_VERSION = 0f74cff52b96841fe0efa01ffd1a6875b253e72a
SIMCOUPE_SITE = $(call github,simonowen,simcoupe,$(SIMCOUPE_VERSION))
SIMCOUPE_DEPENDENCIES = sdl2
SIMCOUPE_LICENSE = GPL-3.0
SIMCOUPE_SUPPORTS_IN_SOURCE_BUILD = YES
SIMCOUPE_BIOS_AND_RESOURCES = /usr/share/simcoupe

SIMCOUPE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define SIMCOUPE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/simcoupe $(TARGET_DIR)/usr/bin/simcoupe
	cp -d $(@D)/_deps/saasound-build/libSAASound* $(TARGET_DIR)/usr/lib/
	mkdir -p $(TARGET_DIR)$(SIMCOUPE_BIOS_AND_RESOURCES)
	cp -R $(@D)/Resource/* $(TARGET_DIR)$(SIMCOUPE_BIOS_AND_RESOURCES)
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/simcoupe/samcoupe.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
