################################################################################
#
# libdmdutil
#
################################################################################
# Version: Commits on Apr 03, 2024
LIBDMDUTIL_VERSION = 33874014e3220174cc20f0b66375357fe2a2b76b
LIBDMDUTIL_SITE = $(call github,vpinball,libdmdutil,$(LIBDMDUTIL_VERSION))
LIBDMDUTIL_LICENSE = BSD-3-Clause
LIBDMDUTIL_LICENSE_FILES = LICENSE
LIBDMDUTIL_DEPENDENCIES = cargs libpupdmd libserialport libzedmd libserum sockpp
LIBDMDUTIL_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDMDUTIL_INSTALL_STAGING = YES

LIBDMDUTIL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBDMDUTIL_INSTALL_SERVER
	$(INSTALL) -D -m 0755 $(LIBDMDUTIL_BUILDDIR)/dmdserver $(TARGET_DIR)/usr/bin/dmdserver

	mkdir -p $(TARGET_DIR)/usr/share/batocera/services
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/libdmdutil/dmd_server.service  $(TARGET_DIR)/usr/share/batocera/services/dmd_real
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/libdmdutil/dmdserver-config.py $(TARGET_DIR)/usr/bin/dmdserver-config
endef

$(eval $(cmake-package))