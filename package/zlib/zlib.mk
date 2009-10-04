#############################################################
#
# zlib
#
#############################################################
ZLIB_VERSION:=1.2.3
ZLIB_SOURCE:=zlib-$(ZLIB_VERSION).tar.bz2
ZLIB_CAT:=$(BZCAT)
ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
ZLIB_DIR:=$(BUILD_DIR)/zlib-$(ZLIB_VERSION)

$(DL_DIR)/$(ZLIB_SOURCE):
	$(call DOWNLOAD,$(ZLIB_SITE),$(ZLIB_SOURCE))

$(ZLIB_DIR)/.patched: $(DL_DIR)/$(ZLIB_SOURCE)
	$(ZLIB_CAT) $(DL_DIR)/$(ZLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(ZLIB_DIR) package/zlib/ zlib\*.patch
	$(CONFIG_UPDATE) $(@D)
	touch $@

ifeq ($(BR2_PREFER_STATIC_LIB),y)
ZLIB_PIC :=
ZLIB_SHARED :=
ZLIB_TARGET := $(STAGING_DIR)/usr/lib/libz.a
else
ZLIB_PIC := -fPIC
ZLIB_SHARED := --shared
ZLIB_TARGET := $(TARGET_DIR)/usr/lib/libz.so
endif

$(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
	(cd $(ZLIB_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_ARGS) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_PIC)" \
		./configure \
		$(ZLIB_SHARED) \
		--prefix=/usr \
		--exec-prefix=$(STAGING_DIR)/usr/bin \
		--libdir=$(STAGING_DIR)/usr/lib \
		--includedir=$(STAGING_DIR)/usr/include \
	)
	touch $@

$(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
	$(MAKE) -C $(ZLIB_DIR) all libz.a
	touch -c $@

$(STAGING_DIR)/usr/lib/libz.a: $(ZLIB_DIR)/libz.a
	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/libz.a
	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
	$(INSTALL) $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
	touch -c $@

$(STAGING_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.a
	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
	touch -c $@

$(TARGET_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.so
	mkdir -p $(TARGET_DIR)/usr/lib
	cp -dpf $(STAGING_DIR)/usr/lib/libz.so* $(TARGET_DIR)/usr/lib
	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
	touch -c $@

$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.a
	$(INSTALL) -D $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/zlib.h
	$(INSTALL) $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/libz.a
	touch -c $@

zlib: $(ZLIB_TARGET) $(if $(BR2_HAVE_DEVFILES),$(TARGET_DIR)/usr/lib/libz.a)

zlib-source: $(DL_DIR)/$(ZLIB_SOURCE)

zlib-clean:
	rm -f $(TARGET_DIR)/usr/lib/libz.* \
	      $(TARGET_DIR)/usr/include/zlib.h \
	      $(TARGET_DIR)/usr/include/zconf.h \
	      $(STAGING_DIR)/usr/include/zlib.h \
	      $(STAGING_DIR)/usr/include/zconf.h \
	      $(STAGING_DIR)/usr/lib/libz.*
	-$(MAKE) -C $(ZLIB_DIR) clean

zlib-dirclean:
	rm -rf $(ZLIB_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_ZLIB),y)
TARGETS+=zlib
endif
