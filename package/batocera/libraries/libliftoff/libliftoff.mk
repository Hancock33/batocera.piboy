################################################################################
#
# libliftoff
#
################################################################################
# Version: Commits on May 27, 2024
LIBLIFTOFF_VERSION = 0.5.0
LIBLIFTOFF_SITE = https://gitlab.freedesktop.org/emersion/libliftoff/-/releases/v$(LIBLIFTOFF_VERSION)/downloads
LIBLIFTOFF_LICENSE = MIT
LIBLIFTOFF_LICENSE_FILES = LICENSE
LIBLIFTOFF_INSTALL_STAGING = YES

$(eval $(meson-package))
