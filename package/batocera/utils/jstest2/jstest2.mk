################################################################################
#
# jstest2
#
################################################################################
# Version: Commits on 31 May, 2022
JSTEST2_VERSION = 95784a322faf66f7af79bc883508c8d827ed77b2
JSTEST2_SITE = https://gitlab.com/sdl-jstest/sdl-jstest
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
