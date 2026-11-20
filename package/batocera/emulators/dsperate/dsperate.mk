################################################################################
#
# dsperate
#
################################################################################
# Version: Commits on Nov 20, 2026
DSPERATE_VERSION = v3.5.0
DSPERATE_SITE = $(call github,beebono,DSperate,$(DSPERATE_VERSION))
DSPERATE_LICENSE = GPL-3.0+
DSPERATE_LICENSE_FILES = LICENSE
DSPERATE_SUPPORTS_IN_SOURCE_BUILD = NO
DSPERATE_DEPENDENCIES = sdl2 libcurl
DSPERATE_EMULATOR_INFO = dsperate.emulator.yml

DSPERATE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
DSPERATE_CONF_OPTS += -DDSPERATE_TESTS=OFF
DSPERATE_CONF_OPTS += -DDSPERATE_HEADLESS=OFF
DSPERATE_CONF_OPTS += -DDSPERATE_SDL=ON
DSPERATE_CONF_OPTS += -DDSPERATE_CHEEVOS=ON
DSPERATE_CONF_OPTS += -DDSPERATE_NET=ON

# the recompiler and NEON kernels only exist for ARM hosts
ifeq ($(BR2_aarch64)$(BR2_arm),y)
DSPERATE_CONF_OPTS += -DDSPERATE_JIT=ON
else
DSPERATE_CONF_OPTS += -DDSPERATE_JIT=OFF
endif

ifeq ($(BR2_aarch64)$(BR2_ARM_CPU_HAS_NEON),y)
DSPERATE_CONF_OPTS += -DDSPERATE_NEON=ON
else
DSPERATE_CONF_OPTS += -DDSPERATE_NEON=OFF
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
DSPERATE_CONF_OPTS += -DDSPERATE_WAYLAND=ON
else
DSPERATE_CONF_OPTS += -DDSPERATE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
DSPERATE_DEPENDENCIES += vulkan-headers
endif

define DSPERATE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/src/frontend/sdl/dsperate $(TARGET_DIR)/usr/bin/dsperate
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
