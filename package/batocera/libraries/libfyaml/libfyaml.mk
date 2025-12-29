################################################################################
#
# libfyaml
#
################################################################################
# Version: Commits on Dec 28, 2025
LIBFYAML_VERSION = v0.9.1
LIBFYAML_SITE = $(call github,pantoniou,libfyaml,$(LIBFYAML_VERSION))
LIBFYAML_INSTALL_STAGING = YES
LIBFYAML_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-cmake-package))
