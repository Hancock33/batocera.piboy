################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Aug 09, 2025
DUCKSTATION_VERSION = d65c8a307340e2014b42960ed32e0101878c942a
DUCKSTATION_SITE = $(call github,stenzek,duckstation,$(DUCKSTATION_VERSION))
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = boost cpuinfo ecm ffmpeg fmt libbacktrace libcurl libdrm libevdev libsoundtouch
DUCKSTATION_DEPENDENCIES += plutosvg plutovg sdl3 stenzek-shaderc webp zstd
DUCKSTATION_DEPENDENCIES += host-clang host-spirv-cross spirv-cross
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -flto"
DUCKSTATION_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -flto"
DUCKSTATION_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-lstdc++ -flto"

DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/clang
DUCKSTATION_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/clang++
DUCKSTATION_CONF_OPTS += -DCMAKE_PREFIX_PATH=$(STAGING_DIR)/stenzek-shaderc
DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread

ifeq ($(BR2_PACKAGE_BATOCERA_QT6),y)
    DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=ON -DBUILD_MINI_FRONTEND=OFF
    DUCKSTATION_DEPENDENCIES += qt6base qt6tools qt6svg
    ifeq ($(BR2_PACKAGE_WAYLAND),y)
        DUCKSTATION_DEPENDENCIES += qt6wayland
    endif
else
    DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=OFF -DBUILD_MINI_FRONTEND=ON
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
    DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=ON
else
    DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
    DUCKSTATION_CONF_OPTS += -DENABLE_X11=ON
else
    DUCKSTATION_CONF_OPTS += -DENABLE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
    DUCKSTATION_DEPENDENCIES += glslang
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
else
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DUCKSTATION_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/duckstation
	cp -R $(@D)/buildroot-build/bin $(TARGET_DIR)/usr/bin/duckstation
	rm -r $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSans*.ttf
	ln -sf /usr/share/fonts/truetype/noto/NotoSansJP-VF.ttf $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSansJP-VariableFont_wght.ttf
	ln -sf /usr/share/fonts/truetype/noto/NotoSansKR-VF.ttf $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSansKR-VariableFont_wght.ttf
	ln -sf /usr/share/fonts/truetype/noto/NotoSansSC-VF.ttf $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSansSC-VariableFont_wght.ttf
endef

define DUCKSTATION_VERSION_DETAILS
	echo '#pragma once' > $(@D)/src/scmversion/tag.h
	echo '#define SCM_RELEASE_TAG "latest"' >> $(@D)/src/scmversion/tag.h
	echo '#define SCM_RELEASE_TAGS {"latest", "preview"}' >> $(@D)/src/scmversion/tag.h
endef

DUCKSTATION_PRE_CONFIGURE_HOOKS = DUCKSTATION_VERSION_DETAILS
$(eval $(cmake-package))
