################################################################################
#
# tr1x
#
################################################################################
# Version: Commits on Mar 31, 2025
TR1X_VERSION = a52d1efc81d2cf8e0de8d20714d9bb9deca6ac6d
TR1X_SITE = $(call github,LostArtefacts,TRX,$(TR1X_VERSION))
TR1X_LICENSE = GPL-3.0 license
TR1X_LICENSE_FILES = COPYING.md
TR1X_SUPPORTS_IN_SOURCE_BUILD = NO
# meson.build in src/tr1 subfolder
TR1X_SUBDIR = src/tr1

TR1X_DEPENDENCIES = ffmpeg libglew pcre2 sdl2 uthash

TR1X_CONF_OPTS = -Dstaticdeps=false

# Use install target commands to get all files & dirs
define TR1X_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/tr1x
	cp -f $(@D)/src/tr1/build/TR1X $(TARGET_DIR)/usr/bin/tr1x/
	cp -rf $(@D)/data/tr1/ship/* $(TARGET_DIR)/usr/bin/tr1x/
endef

$(eval $(meson-package))
################################################################################
# This file is part of the batocera distribution (https://batocera.org).
# Copyright (c) 2025+.
# With this build script you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# YOU MUST KEEP THIS FOOTER AS IT IS
################################################################################
