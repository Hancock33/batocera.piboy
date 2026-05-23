################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on May 20, 2026
LIBLCF_VERSION = 666e6c023696d4a45a67dd9ba879dbff7b0f69f3
LIBLCF_SITE = $(call github,EasyRPG,liblcf,$(LIBLCF_VERSION))
LIBLCF_DEPENDENCIES = expat icu inih
LIBLCF_LICENSE = MIT
LIBLCF_SUPPORTS_IN_SOURCE_BUILD = NO

LIBLCF_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXXFLAGS="-fPIC"

# We need staging install for player cmake build
LIBLCF_INSTALL_STAGING = YES

$(eval $(cmake-package))
