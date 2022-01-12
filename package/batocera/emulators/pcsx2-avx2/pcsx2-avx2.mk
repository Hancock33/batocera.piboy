################################################################################
#
# pcsx2-avx2
#
################################################################################
#Version: Commits on Jan 11, 2022
#v1.7.2224 = commit 3c92054a6e93495145e0d145a9b4d56261fe7f29
PCSX2_AVX2_VERSION = v1.7.2224
PCSX2_AVX2_SITE = https://github.com/pcsx2/pcsx2.git
PCSX2_AVX2_SITE_METHOD = git
PCSX2_AVX2_GIT_SUBMODULES = YES
PCSX2_AVX2_LICENSE = GPLv3
PCSX2_AVX2_LICENSE_FILE = COPYING.GPLv3
PCSX2_AVX2_DEPENDENCIES = xserver_xorg-server alsa-lib freetype zlib libpng wxwidgets libaio portaudio libsoundtouch sdl2 libpcap yaml-cpp libgtk3 libsamplerate fmt

PCSX2_AVX2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
PCSX2_AVX2_CONF_OPTS += -DXDG_STD=TRUE
PCSX2_AVX2_CONF_OPTS += -DSDL2_API=TRUE
PCSX2_AVX2_CONF_OPTS += -DDISABLE_PCSX2_WRAPPER=1
PCSX2_AVX2_CONF_OPTS += -DPACKAGE_MODE=FALSE
PCSX2_AVX2_CONF_OPTS += -DwxWidgets_CONFIG_EXECUTABLE="$(STAGING_DIR)/usr/bin/wx-config"
PCSX2_AVX2_CONF_OPTS += -DPCSX2_TARGET_ARCHITECTURES=x86_64
PCSX2_AVX2_CONF_OPTS += -DENABLE_TESTS=OFF
PCSX2_AVX2_CONF_OPTS += -DUSE_SYSTEM_YAML=OFF
PCSX2_AVX2_CONF_OPTS += -DEXTRA_PLUGINS=TRUE
PCSX2_AVX2_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
PCSX2_AVX2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=OFF
PCSX2_AVX2_CONF_OPTS += -DUSE_VTUNE=OFF
PCSX2_AVX2_CONF_OPTS += -DUSE_VULKAN=ON

define PCSX2_AVX2_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/pcsx2/pcsx2 $(TARGET_DIR)/usr/pcsx2-avx2/bin/pcsx2
	cp -pr $(@D)/bin/Langs $(TARGET_DIR)/usr/pcsx2-avx2/bin
	cp -pr  $(@D)/bin/resources $(TARGET_DIR)/usr/pcsx2-avx2/bin/
	mkdir -p $(TARGET_DIR)/usr/pcsx2-avx2/lib
	cp -p $(@D)/common/libcommon.so $(TARGET_DIR)/usr/pcsx2-avx2/lib
	cp -p $(@D)/3rdparty/glad/libglad.so $(TARGET_DIR)/usr/pcsx2-avx2/lib
	cp -p $(@D)/3rdparty/imgui/libimgui.so $(TARGET_DIR)/usr/pcsx2-avx2/lib
	cp -p $(@D)/3rdparty/rapidyaml/rapidyaml/libryml.so.0.2.3 $(TARGET_DIR)/usr/pcsx2-avx2/lib
	cp -p $(@D)/3rdparty/glslang/libglslang.so $(TARGET_DIR)/usr/pcsx2-avx2/lib
endef

$(eval $(cmake-package))
