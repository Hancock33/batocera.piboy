#############################################################
#
# e2fsprogs
#
#############################################################
E2FSPROGS_VERSION:=1.41.3
E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
E2FSPROGS_CAT:=$(ZCAT)
E2FSPROGS_BINARY:=misc/mke2fs
E2FSPROGS_TARGET_BINARY:=sbin/mke2fs
LIBUUID_DIR=$(E2FSPROGS_DIR)/lib/uuid/
LIBUUID_TARGET_BINARY:=usr/lib/libuuid.so

E2FSPROGS_MISC_STRIP:= \
	badblocks blkid chattr dumpe2fs filefrag fsck logsave \
	lsattr mke2fs mklost+found tune2fs uuidgen

$(DL_DIR)/$(E2FSPROGS_SOURCE):
	 $(call DOWNLOAD,$(E2FSPROGS_SITE),$(E2FSPROGS_SOURCE))

e2fsprogs-source: $(DL_DIR)/$(E2FSPROGS_SOURCE)

$(E2FSPROGS_DIR)/.unpacked: $(DL_DIR)/$(E2FSPROGS_SOURCE)
	$(E2FSPROGS_CAT) $(DL_DIR)/$(E2FSPROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(E2FSPROGS_DIR) package/e2fsprogs/ e2fsprogs\*.patch
	$(CONFIG_UPDATE) $(E2FSPROGS_DIR)/config
	touch $@

$(E2FSPROGS_DIR)/.configured: $(E2FSPROGS_DIR)/.unpacked
	(cd $(E2FSPROGS_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		./configure $(QUIET) \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--with-cc=$(TARGET_CC) \
		--with-linker=$(TARGET_CROSS)ld \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/bin \
		--sbindir=/sbin \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--disable-tls \
		--enable-elf-shlibs --enable-dynamic-e2fsck --disable-swapfs \
		--disable-debugfs --disable-imager \
		--disable-resizer --enable-fsck \
		--disable-e2initrd-helper \
		--without-catgets $(DISABLE_NLS) \
		$(DISABLE_LARGEFILE) \
	)
	# do away with hiding the commands
	find $(E2FSPROGS_DIR) -name Makefile \
		| xargs $(SED) '/^[[:space:]]*@/s/@/$$\(Q\)/'
	touch $@

$(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY): $(E2FSPROGS_DIR)/.configured
	$(MAKE1) -C $(E2FSPROGS_DIR)
	(cd $(E2FSPROGS_DIR)/misc; \
		$(STRIPCMD) $(E2FSPROGS_MISC_STRIP); \
	)
	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
	touch -c $@

$(E2FSPROGS_DIR)/lib/libuuid.so: $(E2FSPROGS_DIR)/.configured
	$(MAKE1) -C $(E2FSPROGS_DIR)/lib/uuid
	touch -c $@

$(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
		-C $(E2FSPROGS_DIR) install
	touch -c $@

$(STAGING_DIR)/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/lib/libuuid.so
	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
		-C $(LIBUUID_DIR) install
	touch -c $@

E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += ${TARGET_DIR}/sbin/badblocks
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BLKID) += ${TARGET_DIR}/sbin/blkid
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_CHATTR) += ${TARGET_DIR}/bin/chattr
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_DUMPE2FS) += ${TARGET_DIR}/sbin/dumpe2fs
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_E2LABEL) += ${TARGET_DIR}/sbin/e2label
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_E2FSCK) += ${TARGET_DIR}/sbin/e2fsck
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_FILEFRAG) += ${TARGET_DIR}/sbin/filefrag
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_FSCK) += ${TARGET_DIR}/sbin/fsck
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += ${TARGET_DIR}/sbin/logsave
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_LSATTR) += ${TARGET_DIR}/bin/lsattr
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_MKE2FS) += ${TARGET_DIR}/sbin/mke2fs
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += ${TARGET_DIR}/sbin/mklost+found
E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += ${TARGET_DIR}/bin/uuidgen

$(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY)
	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) LDCONFIG=true \
		-C $(E2FSPROGS_DIR) install
	rm -rf ${TARGET_DIR}/sbin/mkfs.ext[234] \
		${TARGET_DIR}/sbin/fsck.ext[234] \
		${TARGET_DIR}/sbin/findfs \
		${TARGET_DIR}/sbin/tune2fs
ifneq ($(E2FSPROGS_RM),)
	rm -rf $(E2FSPROGS_RM)
endif
ifeq ($(BR2_PACKAGE_E2FSPROGS_MKE2FS),y)
	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext2
	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext3
	ln -sf mke2fs ${TARGET_DIR}/sbin/mkfs.ext4
endif
ifeq ($(BR2_PACKAGE_E2FSPROGS_E2FSCK),y)
	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext2
	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext3
	ln -sf e2fsck ${TARGET_DIR}/sbin/fsck.ext4
endif
ifeq ($(BR2_PACKAGE_E2FSPROGS_TUNE2FS),y)
	ln -sf e2label ${TARGET_DIR}/sbin/tune2fs
endif
ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
	ln -sf e2label ${TARGET_DIR}/sbin/findfs
endif
ifneq ($(BR2_HAVE_INFOPAGES),y)
	rm -rf $(TARGET_DIR)/usr/share/info
endif
ifneq ($(BR2_HAVE_MANPAGES),y)
	rm -rf $(TARGET_DIR)/usr/share/man
endif
	rm -rf $(TARGET_DIR)/share/locale
	rm -rf $(TARGET_DIR)/usr/share/doc
	touch -c $@

$(TARGET_DIR)/$(LIBUUID_TARGET_BINARY): $(STAGING_DIR)/$(LIBUUID_TARGET_BINARY)
	cp -a $(STAGING_DIR)/$(LIBUUID_TARGET_BINARY)* $(@D)
	touch -c $@

libuuid: $(TARGET_DIR)/$(LIBUUID_TARGET_BINARY)
e2fsprogs: libuuid $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)

e2fsprogs-clean:
	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(E2FSPROGS_DIR) uninstall
	-$(MAKE1) -C $(E2FSPROGS_DIR) clean

e2fsprogs-dirclean:
	rm -rf $(E2FSPROGS_DIR)

libuuid-clean:
	-$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
		-C $(LIBUUID_DIR) uninstall
	# make uninstall misses the includes
	rm -rf $(STAGING_DIR)/usr/include/uuid
	rm -f $(TARGET_DIR)/$(LIBUUID_TARGET_BINARY)*
	-$(MAKE1) -C $(LIBUUID_DIR) clean

libuuid-source: e2fsprogs-source
libuuid-dirclean: e2fsprogs-dirclean

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
TARGETS+=e2fsprogs
endif

ifeq ($(BR2_PACKAGE_LIBUUID),y)
TARGETS+=libuuid
endif
