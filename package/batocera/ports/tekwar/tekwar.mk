################################################################################
#
# tekwar
#
################################################################################
# Version: Commits on Jun 01, 2026
TEKWAR_VERSION = 20260603
TEKWAR_SITE = https://github.com/jonof/jftekwar.git
TEKWAR_EMULATOR_INFO = etekwar.emulator.yml
TEKWAR_DEPENDENCIES = sdl2 sdl2_image
TEKWAR_SITE_METHOD=git
TEKWAR_GIT_SUBMODULES=YES
TEKWAR_LICENSE = GPL-3.0

define TEKWAR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -j2 \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
	-C $(@D) -f Makefile RELEASE=1 WITHOUT_GTK=1 USE_OPENGL=1 USE_POLYMOST=1
endef

define TEKWAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/tekwar -D $(TARGET_DIR)/usr/bin/etekwar
	# make rom path
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/etekwar $(@D)/rsrc/*.dat

	# evmap config
	$(INSTALL) -m 0644 -D $(TEKWAR_PKGDIR)/tekwar.keys $(TARGET_DIR)/usr/share/evmapy/etekwar.keys
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
