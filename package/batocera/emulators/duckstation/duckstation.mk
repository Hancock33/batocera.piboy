################################################################################
#
# duckstation
#
################################################################################

DUCKSTATION_VERSION = v0.1-7294
DUCKSTATION_SITE = https://github.com/duckstation/old-releases.git
DUCKSTATION_SITE_METHOD=git
DUCKSTATION_GIT_SUBMODULES=YES
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_DEPENDENCIES += fmt boost ffmpeg libcurl ecm stenzek-shaderc
DUCKSTATION_DEPENDENCIES += qt6base qt6tools qt6svg libbacktrace cpuinfo
DUCKSTATION_DEPENDENCIES += spirv-cross libsoundtouch webp host-clang

# Use clang for performance
DUCKSTATION_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/clang
DUCKSTATION_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/clang++
DUCKSTATION_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="-no-pie -lm -lstdc++"

DUCKSTATION_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=ON
DUCKSTATION_CONF_OPTS += -DSHADERC_INCLUDE_DIR=$(STAGING_DIR)/stenzek-shaderc/include
DUCKSTATION_CONF_OPTS += -DSHADERC_LIBRARY=$(STAGING_DIR)/stenzek-shaderc/lib/libshaderc_shared.so

ifeq ($(BR2_PACKAGE_BATOCERA_WAYLAND),y)
    DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=ON
    DUCKSTATION_DEPENDENCIES += qt6wayland
else
    DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
    DUCKSTATION_CONF_OPTS += -DENABLE_X11=ON
else
    DUCKSTATION_CONF_OPTS += -DENABLE_X11=OFF
endif

# currently duckstation build fails if you set vulkan off when headers & loader are present
ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
    DUCKSTATION_DEPENDENCIES += vulkan-headers vulkan-loader
else
    DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

define DUCKSTATION_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/bin
    mkdir -p $(TARGET_DIR)/usr/lib
    mkdir -p $(TARGET_DIR)/usr/share/duckstation

    $(INSTALL) -D $(@D)/buildroot-build/bin/duckstation* \
        $(TARGET_DIR)/usr/bin/
    cp -R $(@D)/buildroot-build/bin/resources \
        $(TARGET_DIR)/usr/share/duckstation/
    rm -f $(TARGET_DIR)/usr/share/duckstation/resources/gamecontrollerdb.txt
endef

define DUCKSTATION_TRANSLATIONS
    mkdir -p $(TARGET_DIR)/usr/share/duckstation
    cp -R $(@D)/buildroot-build/bin/translations \
        $(TARGET_DIR)/usr/share/duckstation/
endef

define DUCKSTATION_TRANSLATIONS_DIR
    mkdir -p $(@D)/buildroot-build/bin/resources
endef

DUCKSTATION_POST_INSTALL_TARGET_HOOKS += DUCKSTATION_TRANSLATIONS
DUCKSTATION_POST_CONFIGURE_HOOKS = DUCKSTATION_TRANSLATIONS_DIR

$(eval $(cmake-package))
