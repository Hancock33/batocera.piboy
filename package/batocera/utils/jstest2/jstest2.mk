################################################################################
#
# jstest2
#
################################################################################
# Version: Commits on Oct 15, 2026
JSTEST2_VERSION = ad9181e78448b7c3c84a52668380141d8889260d
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
