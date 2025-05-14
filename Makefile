ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dkhelper
$(TWEAK_NAME)_FILES = $(wildcard DK/*.xm) $(wildcard DK/*.m) $(wildcard DK/*.mm) $(wildcard DK/*.s)
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_CXXFLAGS += -fobjc-arc   # 可选
$(TWEAK_NAME)_FRAMEWORKS = UIKit AVFoundation CoreLocation
$(TWEAK_NAME)_INCLUDE_PATHS += $(PROJECT_DIR)/DK
$(TWEAK_NAME)_CFLAGS += -w \
    -Wno-deprecated-declarations \
    -Wno-unused-but-set-variable \
    -Wno-incompatible-pointer-types \
    -Wno-missing-braces
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
