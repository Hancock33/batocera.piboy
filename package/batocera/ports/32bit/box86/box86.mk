################################################################################
#
# Box86
#
################################################################################
# Version: Commits on Apr 18, 2022
BOX86_VERSION = c904d9f66cb30f08956c98152b51dfc5e9a2e3a4
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
endef

$(eval $(cmake-package))
