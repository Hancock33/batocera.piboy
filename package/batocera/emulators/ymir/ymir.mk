################################################################################
# This file is part of the batocera distribution (https://batocera.org).
# Copyright (c) 2025+.
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# YOU MUST KEEP THIS HEADER AS IT IS
################################################################################
#
# ymir
#
################################################################################
# Version: Commits on Jun 23, 2025
YMIR_VERSION = 8c6a47f05b6f3367e1a9fa3ce7fbbd1aa1d92b6a
YMIR_SITE = https://github.com/StrikerX3/Ymir
YMIR_SITE_METHOD=git
YMIR_GIT_SUBMODULES=YES
YMIR_LICENSE = GPLv2
YMIR_LICENSE_FILE = LICENSE
YMIR_DEPENDENCIES += host-clang sdl3
YMIR_SUPPORTS_IN_SOURCE_BUILD = NO

YMIR_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
YMIR_CONF_OPTS += -DCMAKE_INSTALL_PREFIX=/usr
YMIR_CONF_OPTS += -DYmir_DEV_BUILD=OFF
YMIR_CONF_OPTS += -DYmir_ENABLE_DEVLOG=OFF
YMIR_CONF_OPTS += -DYmir_ENABLE_IMGUI_DEMO=OFF
YMIR_CONF_OPTS += -DYmir_ENABLE_SANDBOX=OFF
YMIR_CONF_OPTS += -DYmir_ENABLE_TESTS=OFF
YMIR_CONF_OPTS += -DYmir_ENABLE_YMDASM=OFF
YMIR_CONF_OPTS += -DYmir_INCLUDE_PACKAGING=OFF

ifeq ($(BR2_X86_CPU_HAS_AVX2),y)
    YMIR_CONF_OPTS += -DYmir_AVX2=ON
else
    YMIR_CONF_OPTS += -DYmir_AVX2=OFF
endif

define YMIR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/buildroot-build/apps/ymir-sdl3/ymir-sdl3-* $(TARGET_DIR)/usr/bin/ymir
endef

$(eval $(cmake-package))
