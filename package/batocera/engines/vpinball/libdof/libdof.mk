################################################################################
#
# libdof
#
################################################################################
# Version: Commits on Mar 17, 2026
LIBDOF_VERSION = d2a8e58d485d72f053d109f9cfc85de4caf1c97c
LIBDOF_SITE = $(call github,jsm174,libdof,$(LIBDOF_VERSION))
LIBDOF_LICENSE = BSD-3-Clause
LIBDOF_LICENSE_FILES = LICENSE
LIBDOF_DEPENDENCIES = cargs hidapi libftdi1 libserialport sockpp
LIBDOF_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDOF_INSTALL_STAGING = YES

LIBDOF_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
