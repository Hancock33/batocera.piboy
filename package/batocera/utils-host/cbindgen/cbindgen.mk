################################################################################
#
# cbindgen
#
################################################################################
# Version: Commits on Oct 21, 2025
CBINDGEN_VERSION = v0.29.2
CBINDGEN_SITE = $(call github,mozilla,cbindgen,$(CBINDGEN_VERSION))
CBINDGEN_LICENSE = MPL-2.0
CBINDGEN_LICENSE_FILES = LICENSE

HOST_CBINDGEN_DEPENDENCIES = host-pkgconf

$(eval $(host-cargo-package))
