################################################################################
#
# bstone
#
################################################################################
# Version: Commits on May 27, 2026
BSTONE_VERSION = v1.3.4
BSTONE_SITE = $(call github,bibendovsky,bstone,$(BSTONE_VERSION))

BSTONE_DEPENDENCIES = openal sdl2 sdl2_mixer
BSTONE_LICENSE = GPL-2.0
BSTONE_SUPPORTS_IN_SOURCE_BUILD = NO
BSTONE_EMULATOR_INFO = bstone.emulator.yml

BSTONE_CONF_OPTS += -DBSTONE_CI_GIT_HASH="$(shell echo $(BSTONE_VERSION) | cut -c 1-7)"
BSTONE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
BSTONE_CONF_OPTS += -DCMAKE_INSTALL_PREFIX="/usr/bin"

define BSTONE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/src/bstone/bstone $(TARGET_DIR)/usr/bin/bstone
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(BSTONE_PKGDIR)/bstone.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
