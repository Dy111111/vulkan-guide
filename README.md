# Vulkan Guide 学习记录

这是我的 Vulkan 学习仓库，基于
[vblanco20-1/vulkan-guide](https://github.com/vblanco20-1/vulkan-guide)
创建，用于记录练习代码，并在不同电脑之间同步学习进度。

当前主要学习分支为 `starting-point-2`。

## 当前进度

- 创建 SDL 窗口
- 初始化 Vulkan 1.3 实例
- 创建调试 Messenger 和 Window Surface
- 选择支持所需 Vulkan 1.2/1.3 特性的物理设备
- 创建 Vulkan 逻辑设备
- 为 Swapchain、Command 和同步对象初始化预留接口

## 开发环境

- Windows
- Visual Studio 2022（安装“使用 C++ 的桌面开发”）
- CMake
- Vulkan SDK

项目使用 C++20，第三方依赖已经包含在 `third_party` 目录中。

## 构建和运行

在仓库根目录执行：

```powershell
cmake -S . -B build
cmake --build build --config Debug
.\bin\Debug\engine.exe
```

Release 构建：

```powershell
cmake --build build --config Release
.\bin\Release\engine.exe
```

## 项目结构

```text
assets/       运行时资源
shaders/      GLSL Shader
src/          Vulkan 引擎源码
third_party/  第三方依赖
CMakeLists.txt
```

## 在不同电脑间同步

开始学习前，先获取最新代码：

```powershell
git switch starting-point-2
git pull
```

完成一段学习内容后提交并推送：

```powershell
git add .
git commit -m "描述本次学习内容"
git push
```

如果电脑上还没有这个仓库：

```powershell
git clone https://github.com/Dy111111/vulkan-guide.git
cd vulkan-guide
git switch starting-point-2
```

## 远程仓库

- `origin`：我的学习仓库
- `upstream`：原始 Vulkan Guide 教程仓库

获取原教程的最新变化：

```powershell
git fetch upstream
```

本仓库用于个人学习。原项目的版权和许可信息请参阅
[LICENSE.txt](LICENSE.txt)。
