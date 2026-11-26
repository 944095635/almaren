# Almaren IM

基于 Flutter 实现的高保真即时通讯（IM）界面演示项目，复刻了 Almaren 社交 App 的设计稿。项目聚焦 UI 与交互效果，数据均为本地模拟数据，不涉及真实后端服务。

## 界面预览

![会话列表与聊天界面](https://github.com/user-attachments/assets/8050d242-18d3-40fa-bb1b-2a94d89001af)

![更多界面截图](https://github.com/user-attachments/assets/04c4e37a-bf89-4da7-8e86-ada0272d7b23)

## 功能特性

- **启动流程**：启动页权限申请（相机、麦克风、相册/存储）、引导页、手机号登录、基于 `SharedPreferences` 的登录状态保持与退出登录。
- **主框架**：底部毛玻璃导航栏，包含会话、联系人、设置三个 Tab，使用 `IndexedStack` 保持页面状态。
- **会话列表**：会话头像与在线状态、未读数、滑动操作（`flutter_slidable`）、下拉刷新（`easy_refresh`）、点击会话进入聊天页。
- **聊天详情**：
  - 文本消息气泡（按收发方区分样式）、图片消息与 Hero 动画大图预览；
  - 表情面板（`assets/emoji.plist`，按光标位置插入）、键盘 / 表情 / 工具 / 语音面板切换，面板高度跟随键盘；
  - 相册多选、相机拍摄（`wechat_assets_picker` / `wechat_camera_picker`），选中图片后直接发送；
  - 上拉加载更多、触摸列表收起输入面板、消息多选模式占位 UI。
- **辅助页面**：联系人列表、搜索页、设置页、图片预览页；AppBar 随滚动淡入动画、中文零宽换行处理等细节。

## 技术栈

| 类别 | 选型 |
| --- | --- |
| 框架 | Flutter（Dart 3.11+）、Material Design |
| 状态管理 / 路由 | GetX（`GetMaterialApp`、`Get.to`、`GetxController`、`GetBuilder`、`Obx`） |
| 网络 | `http`（已声明，当前项目未使用） |
| 本地存储 | `shared_preferences` |
| 图片与图标 | `flutter_svg`、`extended_image`、`flutter_launcher_icons` |
| 交互组件 | `easy_refresh`、`flutter_slidable`、`flutter_smart_dialog`、`flutter_keyboard_visibility`、`chat_bottom_container` |
| 资源选择 | `wechat_assets_picker`、`wechat_camera_picker`、`permission_handler`、`device_info_plus` |
| 工具依赖 | `xml`（解析表情 plist）、`flutter_styled`（布局扩展，来自 GitHub） |

## 目录结构

```text
lib/
├── main.dart                  # 应用入口、全局主题配置
├── mixin/                     # AppBar 滚动动画等 mixin
├── models/                    # Chat / Contacts / Message 数据模型
├── page/
│   ├── splash/                # 启动页与权限申请
│   ├── intro/                 # 引导页
│   ├── login/                 # 登录页
│   ├── frame/                 # 主框架与底部导航
│   ├── chats/                 # 会话列表（page + logic + item）
│   ├── chat/                  # 聊天页：输入面板、表情、消息渲染与交互逻辑
│   ├── contacts/              # 联系人列表
│   ├── search/                # 搜索页
│   ├── settings/              # 设置页
│   └── common/                # 通用图片预览页
├── theme/                     # 颜色、间距与圆角定义
├── utils/                     # 资源选择、平台判断、键盘、文本工具
└── widgets/                   # 头像、毛玻璃、标题等通用组件
```

页面普遍采用 `xxx_page.dart`（UI）+ `xxx_logic.dart`（GetX 控制器）分层。

## 快速开始

### 环境要求

- Dart SDK：`^3.11.0`
- Flutter SDK：`>=3.38.4`（以 `pubspec.lock` 为准）

### 运行

```bash
# 获取依赖（flutter_styled 来自 GitHub，首次拉取需要能访问 GitHub）
flutter pub get

# 运行到当前连接的设备 / 模拟器
flutter run

# 指定平台运行
flutter run -d chrome        # Web
flutter run -d windows       # Windows 桌面
```

### 重新生成应用图标

```bash
dart run flutter_launcher_icons
```

图标源图为项目根目录的 `logo.png`，配置见 `flutter_launcher_icons.yaml`。

## 页面流程

```text
Splash（权限申请 / 登录状态判断）
  ├─ 已登录 → Frame（会话 / 联系人 / 设置）
  │            └─ 会话 → ChatPage → 图片消息 → PreviewImagePage
  └─ 未登录 → Intro → Login → Frame

设置页退出登录 → 清除本地登录标记 → Intro
```

## 数据说明与已知限制

- 本项目是 **UI 演示**：会话、联系人、消息均为本地构造的模拟数据，登录仅做非空校验并写入本地标记；`http` 依赖未实际使用，没有后端接口。
- 部分入口仍为占位实现：联系人点击、搜索、设置中的部分菜单、聊天页工具箱中的文件 / 转账 / 红包 / 收藏、消息上拉加载、长按菜单等。
- 桌面平台限制：`permission_handler`、`wechat_assets_picker`、`wechat_camera_picker` 对桌面端支持有限（尤其是 macOS），图片选择与拍摄功能主要面向移动端。
- Android / iOS 的包名仍是 Flutter 模板默认的 `com.example.almaren`，Android release 也仍使用 debug 签名，上架前需要替换。
- `flutter_styled` 依赖指向 GitHub 仓库 `HEAD`，如需可复现构建建议固定到具体提交。
- 启动时会一次性申请相机、麦克风和相册/存储权限，拒绝授权会影响图片选择与拍摄功能。

## 设计来源与致谢

- UI 设计：Designed by Roman Beliaev
- 设计稿：[Almaren 社交 APP 设计 - MasterGo 社区](https://mastergo.com/community/resource/10124)
- 项目仓库：<https://github.com/944095635/almaren.git>

## 许可证

本项目代码采用 [MIT 许可证](LICENSE)，版权所有 © 2026 DM。完整条款见仓库根目录的 `LICENSE` 文件。

> 该许可证仅覆盖本项目的代码；设计稿、图片等素材版权归原作者所有，第三方依赖遵循各自的许可证。
