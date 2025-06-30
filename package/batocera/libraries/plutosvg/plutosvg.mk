################################################################################
#
# plutosvg
#
################################################################################
# Version: Commits on May 15, 2025
PLUTOSVG_VERSION = v0.0.7
PLUTOSVG_SITE = https://github.com/sammycage/plutosvg.git
PLUTOSVG_SITE_METHOD=git
PLUTOSVG_GIT_SUBMODULES=YES
PLUTOSVG_LICENSE = BSD-2-Clause
PLUTOSVG_INSTALL_STAGING = YES
PLUTOSVG_SUPPORTS_IN_SOURCE_BUILD = NO

PLUTOSVG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PLUTOSVG_CONF_OPTS += -DPLUTOSVG_BUILD_EXAMPLES=OFF
PLUTOSVG_CONF_OPTS += -DPLUTOSVG_ENABLE_FREETYPE=ON

$(eval $(cmake-package))
