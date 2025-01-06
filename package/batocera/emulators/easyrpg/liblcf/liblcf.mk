################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on Jan 06, 2025
LIBLCF_VERSION = c359e1d9a013e95f6f2031093c07a6c8f49ec6e7
LIBLCF_SITE = $(call github,EasyRPG,liblcf,$(LIBLCF_VERSION))
LIBLCF_DEPENDENCIES = expat icu inih
LIBLCF_LICENSE = MIT
LIBLCF_SUPPORTS_IN_SOURCE_BUILD = NO

LIBLCF_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
LIBLCF_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
LIBLCF_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXXFLAGS="-fPIC"

# We need staging install for player cmake build
LIBLCF_INSTALL_STAGING = YES

$(eval $(cmake-package))
