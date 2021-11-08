################################################################################
#
# gl4es
#
################################################################################
# Version.: Commits on Nov 08, 2021
GL4ES_VERSION = 4f2151a104ac45bf5417a0063e96148204f8256c
GL4ES_SITE = $(call github,ptitSeb,gl4es,$(GL4ES_VERSION))
GL4ES_LICENSE = MIT License

GL4ES_CONF_OPTS += -DNOX11=1 -DODROID=1 -DGBM=ON -DCMAKE_BUILD_TYPE=Release

define GL4ES_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(TARGET_DIR)/usr/lib/libGL.so
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(TARGET_DIR)/usr/lib/libGL.so.1
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libGL.so
    mkdir -p $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/GL
    cp -pva $(@D)/include/GL/*.h $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include/GL
    cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/gpu/gl4es/gl4es/gl.pc $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig
endef

$(eval $(cmake-package))
