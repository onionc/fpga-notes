## vivado 的版本控制

直接上传vivado工程的时候，就算使用了xilinx.gitignore忽略文件也还是有问题，其中block design被忽略导致很多依赖的文件没有，再拉下来编译会报错，不忽略的又会很大。


上层新建两个目录

- pl_prj 	存放 vivado 创建的 FPGA 项目
- ps_app	存放 vitis/sdk创建的 ARM 项目，xilinx 19之前叫sdk，之后叫vitis，这里用app来命名

ps项目通过pl的xsa来创建，以及管理源码即可。这里主要来分析vivado项目的目录结构

- Vivado
   - src
      - xdc
         - xxx.xdc
         - xxx.ucf
      - hdl
         - xxx.v
      - bd
         - xxx.tcl
   - ip_repo
      - xxx
   - build.tcl
   - build.bat (build.sh)

## 保存文件
### 导出bd的tcl
打开block design，File -> Export -> Export Block Design, 保存为 src/bd/design_1.tcl

### 导出项目tcl文件 
File -> Project -> Write Tcl，保存为build.tcl。


这里需要注意一下，为了避免其他路径问题，保存到项目根目录即可。
### 保存xdc及其他所需文件
保存xdc文件到相应目录（以及其他缺少的文件，查看build.tcl会看到引用的文件）

## 修改脚本
### origin_dir
```c
set origin_dir "."
```
修改为：
```c
set origin_dir [file dirname [info script]]
```

### block design 相关
```c
# Import local files from the original project
set files [list \
 [file normalize "${origin_dir}/xxx/xxx.srcs/sources_1/bd/design_1/design_1.bd" ]\
 [file normalize "${origin_dir}/xxx/xxx.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v" ]\
]
set imported_files [import_files -fileset sources_1 $files]

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
set file "design_1/design_1.bd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "registered_with_manager" -value "1" -objects $file_obj

```
修改为
```c
# Import local files from the original project
source $origin_dir/src/bd/design_1.tcl

# generate the wrapper
set design_name [get_bd_designs]
make_wrapper -files [get_files $design_name.bd] -top -import

```

### xdc 文件路径修改
原始配置：
```c
# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/xxx/constrs_1/new/pin.xdc"]"
set file_imported [import_files -fileset constrs_1 [list $file]]
set file "new/pin.xdc"
```
从上面的配置可以看到我这个项目中 pin.xdc 在new目录下（constrs_1/new/）， 但是不知道怎么生成new目录，修改为下面的倒是可以正常编译
```c
set file [file normalize "${origin_dir}/src/xdc/pin.xdc"]
set file_imported [import_files -fileset constrs_1 [list $file]]
set file "pin.xdc"
```
最终导入到项目中的不是原始的 constrs_1/new 目录，而是 constrs_1\imports\xdc 目录，再链接到项目的constrs_1 下，还是没有new目录。
虽说编译没问题，但是后续脚本里面可能还修改了pin.xdc属性，也都是使用 new/pin.xdc 路径来引用的。

最后实践出来，原始项目中的依赖不要添加子文件夹，就放到 prjnamexxx.srcs\constrs_1 下，然后生成的项目中修改xdc路径，以及用到的xdc都把前缀（可能是目录中的，如果没有目录也默认会有constrs_1前缀）删了使用。

## tcl 生成项目
恢复项目很简单，只需要打开vivado，tcl 窗口
切换目录：
```c
cd E:/xxx/test
```
执行tcl 脚本：
```c
source ./build.tcl
```

还要很多文件没有用到，只用到了xdc依赖文件，后续如果碰到特殊的问题，再来记录。普通的路径问题都能通过运行时的报错来发现。

参考：

- [git 管理vivado工程， tcl 恢复vivado工程](https://blog.csdn.net/weixin_39060517/article/details/135391234)
- [使用Git进行Vivado版本控制](https://blog.csdn.net/qq_41332806/article/details/110715083)
- [Version control for Vivado projects](https://www.fpgadeveloper.com/2014/08/version-control-for-vivado-projects.html/)
