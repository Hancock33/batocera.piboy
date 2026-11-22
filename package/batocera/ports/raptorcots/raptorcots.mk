################################################################################
#
# raptorcots
#
################################################################################
# Version: Commits on Sept 28, 2026
RAPTORCOTS_VERSION = 746c35a256bfa2afc6732c7923be9e2e777d6bf0
RAPTORCOTS_SITE = $(call github,skynettx,raptor,$(RAPTORCOTS_VERSION))
RAPTORCOTS_EMULATOR_INFO = raptor.emulator.yml
RAPTORCOTS_DEPENDENCIES = sdl2 openal
RAPTORCOTS_LICENSE = GPL-2.0
RAPTORCOTS_SUPPORTS_IN_SOURCE_BUILD = NO

#RAPTORCOTS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--unresolved-symbols=ignore-all"

define RAPTORCOTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/bin/raptor $(TARGET_DIR)/usr/bin/raptor
	$(INSTALL) -m 0644 -D "$(@D)/SETUP(ADLIB).INI" $(TARGET_DIR)/usr/share/raptor/SETUP.INI
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(RAPTORCOTS_PKGDIR)/raptor.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
