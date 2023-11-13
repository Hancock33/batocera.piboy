################################################################################
#
# libserum
#
################################################################################

LIBSERUM_VERSION = v1.6.1
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md

# Install to staging to build Visual Pinball Standalone
LIBSERUM_INSTALL_STAGING = YES

$(eval $(cmake-package))
