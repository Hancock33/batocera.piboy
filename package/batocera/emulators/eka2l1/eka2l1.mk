################################################################################
#
# eka2l1
#
################################################################################
# Version: Commits on Apr 07, 2024
EKA2L1_VERSION = e67f84dc605ea30afc1ab6f4f43c0f855eec79a5
EKA2L1_SITE = https://github.com/EKA2L1/EKA2L1.git
EKA2L1_SITE_METHOD=git
EKA2L1_GIT_SUBMODULES=YES
EKA2L1_LICENSE = GPLv2
EKA2L1_DEPENDENCIES = qt6base qt6multimedia qt6svg
EKA2L1_EMULATOR_INFO = eka2l1.emulator.yml

EKA2L1_SUPPORTS_IN_SOURCE_BUILD = NO

EKA2L1_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
EKA2L1_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
EKA2L1_CONF_OPTS += -DEKA2L1_ENABLE_SCRIPTING_ABILITY=OFF
EKA2L1_CONF_OPTS += -DEKA2L1_BUILD_TOOLS=OFF
EKA2L1_CONF_OPTS += -DEKA2L1_BUILD_TESTS=OFF
EKA2L1_CONF_OPTS += -DEKA2L1_USE_SYSTEM_FFMPEG=ON
EKA2L1_CONF_OPTS += -DENABLE_PROGRAMS=OFF # for mbedtls

# use gcc to build
EKA2L1_TARGET_CFLAGS= -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion
EKA2L1_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(EKA2L1_TARGET_CFLAGS)"
EKA2L1_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
EKA2L1_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

ifneq ($(BR2_x86_64),y)
    EKA2L1_CONF_OPTS += -DEKA2L1_UNIX_USE_X11=OFF
    EKA2L1_CONF_OPTS += -DEKA2L1_UNIX_USE_WAYLAND=ON
endif

define EKA2L1_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/eka2l1
	$(TARGET_STRIP) $(@D)/buildroot-build/bin/eka2l1_qt
	cp -R $(@D)/buildroot-build/bin/* $(TARGET_DIR)/usr/bin/eka2l1/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
