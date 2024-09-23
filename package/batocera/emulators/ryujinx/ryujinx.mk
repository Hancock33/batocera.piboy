################################################################################
#
# ryujinx
#
################################################################################
# Version: Commits on Sept 22, 2024
RYUJINX_VERSION = 1.1.1398
RYUJINX_SITE = https://github.com/Ryujinx/Ryujinx.git
RYUJINX_SITE_METHOD=git
RYUJINX_GIT_SUBMODULES=YES
RYUJINX_LICENSE = MIT
RYUJINX_DEPENDENCIES = sdl2 openal hicolor-icon-theme adwaita-icon-theme librsvg

define RYUJINX_BUILD_CMDS
	echo $(HOME)
	rm -rf $(HOME)/.local/share/NuGet
	rm -rf $(HOME)/.nuget/packages
	rm -rf /tmp/NuGetScratch*
	$(SED) "s|1.0.0-dirty|$(RYUJINX_VERSION)|g" $(@D)/src/*/*.csproj
	
	cd $(@D) && PATH=/home/lee/ryu/dotnet:$(PATH) DOTNET_CLI_TELEMETRY_OPTOUT=1 && dotnet clean && \
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

$(eval $(generic-package))
