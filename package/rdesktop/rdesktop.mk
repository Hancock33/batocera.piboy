#############################################################
#
# rdesktop
#
#############################################################

RDESKTOP_VERSION=1.5.0
RDESKTOP_SOURCE=rdesktop-$(RDESKTOP_VERSION).tar.gz
RDESKTOP_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rdesktop/
RDESKTOP_DIR=$(BUILD_DIR)/rdesktop-$(RDESKTOP_VERSION)
RDESKTOP_CAT:=$(ZCAT)

$(DL_DIR)/$(RDESKTOP_SOURCE):
	$(call DOWNLOAD,$(RDESKTOP_SITE),$(RDESKTOP_SOURCE))

$(RDESKTOP_DIR)/.unpacked: $(DL_DIR)/$(RDESKTOP_SOURCE)
	$(RDESKTOP_CAT) $(DL_DIR)/$(RDESKTOP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(RDESKTOP_DIR) package/rdesktop/ \*.patch*
	touch $(RDESKTOP_DIR)/.unpacked

$(RDESKTOP_DIR)/.configured: $(RDESKTOP_DIR)/.unpacked
	(cd $(RDESKTOP_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--with-openssl=$(STAGING_DIR)/usr \
		--sysconfdir=/etc \
	)
	touch $(RDESKTOP_DIR)/.configured

$(RDESKTOP_DIR)/rdesktop: $(RDESKTOP_DIR)/.configured
	$(MAKE) CC=$(TARGET_CC) -C $(RDESKTOP_DIR)

$(TARGET_DIR)/usr/bin/rdesktop: $(RDESKTOP_DIR)/rdesktop
	cp $^ $@

rdesktop: openssl xserver_xorg-server $(TARGET_DIR)/usr/bin/rdesktop

rdesktop-source: $(DL_DIR)/$(RDESKTOP_SOURCE)

rdesktop-clean:
	-$(MAKE) -C $(RDESKTOP_DIR) clean
	rm -f $(TARGET_DIR)/usr/bin/rdesktop

rdesktop-dirclean:
	rm -rf $(RDESKTOP_DIR) $(RDESKTOP_DIR)
#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_RDESKTOP),y)
TARGETS+=rdesktop
endif
