################################################################################
#
# plutovg
#
################################################################################
# Version: Commits on May 14, 2025
PLUTOVG_VERSION = e8c242591012177695e5f13c6cfb0935a0754ea0
PLUTOVG_SITE = $(call github,sammycage,plutovg,$(PLUTOVG_VERSION))

PLUTOVG_LICENSE = BSD-2-Clause
PLUTOVG_INSTALL_STAGING = YES
PLUTOVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PLUTOVG_CONF_OPTS += -DPLUTOVG_BUILD_EXAMPLES=OFF

$(eval $(cmake-package))
