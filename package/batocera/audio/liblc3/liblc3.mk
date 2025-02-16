################################################################################
#
# liblc3
#
################################################################################
# Version: Commits on Feb 12, 2025
LIBLC3_VERSION = v1.1.3
LIBLC3_SOURCE = $(LIBLC3_VERSION).tar.gz
LIBLC3_SITE = https://github.com/google/liblc3/archive/refs/tags
LIBLC3_LICENSE = Apache-2.0 license
LIBLC3_LICENSE_FILES = LICENSE
LIBLC3_INSTALL_STAGING = YES

$(eval $(meson-package))
