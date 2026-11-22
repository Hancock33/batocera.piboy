################################################################################
#
# wxwidgets
#
################################################################################
# Version: Commits on Oct 10, 2026
WXWIDGETS_VERSION = v3.3.4
WXWIDGETS_SITE = https://github.com/wxWidgets/wxWidgets
WXWIDGETS_DEPENDENCIES = zlib libpng jpeg gdk-pixbuf host-libgtk3 libgtk3 libglu
WXWIDGETS_SITE_METHOD = git
WXWIDGETS_GIT_SUBMODULES = YES
WXWIDGETS_LICENSE = wxWindows
WXWIDGETS_LICENSE_FILES = docs/licence.txt docs/lgpl.txt

WXWIDGETS_SUPPORTS_IN_SOURCE_BUILD = NO
WXWIDGETS_INSTALL_STAGING = YES

# major.minor of the version, e.g. v3.3.4 -> 3.3
WXWIDGETS_SERIES = $(subst $(space),.,$(wordlist 1,2,$(subst ., ,$(patsubst v%,%,$(WXWIDGETS_VERSION)))))

define WXWIDGETS_FIXUP_WXWIDGET_CONFIG
	# Explicitly target the version we want
	ln -sf $(STAGING_DIR)/usr/lib/wx/config/gtk3-unicode-$(WXWIDGETS_SERIES) $(STAGING_DIR)/usr/bin/wx-config
	$(SED) 's%^prefix=.*%prefix=$(STAGING_DIR)/usr%'		$(STAGING_DIR)/usr/bin/wx-config
	$(SED) 's%^exec_prefix=.*%exec_prefix=$${prefix}%'		$(STAGING_DIR)/usr/bin/wx-config
endef

WXWIDGETS_POST_INSTALL_STAGING_HOOKS += WXWIDGETS_FIXUP_WXWIDGET_CONFIG

$(eval $(cmake-package))
