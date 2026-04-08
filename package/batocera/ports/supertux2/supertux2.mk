################################################################################
#
# supertux2
#
################################################################################
# Version: Commits on Mar 15, 2026
SUPERTUX2_VERSION = v0.7.0
SUPERTUX2_SITE =  https://github.com/SuperTux/supertux/releases/download/$(SUPERTUX2_VERSION)
SUPERTUX2_SOURCE = SuperTux-$(SUPERTUX2_VERSION)-Source.tar.gz
SUPERTUX2_SUPPORTS_IN_SOURCE_BUILD = NO

# Supertux itself is GPL-3.0+, but it bundles a few libraries with different
# licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
SUPERTUX2_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, CC-BY-SA-4.0, GPL-2.0+ (images music sounds)
SUPERTUX2_LICENSE_FILES = LICENSE.txt data/AUTHORS
SUPERTUX2_EMULATOR_INFO = supertux2.emulator.yml
SUPERTUX2_DEPENDENCIES = boost freetype host-pkgconf libcurl libogg libpng libvorbis openal physfs sdl2 sdl2_image zlib

#SUPERTUX2_CONF_ENV = PKG_CONFIG_LIBDIR=$(TARGET_DIR)/lib/pkgconfig:$(TARGET_DIR)/share/pkgconfig

SUPERTUX2_CONF_OPTS += -DBUILD_DOCUMENTATION=OFF
SUPERTUX2_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
SUPERTUX2_CONF_OPTS += -DINSTALL_SUBDIR_BIN="bin"
SUPERTUX2_CONF_OPTS += -DINSTALL_SUBDIR_SHARE="share/supertux2"

define SUPERTUX2_INSTALL_TARGET_CMDS
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2
	touch $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2/SuperTux2.game
	cp -a $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/supertux2/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/supertux2
	ln -sf /userdata/roms/ports/supertux2 $(TARGET_DIR)/usr/share/supertux2
	# copy binaries
	cp -a $(@D)/buildroot-build/supertux2 $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
