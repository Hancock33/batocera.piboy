################################################################################
#
# jstest2
#
################################################################################
# Version: Commits on Nov 16, 2025
JSTEST2_VERSION = d0f10bfa1440c1e65e9916e1d93ee48cfff4b1f9
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
