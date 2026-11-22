################################################################################
#
# rk915 - Rockchip RK915 SDIO WiFi driver (ported from BSP 4.4 to mainline)
#
################################################################################
# Version: Commits on Jun 04, 2026
RK915_VERSION = bf237144d8fde7dffaef1777350b23d5d40d0920
RK915_SITE = $(call github,ImanolBarba,rk915,$(RK915_VERSION))
RK915_LICENSE = GPL-2.0
RK915_LICENSE_FILES = LICENSE

RK915_MODULE_MAKE_OPTS = \
	CONFIG_RK915=m \
	USER_EXTRA_CFLAGS="-Wno-error"

# Install firmware files to /lib/firmware/ when the source ships them under
# firmware/ (they come from the stock R36 Ultra ROM)
define RK915_INSTALL_FIRMWARE
	for f in rk915_fw.bin rk915_patch.bin; do \
		if [ -f $(@D)/firmware/$$f ]; then \
			$(INSTALL) -D -m 0644 $(@D)/firmware/$$f $(TARGET_DIR)/lib/firmware/$$f; \
		fi; \
	done
endef

RK915_POST_INSTALL_TARGET_HOOKS = RK915_INSTALL_FIRMWARE

$(eval $(kernel-module))
$(eval $(generic-package))
