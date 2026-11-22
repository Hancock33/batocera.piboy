################################################################################
#
# simcoupe
#
################################################################################
# Version: Commits on Aug 30, 2026
SIMCOUPE_VERSION = 1f966036543991c05022ce4f95cfbfbb0014b187
SIMCOUPE_SITE = $(call github,simonowen,simcoupe,$(SIMCOUPE_VERSION))
SIMCOUPE_DEPENDENCIES = sdl2
SIMCOUPE_EMULATOR_INFO = samcoupe.emulator.yml
SIMCOUPE_LICENSE = GPL-3.0
SIMCOUPE_SUPPORTS_IN_SOURCE_BUILD = YES
SIMCOUPE_BIOS_AND_RESOURCES = /usr/share/simcoupe

SIMCOUPE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define SIMCOUPE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/simcoupe $(TARGET_DIR)/usr/bin/simcoupe
	cp -d $(@D)/_deps/saasound-build/libSAASound* $(TARGET_DIR)/usr/lib/
	mkdir -p $(TARGET_DIR)$(SIMCOUPE_BIOS_AND_RESOURCES)
	cp -R $(@D)/Resource/* $(TARGET_DIR)$(SIMCOUPE_BIOS_AND_RESOURCES)
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(SIMCOUPE_PKGDIR)/samcoupe.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
