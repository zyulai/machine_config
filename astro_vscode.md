# AstroNvim风格Cursor快捷键配置指南

## 📋 概述

这个配置文件将AstroNvim的核心快捷键映射到Cursor编辑器中，让习惯了AstroNvim的用户能够在Cursor中使用熟悉的快捷键。

## 🚀 安装步骤

### 1. 打开Cursor的快捷键设置
- 使用快捷键：`Cmd/Ctrl + Shift + P`
- 输入："Open Keyboard Shortcuts (JSON)"
- 选择 "Preferences: Open Keyboard Shortcuts (JSON)"

### 2. 替换配置文件
- 将提供的 `keybindings.json` 内容完全替换到打开的文件中
- 保存文件 (`Cmd/Ctrl + S`)

### 3. 重启Cursor
- 重启Cursor以确保所有快捷键生效

## 🎯 主要快捷键映射

### 通用操作
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `Space` | 领导键 | `Space` |
| `Ctrl + s` | 保存文件 | `Ctrl + s` |
| `Ctrl + q` | 退出 | `Ctrl + q` |
| `Space + n` | 新文件 | `Space + n` |
| `Space + c` | 关闭缓冲区 | `Space + c` |
| `Space + /` | 切换注释 | `Space + /` |

### 窗口导航
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `Ctrl + h` | 左窗口 | `Ctrl + h` |
| `Ctrl + j` | 下窗口 | `Ctrl + j` |
| `Ctrl + k` | 上窗口 | `Ctrl + k` |
| `Ctrl + l` | 右窗口 | `Ctrl + l` |
| `\\` | 水平分割 | `\\` |
| `\|` | 垂直分割 | `Shift + \\` |

### 文件查找 (Space + f)
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `Space + ff` | 查找文件 | `Space + f f` |
| `Space + fw` | 实时搜索 | `Space + f w` |
| `Space + fb` | 缓冲区列表 | `Space + f b` |
| `Space + fo` | 最近文件 | `Space + f o` |
| `Space + fC` | 命令面板 | `Space + f C` |
| `Space + fk` | 快捷键设置 | `Space + f k` |

### LSP功能 (Space + l)
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `K` | 悬停文档 | `K` |
| `Space + lf` | 格式化文档 | `Space + l f` |
| `Space + la` | 代码操作 | `Space + l a` |
| `Space + lr` | 重命名 | `Space + l r` |
| `Space + ls` | 文档符号 | `Space + l s` |
| `Space + lG` | 工作区符号 | `Space + l G` |
| `gd` | 转到定义 | `g d` |
| `gD` | 转到声明 | `g D` |
| `grr` | 查找引用 | `g r r` |
| `gy` | 类型定义 | `g y` |

### 缓冲区管理 (Space + b)
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `]b` | 下一个缓冲区 | `] b` |
| `[b` | 上一个缓冲区 | `[ b` |
| `Space + bb` | 缓冲区选择器 | `Space + b b` |
| `Space + bc` | 关闭其他缓冲区 | `Space + b c` |
| `Space + bC` | 关闭所有缓冲区 | `Space + b C` |

### 文件树 (Neo-tree)
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `Space + e` | 切换文件浏览器 | `Space + e` |
| `Space + o` | 聚焦文件浏览器 | `Space + o` |

### 终端 (Space + t)
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `Space + tf` | 浮动终端 | `Space + t f` |
| `Space + th` | 水平终端 | `Space + t h` |
| `Space + tv` | 垂直终端 | `Space + t v` |
| `F7` | 切换终端 | `F7` |

### Git操作 (Space + g)
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `Space + gt` | Git状态 | `Space + g t` |
| `Space + gb` | Git分支 | `Space + g b` |
| `Space + gc` | Git提交 | `Space + g c` |

### 调试 (Space + d)
| AstroNvim | 功能 | Cursor映射 |
|-----------|------|------------|
| `Space + dc` | 开始/继续调试 | `Space + d c` |
| `Space + db` | 切换断点 | `Space + d b` |
| `Space + do` | 单步跳过 | `Space + d o` |
| `Space + di` | 单步进入 | `Space + d i` |
| `Space + dO` | 单步跳出 | `Space + d O` |

### AI功能 (Cursor特有)
| 快捷键 | 功能 |
|--------|------|
| `Space + a i` | AI聊天 |
| `Space + a g` | AI生成代码 |
| `Space + a c` | AI作曲家 |

## ⚠️ 重要注意事项

### 1. Cursor默认快捷键冲突
此配置会禁用以下Cursor默认快捷键：
- `Cmd/Ctrl + K` (原AI生成代码)
- `Cmd/Ctrl + L` (原新建聊天)
- `Cmd/Ctrl + Shift + K` (原终端AI生成)

### 2. macOS vs Windows/Linux
- 配置文件中的 `cmd` 键在Windows/Linux上对应 `ctrl` 键
- 大部分快捷键使用 `ctrl` 来保持跨平台兼容性

### 3. 可能的问题和解决方案

#### 问题1：某些快捷键不工作
**解决方案：**
1. 检查是否与系统快捷键冲突
2. 确保Cursor处于焦点状态
3. 重启Cursor

#### 问题2：AI功能快捷键冲突
**解决方案：**
- AI功能已重新映射到 `Space + a` 开头的组合键
- 可以根据个人喜好修改这些映射

#### 问题3：Space键作为领导键不工作
**解决方案：**
1. 确保没有其他插件占用Space键
2. 检查快捷键设置中是否正确配置
3. 可能需要安装Which Key插件来增强Space键体验

## 🔧 自定义配置

如果需要修改某些快捷键，请：

1. 打开快捷键设置 (`Space + f k`)
2. 搜索对应的命令
3. 修改键绑定
4. 保存并重启Cursor

## 📝 反馈和改进

如果发现任何问题或有改进建议，请：
1. 检查快捷键是否与系统或其他应用冲突
2. 尝试重启Cursor
3. 查看Cursor的输出面板获取错误信息

## 🎉 享受使用

现在您可以在Cursor中享受熟悉的AstroNvim快捷键体验了！这个配置旨在让从AstroNvim迁移到Cursor的用户能够快速适应，同时保持高效的编码体验。
