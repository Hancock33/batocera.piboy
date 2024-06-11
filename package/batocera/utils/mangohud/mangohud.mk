################################################################################
#
# mangohud
#
################################################################################
# Version: Commits on May 28, 2022
MANGOHUD_VERSION = a8a0a245e69fbbca5263d2436fd1c04289375498
MANGOHUD_SITE =  $(call github,flightlessmango,MangoHud,$(MANGOHUD_VERSION))

MANGOHUD_DEPENDENCIES = host-python-mako host-glslang

ifeq ($(BR2_PACKAGE_LIBDRM),y)
	MANGOHUD_DEPENDENCIES += libdrm
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
	MANGOHUD_DEPENDENCIES += xserver_xorg-server
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS),y)
	MANGOHUD_DEPENDENCIES += vulkan-headers
endif

MANGOHUD_CONF_OPTS = -Dwith_xnvctrl=disabled
ifeq ($(BR2_PACKAGE_VULKAN_HEADERS),y)
	MANGOHUD_CONF_OPTS += -Duse_vulkan=true -Duse_system_vulkan=disabled
else
	MANGOHUD_CONF_OPTS += -Duse_vulkan=false -Duse_system_vulkan=disabled
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
	MANGOHUD_CONF_OPTS += -Dwith_x11=enabled
else
	MANGOHUD_CONF_OPTS += -Dwith_x11=disabled
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
	MANGOHUD_CONF_OPTS += -Dwith_wayland=enabled
else
	MANGOHUD_CONF_OPTS += -Dwith_wayland=disabled
endif

# this is a not nice workaround
# i don't know why meson uses bad ssl certificates and doesn't manage to download them
define MANGOHUD_DWD_DEPENDENCIES
	mkdir -p  $(MANGOHUD_DL_DIR)/sumodules
	curl -L https://github.com/ocornut/imgui/archive/v1.81.tar.gz					-o $(MANGOHUD_DL_DIR)/sumodules/imgui-1.81.tar.gz
	curl -L https://wrapdb.mesonbuild.com/v2/imgui_1.81-1/get_patch					-o $(MANGOHUD_DL_DIR)/sumodules/imgui-1.81-1-wrap.zip
	curl -L https://github.com/gabime/spdlog/archive/v1.8.5.tar.gz					-o $(MANGOHUD_DL_DIR)/sumodules/v1.8.5.tar.gz
	curl -L https://wrapdb.mesonbuild.com/v2/spdlog_1.8.5-1/get_patch				-o $(MANGOHUD_DL_DIR)/sumodules/spdlog-1.8.5-1-wrap.zip
	curl -L https://github.com/KhronosGroup/Vulkan-Headers/archive/v1.2.158.tar.gz	-o $(MANGOHUD_DL_DIR)/sumodules/vulkan-headers-1.2.158.tar.gz
	curl -L https://wrapdb.mesonbuild.com/v2/vulkan-headers_1.2.158-2/get_patch		-o $(MANGOHUD_DL_DIR)/sumodules/vulkan-headers-1.2.158-2-wrap.zip
	mkdir -p $(@D)/subprojects/packagecache
	cp  $(MANGOHUD_DL_DIR)/sumodules/* $(@D)/subprojects/packagecache
endef
MANGOHUD_PRE_CONFIGURE_HOOKS += MANGOHUD_DWD_DEPENDENCIES

$(eval $(meson-package))
