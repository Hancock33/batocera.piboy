################################################################################
#
# plutovg
#
################################################################################
# Version: Commits on May 13, 2025
PLUTOVG_VERSION = 6987abcd3550d66e56c188e19dd80a697d053a39
PLUTOVG_SITE = $(call github,sammycage,plutovg,$(PLUTOVG_VERSION))

PLUTOVG_LICENSE = BSD-2-Clause
PLUTOVG_INSTALL_STAGING = YES
PLUTOVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PLUTOVG_CONF_OPTS += -DPLUTOVG_BUILD_EXAMPLES=OFF

$(eval $(cmake-package))
