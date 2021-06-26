################################################################################
#
# jstest2
#
################################################################################
# Version.: Commits on Apr 22, 2021
JSTEST2_VERSION = 6d29d45a06b1b465fe5ee1779b80e1de8c37fff2
JSTEST2_SITE = $(call github,Grumbel,sdl-jstest,$(JSTEST2_VERSION))
JSTEST2_DEPENDENCIES = sdl2

$(eval $(cmake-package))
