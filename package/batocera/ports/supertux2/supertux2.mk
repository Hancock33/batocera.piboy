################################################################################
#
# supertux2
#
################################################################################
# Version: Commits on Jul 27, 2025
SUPERTUX2_VERSION = 3bbc838c71cdf59a6dea09258fe26f6c9314b236
SUPERTUX2_SITE = https://github.com/SuperTux/supertux.git
SUPERTUX2_SITE_METHOD=git
SUPERTUX2_GIT_SUBMODULES=YES
SUPERTUX2_SUPPORTS_IN_SOURCE_BUILD = NO
SUPERTUX2_CMAKE_BACKEND = make

# Supertux itself is GPL-3.0+, but it bundles a few libraries with different
# licenses (sexp-cpp, squirrel, tinygettext) which are linked statically.
SUPERTUX2_LICENSE = GPL-3.0+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, CC-BY-SA-4.0, GPL-2.0+ (images music sounds)
SUPERTUX2_LICENSE_FILES = LICENSE.txt data/AUTHORS

SUPERTUX2_DEPENDENCIES = boost freetype host-pkgconf libcurl libogg libpng libvorbis openal physfs sdl2 sdl2_image zlib

SUPERTUX2_CONF_OPTS +=-DBUILD_DOCUMENTATION=OFF
SUPERTUX2_CONF_OPTS +=-DINSTALL_SUBDIR_BIN="bin"
SUPERTUX2_CONF_OPTS +=-DINSTALL_SUBDIR_SHARE="share/supertux2"
SUPERTUX2_CONF_OPTS +=-DSUPERTUX_PACKAGE_VERSION="v0.6.3-dev"
SUPERTUX2_CONF_OPTS +=-DSUPERTUX_VERSION_STRING="$(shell echo $(SUPERTUX2_VERSION) | cut -c 1-7)"

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
