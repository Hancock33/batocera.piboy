#############################################################
#
# dhcpdump
#
#############################################################
# Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>

DHCPDUMP_VER:=1.7
DHCPDUMP_DIR:=$(BUILD_DIR)/dhcpdump-$(DHCPDUMP_VER)
DHCPDUMP_SITE:=http://www.mavetju.org/download/
DHCPDUMP_SOURCE:=dhcpdump-$(DHCPDUMP_VER).tar.gz
DHCPDUMP_CAT:=$(ZCAT)

$(DL_DIR)/$(DHCPDUMP_SOURCE):
	 $(WGET) -P $(DL_DIR) $(DHCPDUMP_SITE)/$(DHCPDUMP_SOURCE)

dhcpdump-source: $(DL_DIR)/$(DHCPDUMP_SOURCE)

$(DHCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(DHCPDUMP_SOURCE)
	$(DHCPDUMP_CAT) $(DL_DIR)/$(DHCPDUMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $(DHCPDUMP_DIR)/.unpacked

$(DHCPDUMP_DIR)/.configured: $(DHCPDUMP_DIR)/.unpacked
	( \
		cd $(DHCPDUMP_DIR) ; \
		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
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
		--includedir=/include \
		--mandir=/usr/man \
		--infodir=/usr/info \
		--with-build-cc="$(HOSTCC)" \
	)
	touch $(DHCPDUMP_DIR)/.configured

$(DHCPDUMP_DIR)/dhcpdump: $(DHCPDUMP_DIR)/.configured
	$(MAKE) CC="$(TARGET_CC)" -C $(DHCPDUMP_DIR)

$(TARGET_DIR)/sbin/dhcpdump: $(DHCPDUMP_DIR)/dhcpdump
	cp -af $< $@

dhcpdump: uclibc zlib libpcap $(TARGET_DIR)/sbin/dhcpdump

dhcpdump-clean:
	rm -f $(TARGET_DIR)/sbin/dhcpdump
	-$(MAKE) -C $(DHCPDUMP_DIR) clean

dhcpdump-dirclean:
	rm -rf $(DHCPDUMP_DIR)
#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_DHCPDUMP)),y)
TARGETS+=dhcpdump
endif
