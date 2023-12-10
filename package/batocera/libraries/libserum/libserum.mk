################################################################################
#
# libserum
#
################################################################################
# Version: Commits on Nov 03, 2023
LIBSERUM_VERSION = ea90a5460b47d77e4cf1deacdacddbdb94c25067
LIBSERUM_SITE = $(call github,zesinger,libserum,$(LIBSERUM_VERSION))
LIBSERUM_LICENSE = GPLv2+
LIBSERUM_LICENSE_FILES = LICENSE.md

# Install to staging to build Visual Pinball Standalone
LIBSERUM_INSTALL_STAGING = YES

$(eval $(cmake-package))
