################################################################################
#
# plutovg
#
################################################################################
# Version: Commits on May 25, 2025
PLUTOVG_VERSION = c6a1c3b7989cde72f21e09a74cfa6078528ff978
PLUTOVG_SITE = $(call github,sammycage,plutovg,$(PLUTOVG_VERSION))

PLUTOVG_LICENSE = BSD-2-Clause
PLUTOVG_INSTALL_STAGING = YES
PLUTOVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PLUTOVG_CONF_OPTS += -DPLUTOVG_BUILD_EXAMPLES=OFF

$(eval $(cmake-package))
