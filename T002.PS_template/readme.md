## Vitis 的版本管理

目录如下：

```
auto_create_vitis/                    # 自动化运行的文件
   │         ├── build_vitis.bat               # 批处理文件
   │         ├── build_vitis.tcl                 # vitis工程tcl脚本化文件
   │         └── src/                       # 源文件
   │             ├── app/             # Application project（需要的创建的应用工程）
   │             │     └── *.c           # c代码源文件
   │             ├── app_n.../           # Application project（需要的创建的应用工程）
   │             │     └── *.c
   │
   └──  design_1_wrapper.xsa             # vivado导出的硬件信息文件
```







### 使用步骤

1. 备份现有项目

- 把源代码放到src/appx目录下。

- vivado生成硬件描述信息的 xsa文件（选择包含bit），替换 design_1_wrapper.xsa 文件

  

2. 恢复项目

- 修改 build_vitis.bat 中的 vitis 安装路径
- 将需要增加的代码添加进src/appx 目录下
- 根据需要修改 build_vitis.tcl  中的生成信息（平台、模板等）
- 运行 build_vitis.bat ，即可自动生成vitis项目