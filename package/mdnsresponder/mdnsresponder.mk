#############################################################
#
# mDNSResponder
#
#############################################################
MDNSRESPONDER_VERSION:=107.6
MDNSRESPONDER_SOURCE:=mDNSResponder-$(MDNSRESPONDER_VERSION).tar.gz
MDNSRESPONDER_SITE:=http://www.opensource.apple.com/darwinsource/tarballs/other/$(MDNSRESPONDER_SOURCE)
MDNSRESPONDER_DIR:=$(BUILD_DIR)/mDNSResponder-$(MDNSRESPONDER_VERSION)
MDNSRESPONDER_CAT:=$(ZCAT)
MDNSRESPONDER_INSTDEPS:=

ifeq ($(BR2_PACKAGE_MDNSRESPONDER_UTILS),y)
	MDNSRESPONDER_INSTDEPS+=$(TARGET_DIR)/usr/bin/mDNSClientPosix
endif

$(DL_DIR)/$(MDNSRESPONDER_SOURCE):
	$(call DOWNLOAD,$(MDNSRESPONDER_SITE),$(MDNSRESPONDER_SOURCE))

$(MDNSRESPONDER_DIR)/.unpacked: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)
	$(MDNSRESPONDER_CAT) $(DL_DIR)/$(MDNSRESPONDER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(MDNSRESPONDER_DIR) package/mdnsresponder/ \
		mDNSResponder-$(MDNSRESPONDER_VERSION)\*.patch
	touch $@

$(MDNSRESPONDER_DIR)/.configured: $(MDNSRESPONDER_DIR)/.unpacked
	$(SED) 's:OPTIONALTARG = nss_mdns::' $(MDNSRESPONDER_DIR)/mDNSPosix/Makefile
	touch $@

$(MDNSRESPONDER_DIR)/.built: $(MDNSRESPONDER_DIR)/.configured
	$(MAKE1) CC=$(TARGET_CC) os="linux" LD="$(TARGET_CC) -shared" LOCALBASE="/usr" -C $(MDNSRESPONDER_DIR)/mDNSPosix
	touch $@

$(STAGING_DIR)/usr/lib/libdns_sd.so: $(MDNSRESPONDER_DIR)/.built
	# lib
	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/libdns_sd.so $(STAGING_DIR)/usr/lib/
	ln -sf $(STAGING_DIR)/usr/lib/libdns_sd.so $(STAGING_DIR)/usr/lib/libdns_sd.so.1
	# include
	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSShared/dns_sd.h $(STAGING_DIR)/usr/include/

$(TARGET_DIR)/usr/sbin/mdnsd: $(STAGING_DIR)/usr/lib/libdns_sd.so
	# sbin
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/dnsextd $(TARGET_DIR)/usr/sbin/
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSResponderPosix $(TARGET_DIR)/usr/sbin/
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mdnsd $(TARGET_DIR)/usr/sbin/
	# lib
	$(INSTALL) -m 644 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/libdns_sd.so $(TARGET_DIR)/usr/lib/
	ln -sf $(TARGET_DIR)/usr/lib/libdns_sd.so $(TARGET_DIR)/usr/lib/libdns_sd.so.1
	# etc
	$(INSTALL) -m 0644 -D package/mdnsresponder/mDNSResponderPosix.conf $(TARGET_DIR)/etc/
	# init
	$(INSTALL) -m 0755 -D package/mdnsresponder/rc.mdnsresponder $(TARGET_DIR)/etc/init.d/S80mdnsresponder

$(TARGET_DIR)/usr/bin/mDNSClientPosix: $(STAGING_DIR)/usr/lib/libdns_sd.so
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSNetMonitor $(TARGET_DIR)/usr/sbin/
	# bin
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/Clients/build/dns-sd $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSProxyResponderPosix $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSIdentify $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 755 -D $(MDNSRESPONDER_DIR)/mDNSPosix/build/prod/mDNSClientPosix $(TARGET_DIR)/usr/bin/


mdnsresponder: $(TARGET_DIR)/usr/sbin/mdnsd $(MDNSRESPONDER_INSTDEPS)

mdnsresponder-source: $(DL_DIR)/$(MDNSRESPONDER_SOURCE)

mdnsresponder-unpacked: $(MDNSRESPONDER_DIR)/.unpacked

mdnsresponder-clean:
	rm -f $(MDNSRESPONDER_DIR)/.configured $(MDNSRESPONDER_DIR)/.built $(MDNSRESPONDER_DIR)/.staged
	-$(MAKE1) os=linux -C $(MDNSRESPONDER_DIR)/mDNSPosix clean
	rm -f $(TARGET_DIR)/usr/sbin/dnsextd \
		$(TARGET_DIR)/usr/sbin/mDNSResponderPosix \
		$(TARGET_DIR)/usr/sbin/mDNSNetMonitor \
		$(TARGET_DIR)/usr/sbin/mdnsd \
		$(TARGET_DIR)/usr/bin/dns-sd \
		$(TARGET_DIR)/usr/bin/mDNSProxyResponderPosix \
		$(TARGET_DIR)/usr/bin/mDNSIdentify \
		$(TARGET_DIR)/usr/bin/mDNSClientPosix \
		$(TARGET_DIR)/usr/lib/libdns_sd.so* \
		$(STAGING_DIR)/usr/lib/libdns_sd.so* \
		$(STAGING_DIR)/usr/include/dns_sd.h \
		$(TARGET_DIR)/etc/mDNSResponderPosix.conf \
		$(TARGET_DIR)/etc/init.d/S80mdnsresponder

mdnsresponder-dirclean:
	rm -rf $(MDNSRESPONDER_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_MDNSRESPONDER),y)
TARGETS+=mdnsresponder
endif
