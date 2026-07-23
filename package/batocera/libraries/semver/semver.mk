################################################################################
#
# semver
#
################################################################################
# Version: Commits on Jul 23, 2026
SEMVER_VERSION = v1.0.0
SEMVER_SITE =  $(call github,Neargye,semver,$(SEMVER_VERSION))
SEMVER_LICENSE = MIT license
SEMVER_LICENSE_FILES = LICENSE
SEMVER_SUPPORTS_IN_SOURCE_BUILD = NO
SEMVER_INSTALL_STAGING = YES
SEMVER_INSTALL_TARGET = NO

SEMVER_CONF_OPTS += -DSEMVER_OPT_BUILD_EXAMPLES=OFF
SEMVER_CONF_OPTS += -DSEMVER_OPT_BUILD_TESTS=OFF

$(eval $(cmake-package))
