################################################################################
#
# srb2
#
################################################################################
# Version: Commits on Jan 26, 2025
SRB2_VERSION = SRB2_release_2.2.15
SRB2_SITE = $(call github,STJr,SRB2,$(SRB2_VERSION))
SRB2_EMULATOR_INFO = srb2.emulator.yml
SRB2_DEPENDENCIES = libgme libopenmpt sdl2 sdl2_mixer
SRB2_LICENSE = GPL-2.0
SRB2_SUPPORTS_IN_SOURCE_BUILD = NO

SRB2_CONF_OPTS += -DSRB2_SDL2_EXE_NAME=srb2
SRB2_CONF_OPTS += -DSRB2_CONFIG_ENABLE_TESTS=FALSE

define SRB2_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/buildroot-build/bin/srb2 $(TARGET_DIR)/usr/bin/srb2
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/batocera/datainit/system/.srb2 $(SRB2_PKGDIR)/config.cfg
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(SRB2_PKGDIR)/srb2.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
