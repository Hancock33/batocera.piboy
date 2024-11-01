################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on Nov 01, 2024
RYUJINX_VERSION = 1.2.67
RYUJINX_SITE = https://github.com/GreemDev/Ryujinx.git
RYUJINX_SITE_METHOD=git
RYUJINX_GIT_SUBMODULES=YES
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = sdl2 openal hicolor-icon-theme adwaita-icon-theme librsvg
RYUJINX_DOTNET_VERSION = 9.0.100-rc.2.24474.11

ifeq ($(BR2_x86_64),y)
    RYUJINX_DOTNET_FILE = dotnet-sdk-$(RYUJINX_DOTNET_VERSION)-linux-x64.tar.gz
    RYUJINX_EXTRA_DOWNLOADS = https://download.visualstudio.microsoft.com/download/pr/202e929a-e985-4eab-a78a-d7159fc204e4/0c85219d441cd3bbffd4fb65b7e36fe5/$(RYUJINX_DOTNET_FILE)
else
    RYUJINX_DOTNET_FILE = dotnet-sdk-$(RYUJINX_DOTNET_VERSION)-linux-arm64.tar.gz
    RYUJINX_EXTRA_DOWNLOADS = https://download.visualstudio.microsoft.com/download/pr/817f5589-0347-4254-b19a-67c30d9ce4f8/3dfe6b98927c4003fc004a1a32132a76/$(RYUJINX_DOTNET_FILE)
endif

define RYUJINX_BUILD_CMDS
	rm -rf $(HOME)/.local/share/NuGet
	rm -rf $(HOME)/.nuget/packages
	rm -rf /tmp/NuGetScratch*
	$(SED) "s|1.0.0-dirty|$(RYUJINX_VERSION)|g" $(@D)/src/*/*.csproj

	cd $(@D) && PATH=$(HOST_DIR)/dotnet:$(PATH) DOTNET_CLI_TELEMETRY_OPTOUT=1 && dotnet clean && \
	dotnet nuget locals all -c && \
	dotnet publish -c Release -r linux-x64 --nologo --self-contained true -p:DebugType=none -p:ExtraDefineConstants=DISABLE_UPDATER -o ./publish src/Ryujinx
endef

define RYUJINX_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/ryujinx
	mkdir -p $(TARGET_DIR)/usr/bin/ryujinx
	cp -avr $(@D)/publish/* $(TARGET_DIR)/usr/bin/ryujinx
	cp -avr $(@D)/publish/mime/Ryujinx.xml $(TARGET_DIR)/usr/share/mime
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/ryujinx/switch.ryujinx.keys $(TARGET_DIR)/usr/share/evmapy
endef

define RYUJINX_DOTNET_INSTALL
	rm -rf $(HOST_DIR)/dotnet
	mkdir $(HOST_DIR)/dotnet
	tar -xf $(RYUJINX_DL_DIR)/$(RYUJINX_DOTNET_FILE) -C $(HOST_DIR)/dotnet
endef

RYUJINX_POST_EXTRACT_HOOKS += RYUJINX_DOTNET_INSTALL

$(eval $(generic-package))
