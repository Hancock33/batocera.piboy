################################################################################
#
# libdmdutil
#
################################################################################
# Version: Commits on May 04, 2025
LIBDMDUTIL_VERSION = 9ff1d0f238fe6859008dd5c716e0c742931b46cc
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
	# pixelcade
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/libdmdutil/pixelcade-add   $(TARGET_DIR)/usr/bin/pixelcade-add
	install -m 0644 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/libdmdutil/99-pixelcade.rules $(TARGET_DIR)/etc/udev/rules.d/99-pixelcade.rules
endef

LIBDMDUTIL_POST_INSTALL_TARGET_HOOKS += LIBDMDUTIL_INSTALL_SERVER

$(eval $(cmake-package))
