################################################################################
#
# tekwar
#
################################################################################
# Version: Commits on Jan 08, 2023
TEKWAR_VERSION = 45c37ed419c252da5b89a3af53aa72ba640d0fc5
TEKWAR_SITE = https://github.com/jonof/jftekwar.git

TEKWAR_DEPENDENCIES = sdl2 sdl2_image
TEKWAR_SITE_METHOD=git
TEKWAR_GIT_SUBMODULES=YES
TEKWAR_LICENSE = GPLv3
#TEKWAR_FLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -w -pipe -fsigned-char -D_FORTIFY_SOURCE=1 -fPIC"

define TEKWAR_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
	-C $(@D) -f Makefile RELEASE=1 WITHOUT_GTK=1 USE_OPENGL=1 USE_POLYMOST=1
endef

define TEKWAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/tekwar -D $(TARGET_DIR)/usr/bin/etekwar
	# make rom path
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/etekwar
	cp $(@D)/data/*.dat $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/etekwar/

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/tekwar/tekwar.keys $(TARGET_DIR)/usr/share/evmapy/etekwar.keys
endef

$(eval $(generic-package))
