#############################################################
#
# sysvinit
#
#############################################################
SYSVINIT_VERSION:=2.86
SYSVINIT_SOURCE:=sysvinit-$(SYSVINIT_VERSION).tar.gz
SYSVINIT_SITE:=ftp://ftp.cistron.nl/pub/people/miquels/software
SYSVINIT_DIR:=$(BUILD_DIR)/sysvinit-$(SYSVINIT_VERSION)
SYSVINIT_CAT:=$(ZCAT)
SYSVINIT_BINARY:=src/init
SYSVINIT_TARGET_BINARY:=sbin/init

$(DL_DIR)/$(SYSVINIT_SOURCE):
	$(call DOWNLOAD,$(SYSVINIT_SITE),$(SYSVINIT_SOURCE))

sysvinit-unpacked: $(SYSVINIT_DIR)/.unpacked
$(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
	$(SYSVINIT_CAT) $(DL_DIR)/$(SYSVINIT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(SYSVINIT_DIR) package/sysvinit/ sysvinit-\*.patch
	touch $@

$(SYSVINIT_DIR)/$(SYSVINIT_BINARY): $(SYSVINIT_DIR)/.unpacked
	# Force sysvinit to link against libcrypt as it otherwise
	# use an incorrect test to see if it's available
	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC="$(TARGET_CC)" LCRYPT="-lcrypt" -C $(SYSVINIT_DIR)/src

$(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY): $(SYSVINIT_DIR)/$(SYSVINIT_BINARY)
	for x in halt init shutdown; do \
		install -D $(SYSVINIT_DIR)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
	done

sysvinit: $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY)

sysvinit-source: $(DL_DIR)/$(SYSVINIT_SOURCE)

sysvinit-clean:
	for x in halt init shutdown; do \
		rm -f $(TARGET_DIR)/sbin/$$x || exit 1; \
	done
	-$(MAKE) -C $(SYSVINIT_DIR) clean

sysvinit-dirclean:
	rm -rf $(SYSVINIT_DIR)
#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_SYSVINIT),y)
TARGETS+=sysvinit
endif
