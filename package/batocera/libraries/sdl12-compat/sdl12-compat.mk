################################################################################
#
# sdl12-compat
#
################################################################################
# Version: Commits on Mar 05, 2025
SDL12_COMPAT_VERSION = 60ba97c41e53dfa34f50eb4741c3a758739623d1
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
