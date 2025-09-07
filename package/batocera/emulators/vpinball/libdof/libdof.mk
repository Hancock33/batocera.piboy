################################################################################
#
# libdof
#
################################################################################
# Version: Commits on Sept 04, 2025
LIBDOF_VERSION = fd1c4707c62cd0fbe65b9f5ea84bdd30b8cd0e1a
LIBDOF_SITE = $(call github,jsm174,libdof,$(LIBDOF_VERSION))
LIBDOF_LICENSE = BSD-3-Clause
LIBDOF_LICENSE_FILES = LICENSE
LIBDOF_DEPENDENCIES = cargs hidapi libftdi1 libserialport sockpp
LIBDOF_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDOF_INSTALL_STAGING = YES

LIBDOF_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
