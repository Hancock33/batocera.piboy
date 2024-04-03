################################################################################
#
# libdmdutil
#
################################################################################
# Version: Commits on Apr 01, 2024
LIBDMDUTIL_VERSION = 03acd8cb912bdd18f3b9e7984d8d2b08519c4a77
LIBDMDUTIL_SITE = $(call github,vpinball,libdmdutil,$(LIBDMDUTIL_VERSION))
LIBDMDUTIL_LICENSE = BSD-3-Clause
LIBDMDUTIL_LICENSE_FILES = LICENSE
LIBDMDUTIL_DEPENDENCIES = cargs libpupdmd libserialport libzedmd libserum sockpp
LIBDMDUTIL_SUPPORTS_IN_SOURCE_BUILD = NO

LIBDMDUTIL_CONF_OPTS += -DPLATFORM=linux
LIBDMDUTIL_CONF_OPTS += -DPOST_BUILD_COPY_EXT_LIBS=OFF

# handle supported target platforms
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3588),y)
    LIBDMDUTIL_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711)$(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBDMDUTIL_CONF_OPTS += -DARCH=aarch64
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBDMDUTIL_CONF_OPTS += -DARCH=x64
endif

# Install to staging to build Visual Pinball Standalone
LIBDMDUTIL_INSTALL_STAGING = YES

define LIBDMDUTIL_INSTALL_SERVER
	$(INSTALL) -D -m 0755 $(LIBDMDUTIL_BUILDDIR)/dmdserver $(TARGET_DIR)/usr/bin/dmdserver

	mkdir -p $(TARGET_DIR)/usr/share/batocera/services
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/libdmdutil/dmd_server.service  $(TARGET_DIR)/usr/share/batocera/services/dmd_real
	install -m 0755 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/vpinball/libdmdutil/dmdserver-config.py $(TARGET_DIR)/usr/bin/dmdserver-config
endef

$(eval $(cmake-package))