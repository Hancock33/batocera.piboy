################################################################################
#
# LIBGME
#
################################################################################

LIBGME_VERSION = b3d158a30492181fd7c38ef795c8d4dcfd77eaa9
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

