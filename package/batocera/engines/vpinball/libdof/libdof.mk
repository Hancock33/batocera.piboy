################################################################################
#
# libdof
#
################################################################################
# Version: Commits on Apr 09, 2026
LIBDOF_VERSION = 1a887d98f442081d1d5d8fe9268ed4b96cb06eb0
LIBDOF_SITE = $(call github,jsm174,libdof,$(LIBDOF_VERSION))
LIBDOF_LICENSE = BSD-3-Clause
LIBDOF_LICENSE_FILES = LICENSE
LIBDOF_DEPENDENCIES = cargs hidapi libftdi1 libserialport sockpp
LIBDOF_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDOF_INSTALL_STAGING = YES

LIBDOF_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
