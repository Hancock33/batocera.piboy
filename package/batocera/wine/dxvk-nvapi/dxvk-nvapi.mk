################################################################################
#
# dxvk-nvapi
#
################################################################################
# Version: Commits on Oct 30, 2026
DXVK_NVAPI_VERSION = v0.9.3
DXVK_NVAPI_SITE = https://github.com/jp7677/dxvk-nvapi/releases/download/$(DXVK_NVAPI_VERSION)
DXVK_NVAPI_LICENSE = Zlib
DXVK_NVAPI_LICENSE_FILES = target/LICENSE

define DXVK_NVAPI_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && \
	    tar xf $(DL_DIR)/$(DXVK_NVAPI_DL_SUBDIR)/$(DXVK_NVAPI_SOURCE)
endef

define DXVK_NVAPI_INSTALL_TARGET_CMDS
	# Install 32-bit and 64-bit DLLs
	$(INSTALL) -D -m 0644 $(@D)/target/x32/nvapi.dll $(TARGET_DIR)/usr/wine/dxvk/x32/nvapi.dll
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/wine/dxvk/x64 $(@D)/target/x64/nvapi64.dll $(@D)/target/x64/nvofapi64.dll

	# Install Vulkan Reflex layer library
	$(INSTALL) -D -m 0755 $(@D)/target/layer/libdxvk_nvapi_vkreflex_layer.so $(TARGET_DIR)/usr/lib/libdxvk_nvapi_vkreflex_layer.so

	# Install Vulkan Reflex layer manifest
	$(INSTALL) -D -m 0644 $(@D)/target/layer/VkLayer_DXVK_NVAPI_reflex.json $(TARGET_DIR)/usr/share/vulkan/implicit_layer.d/VkLayer_DXVK_NVAPI_reflex.json

	# Correct the library path inside the Vulkan layer manifest
	$(SED) 's|"\./libdxvk_nvapi_vkreflex_layer\.so"|"/usr/lib/libdxvk_nvapi_vkreflex_layer.so"|g' \
		$(TARGET_DIR)/usr/share/vulkan/implicit_layer.d/VkLayer_DXVK_NVAPI_reflex.json
endef

$(eval $(generic-package))
