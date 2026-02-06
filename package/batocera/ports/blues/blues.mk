################################################################################
#
# blues
#
################################################################################
# Version: Commits on Dec 28, 2024
BLUES_VERSION = a12e0a8cc4b3a8ce9d9f411592037b1ee27fc751
BLUES_SITE = $(call github,twojstaryzdomu,blues,$(BLUES_VERSION))
BLUES_EMULATOR_INFO = blues.emulator.yml bbja.emulator.yml pre2.emulator.yml
BLUES_DEPENDENCIES = sdl2 sdl2_mixer
BLUES_LICENSE = GPLv2

define BLUES_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
	CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
	CFLAGS="$(TARGET_CFLAGS) -std=gnu17" \
	-C $(@D)
endef

define BLUES_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/bbja -D $(TARGET_DIR)/usr/bin/bbja
	$(INSTALL) -m 0755 $(@D)/blues -D $(TARGET_DIR)/usr/bin/blues
	$(INSTALL) -m 0755 $(@D)/pre2 -D $(TARGET_DIR)/usr/bin/pre2
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
