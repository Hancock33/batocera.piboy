################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Jul 26, 2023
SPIRV_TOOLS_VERSION = b5f600c08cc9d900c7450ecba3689ef45fa20d6d
SPIRV_TOOLS_SITE = https://github.com/KhronosGroup/SPIRV-Tools.git
SPIRV_TOOLS_SITE_METHOD = git
SPIRV_TOOLS_GIT_SUBMODULES = YES

SPIRV_TOOLS_DEPENDENCIES = spirv-headers host-ninja
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja
SPIRV_TOOLS_CONF_OPTS += -DSPIRV-Headers_SOURCE_DIR="$(BUILD_DIR)/spirv-headers-$(SPIRV_HEADERS_VERSION)" 
SPIRV_TOOLS_CONF_OPTS += -DSPIRV_SKIP_TESTS=ON

define SPIRV_TOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(SPIRV_TOOLS_BUILDDIR)
endef

define SPIRV_TOOLS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(SPIRV_TOOLS_BUILDDIR)
endef

define SPIRV_TOOLS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(SPIRV_TOOLS_BUILDDIR)
endef

$(eval $(cmake-package))
