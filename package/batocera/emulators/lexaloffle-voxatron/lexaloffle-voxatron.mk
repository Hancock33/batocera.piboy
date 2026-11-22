################################################################################
#
# lexaloffle-voxatron
#
################################################################################

LEXALOFFLE_VOXATRON_VERSION = 0.1
LEXALOFFLE_VOXATRON_LICENSE = PROPRIETARY
LEXALOFFLE_VOXATRON_SOURCE =

define LEXALOFFLE_VOXATRON_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(LEXALOFFLE_VOXATRON_PKGDIR)/voxatron.keys
endef

$(eval $(generic-package))
