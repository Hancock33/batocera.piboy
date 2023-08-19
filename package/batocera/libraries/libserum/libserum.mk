################################################################################
#
# libserum
#
################################################################################

LIBSERUM_VERSION = 828c087986f95ca7dbf6c3de2ca8df4200ed011b
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md

# Install to staging to build Visual Pinball Standalone
LIBSERUM_INSTALL_STAGING = YES

$(eval $(cmake-package))
