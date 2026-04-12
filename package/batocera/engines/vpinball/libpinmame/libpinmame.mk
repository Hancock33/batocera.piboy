################################################################################
#
# libpinmame
#
################################################################################
# Version: Commits on Mar 15, 2026
LIBPINMAME_VERSION = e03ed12b301f2a24cd141ca730f73dd155e785ce
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

$(eval $(cmake-package))
