################################################################################
#
# micropython
#
################################################################################

MICROPYTHON_VERSION = v1.4.5
MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
MICROPYTHON_LICENSE = MIT
MICROPYTHON_LICENSE_FILES = LICENSE
MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch

# Use fallback implementation for exception handling on architectures that don't
# have explicit support.
ifeq ($(BR2_powerpc)$(BR2_sh)$(BR2_xtensa),y)
MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
endif

define MICROPYTHON_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
		CROSS_COMPILE=$(TARGET_CROSS) \
		CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
endef

define MICROPYTHON_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
		DESTDIR=$(TARGET_DIR) \
		PREFIX=$(TARGET_DIR)/usr \
		install
endef

$(eval $(generic-package))
