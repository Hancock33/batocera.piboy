################################################################################
#
# uwe5622
#
################################################################################
# Version: Commits on Oct 12, 2026
UWE5622_VERSION = fa9d1a6703a93a85bcf68e865ebc2726474076ad
UWE5622_SITE = $(call github,armbian,uwe5622,$(UWE5622_VERSION))

UWE5622_MODULE_MAKE_OPTS = \
    CONFIG_WLAN_UWE5622=m \
    CONFIG_TTY_OVERY_SDIO=m \
    CONFIG_AW_WIFI_DEVICE_UWE5622=y \
    KCFLAGS=-DCONFIG_AW_BIND_VERIFY

$(eval $(kernel-module))
$(eval $(generic-package))
