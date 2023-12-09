################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on Dec 05, 2023
LIBLCF_VERSION = c94ff83b27c93e084a428b0bc855b5424d1f5354
LIBLCF_DEPENDENCIES = expat icu
LIBLCF_LICENSE = MIT
LIBLCF_SITE = $(call github,EasyRPG,liblcf,$(LIBLCF_VERSION))

LIBLCF_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXXFLAGS="-fPIC"

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
LIBLCF_SUPPORTS_IN_SOURCE_BUILD = NO

# We need staging install for player cmake build
LIBLCF_INSTALL_STAGING = YES

$(eval $(cmake-package))
