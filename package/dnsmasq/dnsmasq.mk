#############################################################
#
# dnsmasq
#
#############################################################

DNSMASQ_SITE=http://thekelleys.org.uk/dnsmasq
ifeq ($(filter $(TARGETS),dnsmasq1),)
DNSMASQ_UPVER=2.22
DNSMASQ_VER=dnsmasq2
else
DNSMASQ_UPVER=1.18
DNSMASQ_VER=dnsmasq1
endif
DNSMASQ_SOURCE=dnsmasq-$(DNSMASQ_UPVER).tar.gz
DNSMASQ_DIR=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
DNSMASQ_BINARY=dnsmasq
DNSMASQ_TARGET_BINARY=usr/sbin/dnsmasq

$(DL_DIR)/$(DNSMASQ_SOURCE):
	$(WGET) -P $(DL_DIR) $(DNSMASQ_SITE)/$(DNSMASQ_SOURCE)

$(DNSMASQ_DIR)/.source: $(DL_DIR)/$(DNSMASQ_SOURCE)
	$(ZCAT) $(DL_DIR)/$(DNSMASQ_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(DNSMASQ_DIR) package/dnsmasq/ \
		$(DNSMASQ_VER)\*.patch
	touch $(DNSMASQ_DIR)/.source

$(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source
	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
		BINDIR=/usr/sbin MANDIR=/usr/man -C $(DNSMASQ_DIR)

$(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY): $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY)
	$(MAKE) BINDIR=/usr/sbin MANDIR=/usr/man \
		DESTDIR=$(TARGET_DIR) -C $(DNSMASQ_DIR) install
	$(STRIP) $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
	rm -rf $(TARGET_DIR)/usr/man

dnsmasq: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)

dnsmasq1: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)

dnsmasq-source: $(DL_DIR)/$(DNSMASQ_SOURCE)

dnsmasq-clean:
	#$(MAKE) prefix=$(TARGET_DIR)/usr -C $(DNSMASQ_DIR) uninstall
	-$(MAKE) -C $(DNSMASQ_DIR) clean

dnsmasq-dirclean:
	rm -rf $(DNSMASQ_DIR)
#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_DNSMASQ)),y)
TARGETS+=dnsmasq
endif
