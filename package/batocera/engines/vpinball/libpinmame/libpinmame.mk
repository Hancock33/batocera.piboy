################################################################################
#
# libpinmame
#
################################################################################
# Version: Commits on Aug 02, 2026
LIBPINMAME_VERSION = c5e82cad15f8a2a021cbdbd5419a38c5cd4d459d
LIBPINMAME_SITE = $(call github,vbousquet,pinmame,$(LIBPINMAME_VERSION))
LIBPINMAME_BRANCH = plugin_state
LIBPINMAME_LICENSE = BSD-3-Clause
LIBPINMAME_LICENSE_FILES = LICENSE
LIBPINMAME_DEPENDENCIES = zlib
LIBPINMAME_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPINMAME_INSTALL_STAGING = YES

LIBPINMAME_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBPINMAME_RENAME_CMAKE
	cp $(@D)/cmake/libpinmame/CMakeLists.txt $(@D)/CMakeLists.txt
	rm $(@D)/makefile
endef

LIBPINMAME_PRE_CONFIGURE_HOOKS += LIBPINMAME_RENAME_CMAKE

define LIBPINMAME_STAGING_INCLUDES
	mkdir -p $(STAGING_DIR)/usr/include/pinmame
	cp $(@D)/src/libpinmame/PinMAMEPlugin.h $(STAGING_DIR)/usr/include/pinmame
	cp $(@D)/src/libpinmame/libpinmame.h    $(STAGING_DIR)/usr/include/pinmame
endef
LIBPINMAME_POST_INSTALL_TARGET_HOOKS += LIBPINMAME_STAGING_INCLUDES
$(eval $(cmake-package))
