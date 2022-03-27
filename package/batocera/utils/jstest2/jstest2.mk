################################################################################
#
# jstest2
#
################################################################################
# Version: Commits on Apr 22, 2021
JSTEST2_VERSION = 6d29d45a06b1b465fe5ee1779b80e1de8c37fff2
JSTEST2_SITE = https://github.com/Grumbel/sdl-jstest.git

JSTEST2_SITE_METHOD=git
JSTEST2_GIT_SUBMODULES=YES
JSTEST2_DEPENDENCIES = sdl2
JSTEST2_LICENSE = GPLv3

JSTEST2_CONF_OPTS += -DBUILD_SDL_JSTEST=OFF

$(eval $(cmake-package))
