################################################################################
#
# libdmdutil
#
################################################################################
# Version: Commits on Oct 30, 2026
LIBDMDUTIL_VERSION = 6b8f711a5346cf2e70562872ebc1a57b210906df
LIBDMDUTIL_SITE = $(call github,vpinball,libdmdutil,$(LIBDMDUTIL_VERSION))
LIBDMDUTIL_LICENSE = BSD-3-Clause
LIBDMDUTIL_LICENSE_FILES = LICENSE
LIBDMDUTIL_DEPENDENCIES = cargs libframeutil libpupdmd libserialport libserum libusb libvni libzedmd sockpp
LIBDMDUTIL_SUPPORTS_IN_SOURCE_BUILD = NO
LIBDMDUTIL_INSTALL_STAGING = YES

LIBDMDUTIL_CONF_OPTS += $(VPINBALL_COMMON_CONF_OPTS)

define LIBDMDUTIL_INSTALL_SERVER
	$(INSTALL) -D -m 0755 $(LIBDMDUTIL_BUILDDIR)/dmdserver $(TARGET_DIR)/usr/bin/dmdserver
	$(INSTALL) -D -m 0755 $(LIBDMDUTIL_PKGDIR)/dmdserver-config.py $(TARGET_DIR)/usr/bin/dmdserver-config
	$(INSTALL) -D -m 0755 $(LIBDMDUTIL_PKGDIR)/dmd_server.service $(TARGET_DIR)/usr/share/batocera/services/dmd_real
	# pixelcade
	$(INSTALL) -D -m 0755 $(LIBDMDUTIL_PKGDIR)/pixelcade-add $(TARGET_DIR)/usr/bin/pixelcade-add
	$(INSTALL) -D -m 0644 $(LIBDMDUTIL_PKGDIR)/99-pixelcade.rules $(TARGET_DIR)/etc/udev/rules.d/99-pixelcade.rules
endef
LIBDMDUTIL_POST_INSTALL_TARGET_HOOKS += LIBDMDUTIL_INSTALL_SERVER

$(eval $(cmake-package))
