################################################################################
#
# plutosvg
#
################################################################################
# Version: Commits on Apr 19, 2025
PLUTOSVG_VERSION = c816e127bcba7ea311114be2cec0d1d3260abe06
PLUTOSVG_SITE = $(call github,stenzek,plutosvg,$(PLUTOSVG_VERSION))

PLUTOSVG_LICENSE = BSD-2-Clause
PLUTOSVG_INSTALL_STAGING = YES
PLUTOSVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOSVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PLUTOSVG_CONF_OPTS += -DPLUTOSVG_BUILD_EXAMPLES=OFF
PLUTOSVG_CONF_OPTS += -DPLUTOSVG_ENABLE_FREETYPE=ON

$(eval $(cmake-package))
