################################################################################
#
# libgme
#
################################################################################
# Version: Commits on 08 Jul, 2022
LIBGME_VERSION = 6cd4bdb69be304f58c9253fb08b8362f541b3b4b
LIBGME_SITE = https://bitbucket.org/mpyne/game-music-emu.git
LIBGME_SITE_METHOD=git
LIBGME_GIT_SUBMODULES=YES
LIBGME_INSTALL_STAGING = YES

LIBGME_CONF_OPTS = -DENABLE_UBSAN=OFF

LIBGME_DEPENDENCIES = host-pkgconf

define LIBGME_INSTALL_TARGET_CMDS
	cp -avr $(@D)/gme/libgme.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))

