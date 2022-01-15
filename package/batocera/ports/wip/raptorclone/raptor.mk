################################################################################
#
# Raptor: Call of the Shadows Clone
#
################################################################################
# Version.: Commits on Feb 12, 2021
RAPTORCLONE_VERSION = 19c4d684acd87b149cf2e00975d73db5d8875e82
RAPTORCLONE_SITE = https://github.com/aroldanju/raptor-call-of-the-shadows.git
RAPTORCLONE_SITE_METHOD=git
RAPTORCLONE_GIT_SUBMODULES=YES

RAPTORCLONE_DEPENDENCIES = sdl2 sdl2_mixer sdl2_ttf
RAPTORCLONE_LICENSE = GPL-2.0

RAPTORCLONE_SUPPORTS_IN_SOURCE_BUILD = NO

RAPTORCLONE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
RAPTORCLONE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--unresolved-symbols=ignore-all"
define RAPTORCLONE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/src/RigelEngine $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/raptorclone/raptor.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
