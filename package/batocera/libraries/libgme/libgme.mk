################################################################################
#
# libgme
#
################################################################################
# Version: Commits on 03 Oct, 2023
LIBGME_VERSION = 0.6.3
LIBGME_SITE = https://github.com/libgme/game-music-emu.git
LIBGME_SITE_METHOD=git
LIBGME_GIT_SUBMODULES=YES
LIBGME_INSTALL_STAGING = YES

LIBGME_CONF_OPTS = -DENABLE_UBSAN=OFF

LIBGME_DEPENDENCIES = host-pkgconf

define LIBGME_INSTALL_TARGET_CMDS
	cp -avr $(@D)/gme/libgme.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))

