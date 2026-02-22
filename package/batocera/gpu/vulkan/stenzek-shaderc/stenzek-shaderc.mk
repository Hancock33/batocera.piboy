################################################################################
#
# stenzek-shaderc
#
################################################################################
# Version: Commits on Feb 22, 2026
STENZEK_SHADERC_VERSION = d72697bfc353b547efc58421ad54ac0345441bf4
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
	mkdir -p $(TARGET_DIR)/usr/lib
	$(INSTALL) -D $(@D)/buildroot-build/libshaderc/libshaderc_ds.* $(TARGET_DIR)/usr/lib
endef

$(eval $(cmake-package))
