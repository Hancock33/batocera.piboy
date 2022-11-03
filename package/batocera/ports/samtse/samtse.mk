################################################################################
#
# samtse
#
################################################################################
# Version: Commits on Oct 18, 2022
SAMTSE_VERSION = 48143b121a150e55e9ee386456b92f8060a88655
SAMTSE_SITE = https://github.com/tx00100xt/SeriousSamClassic-VK.git
SAMTSE_SITE_METHOD=git
SAMTSE_GIT_SUBMODULES=YES
SAMTSE_SUBDIR = SamTSE/Sources
SAMTSE_SUPPORTS_IN_SOURCE_BUILD = NO
SAMTSE_DEPENDENCIES = sdl2 sdl2_mixer host-samtfe
SAMTSE_LICENSE = GPL-2.0

define SAMTSE_CP_WEAPONS
	cp -vfr $(@D)/SamTSE/Sources/Entities/PlayerWeapons_old.es $(@D)/SamTSE/Sources/Entities/PlayerWeapons.es
endef
SAMTSE_POST_EXTRACT_HOOKS += SAMTSE_CP_WEAPONS

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
	SAMTSE_CONF_OPTS += -DRPI4=ON
endif
SAMTSE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DECC=$(HOST_SAMTFE_BUILDDIR)/ecc -DTFE=ON

define SAMTSE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	cp -av $(@D)/SamTSE/SE1_10b.gro   $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	cp -av $(SAMTSE_BUILDDIR)/Debug/* $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
	cp -av $(SAMTSE_BUILDDIR)/{DedicatedServer,MakeFONT,SeriousSam} $(TARGET_DIR)/usr/share/game_assets/samtse/Bin
endef

$(eval $(cmake-package))
