################################################################################
#
# sdl12-compat
#
################################################################################
# Version: Commits on Oct 25, 2025
SDL12_COMPAT_VERSION = 192cef725169c0732175884ad1bebe430bb0034b
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
