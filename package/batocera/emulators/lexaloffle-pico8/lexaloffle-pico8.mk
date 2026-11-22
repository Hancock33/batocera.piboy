################################################################################
#
# lexaloffle-pico8
#
################################################################################

LEXALOFFLE_PICO8_VERSION = 0.1
LEXALOFFLE_PICO8_LICENSE = PROPRIETARY
LEXALOFFLE_PICO8_SOURCE =

define LEXALOFFLE_PICO8_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(LEXALOFFLE_PICO8_PKGDIR)/pico8.keys
endef

$(eval $(generic-package))
