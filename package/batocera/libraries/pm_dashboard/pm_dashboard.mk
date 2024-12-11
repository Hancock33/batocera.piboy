################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Dec 11, 2024
PM_DASHBOARD_VERSION = b2a8990c57d9d81200b8540970433ffdac40eb5e
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
