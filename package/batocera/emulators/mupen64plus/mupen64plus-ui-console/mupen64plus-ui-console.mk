################################################################################
#
# mupen64plus-ui-console
#
################################################################################
# Version: Commits on Jun 21, 2025
MUPEN64PLUS_UI_CONSOLE_VERSION = 44bc0d8e82da88efa2bd700472c10f9166314e00
MUPEN64PLUS_UI_CONSOLE_SITE = $(call github,mupen64plus,mupen64plus-ui-console,$(MUPEN64PLUS_UI_CONSOLE_VERSION))
MUPEN64PLUS_UI_CONSOLE_LICENSE = GPLv2
MUPEN64PLUS_UI_CONSOLE_DEPENDENCIES = sdl2 alsa-lib mupen64plus-core

define MUPEN64PLUS_UI_CONSOLE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
		PREFIX="$(STAGING_DIR)/usr" \
		HOST_CPU="$(MUPEN64PLUS_HOST_CPU)" \
		PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
		APIDIR="$(STAGING_DIR)/usr/include/mupen64plus" \
		-C $(@D)/projects/unix all $(MUPEN64PLUS_PARAMS) OPTFLAGS="$(TARGET_CXXFLAGS)"
endef

define MUPEN64PLUS_UI_CONSOLE_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(STAGING_DIR)/usr/bin/" \
		PREFIX="$(TARGET_DIR)/usr" \
		APIDIR="$(STAGING_DIR)/usr/include/mupen64plus" \
		PKG_CONFIG="$(HOST_DIR)/bin/pkg-config" \
		HOST_CPU="$(MUPEN64PLUS_HOST_CPU)" \
		INSTALL="/usr/bin/install" \
		INSTALL_STRIP_FLAG="" \
		-C $(@D)/projects/unix all $(MUPEN64PLUS_PARAMS) OPTFLAGS="$(TARGET_CXXFLAGS)" install
endef

$(eval $(generic-package))
