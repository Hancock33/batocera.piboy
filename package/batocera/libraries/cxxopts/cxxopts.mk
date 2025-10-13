################################################################################
#
# cxxopts
#
################################################################################
# Version: Commits on May 26, 2025
CXXOPTS_VERSION = v3.3.1
CXXOPTS_SITE =  $(call github,jarro2783,cxxopts,$(CXXOPTS_VERSION))
CXXOPTS_LICENSE = MIT license
CXXOPTS_LICENSE_FILES = LICENSE
CXXOPTS_SUPPORTS_IN_SOURCE_BUILD = NO
CXXOPTS_INSTALL_STAGING = YES
CXXOPTS_INSTALL_TARGET = NO

CXXOPTS_CONF_OPTS += -DCXXOPTS_BUILD_EXAMPLES=OFF
CXXOPTS_CONF_OPTS += -DCXXOPTS_BUILD_TESTS=OFF

$(eval $(cmake-package))
