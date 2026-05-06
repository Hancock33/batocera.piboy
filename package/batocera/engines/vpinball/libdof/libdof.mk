################################################################################
#
# libdof
#
################################################################################
# Version: Commits on May 06, 2026
LIBDOF_VERSION = 2591c0fbe2cca64bb8c866d100b80c9ebc8cca33
LIBDOF_SITE = $(call github,jsm174,libdof,$(LIBDOF_VERSION))
LIBDOF_LICENSE = BSD-3-Clause
LIBDOF_LICENSE_FILES = LICENSE
LIBDOF_DEPENDENCIES = cargs hidapi libftdi1 libserialport sockpp
LIBDOF_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDOF_INSTALL_STAGING = YES

LIBDOF_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
