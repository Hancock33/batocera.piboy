################################################################################
#
# supermodel
#
################################################################################
# Version: Commits on Sept 23, 2023
SUPERMODEL_VERSION = 6b0d5c453aa3621d6b442373276788ea9adb7c8a
SUPERMODEL_SITE = $(call github,trzy,Supermodel,$(SUPERMODEL_VERSION))
SUPERMODEL_DEPENDENCIES = sdl2 zlib libzip sdl2_net
SUPERMODEL_LICENSE = GPLv3

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
	SUPERMODEL_VERSION = 4c727abdc84e5c9eb56b3a178c2dd473d7581725
else
	X86_INSTALL=y
endif

ifeq ($(BR2_PACKAGE_LIBGLEW),y)
	SUPERMODEL_DEPENDENCIES += libglew
endif

define SUPERMODEL_BUILD_CMDS
	cp $(@D)/Makefiles/Makefile.UNIX $(@D)/Makefile
	$(SED) "s|CC = gcc|CC = $(TARGET_CC)|g" $(@D)/Makefile
	$(SED) "s|CXX = g++|CXX = $(TARGET_CXX)|g" $(@D)/Makefile
	$(SED) "s|LD = gcc|LD = $(TARGET_CC)|g" $(@D)/Makefile
	$(SED) "s|sdl2-config|$(STAGING_DIR)/usr/bin/sdl2-config|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -f Makefile NET_BOARD=1 VERBOSE=1 ARCH=$(BR2_TARGET_OPTIMIZATION)
endef

define SUPERMODEL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/supermodel
	$(INSTALL) -D -m 0755 $(@D)/bin/supermodel $(TARGET_DIR)/usr/bin/supermodel
	$(INSTALL) -D -m 0644 $(@D)/Config/Games.xml $(TARGET_DIR)/usr/share/supermodel/Games.xml
	@if [ "$(X86_INSTALL)" = "y" ]; then cp -av $(@D)/Assets $(TARGET_DIR)/usr/share/supermodel ; fi
	$(INSTALL) -D -m 0644 $(@D)/Config/Supermodel.ini $(TARGET_DIR)/usr/share/supermodel/Supermodel.ini.template
	$(INSTALL) -D -m 0644 $(@D)/Config/Supermodel.ini $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputAccelerator = "KEY_UP,JOY1_UP"|InputAccelerator = "KEY_UP,JOY1_RZAXIS_POS"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputBrake = "KEY_DOWN,JOY1_DOWN"|InputBrake = "KEY_DOWN,JOY1_ZAXIS_POS"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputGearShift1 = "KEY_Q,JOY1_BUTTON5"|InputGearShift1 = "KEY_Q"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputGearShift2 = "KEY_W,JOY1_BUTTON6"|InputGearShift2 = "KEY_W"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputGearShift3 = "KEY_E,JOY1_BUTTON7"|InputGearShift3 = "KEY_E"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputGearShift4 = "KEY_R,JOY1_BUTTON8"|InputGearShift4 = "KEY_R"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputGearShiftUp = "KEY_Y"|InputGearShiftUp = "KEY_Y,JOY1_BUTTON6,JOY1_RYAXIS_NEG"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
	$(SED) 's|InputGearShiftDown = "KEY_H"|InputGearShiftDown = "KEY_H,JOY1_BUTTON5,JOY1_RYAXIS_POS"|g' $(TARGET_DIR)/usr/share/supermodel/Supermodel-Driving.ini.template
endef

define SUPERMODEL_POST_PROCESS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy $(TARGET_DIR)/usr/share/supermodel
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/supermodel/model3.supermodel.keys $(TARGET_DIR)/usr/share/evmapy
		cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/supermodel/NVRAM $(TARGET_DIR)/usr/share/supermodel
endef

SUPERMODEL_POST_INSTALL_TARGET_HOOKS += SUPERMODEL_POST_PROCESS

$(eval $(generic-package))
