################################################################################
#
# uqm
#
################################################################################
# Version: Commits on Nov 21, 2026
UQM_VERSION = 3ec5f474b366d7ecc72bec6dfe23367520a1918d
UQM_SITE = https://git.code.sf.net/p/sc2/uqm
UQM_SITE_METHOD = git
UQM_LICENSE = GPL-2.0+
UQM_DEPENDENCIES = sdl2 libpng libvorbis libzip
UQM_SUBDIR = sc2
UQM_EMULATOR_INFO = uqm.emulator.yml

define UQM_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/sc2/src/urquan -D $(TARGET_DIR)/usr/bin/urquan
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
