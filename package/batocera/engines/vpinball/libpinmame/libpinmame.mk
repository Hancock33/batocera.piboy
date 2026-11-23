################################################################################
#
# libpinmame
#
################################################################################
# Version: Commits on Nov 23, 2026
LIBPINMAME_VERSION = 309a17d882d098fe0a7cad88cb3b6ee6039f24e7
LIBPINMAME_SITE = $(call github,vpinball,pinmame,$(LIBPINMAME_VERSION))
LIBPINMAME_LICENSE = BSD-3-Clause
LIBPINMAME_LICENSE_FILES = LICENSE
LIBPINMAME_SUPPORTS_IN_SOURCE_BUILD = NO
LIBPINMAME_INSTALL_STAGING = YES

LIBPINMAME_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBPINMAME_SETUP_CMAKE
	cp $(@D)/cmake/libpinmame/CMakeLists.txt $(@D)/CMakeLists.txt
endef
LIBPINMAME_PRE_CONFIGURE_HOOKS += LIBPINMAME_SETUP_CMAKE

$(eval $(cmake-package))
