################################################################################
#
# Doom 3 BFG
#
################################################################################
# Version.: Commits on Nov 16, 2021
DOOM3BFG_VERSION = 2b727db4c211c6b6f4d1be0d43d76aa69c7e104f
DOOM3BFG_SITE = https://github.com/RobertBeckebans/RBDOOM-3-BFG.git
DOOM3BFG_SITE_METHOD=git
DOOM3BFG_GIT_SUBMODULES=YES

DOOM3BFG_DEPENDENCIES = sdl2 sdl2_mixer
DOOM3BFG_LICENSE = GPL-2.0

DOOM3BFG_SUPPORTS_IN_SOURCE_BUILD = NO
DOOM3BFG_SUBDIR = neo

DOOM3BFG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
DOOM3BFG_CONF_OPTS += -DSDL2=ON 
DOOM3BFG_CONF_OPTS += -DONATIVE=ON -DFFMPEG=OFF -DBINKDEC=ON 
DOOM3BFG_CONF_OPTS += -DUSE_VULKAN=ON -DSPIRV_SHADERC=OFF
DOOM3BFG_CONF_OPTS += -DDOOM_CLASSIC=ON

define DOOM3BFG_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/neo/buildroot-build/idlib/libidlib.so $(TARGET_DIR)/usr/lib
	cp -pvr $(@D)/neo/buildroot-build/RBDOOM3BFGBFG $(TARGET_DIR)/usr/bin	

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom3bfg/bennugd.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))

