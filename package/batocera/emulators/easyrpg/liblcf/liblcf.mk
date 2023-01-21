################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on Jan 11, 2023
LIBLCF_VERSION = 8ef42985f38e7517c7c2542dbd5f05e2ff6bd5b1
LIBLCF_DEPENDENCIES = expat icu
LIBLCF_LICENSE = MIT
LIBLCF_SITE = $(call github,EasyRPG,liblcf,$(LIBLCF_VERSION))

LIBLCF_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

LIBLCF_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXXFLAGS="-fPIC"

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
LIBLCF_SUPPORTS_IN_SOURCE_BUILD = NO

# We need staging install for player cmake build
LIBLCF_INSTALL_STAGING = YES

$(eval $(cmake-package))
