################################################################################
#
# gl4es
#
################################################################################
# Version.: Commits on Aug 04, 2021
GL4ES_VERSION = 2d3dc681ed3f54c76f626d9b674f836eef90f982
GL4ES_SITE = $(call github,ptitSeb,gl4es,$(GL4ES_VERSION))
GL4ES_LICENSE = MIT License

GL4ES_CONF_OPTS += -DODROID=1
GL4ES_CONF_OPTS += -DNOX11=ON
GL4ES_CONF_OPTS += -DDEFAULT_ES=2
GL4ES_CONF_OPTS += -DCMAKE_BUILD_TYPE=RELEASE

define GL4ES_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(TARGET_DIR)/usr/lib/libGL.so
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(TARGET_DIR)/usr/lib/libGL.so.1
    $(INSTALL) -D $(@D)/lib/libGL.so.1 $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libGL.so
    cp -pvr $(@D)/include/gl4es*.h $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include
    cp -pva $(@D)/include/GL $(HOST_DIR)/aarch64-buildroot-linux-gnu/sysroot/usr/include
endef

$(eval $(cmake-package))
