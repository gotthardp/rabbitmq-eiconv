RELEASABLE=true
APP_NAME:=eiconv

UPSTREAM_GIT:=https://github.com/zotonic/eiconv.git
UPSTREAM_REVISION:=644fb5e7bd6640fbd073f4d28957914ea979aea0
RETAIN_ORIGINAL_VERSION:=true

ORIGINAL_APP_FILE:=$(CLONE_DIR)/src/eiconv.app.src
DO_NOT_GENERATE_APP_FILE=true

CONSTRUCT_APP_PREREQS:=$(shell find $(CLONE_DIR)/priv -type f)
define construct_app_commands
	cp -r $(CLONE_DIR)/priv $(APP_DIR)
endef

define package_rules
$(CLONE_DIR)/src/$(APP_NAME).app.src: $(CLONE_DIR)/.done
	sed -i 's/git/"0.4.0"/' $(CLONE_DIR)/src/$(APP_NAME).app.src
endef
