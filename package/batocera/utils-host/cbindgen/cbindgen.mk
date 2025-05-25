################################################################################
#
# cbindgen
#
################################################################################
# Version: Commits on May 20, 2025
CBINDGEN_VERSION = v0.29.0
CBINDGEN_SITE = $(call github,mozilla,cbindgen,$(CBINDGEN_VERSION))
CBINDGEN_LICENSE = MPL-2.0
CBINDGEN_LICENSE_FILES = LICENSE

HOST_CBINDGEN_DEPENDENCIES = host-pkgconf

$(eval $(host-cargo-package))
