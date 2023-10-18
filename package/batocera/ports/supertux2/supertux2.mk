################################################################################
#
# supertux2
#
################################################################################
# Version: Commits on Oct 18, 2023
SUPERTUX2_VERSION = 74f1977de5898b20958b7db3b1bca86fa8efaa88
SUPERTUX2_SITE = https://github.com/SuperTux/supertux.git
SUPERTUX2_SITE_METHOD=git
SUPERTUX2_GIT_SUBMODULES=YES
SUPERTUX2_SUPPORTS_IN_SOURCE_BUILD = NO

# Supertux itself is GPL-3.0+, but it bundles a few libraries with different
# licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
SUPERTUX2_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, CC-BY-SA-4.0, GPL-2.0+ (images music sounds)
SUPERTUX2_LICENSE_FILES = LICENSE.txt data/AUTHORS

SUPERTUX2_DEPENDENCIES = host-pkgconf boost freetype libcurl \
	libogg libpng libvorbis openal physfs sdl2 sdl2_image zlib

SUPERTUX2_CONF_OPTS += \
	-DBUILD_DOCUMENTATION=OFF \
	-DINSTALL_SUBDIR_BIN="bin" \
	-DINSTALL_SUBDIR_SHARE="share/supertux2" \
	-DGIT_VERSION="$(shell echo $(SUPERTUX2_VERSION) | cut -c 1-7)"

define SUPERTUX2_INSTALL_TARGET_CMDS
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2
	touch $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2/SuperTux2.game
	cp -a $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/supertux2/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2
	ln -sf /userdata/roms/ports/supertux2 $(TARGET_DIR)/usr/share/supertux2
	# copy libraries
	cp -a $(@D)/buildroot-build/libLibPartioZip.so $(TARGET_DIR)/usr/lib
	cp -a $(@D)/buildroot-build/supertux2 $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/supertux2/supertux2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
