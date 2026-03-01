################################################################################
#
# libfyaml
#
################################################################################
# Version: Commits on Feb 26, 2026
LIBFYAML_VERSION = v0.9.5
LIBFYAML_SITE = $(call github,pantoniou,libfyaml,$(LIBFYAML_VERSION))
LIBFYAML_INSTALL_STAGING = YES
LIBFYAML_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-cmake-package))
