################################################################################
#
# libspatialaudio
#
################################################################################
# Version: Commits on Jul 01, 2026
LIBSPATIALAUDIO_VERSION = d149ed9744fd399b835c6f2920511f8cbcfce5ea
LIBSPATIALAUDIO_SITE = $(call github,videolan,libspatialaudio,$(LIBSPATIALAUDIO_VERSION))
LIBSPATIALAUDIO_LICENSE = LGPL-2.1+
LIBSPATIALAUDIO_LICENSE_FILES = LICENSE
LIBSPATIALAUDIO_INSTALL_STAGING = YES

$(eval $(meson-package))
