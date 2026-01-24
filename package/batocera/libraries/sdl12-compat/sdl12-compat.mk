################################################################################
#
# sdl12-compat
#
################################################################################
# Version: Commits on Jan 24, 2026
SDL12_COMPAT_VERSION = e1c4dbfa9a171e4743a8f7135d58be228dff2b4a
SDL12_COMPAT_SITE = $(call github,libsdl-org,sdl12-compat,$(SDL12_COMPAT_VERSION))

SDL12_COMPAT_DEPENDENCIES += sdl2
SDL12_COMPAT_LICENSE = LGPLv3
SDL12_COMPAT_INSTALL_STAGING = YES

SDL12_COMPAT_CONF_OPTS += -DSDL12TESTS=OFF

define SDL12_COMPAT_SDLCONFIG
	sed -i "s|/usr|$(STAGING_DIR)/usr|" $(STAGING_DIR)/usr/bin/sdl-config
endef
SDL12_COMPAT_POST_INSTALL_TARGET_HOOKS += SDL12_COMPAT_SDLCONFIG

$(eval $(cmake-package))
