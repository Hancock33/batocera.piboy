################################################################################
#
# tekwar
#
################################################################################
# Version: Commits on Mar 08, 2025
TEKWAR_VERSION = c0efc619e85dc318b363e16fa64770c788f74a23
TEKWAR_SITE = https://github.com/jonof/jftekwar.git

TEKWAR_DEPENDENCIES = sdl2 sdl2_image
TEKWAR_SITE_METHOD=git
TEKWAR_GIT_SUBMODULES=YES
TEKWAR_LICENSE = GPLv3

define TEKWAR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
	-C $(@D) -f Makefile RELEASE=1 WITHOUT_GTK=1 USE_OPENGL=1 USE_POLYMOST=1
endef

define TEKWAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/tekwar -D $(TARGET_DIR)/usr/bin/etekwar
	# make rom path
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/etekwar
	cp $(@D)/rsrc/*.dat $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/etekwar/

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/tekwar/tekwar.keys $(TARGET_DIR)/usr/share/evmapy/etekwar.keys
endef

$(eval $(generic-package))
