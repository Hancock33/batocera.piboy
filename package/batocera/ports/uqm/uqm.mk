################################################################################
#
# uqm
#
################################################################################
# Version: Commits on Apr 05, 2024
UQM_VERSION = d6583f2250e6046de0bcd20e18ba78e8620fb638
UQM_SITE = https://git.code.sf.net/p/sc2/uqm
UQM_SITE_METHOD = git
UQM_DEPENDENCIES = sdl2 libpng libvorbis libzip
UQM_SUBDIR = sc2
UQM_EMULATOR_INFO = uqm.emulator.yml

define UQM_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/sc2/src/urquan -D $(TARGET_DIR)/usr/bin/urquan
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
