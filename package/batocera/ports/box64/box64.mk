################################################################################
#
# box64
#
################################################################################
# Version: Commits on Jan 23, 2024
BOX64_VERSION = aba3e4a460388b64137d02b5635392987742a67a
BOX64_SITE = https://github.com/ptitseb/box64.git
BOX64_SITE_METHOD=git
BOX64_GIT_SUBMODULES=YES
BOX64_SUPPORTS_IN_SOURCE_BUILD = NO

BOX64_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
BOX64_LICENSE = GPL-3.0

BOX64_CONF_OPTS += -DRPI4=1
BOX64_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=""
BOX64_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
BOX64_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define BOX64_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/box64 $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/box64/lib
	cp -pvr $(@D)/x64lib/* $(TARGET_DIR)/usr/share/box64/lib
endef

$(eval $(cmake-package))
