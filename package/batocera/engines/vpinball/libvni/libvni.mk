################################################################################
#
# libvni
#
################################################################################
# Version: Commits on Feb 03, 2026
LIBVNI_VERSION = 6055ec2b1de7f795d4f540c97b4181909ee1b225
LIBVNI_SITE = $(call github,PPUC,libvni,$(LIBVNI_VERSION))
LIBVNI_LICENSE = BSD-3-Clause
LIBVNI_LICENSE_FILES = LICENSE
LIBVNI_DEPENDENCIES = cargs libpupdmd libserialport libzedmd libserum sockpp
LIBVNI_SUPPORTS_IN_SOURCE_BUILD = NO
LIBVNI_INSTALL_STAGING = YES

LIBVNI_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBVNI_INSTALL_HEADERS
	cp -av $(@D)/buildroot-build/libvni.so* $(TARGET_DIR)/usr/lib/
	cp -av $(@D)/buildroot-build/libvni.so* $(STAGING_DIR)/usr/lib/
	cp -av $(@D)/src/*.h $(STAGING_DIR)/usr/include/
endef

LIBVNI_POST_INSTALL_TARGET_HOOKS += LIBVNI_INSTALL_HEADERS

$(eval $(cmake-package))
