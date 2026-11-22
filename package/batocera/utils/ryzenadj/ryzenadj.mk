################################################################################
#
# ryzenadj
#
################################################################################
# Version: Commits on May 13, 2026
RYZENADJ_VERSION = v0.19.0
RYZENADJ_SITE = $(call github,FlyGoat,RyzenAdj,$(RYZENADJ_VERSION))
RYZENADJ_LICENSE = GPL-2.0
RYZENADJ_LICENSE_FILES = LICENSE
RYZENADJ_DEPENDENCIES = pciutils libpciaccess

RYZENADJ_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
RYZENADJ_CONF_OPTS += -DARCHITECTURE_x86_64=ON

define RYZENADJ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/ryzenadj $(TARGET_DIR)/usr/bin/ryzenadj
	$(INSTALL) -D -m 0755 $(@D)/libryzenadj.so $(TARGET_DIR)/usr/lib/libryzenadj.so
endef

$(eval $(cmake-package))
