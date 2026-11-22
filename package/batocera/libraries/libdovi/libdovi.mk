################################################################################
#
# libdovi
#
################################################################################
# Version: Commits on Sept 10, 2026
LIBDOVI_VERSION = 2.3.4
LIBDOVI_SITE = $(call github,quietvoid,dovi_tool,$(LIBDOVI_VERSION))
LIBDOVI_LICENSE = MIT
LIBDOVI_LICENSE_FILES = LICENSE
LIBDOVI_INSTALL_STAGING = YES
LIBDOVI_SUBDIR = dolby_vision

LIBDOVI_DEPENDENCIES = host-cargo-c

LIBDOVI_CARGO = $(TARGET_MAKE_ENV) $(PKG_CARGO_ENV) cargo
LIBDOVI_CARGO_C_OPTS = --release --offline --locked \
	--manifest-path $(@D)/$(LIBDOVI_SUBDIR)/Cargo.toml \
	--target $(RUSTC_TARGET_NAME) --prefix /usr

# Strip unused dev-dependencies and benchmarks, then update Cargo.lock to match
define LIBDOVI_REMOVE_DEV_DEPS
	$(SED) '/\[dev-dependencies\]/,/criterion/d' $(@D)/$(LIBDOVI_SUBDIR)/Cargo.toml
	$(SED) '/\[\[bench\]\]/,/harness = false/d' $(@D)/$(LIBDOVI_SUBDIR)/Cargo.toml
	cd $(@D)/$(LIBDOVI_SUBDIR) && $(LIBDOVI_CARGO) update --offline
endef
LIBDOVI_POST_PATCH_HOOKS += LIBDOVI_REMOVE_DEV_DEPS

define LIBDOVI_BUILD_CMDS
	$(LIBDOVI_CARGO) cbuild $(LIBDOVI_CARGO_C_OPTS)
endef

define LIBDOVI_INSTALL_STAGING_CMDS
	$(LIBDOVI_CARGO) cinstall $(LIBDOVI_CARGO_C_OPTS) --destdir $(STAGING_DIR)
endef

define LIBDOVI_INSTALL_TARGET_CMDS
	$(LIBDOVI_CARGO) cinstall $(LIBDOVI_CARGO_C_OPTS) --destdir $(TARGET_DIR)
endef

$(eval $(cargo-package))
