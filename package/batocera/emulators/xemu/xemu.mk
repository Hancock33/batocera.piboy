################################################################################
#
# xemu
#
################################################################################
# Version: Commits on Nov 16, 2026
XEMU_VERSION = 711b416840c2a528cb989621b6456a72bd02d768
XEMU_SITE = https://github.com/xemu-project/xemu.git
XEMU_SITE_METHOD = git
XEMU_GIT_SUBMODULES = YES
XEMU_LICENSE = GPLv2
XEMU_EMULATOR_INFO = xemu.emulator.yml
XEMU_DEPENDENCIES = host-cmake host-meson host-pkgconf host-python-distlib host-python-pyyaml host-python3
XEMU_DEPENDENCIES += dsp56300 json-for-modern-cpp libcurl libepoxy libglib2 libgtk3 libpcap libsamplerate
XEMU_DEPENDENCIES += pixman sdl3 slirp zlib
XEMU_EXTRA_DOWNLOADS = https://github.com/xemu-project/xemu-dashboard/releases/download/v20250806-0635/xbox_hdd.qcow2

XEMU_CONF_OPTS += --extra-cflags="-DXBOX=1 -Wno-error=redundant-decls $(TARGET_CFLAGS)"
XEMU_CONF_OPTS += --target-list=i386-softmmu
XEMU_CONF_OPTS += --disable-werror
XEMU_CONF_OPTS += --enable-lto
XEMU_CONF_OPTS += --enable-pixman

# Vulkan
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
XEMU_DEPENDENCIES += vulkan-headers vulkan-loader
endif

ifeq ($(BR2_x86_x86_64_v3),y)
XEMU_CONF_OPTS += --x86-version=3
endif

define XEMU_CONFIGURE_CMDS
	cd $(@D) && $(TARGET_CONFIGURE_OPTS) SSL_CERT_DIR=/etc/ssl/certs ./configure $(XEMU_CONF_OPTS)
endef

define XEMU_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define XEMU_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/qemu-system-i386 $(TARGET_DIR)/usr/bin/xemu
	mkdir -p $(TARGET_DIR)/usr/share/xemu/data
	cp $(@D)/data/* $(TARGET_DIR)/usr/share/xemu/data/
	cp $(XEMU_DL_DIR)/xbox_hdd.qcow2 $(TARGET_DIR)/usr/share/xemu/data/
endef

define XEMU_VERSION_DETAILS
	git -C $(XEMU_DL_DIR)/git rev-parse HEAD 2>/dev/null | tr -d '\n' > $(@D)/XEMU_COMMIT
	git -C $(XEMU_DL_DIR)/git symbolic-ref --short HEAD | cut -d'/' -f2- > $(@D)/XEMU_BRANCH
	git -C $(XEMU_DL_DIR)/git describe --tags --match 'v*' | cut -c 2- | tr -d '\n' > $(@D)/XEMU_VERSION
endef

# Meson subprojects, fetched at the revisions pinned in subprojects/*.wrap
XEMU_SUBPROJECTS = SPIRV-Reflect VulkanMemoryAllocator berkeley-softfloat-3 berkeley-testfloat-3
XEMU_SUBPROJECTS += genconfig glslang imgui implot keycodemapdb nv2a_vsh_cpu tomlplusplus volk xxhash

define XEMU_GET_SUBPROJECTS
	$(XEMU_PKGDIR)/fetch-subprojects.sh $(@D) $(XEMU_DL_DIR)/subprojects $(XEMU_SUBPROJECTS)
endef

XEMU_PRE_PATCH_HOOKS += XEMU_VERSION_DETAILS XEMU_GET_SUBPROJECTS

$(eval $(autotools-package))
$(eval $(emulator-info-package))
