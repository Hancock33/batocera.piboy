################################################################################
#
# libgme
#
################################################################################
# Version: Commits on Oct 03, 2023
LIBGME_VERSION = 0.6.3
LIBGME_SITE = $(call github,libgme,game-music-emu,$(LIBGME_VERSION))
LIBGME_INSTALL_STAGING = YES

LIBGME_CONF_OPTS = -DENABLE_UBSAN=OFF

LIBGME_DEPENDENCIES = host-pkgconf

define LIBGME_INSTALL_TARGET_CMDS
	cp -avr $(@D)/gme/libgme.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))
