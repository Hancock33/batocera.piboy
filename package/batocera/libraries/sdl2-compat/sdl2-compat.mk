################################################################################
#
# sdl2_compat
#
################################################################################
# Version: Commits on Nov 19, 2022
SDL2_COMPAT_VERSION = 8bc4b0e345770c3ec36e4100cd00128a18b3282e
SDL2_COMPAT_SITE = $(call github,libsdl-org,sdl12-compat,$(SDL2_COMPAT_VERSION))
SDL2_COMPAT_LICENSE = GPL
SDL2_COMPAT_DEPENDENCIES = sdl2
SDL2_COMPAT_INSTALL_STAGING = YES

SDL2_COMPAT_SUPPORTS_IN_SOURCE_BUILD = NO
SDL2_COMPAT_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
SDL2_COMPAT_CONF_OPTS += -DSDL12TESTS=OFF

define SDL2_COMPAT_SDLCONFIG
	sed -i "s|/usr|$(STAGING_DIR)/usr|" $(STAGING_DIR)/usr/bin/sdl-config
endef
SDL2_COMPAT_POST_INSTALL_TARGET_HOOKS += SDL2_COMPAT_SDLCONFIG

$(eval $(cmake-package))
