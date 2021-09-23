################################################################################
#
# gl4es
#
################################################################################
# Version.: Commits on Sep 11, 2021
GL4ES_VERSION = dab338dc5d16807a071454e6116faf09c37f8a31
GL4ES_SITE = $(call github,ptitSeb,gl4es,$(GL4ES_VERSION))
GL4ES_LICENSE = MIT License

GL4ES_CONF_OPTS += -DODROID=1
GL4ES_CONF_OPTS += -DNOX11=ON
GL4ES_CONF_OPTS += -DGBM=ON
GL4ES_CONF_OPTS += -DCMAKE_BUILD_TYPE=RELEASE

define GL4ES_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(TARGET_DIR)/usr/lib/libGL.so
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(TARGET_DIR)/usr/lib/libGL.so.1
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libGL.so
    mkdir -p $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/GL
    cp -pva $(@D)/include/GL/gl.h $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/GL/gl.h
    cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/gpu/gl4es/gl4es/gl.pc $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig
endef

$(eval $(cmake-package))
