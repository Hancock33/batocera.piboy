################################################################################
#
# supermodel-es
#
################################################################################
# Version: Commits on Sept 24, 2025
SUPERMODEL_ES_VERSION = 369c9f421511f4c37234e4061bcaaab4dfc544ac
SUPERMODEL_ES_SITE = $(call github,DirtBagXon,model3emu-code-sinden,$(SUPERMODEL_ES_VERSION))
SUPERMODEL_ES_DEPENDENCIES = sdl2 zlib libzip sdl2_net
SUPERMODEL_ES_LICENSE = GPLv3

define SUPERMODEL_ES_BUILD_CMDS
	cp $(@D)/Makefiles/Makefile.UNIX $(@D)/Makefile
	$(SED) "s|-O3||g" $(@D)/Makefiles/Rules.inc
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -flto=32|g" $(@D)/Makefile
	$(SED) "s|CC = gcc|CC = $(TARGET_CC)|g" $(@D)/Makefile
	$(SED) "s|CXX = g++|CXX = $(TARGET_CXX)|g" $(@D)/Makefile
	$(SED) "s|LD = gcc|LD = $(TARGET_CC)|g" $(@D)/Makefile
	$(SED) "s|sdl2-config|$(STAGING_DIR)/usr/bin/sdl2-config|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -j2 -C $(@D) -f Makefile NET_BOARD=1 VERBOSE=1
endef

define SUPERMODEL_ES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/supermodel
	$(INSTALL) -D -m 0755 $(@D)/bin/supermodel $(TARGET_DIR)/usr/bin/supermodel-sinden
	$(INSTALL) -D -m 0644 $(@D)/Config/Games.xml $(TARGET_DIR)/usr/share/supermodel/Games.xml
	$(INSTALL) -D -m 0644 $(@D)/Config/Music.xml $(TARGET_DIR)/usr/share/supermodel/Music.xml
endef

define SUPERMODEL_ES_LINE_ENDINGS_FIXUP
	# DOS2UNIX Supermodel.ini and Main.cpp - patch system does not support different line endings
	sed -i -E -e "s|\r$$||g" $(@D)/Src/OSD/SDL/Main.cpp
	sed -i -E -e "s|\r$$||g" $(@D)/Src/Inputs/Inputs.cpp
	sed -i -E -e "s|\r$$||g" $(@D)/Src/Graphics/New3D/R3DShaderTriangles.h
	sed -i -E -e "s|\r$$||g" $(@D)/Src/OSD/Unix/FileSystemPath.cpp
endef

define SUPERMODEL_ES_POST_PROCESS
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/supermodel/NVRAM $(TARGET_DIR)/usr/share/supermodel
endef

SUPERMODEL_ES_PRE_PATCH_HOOKS += SUPERMODEL_ES_LINE_ENDINGS_FIXUP

SUPERMODEL_ES_POST_INSTALL_TARGET_HOOKS += SUPERMODEL_ES_POST_PROCESS

$(eval $(generic-package))
