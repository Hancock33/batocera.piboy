################################################################################
#
# ossp
#
################################################################################
# Version: Commits on Aug 31, 2024
OSSP_VERSION = v1.3.3
OSSP_SITE = $(call github,OpenMandrivaSoftware,ossp,$(OSSP_VERSION))
OSSP_LICENSE = GPL-2.0
OSSP_DEPENDENCIES = libfuse3

OSSP_CONF_OPTS += -Ddaemon=ON
OSSP_CONF_OPTS += -Dtest=OFF

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
OSSP_CONF_OPTS += -Dalsa=ON
OSSP_DEPENDENCIES += alsa-lib
else
OSSP_CONF_OPTS += -Dalsa=OFF
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
OSSP_CONF_OPTS += -Dpulseaudio=ON
OSSP_DEPENDENCIES += pulseaudio
else
OSSP_CONF_OPTS += -Dpulseaudio=OFF
endif

define OSSP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/sbin $(@D)/osspd $(@D)/ossp-alsap $(@D)/ossp-padsp
endef

define OSSP_INITD
	$(INSTALL) -D -m 0755 $(OSSP_PKGDIR)/osspd $(TARGET_DIR)/etc/init.d/S34osspd
endef

OSSP_POST_INSTALL_TARGET_HOOKS += OSSP_INITD

$(eval $(cmake-package))
