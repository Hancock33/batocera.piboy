################################################################################
#
# uinput-joystick
#
################################################################################
# Version: Commits on Feb 11, 2022
UINPUT_JOYSTICK_VERSION = bea7d56f4947b547db2b827640bc9966fe770f84
UINPUT_JOYSTICK_SITE = $(call github,shantigilbert,uinput_joystick,$(UINPUT_JOYSTICK_VERSION))

define UINPUT_JOYSTICK_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" CFLAGS="$(TARGET_CFLAGS)" -C $(@D)
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/fftest.c -o $(@D)/fftest
endef

define UINPUT_JOYSTICK_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/uinput_joystick $(TARGET_DIR)/usr/bin/uinput_joystick
	$(INSTALL) -D -m 0755 $(@D)/fftest $(TARGET_DIR)/usr/bin/fftest
	$(INSTALL) -D -m 0755 $(UINPUT_JOYSTICK_PKGDIR)/S60uinput-joystick $(TARGET_DIR)/etc/init.d/S60uinput-joystick
endef

$(eval $(generic-package))
