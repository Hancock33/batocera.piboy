################################################################################
#
# stenzek-shaderc
#
################################################################################
# Note: shaderc patch required from:
# Version: Commits on Aug 09, 2024
STENZEK_SHADERC_VERSION = 6d2848321250a19641800f8afb07738f3b0b7f18
STENZEK_SHADERC_SITE = $(call github,google,shaderc,$(STENZEK_SHADERC_VERSION))
STENZEK_SHADERC_LICENSE = Apache License v2
STENZEK_SHADERC_LICENSE_FILES = LICENSE
STENZEK_SHADERC_DEPENDENCIES = glslang
STENZEK_SHADERC_SUPPORTS_IN_SOURCE_BUILD = NO
STENZEK_SHADERC_INSTALL_STAGING = YES

STENZEK_SHADERC_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
STENZEK_SHADERC_CONF_OPTS += -DSHADERC_SKIP_TESTS=ON
STENZEK_SHADERC_CONF_OPTS += -DSHADERC_SKIP_EXAMPLES=ON

STENZEK_SHADERC_INSTALL_STAGING_OPTS = --prefix /stenzek-shaderc
STENZEK_SHADERC_INSTALL_TARGET_OPTS = --prefix /usr/stenzek-shaderc

define STENZEK_SHADERC_SYNC_DEPS
	cd $(@D) && PATH=$(BR_PATH) ./utils/git-sync-deps
endef

STENZEK_SHADERC_PRE_CONFIGURE_HOOKS += STENZEK_SHADERC_SYNC_DEPS

$(eval $(cmake-package))
