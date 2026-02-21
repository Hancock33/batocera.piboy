################################################################################
#
# droidports
#
################################################################################
# Version: Commits on Jul 06, 2023
DROIDPORTS_VERSION = 9e43646b43ca3bf80a50edfc1a212d2c702b617d
DROIDPORTS_SITE = https://github.com/JohnnyonFlame/droidports.git
DROIDPORTS_SITE_METHOD=git
DROIDPORTS_GIT_SUBMODULES=YES
DROIDPORTS_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
DROIDPORTS_LICENSE = GPL-2.0

DROIDPORTS_SUPPORTS_IN_SOURCE_BUILD = NO

DROIDPORTS_CONF_OPTS += -DPLATFORM=linux
DROIDPORTS_CONF_OPTS += -DPORT=gmloader
DROIDPORTS_CONF_OPTS += -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake
DROIDPORTS_CONF_OPTS += -DCMAKE_C_FLAGS="-std=gnu17 -Wno-error -Wno-incompatible-pointer-types -Wno-int-conversion -Wno-implicit-function-declaration"

define DROIDPORTS_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/gmloader $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
