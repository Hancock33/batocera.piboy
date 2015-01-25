################################################################################
#
# benejson
#
################################################################################

BENEJSON_VERSION = 0.9.7
BENEJSON_SITE = $(call github,codehero,benejson,$(BENEJSON_VERSION))
BENEJSON_LICENSE = MIT
BENEJSON_LICENSE_FILES = LICENSE
BENEJSON_INSTALL_STAGING = YES

BENEJSON_DEPENDENCIES = host-scons

define BENEJSON_BUILD_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
		$(SCONS))
endef

ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
define BENEJSON_INSTALL_STATIC_LIB
	$(INSTALL) -D -m 0644 $(@D)/lib/libbenejson.a \
		$(1)/usr/lib/libbenejson.a
endef
endif # Static enabled

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
define BENEJSON_INSTALL_SHARED_LIB
	$(INSTALL) -D -m 0644 $(@D)/lib/libbenejson.so \
		$(1)/usr/lib/libbenejson.so
endef
endif # Shared enabled

define BENEJSON_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/include/benejson/benejson.h \
		$(STAGING_DIR)/usr/include/benejson/benejson.h; \
	$(INSTALL) -D -m 0644 $(@D)/include/benejson/pull.hh \
		$(STAGING_DIR)/usr/include/benejson/pull.hh
	$(call BENEJSON_INSTALL_STATIC_LIB,$(STAGING_DIR))
	$(call BENEJSON_INSTALL_SHARED_LIB,$(STAGING_DIR))
endef

define BENEJSON_INSTALL_TARGET_CMDS
	$(call BENEJSON_INSTALL_SHARED_LIB,$(TARGET_DIR))
endef

$(eval $(generic-package))
