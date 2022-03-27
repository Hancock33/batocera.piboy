################################################################################
#
# fdupes
#
################################################################################
# Version: Commits on Aug 12, 2020
FDUPES_VERSION = 2209aff509bd15e8641cb9ae3c9bbb8056f7dd7b
FDUPES_SITE = $(call github,adrianlopezroche,fdupes,$(FDUPES_VERSION))
FDUPES_AUTORECONF = YES
# fdupes needs curses.h but full ncurses support is disabled
FDUPES_DEPENDENCIES = ncurses
FDUPES_CONF_OPTS = --without-ncurses

$(eval $(autotools-package))
