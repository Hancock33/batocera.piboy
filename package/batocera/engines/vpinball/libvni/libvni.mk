################################################################################
#
# libvni
#
################################################################################
# Version: Commits on May 08, 2026
LIBVNI_VERSION = 99a4ce0c844af75604546d8a4d0a2f98a485e2db
LIBVNI_SITE = $(call github,PPUC,libvni,$(LIBVNI_VERSION))
LIBVNI_LICENSE = GPLv2
LIBVNI_LICENSE_FILES = LICENSE.md
LIBVNI_DEPENDENCIES = cargs libpupdmd libserialport libzedmd libserum sockpp
LIBVNI_SUPPORTS_IN_SOURCE_BUILD = NO
LIBVNI_INSTALL_STAGING = YES

LIBVNI_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
