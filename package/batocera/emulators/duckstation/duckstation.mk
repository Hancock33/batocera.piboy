################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Nov 20, 2026
DUCKSTATION_VERSION = e39940aca71ca7cfeb906cd38726e336b53d01c4
DUCKSTATION_SITE = $(call github,stenzek,duckstation,$(DUCKSTATION_VERSION))
DUCKSTATION_LICENSE = GPL-2.0
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO
DUCKSTATION_DEPENDENCIES += boost cpuinfo ecm ffmpeg fmt freetype harfbuzz host-clang host-spirv-cross
DUCKSTATION_DEPENDENCIES += jpeg libbacktrace libcurl libdrm libevdev libpng libsoundtouch libxkbcommon
DUCKSTATION_DEPENDENCIES += libzip noto-cjk-fonts plutosvg plutovg qt6base qt6svg qt6tools sdl3
DUCKSTATION_DEPENDENCIES += spirv-cross sqlite stenzek-shaderc webp zlib zstd
DUCKSTATION_DEPENDENCIES += duckstation-common
DUCKSTATION_EMULATOR_INFO = duckstation.duckstation.core.yml

DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
DUCKSTATION_CONF_OPTS += -DCMAKE_PREFIX_PATH=$(STAGING_DIR)/stenzek-shaderc
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    DUCKSTATION_DEPENDENCIES += qt6wayland
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
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
else
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DUCKSTATION_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/duckstation
	cp -R $(@D)/buildroot-build/bin $(TARGET_DIR)/usr/bin/duckstation
	rm -f $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSans*.ttf
	ln -sf /usr/share/fonts/truetype/noto/NotoSansJP-VF.ttf $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSansJP-VariableFont_wght.ttf
	ln -sf /usr/share/fonts/truetype/noto/NotoSansKR-VF.ttf $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSansKR-VariableFont_wght.ttf
	ln -sf /usr/share/fonts/truetype/noto/NotoSansSC-VF.ttf $(TARGET_DIR)/usr/bin/duckstation/resources/fonts/NotoSansSC-VariableFont_wght.ttf
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/bin/duckstation/resources/fonts $(DUCKSTATION_PKGDIR)/fa-solid-900.ttf
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
