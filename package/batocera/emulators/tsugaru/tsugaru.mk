################################################################################
#
# tsugaru
#
################################################################################
# Version: Commits on Mar 09, 2026
TSUGARU_VERSION = 860372dab6a0378608dfd92d4685099cf44c8467
TSUGARU_SITE = $(call github,captainys,TOWNSEMU,$(TSUGARU_VERSION))
TSUGARU_LICENSE = GPLv2
TSUGARU_SUPPORTS_IN_SOURCE_BUILD = NO
TSUGARU_EMULATOR_INFO = tsugaru.emulator.yml
TSUGARU_SUBDIR = src

TSUGARU_DEPENDENCIES = alsa-lib libglu

TSUGARU_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
TSUGARU_CONF_ENV += LDFLAGS=-lpthread

define TSUGARU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin
	$(INSTALL) -D $(@D)/src/buildroot-build/main_cui/Tsugaru_CUI $(TARGET_DIR)/usr/bin/
	# evampy
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/tsugaru/fmtowns.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
