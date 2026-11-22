################################################################################
#
# retrogame
#
################################################################################

RETROGAME_VERSION = 1.0
RETROGAME_SOURCE =
RETROGAME_LICENSE = BSD-2-Clause

define RETROGAME_EXTRACT_CMDS
	cp $(RETROGAME_PKGDIR)/RetroGame/* $(@D)
endef

define RETROGAME_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) retrogame
endef

define RETROGAME_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/retrogame $(TARGET_DIR)/usr/bin/retrogame
endef

$(eval $(generic-package))
