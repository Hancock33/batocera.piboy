################################################################################
#
# plutovg
#
################################################################################
# Version: Commits on Jun 09, 2025
PLUTOVG_VERSION = 6cbcea0a01a8052a05d983fa7105b437abc32382
PLUTOVG_SITE = $(call github,sammycage,plutovg,$(PLUTOVG_VERSION))

PLUTOVG_LICENSE = BSD-2-Clause
PLUTOVG_INSTALL_STAGING = YES
PLUTOVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PLUTOVG_CONF_OPTS += -DPLUTOVG_BUILD_EXAMPLES=OFF

$(eval $(cmake-package))
