#############################################################
#
# make
#
#############################################################
GNUMAKE_VER:=3.81
GNUMAKE_SOURCE:=make-$(GNUMAKE_VER).tar.bz2
GNUMAKE_SITE:=http://ftp.gnu.org/pub/gnu/make
GNUMAKE_DIR:=$(BUILD_DIR)/make-$(GNUMAKE_VER)
GNUMAKE_CAT:=bzcat
GNUMAKE_BINARY:=make
GNUMAKE_TARGET_BINARY:=usr/bin/make

$(DL_DIR)/$(GNUMAKE_SOURCE):
	 $(WGET) -P $(DL_DIR) $(GNUMAKE_SITE)/$(GNUMAKE_SOURCE)

make-source: $(DL_DIR)/$(GNUMAKE_SOURCE)

$(GNUMAKE_DIR)/.unpacked: $(DL_DIR)/$(GNUMAKE_SOURCE)
	$(GNUMAKE_CAT) $(DL_DIR)/$(GNUMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $(GNUMAKE_DIR)/.unpacked

$(GNUMAKE_DIR)/.configured: $(GNUMAKE_DIR)/.unpacked
	(cd $(GNUMAKE_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		make_cv_sys_gnu_glob=no \
		GLOBINC='-I$(GNUMAKE_DIR)/glob' \
		GLOBLIB=glob/libglob.a \
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
		$(DISABLE_LARGEFILE) \
	);
	touch $(GNUMAKE_DIR)/.configured

$(GNUMAKE_DIR)/$(GNUMAKE_BINARY): $(GNUMAKE_DIR)/.configured
	$(MAKE) -C $(GNUMAKE_DIR)

$(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY): $(GNUMAKE_DIR)/$(GNUMAKE_BINARY)
	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) install
	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc

make: uclibc $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY)

make-clean:
	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) uninstall
	-$(MAKE) -C $(GNUMAKE_DIR) clean

make-dirclean:
	rm -rf $(GNUMAKE_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_MAKE)),y)
TARGETS+=make
endif
