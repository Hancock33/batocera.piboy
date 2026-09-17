################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on Sept 14, 2026
RYUJINX_VERSION = e7cb0632c50063444013dcae4fb3b16e33cfd3e8
RYUJINX_SITE = https://git.ryujinx.app/projects/Kenji-NX.git
RYUJINX_BRANCH = libryujinx_bionic
RYUJINX_SITE_METHOD=git
RYUJINX_GIT_SUBMODULES=YES
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = adwaita-icon-theme hicolor-icon-theme librsvg openal sdl3
RYUJINX_EMULATOR_INFO = ryujinx.emulator.yml
RYUJINX_DOTNET_VERSION = 9.0.318

ifeq ($(BR2_x86_64),y)
    RYUJINX_DOTNET_FILE = dotnet-sdk-$(RYUJINX_DOTNET_VERSION)-linux-x64.tar.gz
    RYUJINX_EXTRA_DOWNLOADS = https://builds.dotnet.microsoft.com/dotnet/Sdk/$(RYUJINX_DOTNET_VERSION)/$(RYUJINX_DOTNET_FILE)
else
    RYUJINX_DOTNET_FILE = dotnet-sdk-$(RYUJINX_DOTNET_VERSION)-linux-arm64.tar.gz
    RYUJINX_EXTRA_DOWNLOADS =  https://builds.dotnet.microsoft.com/dotnet/Sdk/$(RYUJINX_DOTNET_VERSION)/$(RYUJINX_DOTNET_FILE)
endif

define RYUJINX_BUILD_CMDS

	#$(SED) "s|1.0.0-dirty|$(RYUJINX_VERSION)|g" $(@D)/src/*/*.csproj


	cd $(@D) && PATH=$(HOST_DIR)/dotnet:$(PATH) DOTNET_CLI_TELEMETRY_OPTOUT=1 && \
	dotnet nuget locals all -c && \
	dotnet publish -c Release -r linux-x64 --nologo --self-contained true -p:DebugType=none -p:ExtraDefineConstants=DISABLE_UPDATER -o ./publish src/Ryujinx
endef

define RYUJINX_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/bin/ryujinx
	mkdir -p $(TARGET_DIR)/usr/bin/ryujinx
	cp -avr $(@D)/publish/* $(TARGET_DIR)/usr/bin/ryujinx
	rm -rf   $(TARGET_DIR)/usr/bin/ryujinx/{libSDL3.so,libav*,libglfw*}
	cp -avr $(@D)/publish/mime/Ryujinx.xml $(TARGET_DIR)/usr/share/mime
endef

define RYUJINX_DOTNET_INSTALL
	rm -rf $(HOST_DIR)/dotnet
	mkdir $(HOST_DIR)/dotnet
	tar -xf $(RYUJINX_DL_DIR)/$(RYUJINX_DOTNET_FILE) -C $(HOST_DIR)/dotnet
	rm -rf $(HOME)/.local/share/NuGet
	rm -rf $(HOME)/.nuget/packages
	rm -rf /tmp/NuGetScratch*
endef

RYUJINX_POST_EXTRACT_HOOKS += RYUJINX_DOTNET_INSTALL

$(eval $(generic-package))
$(eval $(emulator-info-package))
