################################################################################
#
# plutosvg
#
################################################################################
# Version: Commits on Apr 12, 2025
PLUTOSVG_VERSION = bc845bb6b6511e392f9e1097b26f70cf0b3c33be
PLUTOSVG_SITE = $(call github,stenzek,plutosvg,$(PLUTOSVG_VERSION))

PLUTOSVG_LICENSE = BSD-2-Clause
PLUTOSVG_INSTALL_STAGING = YES
PLUTOSVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOSVG_CONF_OPTS += -DPLUTOSVG_BUILD_EXAMPLES=OFF
PLUTOSVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON

$(eval $(cmake-package))
