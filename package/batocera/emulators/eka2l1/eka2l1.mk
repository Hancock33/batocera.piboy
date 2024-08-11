################################################################################
#
# eka2l1
#
################################################################################
# Version: Commits on Sept 18, 2023
EKA2L1_VERSION = 8bf21e354c7aa3ea8f287a5f47825d1370b1c14f
EKA2L1_BRANCH = wayland-system-ffmpeg
EKA2L1_SITE = https://github.com/rtissera/EKA2L1.git
EKA2L1_SITE_METHOD=git
EKA2L1_GIT_SUBMODULES=YES
EKA2L1_LICENSE = GPLv2
EKA2L1_DEPENDENCIES = qt6base qt6multimedia qt6svg

EKA2L1_SUPPORTS_IN_SOURCE_BUILD = NO

EKA2L1_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
EKA2L1_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
EKA2L1_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
EKA2L1_CONF_OPTS += -DEKA2L1_ENABLE_SCRIPTING_ABILITY=OFF
EKA2L1_CONF_OPTS += -DEKA2L1_BUILD_TOOLS=OFF
EKA2L1_CONF_OPTS += -DEKA2L1_BUILD_TESTS=OFF
EKA2L1_CONF_OPTS += -DEKA2L1_USE_SYSTEM_FFMPEG=ON
EKA2L1_CONF_OPTS += -DENABLE_PROGRAMS=OFF # for mbedtls

# use gcc to build
#EKA2L1_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
#EKA2L1_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
EKA2L1_CONF_OPTS += -DCMAKE_C_COMPILER=/usr/bin/gcc
EKA2L1_CONF_OPTS += -DCMAKE_CXX_COMPILER=/usr/bin/g++

ifneq ($(BR2_x86_64),y)
EKA2L1_CONF_OPTS += -DEKA2L1_UNIX_USE_X11=OFF
EKA2L1_CONF_OPTS += -DEKA2L1_UNIX_USE_WAYLAND=ON
endif

define EKA2L1_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin/eka2l1
    $(TARGET_STRIP) $(@D)/buildroot-build/bin/eka2l1_qt
    cp -R $(@D)/buildroot-build/bin/* \
                $(TARGET_DIR)/usr/bin/eka2l1/
endef

$(eval $(cmake-package))
