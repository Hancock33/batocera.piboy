################################################################################
#
# tsugaru
#
################################################################################
# Version: Commits on Apr 17, 2024
TSUGARU_VERSION = c7f80cf21bb093138e4e91e012b13913be1755e9
TSUGARU_SITE = $(call github,captainys,TOWNSEMU,$(TSUGARU_VERSION))
TSUGARU_DEPENDENCIES = libglu
TSUGARU_LICENSE = GPLv2
TSUGARU_SUPPORTS_IN_SOURCE_BUILD = NO
# CMakeLists.txt in src subfolder
TSUGARU_SUBDIR = src

TSUGARU_CONF_OPTS = -DBUILD_SHARED_LIBS=FALSE
TSUGARU_CONF_ENV += LDFLAGS=-lpthread

define TSUGARU_INSTALL_TARGET_CMDS
		mkdir -p $(TARGET_DIR)/usr/bin
		$(INSTALL) -D $(@D)/src/buildroot-build/main_cui/Tsugaru_CUI \
				$(TARGET_DIR)/usr/bin/

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/tsugaru/fmtowns.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
