LIBCAP_VERSION=2.19
LIBCAP_SOURCE=libcap-$(LIBCAP_VERSION).tar.bz2
LIBCAP_SITE=http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
LIBCAP_INSTALL_STAGING=YES

define LIBCAP_BUILD_CMDS
 $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
endef

define LIBCAP_INSTALL_STAGING_CMDS
 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) install
endef

define LIBCAP_INSTALL_TARGET_CMDS
 install -D $(STAGING_DIR)/usr/lib/libcap.so.* $(TARGET_DIR)/usr/lib
endef

define HOST_LIBCAP_BUILD_CMDS
 $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
endef

define HOST_LIBCAP_INSTALL_CMDS
 $(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) install
endef

$(eval $(call GENTARGETS,package,libcap))
$(eval $(call GENTARGETS,package,libcap,host))
