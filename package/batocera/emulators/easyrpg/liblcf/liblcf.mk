################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on Aug 30, 2024
LIBLCF_VERSION = 4483cb4c2b19a4e41882dab3432cd79bca3f85bf
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
