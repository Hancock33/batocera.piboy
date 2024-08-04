################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on Jul 31, 2024
LIBLCF_VERSION = 505496cb0c4ad846c5e2d346aed447ecd625f7f0
LIBLCF_DEPENDENCIES = expat icu inih
LIBLCF_LICENSE = MIT
LIBLCF_SITE = $(call github,EasyRPG,liblcf,$(LIBLCF_VERSION))

LIBLCF_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXXFLAGS="-fPIC"

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
LIBLCF_SUPPORTS_IN_SOURCE_BUILD = NO

# We need staging install for player cmake build
LIBLCF_INSTALL_STAGING = YES

$(eval $(cmake-package))
