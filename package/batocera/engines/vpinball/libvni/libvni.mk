################################################################################
#
# libvni
#
################################################################################
# Version: Commits on Aug 03, 2026
LIBVNI_VERSION = eb910403834184e1d098bcc310054ac17a00b53d
LIBVNI_SITE = $(call github,PPUC,libvni,$(LIBVNI_VERSION))
LIBVNI_LICENSE = GPLv2
LIBVNI_LICENSE_FILES = LICENSE.md
LIBVNI_DEPENDENCIES = cargs libpupdmd libserialport libzedmd libserum sockpp
LIBVNI_SUPPORTS_IN_SOURCE_BUILD = NO
LIBVNI_INSTALL_STAGING = YES

LIBVNI_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

$(eval $(cmake-package))
