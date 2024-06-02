################################################################################
#
# tsugaru
#
################################################################################
# Version: Commits on Jun 01, 2024
TSUGARU_VERSION = b51ab22d7198ae0d4b20357283e9361ddcfa97af
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
