################################################################################
#
# libfyaml
#
################################################################################
# Version: Commits on Sept 25, 2023
LIBFYAML_VERSION = v0.9
LIBFYAML_SITE = $(call github,pantoniou,libfyaml,$(LIBFYAML_VERSION))
LIBFYAML_INSTALL_STAGING = YES
LIBFYAML_AUTORECONF = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))
