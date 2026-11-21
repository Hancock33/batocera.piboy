################################################################################
#
# xemu-chihiro
#
################################################################################
# Version: Commits on Oct 03, 2026
XEMU_CHIHIRO_VERSION = e66fe47cdaa781966ffd9a7112200ade04c1a531
XEMU_CHIHIRO_SITE = https://github.com/Tovarichtch/xemu.git
XEMU_CHIHIRO_SITE_METHOD = git
XEMU_CHIHIRO_GIT_SUBMODULES = YES
XEMU_CHIHIRO_LICENSE = GPLv2
XEMU_CHIHIRO_EMULATOR_INFO = xemu-chihiro.emulator.yml
XEMU_CHIHIRO_DEPENDENCIES = host-cmake host-meson host-pkgconf host-python-distlib host-python-pyyaml host-python3
XEMU_CHIHIRO_DEPENDENCIES += json-for-modern-cpp libcurl libepoxy libglib2 libgtk3 libpcap libsamplerate
XEMU_CHIHIRO_DEPENDENCIES += pixman sdl3 slirp zlib

XEMU_CHIHIRO_CONF_OPTS += --extra-cflags="-DXBOX=1 -Wno-error=redundant-decls $(TARGET_CFLAGS)"
XEMU_CHIHIRO_CONF_OPTS += --target-list=i386-softmmu
XEMU_CHIHIRO_CONF_OPTS += --disable-werror
XEMU_CHIHIRO_CONF_OPTS += --enable-lto
XEMU_CHIHIRO_CONF_OPTS += --enable-pixman

# Vulkan
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
XEMU_CHIHIRO_DEPENDENCIES += vulkan-headers vulkan-loader
endif

ifeq ($(BR2_x86_x86_64_v3),y)
XEMU_CHIHIRO_CONF_OPTS += --x86-version=3
endif

define XEMU_CHIHIRO_CONFIGURE_CMDS
	cd $(@D) && $(TARGET_CONFIGURE_OPTS) SSL_CERT_DIR=/etc/ssl/certs ./configure $(XEMU_CHIHIRO_CONF_OPTS)
endef

define XEMU_CHIHIRO_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define XEMU_CHIHIRO_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/qemu-system-i386 $(TARGET_DIR)/usr/bin/xemu-chihiro
	mkdir -p $(TARGET_DIR)/usr/share/xemu-chihiro/data
	cp $(@D)/data/* $(TARGET_DIR)/usr/share/xemu-chihiro/data/
	mkdir -p $(TARGET_DIR)/usr/share/xemu-chihiro/crosshairs
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/linuxloader/crosshairs/*.png $(TARGET_DIR)/usr/share/xemu-chihiro/crosshairs/
endef

define XEMU_CHIHIRO_VERSION_DETAILS
	git -C $(XEMU_CHIHIRO_DL_DIR)/git rev-parse HEAD 2>/dev/null | tr -d '\n' > $(@D)/XEMU_COMMIT
	git -C $(XEMU_CHIHIRO_DL_DIR)/git symbolic-ref --short HEAD | cut -d'/' -f2- > $(@D)/XEMU_BRANCH
	git -C $(XEMU_CHIHIRO_DL_DIR)/git describe --tags --match 'v*' | cut -c 2- | tr -d '\n' > $(@D)/XEMU_VERSION
endef

# Meson subprojects, fetched at the revisions pinned in subprojects/*.wrap
XEMU_CHIHIRO_SUBPROJECTS = SPIRV-Reflect VulkanMemoryAllocator berkeley-softfloat-3 berkeley-testfloat-3
XEMU_CHIHIRO_SUBPROJECTS += genconfig glslang imgui implot keycodemapdb nv2a_vsh_cpu tomlplusplus volk xxhash

define XEMU_CHIHIRO_GET_SUBPROJECTS
	$(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/xemu/fetch-subprojects.sh \
		$(@D) $(XEMU_CHIHIRO_DL_DIR)/subprojects $(XEMU_CHIHIRO_SUBPROJECTS)
endef

XEMU_CHIHIRO_PRE_PATCH_HOOKS += XEMU_CHIHIRO_VERSION_DETAILS XEMU_CHIHIRO_GET_SUBPROJECTS

$(eval $(autotools-package))
$(eval $(emulator-info-package))
