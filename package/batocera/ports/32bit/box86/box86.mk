################################################################################
#
# box86
#
################################################################################
# Version: Commits on Aug 06, 2024
BOX86_VERSION = 9811f140ce8faa5f12fc224afb5eda39cde85a09
BOX86_SITE = $(call github,ptitseb,box86,$(BOX86_VERSION))
BOX86_SUPPORTS_IN_SOURCE_BUILD = NO

BOX86_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
BOX86_LICENSE = GPL-3.0

BOX86_CONF_OPTS += -DRPI4=1
BOX86_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=""
BOX86_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
BOX86_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define BOX86_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/box86 $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/box86/lib
	cp -pvr $(@D)/x86lib/* $(TARGET_DIR)/usr/share/box86/lib
endef

$(eval $(cmake-package))
