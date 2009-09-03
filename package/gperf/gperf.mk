#############################################################
#
# gperf
#
#############################################################
GPERF_VERSION = 3.0.3
GPERF_SOURCE = gperf-$(GPERF_VERSION).tar.gz
GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
GPERF_AUTORECONF = NO
GPERF_INSTALL_STAGING = NO
GPERF_INSTALL_TARGET = YES
GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

$(eval $(call AUTOTARGETS,package,gperf))

$(GPERF_HOOK_POST_INSTALL): $(GPERF_TARGET_INSTALL_TARGET)
	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gperf
	touch $@

