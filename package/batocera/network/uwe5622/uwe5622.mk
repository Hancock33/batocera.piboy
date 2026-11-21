################################################################################
#
# uwe5622
#
################################################################################
# Version: Commits on Nov 20, 2026
UWE5622_VERSION = 3b713f8a7ae3627e00bbee5e2a33b6a1fb3151c3
UWE5622_SITE = $(call github,armbian,uwe5622,$(UWE5622_VERSION))

UWE5622_MODULE_MAKE_OPTS = \
	CONFIG_WLAN_UWE5622=m \
	CONFIG_TTY_OVERY_SDIO=m \
	CONFIG_AW_WIFI_DEVICE_UWE5622=y \
	KCFLAGS=-DCONFIG_AW_BIND_VERIFY

$(eval $(kernel-module))
$(eval $(generic-package))
