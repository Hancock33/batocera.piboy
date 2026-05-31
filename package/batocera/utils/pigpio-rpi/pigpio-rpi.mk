################################################################################
#
# pigpio
#
################################################################################
# Version: Commits on Mar 02, 2021
PIGPIO_RPI_VERSION = v79
PIGPIO_RPI_SITE = $(call github,joan2937,pigpio,$(PIGPIO_RPI_VERSION))
PIGPIO_RPI_LICENSE = Unlicense
PIGPIO_RPI_LICENSE_FILES = UNLICENCE
PIGPIO_RPI_INSTALL_STAGING = YES

# GCC 15 defaults to `-std=gnu23` which breaks compilation
PIGPIO_RPI_CFLAGS += $(TARGET_OPTIMIZATION) -std=gnu17

define PIGPIO_RPI_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(PIGPIO_RPI_CFLAGS)" -C $(@D)
endef

define PIGPIO_RPI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/pig2vcd $(TARGET_DIR)/usr/bin/pig2vcd
	$(INSTALL) -D -m 0755 $(@D)/pigpiod $(TARGET_DIR)/usr/bin/pigpiod
	$(INSTALL) -D -m 0755 $(@D)/pigs $(TARGET_DIR)/usr/bin/pigs
	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so.1
	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so.1
	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so.1
	ln -sf libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so
	ln -sf libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so
	ln -sf libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so
endef

define PIGPIO_RPI_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so.1
	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so.1
	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so.1
	$(INSTALL) -D -m 0644 $(@D)/pigpio.h $(STAGING_DIR)/usr/include/pigpio.h
	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if.h $(STAGING_DIR)/usr/include/pigpiod_if.h
	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if2.h $(STAGING_DIR)/usr/include/pigpiod_if2.h
	ln -sf libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so
	ln -sf libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so
	ln -sf libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so
endef

# batocera - we want this as a service
define PIGPIO_RPI_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 $(PIGPIO_RPI_PKGDIR)/S50pigpio \
		$(TARGET_DIR)/usr/share/batocera/services/pigpio
endef

define PIGPIO_RPI_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644  $(PIGPIO_RPI_PKGDIR)/pigpio.service \
		$(TARGET_DIR)/usr/lib/systemd/system/pigpio.service
endef

$(eval $(generic-package))
