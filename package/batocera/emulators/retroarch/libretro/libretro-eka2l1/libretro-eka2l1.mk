################################################################################
#
# libretro-eka2l1
#
################################################################################
# Version: Commits on Oct 16, 2026
LIBRETRO_EKA2L1_VERSION = e39ccac46e631be7470b4f420fb8eebed9c24eca
LIBRETRO_EKA2L1_SITE = https://github.com/WizzardSK/eka2l1-libretro.git
LIBRETRO_EKA2L1_SITE_METHOD = git
LIBRETRO_EKA2L1_GIT_SUBMODULES = YES
LIBRETRO_EKA2L1_LICENSE = GPL-3.0
LIBRETRO_EKA2L1_LICENSE_FILES = LICENSE
LIBRETRO_EKA2L1_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_EKA2L1_EMULATOR_INFO = eka2l1.libretro.core.yml
LIBRETRO_EKA2L1_DEPENDENCIES = retroarch zlib

LIBRETRO_EKA2L1_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
LIBRETRO_EKA2L1_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
LIBRETRO_EKA2L1_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_EKA2L1_CONF_OPTS += -DCI=ON
LIBRETRO_EKA2L1_CONF_OPTS += -DEKA2L1_SCRIPTING_LUA=OFF

define LIBRETRO_EKA2L1_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/bin/eka2l1_libretro.so $(TARGET_DIR)/usr/lib/libretro/eka2l1_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
