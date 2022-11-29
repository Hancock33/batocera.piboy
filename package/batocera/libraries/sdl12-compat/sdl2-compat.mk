################################################################################
#
# sdl12_compat
#
################################################################################
# Version: Commits on Nov 27, 2022
SDL12_COMPAT_VERSION = 137d4515585efa145baca6bf52afd1eb702a6bbc
SDL12_COMPAT_SITE = $(call github,libsdl-org,sdl12-compat,$(SDL12_COMPAT_VERSION))
SDL12_COMPAT_LICENSE = GPL
SDL12_COMPAT_DEPENDENCIES = sdl2
SDL12_COMPAT_INSTALL_STAGING = YES

SDL12_COMPAT_SUPPORTS_IN_SOURCE_BUILD = NO
SDL12_COMPAT_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
SDL12_COMPAT_CONF_OPTS += -DSDL12TESTS=OFF

define SDL12_COMPAT_SDLCONFIG
	sed -i "s|/usr|$(STAGING_DIR)/usr|" $(STAGING_DIR)/usr/bin/sdl-config
endef
SDL12_COMPAT_POST_INSTALL_TARGET_HOOKS += SDL12_COMPAT_SDLCONFIG

$(eval $(cmake-package))
