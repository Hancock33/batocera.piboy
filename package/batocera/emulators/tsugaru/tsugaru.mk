################################################################################
#
# tsugaru
#
################################################################################
# Version: Commits on Oct 31, 2026
TSUGARU_VERSION = 1ca4ec4f05cc55458e0d4a7a661559af9b068529
TSUGARU_SITE = $(call github,captainys,TOWNSEMU,$(TSUGARU_VERSION))
TSUGARU_LICENSE = GPL-2.0
TSUGARU_SUPPORTS_IN_SOURCE_BUILD = NO
TSUGARU_EMULATOR_INFO = tsugaru.emulator.yml
TSUGARU_SUBDIR = src

TSUGARU_DEPENDENCIES = alsa-lib libglu

TSUGARU_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE

define TSUGARU_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/src/buildroot-build/main_cui/Tsugaru_CUI $(TARGET_DIR)/usr/bin/Tsugaru_CUI
	# evmapy
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(TSUGARU_PKGDIR)/fmtowns.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
