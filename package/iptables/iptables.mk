#############################################################
#
# iptables
#
#############################################################
IPTABLES_VER:=1.2.11
IPTABLES_SOURCE_URL:=http://www.netfilter.org/files
IPTABLES_SOURCE:=iptables-$(IPTABLES_VER).tar.bz2
IPTABLES_BUILD_DIR:=$(BUILD_DIR)/iptables-$(IPTABLES_VER)

$(DL_DIR)/$(IPTABLES_SOURCE):
	 $(WGET) -P $(DL_DIR) $(IPTABLES_SOURCE_URL)/$(IPTABLES_SOURCE) 

$(IPTABLES_BUILD_DIR)/.unpacked: $(DL_DIR)/$(IPTABLES_SOURCE)
	bzcat $(DL_DIR)/$(IPTABLES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $(IPTABLES_BUILD_DIR)/.unpacked

$(IPTABLES_BUILD_DIR)/.configured: $(IPTABLES_BUILD_DIR)/.unpacked
	# Allow patches.  Needed for openwrt for instance.
	toolchain/patch-kernel.sh $(IPTABLES_BUILD_DIR) package/iptables/ iptables\*.patch
	#
	$(SED) "s;\[ -f /usr/include/netinet/ip6.h \];grep -q '__UCLIBC_HAS_IPV6__ 1' \
		$(BUILD_DIR)/uClibc/include/bits/uClibc_config.h;" $(IPTABLES_BUILD_DIR)/Makefile
	touch  $(IPTABLES_BUILD_DIR)/.configured

$(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
	$(TARGET_CONFIGURE_OPTS) \
	$(MAKE) -C $(IPTABLES_BUILD_DIR) \
		KERNEL_DIR=$(LINUX_DIR) PREFIX=/usr \
		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)"

$(TARGET_DIR)/usr/sbin/iptables: $(IPTABLES_BUILD_DIR)/iptables
	$(TARGET_CONFIGURE_OPTS) \
	$(MAKE) -C $(IPTABLES_BUILD_DIR) \
		KERNEL_DIR=$(LINUX_DIR) PREFIX=/usr \
		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)" \
		DESTDIR=$(TARGET_DIR) install
	$(STRIP) $(TARGET_DIR)/usr/sbin/iptables*
	$(STRIP) $(TARGET_DIR)/usr/lib/iptables/*.so
	rm -rf $(TARGET_DIR)/usr/man

iptables: $(TARGET_DIR)/usr/sbin/iptables

iptables-source: $(DL_DIR)/$(IPTABLES_SOURCE)

iptables-clean:
	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(IPTABLES_BUILD_DIR) uninstall
	-$(MAKE) -C $(IPTABLES_BUILD_DIR) clean

iptables-dirclean:
	rm -rf $(IPTABLES_BUILD_DIR)
#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_IPTABLES)),y)
TARGETS+=iptables
endif
