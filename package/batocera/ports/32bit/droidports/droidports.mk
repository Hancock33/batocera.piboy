################################################################################
#
# droidports
#
################################################################################
# Version: Commits on Apr 26, 2023
DROIDPORTS_VERSION = caf1246fab352a004e42121db161251772308d11
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
