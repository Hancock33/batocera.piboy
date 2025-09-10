################################################################################
#
# libdof
#
################################################################################
# Version: Commits on Sept 10, 2025
LIBDOF_VERSION = 11079f33a4eb371c1002673a23287433addf0a4b
LIBDOF_SITE = $(call github,jsm174,libdof,$(LIBDOF_VERSION))
LIBDOF_LICENSE = BSD-3-Clause
LIBDOF_LICENSE_FILES = LICENSE
LIBDOF_DEPENDENCIES = cargs hidapi libftdi1 libserialport sockpp
LIBDOF_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDOF_INSTALL_STAGING = YES

LIBDOF_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
