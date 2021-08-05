################################################################################
#
# SIMCOUPE
#
################################################################################
# Version.: Commits on Jun 23, 2021
SIMCOUPE_VERSION = 37b254a378f67ef4ffa450ad5d75e65190ad8806
SIMCOUPE_SITE = $(call github,simonowen,simcoupe,$(SIMCOUPE_VERSION))

SIMCOUPE_LICENSE = GPL-3.0
SIMCOUPE_SUPPORTS_IN_SOURCE_BUILD = YES
SIMCOUPE_BIOS_AND_RESOURCES = /usr/share/simcoupe
SIMCOUPE_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release

SIMCOUPE_BIOS_AND_RESOURCES = /usr/share/simcoupe

define SIMCOUPE_SETUP_CMAKE
		sed -i -E -e "s|set\(RESOURCE_DIR \\$$\{CMAKE_INSTALL_PREFIX\}/share/\\$$\{PROJECT_NAME\}\)|set(RESOURCE_DIR $(SIMCOUPE_BIOS_AND_RESOURCES))|g" $(@D)/CMakeLists.txt
endef

SIMCOUPE_PRE_CONFIGURE_HOOKS += SIMCOUPE_SETUP_CMAKE

define SIMCOUPE_INSTALL_TARGET_CMDS
		$(INSTALL) -D $(@D)/simcoupe $(TARGET_DIR)/usr/bin/simcoupe
		$(INSTALL) -D $(@D)/Extern/saasound/libSAASound* $(TARGET_DIR)/usr/lib/
		$(INSTALL) -D $(@D)/Extern/resid/libresid* $(TARGET_DIR)/usr/lib/
		$(INSTALL) -D $(@D)/Extern/fmt/libfmt* $(TARGET_DIR)/usr/lib/
		mkdir -p $(TARGET_DIR)$(SIMCOUPE_BIOS_AND_RESOURCES)
		cp -R $(@D)/Resource/* $(TARGET_DIR)$(SIMCOUPE_BIOS_AND_RESOURCES)
		cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/simcoupe/samcoupe.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
