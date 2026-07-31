################################################################################
#
# libpinmame
#
################################################################################
# Version: Commits on Jul 29, 2026
LIBPINMAME_VERSION = f53ff084f8313c8b3458aff4cc6375a3f6b2db72
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
