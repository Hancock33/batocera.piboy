################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Jun 30, 2024
LIBSERUM_VERSION = v2.0.1
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md
LIBSERUM_DEPENDENCIES =
LIBSERUM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBSERUM_INSTALL_STAGING = YES

LIBSERUM_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBSERUM_COPY_INCLUDES
	cp $(@D)/src/serum.h $(STAGING_DIR)/usr/include
endef
LIBSERUM_POST_INSTALL_TARGET_HOOKS += LIBSERUM_COPY_INCLUDES

$(eval $(cmake-package))
