################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on Oct 06, 2024
RYUJINX_VERSION = r.dc545c3
RYUJINX_SITE = https://github.com/ryujinx-mirror/ryujinx.git
RYUJINX_SITE_METHOD=git
RYUJINX_GIT_SUBMODULES=YES
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = sdl2 openal hicolor-icon-theme adwaita-icon-theme librsvg
RYUJINX_DOTNET_VERSION = 9.0.100-rc.1.24452.12

ifeq ($(BR2_x86_64),y)
    RYUJINX_DOTNET_FILE = dotnet-sdk-$(RYUJINX_DOTNET_VERSION)-linux-x64.tar.gz
    RYUJINX_EXTRA_DOWNLOADS = https://download.visualstudio.microsoft.com/download/pr/3b2b3c23-574b-45d7-b2b0-c67f0e935308/23ed647eb71a8f07414124422c15927d/$(RYUJINX_DOTNET_FILE)
else
    RYUJINX_DOTNET_FILE = dotnet-sdk-$(RYUJINX_DOTNET_VERSION)-linux-arm64.tar.gz
    RYUJINX_EXTRA_DOWNLOADS = https://download.visualstudio.microsoft.com/download/pr/f7739964-9e84-4bb7-9435-509458a15f9c/a95ad7f9deb8ce2fd30173dfe86f55ba/$(RYUJINX_DOTNET_FILE)
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
	cp -avr $(@D)/publish/{libHarfBuzzSharp.so,libSkiaSharp.so,libsoundio.so,LICENSE.txt,Ryujinx,THIRDPARTY.md} $(TARGET_DIR)/usr/bin/ryujinx
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
