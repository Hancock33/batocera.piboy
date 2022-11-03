################################################################################
#
# samtfe
#
################################################################################
# Version: Commits on Oct 18, 2022
SAMTFE_VERSION = 48143b121a150e55e9ee386456b92f8060a88655
SAMTFE_SITE = https://github.com/tx00100xt/SeriousSamClassic-VK.git
SAMTFE_SITE_METHOD=git
SAMTFE_GIT_SUBMODULES=YES
SAMTFE_SUBDIR = SamTFE/Sources
SAMTFE_SUPPORTS_IN_SOURCE_BUILD = NO
SAMTFE_DEPENDENCIES = sdl2 sdl2_mixer host-samtfe
SAMTFE_LICENSE = GPL-2.0

define SAMTFE_CP_WEAPONS
	cp -vfr $(@D)/SamTFE/Sources/Entities/PlayerWeapons_old.es $(@D)/SamTFE/Sources/Entities/PlayerWeapons.es
endef
SAMTFE_POST_EXTRACT_HOOKS += SAMTFE_CP_WEAPONS


HOST_SAMTFE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
define HOST_SAMTFE_INSTALL_CMDS
	cp -av $(HOST_SAMTFE_BUILDDIR)/ecc $(HOST_DIR)/bin
endef

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
SAMTFE_CONF_OPTS += -DRPI4=ON
endif
SAMTFE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DECC=$(HOST_SAMTFE_BUILDDIR)/ecc -DTFE=ON

define SAMTFE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	cp -av $(@D)/SamTFE/SE1_10b.gro   $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	cp -av $(SAMTFE_BUILDDIR)/Debug/* $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
	cp -av $(SAMTFE_BUILDDIR)/{DedicatedServer,MakeFONT,SeriousSam} $(TARGET_DIR)/usr/share/game_assets/samtfe/Bin
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
