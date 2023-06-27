################################################################################
#
# droidports
#
################################################################################
# Version: Commits on Jun 25, 2023
DROIDPORTS_VERSION = b68d5cd9b61aa99a211b06a427cf6c0de3851af2
DROIDPORTS_SITE = https://github.com/JohnnyonFlame/droidports.git
DROIDPORTS_SITE_METHOD=git
DROIDPORTS_GIT_SUBMODULES=YES

DROIDPORTS_DEPENDENCIES = sdl2 sdl2_image zlib libzip freetype bzip2 libpng openal
DROIDPORTS_LICENSE = GPL-2.0

DROIDPORTS_SUPPORTS_IN_SOURCE_BUILD = NO

DROIDPORTS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
DROIDPORTS_CONF_OPTS += -DPLATFORM=linux
DROIDPORTS_CONF_OPTS += -DPORT=gmloader
DROIDPORTS_CONF_OPTS += -DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake

ifeq ($(BR2_arm),y)
	DROIDPORTS_CONF_OPTS += -DCMAKE_CXX_FLAGS="-w -mlittle-endian -fsingle-precision-constant -Wdouble-promotion -Wfloat-conversion -lm"
	DROIDPORTS_CONF_OPTS += -DCMAKE_C_FLAGS="-w -mlittle-endian -fsingle-precision-constant -Wdouble-promotion -Wfloat-conversion -lm"
endif

define DROIDPORTS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/DROIDPORTS
	cp -pvr $(@D)/buildroot-build/gmloader $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
