################################################################################
#
# jstest2
#
################################################################################
# Version: Commits on Mar 31, 2024
JSTEST2_VERSION = 60f6e62109e100b6ef363841b71c2e37ed714d01
JSTEST2_SITE = https://github.com/Grumbel/sdl-jstest
JSTEST2_SITE_METHOD = git
JSTEST2_GIT_SUBMODULES = YES
JSTEST2_DEPENDENCIES = sdl2

JSTEST2_CONF_ENV = LIBS="-ncurses -ltinfo"

define JSTEST2_GAMECONTROLLER_DB
	rm -fr $(TARGET_DIR)/usr/share/sdl-jstest/gamecontrollerdb.txt
	ln -sf /usr/share/gamecontrollerdb.txt $(TARGET_DIR)/usr/share/sdl-jstest/gamecontrollerdb.txt
endef

JSTEST2_POST_INSTALL_TARGET_HOOKS += JSTEST2_GAMECONTROLLER_DB

$(eval $(cmake-package))
