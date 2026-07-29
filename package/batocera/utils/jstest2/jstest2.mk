################################################################################
#
# jstest2
#
################################################################################
# Version: Commits on Jul 29, 2026
JSTEST2_VERSION = cf4fab3294fd6ede340ecf2cb7f940d75390039e
JSTEST2_SITE = https://github.com/Grumbel/sdl-jstest
JSTEST2_SITE_METHOD = git
JSTEST2_GIT_SUBMODULES = YES
JSTEST2_DEPENDENCIES = sdl2 ncurses

JSTEST2_CONF_ENV = LIBS="-ncurses -ltinfo"

define JSTEST2_GAMECONTROLLER_DB
	rm -fr $(TARGET_DIR)/usr/share/sdl-jstest/gamecontrollerdb.txt
	ln -sf /usr/share/gamecontrollerdb.txt $(TARGET_DIR)/usr/share/sdl-jstest/gamecontrollerdb.txt
endef

JSTEST2_POST_INSTALL_TARGET_HOOKS += JSTEST2_GAMECONTROLLER_DB

$(eval $(cmake-package))
