#############################################################
#
# ruby
#
#############################################################
RUBY_VERSION:=1.9.1-p129
RUBY_SOURCE:=ruby-$(RUBY_VERSION).tar.gz
RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.9
RUBY_DIR:=$(BUILD_DIR)/ruby-$(RUBY_VERSION)
RUBY_CAT:=$(ZCAT)
RUBY_BINARY:=ruby
RUBY_TARGET_BINARY:=usr/bin/ruby

$(DL_DIR)/$(RUBY_SOURCE):
	 $(call DOWNLOAD,$(RUBY_SITE),$(RUBY_SOURCE))

ruby-source: $(DL_DIR)/$(RUBY_SOURCE)

$(RUBY_DIR)/.unpacked: $(DL_DIR)/$(RUBY_SOURCE)
	$(RUBY_CAT) $(DL_DIR)/$(RUBY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(RUBY_DIR) package/ruby/ ruby-\*.patch
	(cd $(RUBY_DIR); autoreconf)
	touch $(RUBY_DIR)/.unpacked

$(RUBY_DIR)/.configured: $(RUBY_DIR)/.unpacked
	(cd $(RUBY_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libdir=/lib \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--mandir=/usr/man \
		--infodir=/usr/info \
		--disable-install-doc \
		$(DISABLE_IPV6) \
		$(DISABLE_NLS) \
		$(DISABLE_LARGEFILE) \
	)
	touch $(RUBY_DIR)/.configured

$(RUBY_DIR)/$(RUBY_BINARY): $(RUBY_DIR)/.configured
	$(MAKE) -C $(RUBY_DIR)

$(TARGET_DIR)/$(RUBY_TARGET_BINARY): $(RUBY_DIR)/$(RUBY_BINARY)
	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(RUBY_DIR) install
	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc

ruby: $(TARGET_DIR)/$(RUBY_TARGET_BINARY)

ruby-clean:
	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(RUBY_DIR) uninstall
	-$(MAKE) -C $(RUBY_DIR) clean

ruby-dirclean:
	rm -rf $(RUBY_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_RUBY),y)
TARGETS+=ruby
endif
