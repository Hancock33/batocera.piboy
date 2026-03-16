################################################################################
#
# libfyaml
#
################################################################################
# Version: Commits on Feb 19, 2023
LIBFYAML_VERSION = v1.0.0-alpha1
LIBFYAML_SITE = $(call github,pantoniou,libfyaml,$(LIBFYAML_VERSION))
LIBFYAML_INSTALL_STAGING = YES
LIBFYAML_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-cmake-package))
