################################################################################
#
# libfyaml
#
################################################################################
# Version: Commits on Mar 15, 2026
LIBFYAML_VERSION = v0.9.6
LIBFYAML_SITE = $(call github,pantoniou,libfyaml,$(LIBFYAML_VERSION))
LIBFYAML_INSTALL_STAGING = YES
LIBFYAML_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-cmake-package))
