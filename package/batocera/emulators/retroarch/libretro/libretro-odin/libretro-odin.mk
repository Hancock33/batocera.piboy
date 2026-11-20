################################################################################
#
# libretro-odin
#
################################################################################
# Version: Commits on Nov 19, 2026
LIBRETRO_ODIN_VERSION = 942a4865889db6b10f418f76bbf037e22694321f
LIBRETRO_ODIN_SITE = https://github.com/WizzardSK/odin-libretro.git
LIBRETRO_ODIN_SITE_METHOD = git
LIBRETRO_ODIN_GIT_SUBMODULES = YES
LIBRETRO_ODIN_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_ODIN_LICENSE = GPL-3.0+
LIBRETRO_ODIN_LICENSE_FILES = LICENSE
LIBRETRO_ODIN_DEPENDENCIES = retroarch host-glslang libgl libglvnd
LIBRETRO_ODIN_EMULATOR_INFO = odin.libretro.core.yml

LIBRETRO_ODIN_CONF_OPTS += -DODIN_LIBRETRO=ON
LIBRETRO_ODIN_CONF_OPTS += -DODIN_NATIVE=OFF
LIBRETRO_ODIN_CONF_OPTS += -DGLSLANG=$(HOST_DIR)/bin/glslangValidator
LIBRETRO_ODIN_CONF_OPTS += -DODIN_VERSION=$(shell echo $(LIBRETRO_ODIN_VERSION) | cut -c1-7)

define LIBRETRO_ODIN_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/buildroot-build/odin_libretro.so $(TARGET_DIR)/usr/lib/libretro/odin_libretro.so
	$(INSTALL) -D -m 0644 $(@D)/odin_libretro.info $(TARGET_DIR)/usr/share/libretro/info/odin_libretro.info
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
