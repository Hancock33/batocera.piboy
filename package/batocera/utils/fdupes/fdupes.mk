################################################################################
#
# fdupes
#
################################################################################
# Version: Commits on Mar 30, 2025
FDUPES_VERSION = v2.4.0
FDUPES_SITE = $(call github,adrianlopezroche,fdupes,$(FDUPES_VERSION))
FDUPES_AUTORECONF = YES
# fdupes needs curses.h but full ncurses support is disabled
FDUPES_DEPENDENCIES = ncurses sqlite
FDUPES_CONF_OPTS = --without-ncurses

$(eval $(autotools-package))
