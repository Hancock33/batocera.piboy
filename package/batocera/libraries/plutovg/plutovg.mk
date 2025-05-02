################################################################################
#
# plutovg
#
################################################################################
# Version: Commits on Mar 19, 2025
PLUTOVG_VERSION = aa7beaafd526a02da26e498114290de587b1d5b8
PLUTOVG_SITE = $(call github,sammycage,plutovg,$(PLUTOVG_VERSION))

PLUTOVG_LICENSE = BSD-2-Clause
PLUTOVG_INSTALL_STAGING = YES
PLUTOVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PLUTOVG_CONF_OPTS += -DPLUTOVG_BUILD_EXAMPLES=OFF

$(eval $(cmake-package))
