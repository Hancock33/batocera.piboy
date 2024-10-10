################################################################################
#
# gamecon_gpio_rpi
#
################################################################################
# Version: Commits on Oct 08, 2024
GAMECON_GPIO_RPI_VERSION = 8332c9c7567d708406c24903386f3e5f42a31ede
GAMECON_GPIO_RPI_SITE = $(call github,marqs85,gamecon_gpio_rpi,$(GAMECON_GPIO_RPI_VERSION))

define GAMECON_GPIO_RPI_FIX_EXTRACT
	mv $(@D)/gamecon_gpio_rpi/* $(@D)/
endef
GAMECON_GPIO_RPI_POST_EXTRACT_HOOKS += GAMECON_GPIO_RPI_FIX_EXTRACT

# Needed because can't pass cflags to cc
define GAMECON_GPIO_RPI_RPI2_HOOK
	$(SED) "s/BCM2708_PERI_BASE + 0x200000/BCM2708_PERI_BASE + 0x3F000000/g" $(@D)/gamecon_gpio_rpi.c
endef

ifeq ($(BR2_cortex_a7),y)
GAMECON_GPIO_RPI_PRE_CONFIGURE_HOOKS += GAMECON_GPIO_RPI_RPI2_HOOK
endif
ifeq ($(BR2_cortex_a53),y)
GAMECON_GPIO_RPI_PRE_CONFIGURE_HOOKS += GAMECON_GPIO_RPI_RPI2_HOOK
endif

$(eval $(kernel-module))
$(eval $(generic-package))
