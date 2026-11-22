################################################################################
#
# umtool
#
################################################################################
# Version: Commits on Jun 13, 2022
UMTOOL_VERSION = 20b8c56a3e6f94034b8529eddd777306f5b6152b
UMTOOL_SITE = $(call github,katie-snow,Ultimarc-linux,$(UMTOOL_VERSION))
UMTOOL_LICENSE = GPL-2.0
UMTOOL_DEPENDENCIES = json-c libusb libtool udev
UMTOOL_CONF_OPTS = --disable-shared
UMTOOL_AUTORECONF = YES

define UMTOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/src/umtool/umtool $(TARGET_DIR)/usr/bin/umtool

	# out-of-the-box configs
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/umtool $(@D)/src/umtool/*.json

	# udev rule
	$(INSTALL) -D -m 0644 $(@D)/21-ultimarc.rules $(TARGET_DIR)/etc/udev/rules.d/99-umtool.rules
endef

$(eval $(autotools-package))
