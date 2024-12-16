################################################################################
#
# pm_dashboard
#
################################################################################
# Version: Commits on Dec 16, 2024
PM_DASHBOARD_VERSION = 61c73b8e09a8da97aa96b7bb71e4cbf0073140b8
PM_DASHBOARD_SITE = $(call github,sunfounder,pm_dashboard,$(PM_DASHBOARD_VERSION))
PM_DASHBOARD_SETUP_TYPE = setuptools
PM_DASHBOARD_LICENSE = GPL-2.0
PM_DASHBOARD_LICENSE_FILES = LICENSE

PM_DASHBOARD_DEPENDENCIES = python-influxdb python-flask python-flask-cors influxdb

$(eval $(python-package))
