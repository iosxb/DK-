# 插件：显示编译成功，显示的信息
PACKAGE_IDENTIFIER = com.dkjone.dkhelper
PACKAGE_NAME = dkhelper
PACKAGE_VERSION = 1.1.0
PACKAGE_ARCHITECTURE = iphoneos-arm64 iphoneos-arm64e
PACKAGE_REVISION = 1
PACKAGE_SECTION = Tweaks
PACKAGE_DEPENDS = firmware (>= 14.0), mobilesubstrate
PACKAGE_DESCRIPTION = dkhelper

# 插件：编译时，引用的信息
Package: com.dkjone.dkhelper
Name: dkhelper
Version: 1.1.0
Description: 不止于抢红包，功能丰富的微信插件
Section: System
Depends: firmware (>= 5.0), mobilesubstrate
Conflicts:
Replaces:
Priority: optional
Architecture: iphoneos-arm
Author: DKJone
dev:
Homepage: https://github.com/DKJone/DKWechatHelper
Depiction: 不止于抢红包，功能丰富的微信插件(适配8.0.38)
Maintainer:
Icon:

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