################################################################################
#
# libpinmame
#
################################################################################
# Version: Commits on Sept 29, 2026
LIBPINMAME_VERSION = a7dc6939a3f6cb8a5b4b0972e87ec0e9f77bd5a3
LIBPINMAME_SITE = $(call github,vpinball,pinmame,$(LIBPINMAME_VERSION))
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
