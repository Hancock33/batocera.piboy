################################################################################
#
# stenzek-shaderc
#
################################################################################
# Version: Commits on Aug 04, 2026
STENZEK_SHADERC_VERSION = da25addad407d2ec377ab3c113d202f10adcf062
STENZEK_SHADERC_SITE =  $(call github,stenzek,shaderc,$(STENZEK_SHADERC_VERSION))
STENZEK_SHADERC_DEPENDENCIES = vulkan-headers vulkan-loader glslang spirv-tools
STENZEK_SHADERC_INSTALL_STAGING = YES
STENZEK_SHADERC_SUPPORTS_IN_SOURCE_BUILD = NO

STENZEK_SHADERC_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
STENZEK_SHADERC_CONF_OPTS += -DSHADERC_SKIP_TESTS=ON
STENZEK_SHADERC_CONF_OPTS += -DSHADERC_SKIP_EXAMPLES=ON
STENZEK_SHADERC_CONF_OPTS += -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
STENZEK_SHADERC_CONF_OPTS += -Dglslang_SOURCE_DIR=$(STAGING_DIR)/usr/include/glslang
STENZEK_SHADERC_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR=$(STAGING_DIR)/usr/include/spirv
STENZEK_SHADERC_INSTALL_STAGING_OPTS = --prefix /stenzek-shaderc

define STENZEK_SHADERC_THIRDPARTY
	$(SED) '/third_party/d' -i $(@D)/CMakeLists.txt
endef

STENZEK_SHADERC_PRE_CONFIGURE_HOOKS += STENZEK_SHADERC_THIRDPARTY

define STENZEK_SHADERC_INSTALL_TARGET_CMDS
	rm -rf   $(TARGET_DIR)/usr/lib/stenzek-shaderc
	mkdir -p $(TARGET_DIR)/usr/lib/stenzek-shaderc
	$(INSTALL) -D $(@D)/buildroot-build/libshaderc/libshaderc_ds.* $(TARGET_DIR)/usr/lib/stenzek-shaderc/libshaderc_shared.so
	ln -sf /usr/lib/libsqlite3.so $(TARGET_DIR)/usr/lib/stenzek-shaderc/libsqlite3.so.3
endef

$(eval $(cmake-package))
