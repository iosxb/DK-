
# 直接输出到根路径
export THEOS_PACKAGE_DIR = $(CURDIR)

# TARGET
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:15.0

# Rootless 插件配置
export THEOS_PACKAGE_SCHEME = rootless
THEOS_PACKAGE_INSTALL_PREFIX = /var/jb

# 目标进程
INSTALL_TARGET_PROCESSES = Aweme

# 引入 Theos 的通用设置
include $(THEOS)/makefiles/common.mk

# 插件名称
TWEAK_NAME = dkhelper

# 源代码文件
$(TWEAK_NAME)_FILES = $(wildcard DK/*.xm) $(wildcard DK/*.m)

# 编译选项
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-error
$(TWEAK_NAME)_MMFLAGS = -fobjc-arc -Wno-error -std=c++11

# 框架
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation AVFoundation Photos AVKit

# Theos 编译规则
include $(THEOS_MAKE_PATH)/tweak.mk