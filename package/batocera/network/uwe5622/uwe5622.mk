################################################################################
#
# uwe5622
#
################################################################################
# Version: Commits on Nov 09, 2026
UWE5622_VERSION = 6a6387247c12bf6f0f5c1ed7da8b782623a74ea0
UWE5622_SITE = $(call github,armbian,uwe5622,$(UWE5622_VERSION))

UWE5622_MODULE_MAKE_OPTS = \
	CONFIG_WLAN_UWE5622=m \
	CONFIG_TTY_OVERY_SDIO=m \
	CONFIG_AW_WIFI_DEVICE_UWE5622=y \
	KCFLAGS=-DCONFIG_AW_BIND_VERIFY

$(eval $(kernel-module))
$(eval $(generic-package))
