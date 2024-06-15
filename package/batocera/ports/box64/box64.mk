################################################################################
#
# box64
#
################################################################################
# Version: Commits on Jun 15, 2024
BOX64_VERSION = ece732ba41a7e6e516de081eaf2f0cb465e8115e
BOX64_SITE = $(call github,ptitseb,box64,$(BOX64_VERSION))
BOX64_SUPPORTS_IN_SOURCE_BUILD = NO

BOX64_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
BOX64_LICENSE = GPL-3.0

BOX64_CONF_OPTS += -DRPI4ARM64=1
BOX64_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=""
BOX64_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
BOX64_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
BOX64_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_OPTIMIZATION)"
BOX64_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_OPTIMIZATION)"

define BOX64_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/box64 $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/box64/lib
	cp -pvr $(@D)/x64lib/* $(TARGET_DIR)/usr/share/box64/lib
endef

$(eval $(cmake-package))
