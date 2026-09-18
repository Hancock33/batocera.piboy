################################################################################
#
# libfyaml
#
################################################################################
# Version: Commits on Aug 13, 2026
LIBFYAML_VERSION = v1.0.0-beta1
LIBFYAML_SITE = $(call github,pantoniou,libfyaml,$(LIBFYAML_VERSION))
LIBFYAML_LICENSE = MIT
LIBFYAML_LICENSE_FILES = LICENSE
LIBFYAML_INSTALL_STAGING = YES
IBFYAML_DEPENDENCIES = host-pkgconf

LIBFYAML_CONF_OPTS += -DENABLE_PYTHON_BINDINGS=OFF
HOST_LIBFYAML_CONF_OPTS += -DENABLE_PYTHON_BINDINGS=OFF

$(eval $(cmake-package))
$(eval $(host-cmake-package))
