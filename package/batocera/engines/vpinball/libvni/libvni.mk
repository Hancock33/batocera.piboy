################################################################################
#
# libvni
#
################################################################################
# Version: Commits on Jun 10, 2026
LIBVNI_VERSION = 7258e2fa0d086e1224d6510d44a61879e6b344b1
LIBVNI_SITE = $(call github,PPUC,libvni,$(LIBVNI_VERSION))
LIBVNI_LICENSE = GPLv2
LIBVNI_LICENSE_FILES = LICENSE.md
LIBVNI_DEPENDENCIES = cargs libpupdmd libserialport libzedmd libserum sockpp
LIBVNI_SUPPORTS_IN_SOURCE_BUILD = NO
LIBVNI_INSTALL_STAGING = YES

LIBVNI_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
