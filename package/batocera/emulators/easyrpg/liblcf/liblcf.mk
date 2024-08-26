################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on Aug 25, 2024
LIBLCF_VERSION = 552c1bcd443b2491c221fb3c66d1b0c13367c6be
LIBLCF_DEPENDENCIES = expat icu inih
LIBLCF_LICENSE = MIT
LIBLCF_SITE = $(call github,EasyRPG,liblcf,$(LIBLCF_VERSION))

LIBLCF_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXXFLAGS="-fPIC"

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
LIBLCF_SUPPORTS_IN_SOURCE_BUILD = NO

# We need staging install for player cmake build
LIBLCF_INSTALL_STAGING = YES

$(eval $(cmake-package))
