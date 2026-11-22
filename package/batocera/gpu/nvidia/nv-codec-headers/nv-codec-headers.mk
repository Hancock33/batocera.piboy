################################################################################
#
# nv-codec-headers
#
################################################################################
# Version: Commits on Jul 14, 2026
NV_CODEC_HEADERS_VERSION = n13.1.15.0
NV_CODEC_HEADERS_SITE = https://github.com/FFmpeg/nv-codec-headers
NV_CODEC_HEADERS_SITE_METHOD = git
NV_CODEC_HEADERS_LICENSE = MIT
NV_CODEC_HEADERS_LICENSE_FILES = include/ffnvcodec/nvEncodeAPI.h
NV_CODEC_HEADERS_INSTALL_STAGING = YES

define NV_CODEC_HEADERS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D) install
endef

define NV_CODEC_HEADERS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
endef

$(eval $(generic-package))
