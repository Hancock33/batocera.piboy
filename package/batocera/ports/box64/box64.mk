################################################################################
#
# box64
#
################################################################################
# Version: Commits on Feb 04, 2023
BOX64_VERSION = 09e748d6c90e4ded09cb966c9b30c49bea9895eb
BOX64_SITE = https://github.com/ptitseb/box64.git
BOX64_SITE_METHOD=git
BOX64_GIT_SUBMODULES=YES
BOX64_SUPPORTS_IN_SOURCE_BUILD = NO

BOX64_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
BOX64_LICENSE = GPL-3.0

BOX64_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
BOX64_CONF_OPTS += -DRPI4=1

define BOX64_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/box64 $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/box64/lib
	cp -pvr $(@D)/x64lib/* $(TARGET_DIR)/usr/share/box64/lib
endef

$(eval $(cmake-package))
