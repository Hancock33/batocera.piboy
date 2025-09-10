################################################################################
#
# glsl-shaders
#
################################################################################
# Version: Commits on Sept 09, 2025
GLSL_SHADERS_VERSION = f46cea22ac5030746b27b945aa3e17bd10a2b8bc
GLSL_SHADERS_SITE = $(call github,libretro,glsl-shaders,$(GLSL_SHADERS_VERSION))
GLSL_SHADERS_LICENSE = GPL

define GLSL_SHADERS_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile
endef

define GLSL_SHADERS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders
	$(MAKE) CXX="$(TARGET_CXX)" -C $(@D) INSTALLDIR=$(TARGET_DIR)/usr/share/batocera/shaders install
	sed -e "s:^//#define CURVATURE:#define CURVATURE:" $(TARGET_DIR)/usr/share/batocera/shaders/crt/shaders/crt-pi.glsl > $(TARGET_DIR)/usr/share/batocera/shaders/crt/shaders/crt-pi-curvature.glsl
	sed -e 's:^shader0 = "shaders/crt-pi.glsl":shader0 = "shaders/crt-pi-curvature.glsl":' $(TARGET_DIR)/usr/share/batocera/shaders/crt/crt-pi.glslp > $(TARGET_DIR)/usr/share/batocera/shaders/crt/crt-pi-curvature.glslp
endef

$(eval $(generic-package))
