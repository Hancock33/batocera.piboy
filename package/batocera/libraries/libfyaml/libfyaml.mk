################################################################################
#
# libfyaml
#
################################################################################
# Version: Commits on May 07, 2026
LIBFYAML_VERSION = v1.0.0-alpha6
LIBFYAML_SITE = $(call github,pantoniou,libfyaml,$(LIBFYAML_VERSION))
LIBFYAML_INSTALL_STAGING = YES

LIBFYAML_CONF_OPTS += -DENABLE_PYTHON_BINDINGS=OFF
HOST_LIBFYAML_CONF_OPTS += -DENABLE_PYTHON_BINDINGS=OFF

$(eval $(cmake-package))
$(eval $(host-cmake-package))
