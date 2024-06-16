set tclPath [pwd]
cd $tclPath
cd ..
set projpath [pwd]
puts "Current workspace is $projpath"
setws $projpath
getws
set xsaName design_1_wrapper
set app0Name app
set xsafilePath "${projpath}/../hw/${xsaName}.xsa"
puts "hw is ${xsafilePath}"
#Create a new platform
#platform create -name $xsaName -hw $projpath/$xsaName.xsa -proc {ps7_cortexa9_0} -os {standalone}   -out $projpath
platform create -name $xsaName -hw $xsafilePath -proc {ps7_cortexa9_0} -os {freertos10_xilinx}   -out $projpath

importprojects $projpath/$xsaName
platform active $xsaName
repo -add-platforms $xsaName
 
domain active

#Create a new application
#app create -name $app0Name -platform $xsaName -domain standalone_domain -template "Empty Application"
app create -name $app0Name -platform $xsaName -domain freertos10_xilinx_domain -template "Empty Application"
importsources -name $app0Name -path $tclPath/src/$app0Name

#Build platform project
platform generate
#Build application project
#append app0Name "_system"
set app0PrjName "${app0Name}_system"
puts "build application project :$app0PrjName"
sysproj build -name $app0PrjName