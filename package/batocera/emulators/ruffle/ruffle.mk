################################################################################
#
# ruffle
#
################################################################################
# Version: Commits on Aug 17, 2025
RUFFLE_VERSION = nightly-2025-08-17
RUFFLE_SITE = $(call github,ruffle-rs,ruffle,$(RUFFLE_VERSION))
RUFFLE_LICENSE = GPLv2
RUFFLE_DEPENDENCIES = alsa-lib host-rust-bin host-rustc nghttp2 openssl udev

RUFFLE_CARGO_ENV = CARGO_HOME=$(DL_DIR)/br-cargo-home \
	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
	CARGO_HOST_RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))" \
	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc \
	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"

RUFFLE_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
RUFFLE_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RUFFLE_CARGO_MODE)

RUFFLE_CARGO_OPTS = \
	--$(RUFFLE_CARGO_MODE) \
	--manifest-path=$(@D)/Cargo.toml

define RUFFLE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(RUFFLE_CARGO_ENV) cargo build $(RUFFLE_CARGO_OPTS)
endef

define RUFFLE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(RUFFLE_BIN_DIR)/ruffle_desktop $(TARGET_DIR)/usr/bin/ruffle
endef

$(eval $(generic-package))
