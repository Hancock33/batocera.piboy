################################################################################
#
# liblcf
#
################################################################################
# Version: Commits on May 15, 2023
LIBLCF_VERSION = e8d5127593f3188b411940d70dc9d014a5ff3596
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
