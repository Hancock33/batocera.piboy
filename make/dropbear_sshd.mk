#############################################################
#
# dropbear_sshd
#
#############################################################
DROPBEAR_SSHD_SOURCE:=dropbear-0.37.tar.bz2
DROPBEAR_SSHD_SITE:=http://matt.ucc.asn.au/dropbear/
DROPBEAR_SSHD_DIR:=$(BUILD_DIR)/dropbear-0.37
DROPBEAR_SSHD_CAT:=bzcat
DROPBEAR_SSHD_BINARY:=dropbear
DROPBEAR_SSHD_TARGET_BINARY:=usr/sbin/dropbear


$(DL_DIR)/$(DROPBEAR_SSHD_SOURCE):
	 $(WGET) -P $(DL_DIR) $(DROPBEAR_SSHD_SITE)/$(DROPBEAR_SSHD_SOURCE)

dropbear_sshd-source: $(DL_DIR)/$(DROPBEAR_SSHD_SOURCE)

$(DROPBEAR_SSHD_DIR)/.unpacked: $(DL_DIR)/$(DROPBEAR_SSHD_SOURCE)
	$(DROPBEAR_SSHD_CAT) $(DL_DIR)/$(DROPBEAR_SSHD_SOURCE) | tar -C $(BUILD_DIR) -xvf -
	touch $(DROPBEAR_SSHD_DIR)/.unpacked

$(DROPBEAR_SSHD_DIR)/.configured: $(DROPBEAR_SSHD_DIR)/.unpacked
	(cd $(DROPBEAR_SSHD_DIR); rm -rf config.cache; \
		autoconf; \
		$(TARGET_CONFIGURE_OPTS) \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--mandir=/usr/man \
		--infodir=/usr/info \
		$(DISABLE_NLS) \
		--with-shared \
	);
	touch  $(DROPBEAR_SSHD_DIR)/.configured

$(DROPBEAR_SSHD_DIR)/$(DROPBEAR_SSHD_BINARY): $(DROPBEAR_SSHD_DIR)/.configured
	$(MAKE) CC=$(TARGET_CC) -C $(DROPBEAR_SSHD_DIR)

$(TARGET_DIR)/$(DROPBEAR_SSHD_TARGET_BINARY): $(DROPBEAR_SSHD_DIR)/$(DROPBEAR_SSHD_BINARY)
	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DROPBEAR_SSHD_DIR) install
	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc

dropbear_sshd: uclibc zlib $(TARGET_DIR)/$(DROPBEAR_SSHD_TARGET_BINARY)

dropbear_sshd-clean:
	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DROPBEAR_SSHD_DIR) uninstall
	-$(MAKE) -C $(DROPBEAR_SSHD_DIR) clean

dropbear_sshd-dirclean:
	rm -rf $(DROPBEAR_SSHD_DIR)

