################################################################################
#
# box86
#
################################################################################
# Version: Commits on Sept 24, 2022
BOX86_VERSION = 3024f27b7a0df103855314a1c84a9d11804959f2
BOX86_SITE = https://github.com/ptitseb/box86.git
BOX86_SITE_METHOD=git
BOX86_GIT_SUBMODULES=YES
BOX86_SUPPORTS_IN_SOURCE_BUILD = NO

BOX86_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
BOX86_LICENSE = GPL-3.0

BOX86_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
BOX86_CONF_OPTS += -DRPI4=1

define BOX86_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/box86 $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/box86/lib
	cp -pvr $(@D)/x86lib/* $(TARGET_DIR)/usr/share/box86/lib
endef

$(eval $(cmake-package))
