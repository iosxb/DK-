ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_PACKAGE_SCHEME = rootless  # 如果你的项目是为 rootless 越狱环境开发，建议加上这一行

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dkhelper

$(TWEAK_NAME)_FILES = $(wildcard DK/*.xmm) $(wildcard DK/*.m)
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit AVFoundation CoreLocation

$(TWEAK_NAME)_CXXFLAGS += -x objective-c++ -fobjc-arc

# 修正：变量名应为 _INCLUDE_PATHS 而不是 _INCLUDES_PATHS
$(TWEAK_NAME)_INCLUDE_PATHS += $(PROJECT_DIR)/DK

# 编译器警告控制（建议适量使用 -Werror，避免 release 时编译失败）
$(TWEAK_NAME)_CFLAGS += \
    -w \
    -Wno-deprecated-declarations \
    -Wno-unused-but-set-variable \
    -Wno-incompatible-pointer-types \
    -Wno-missing-braces

ADDITIONAL_CFLAGS = -w

include $(THEOS_MAKE_PATH)/tweak.mk

# 安装后自动重载 SpringBoard
after-install::
	install.exec "sbreload"
