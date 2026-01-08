################################################################################
#
# box64
#
################################################################################
# Version: Commits on Jan 08, 2026
BOX64_VERSION = 57e87b4ee92ea6dc2d6383af8d3b0faf08ff345a
BOX64_SITE = $(call github,ptitseb,box64,$(BOX64_VERSION))
BOX64_SUPPORTS_IN_SOURCE_BUILD = NO

BOX64_DEPENDENCIES = bzip2 freetype libpng libzip openal sdl2 sdl2_image zlib
BOX64_LICENSE = GPL-3.0

BOX64_CONF_OPTS += -DRPI4ARM64=1
BOX64_CONF_OPTS += -DWITH_MOLD=ON
BOX64_CONF_OPTS += -DBOX32=ON
BOX64_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_OPTIMIZATION)"
BOX64_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_OPTIMIZATION)"

define BOX64_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/box64 $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/box64/lib
	cp -pvr $(@D)/x64lib/* $(TARGET_DIR)/usr/share/box64/lib
endef

$(eval $(cmake-package))
