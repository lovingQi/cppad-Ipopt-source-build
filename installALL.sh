#!/bin/bash

############################
# 0前置库安装
sudo apt-get install libblas-dev liblapack-dev libmetis-dev gfortran

###########################
# 1进入 ThirdParty-ASL 目录
cd ThirdParty-ASL || { echo "Failed to change directory to ThirdParty-ASL"; exit 1; }

# 执行 get.ASL 脚本
#./get.ASL || { echo "Failed to run ./get.ASL"; exit 1; }

# 运行 configure 脚本
./configure || { echo "Failed to run ./configure"; exit 1; }

# 运行 make
make || { echo "Failed to run make"; exit 1; }

# 运行 sudo make install
sudo make install || { echo "Failed to run sudo make install"; exit 1; }

echo "ASL installation completed successfully."
#################################################################################

# 2进入 ThirdParty-HSL 目录
cd ../ThirdParty-HSL || { echo "Failed to change directory to ThirdParty-HSL"; exit 1; }

# 运行 configure 脚本
./configure || { echo "Failed to run ./configure"; exit 1; }

# 运行 make
make || { echo "Failed to run make"; exit 1; }

# 运行 sudo make install
sudo make install || { echo "Failed to run sudo make install"; exit 1; }

echo "HSL installation completed successfully."
#################################################################################
# 3进入 ThirdParty-Mumps 目录并安装
echo "Entering ThirdParty-Mumps directory and installing..."
cd ../ThirdParty-Mumps || { echo "Failed to change directory to ThirdParty-Mumps"; exit 1; }

# 执行 get.Mumps 脚本
#./get.Mumps || { echo "Failed to run ./get.Mumps"; exit 1; }

# 运行 configure 脚本
./configure || { echo "Failed to run ./configure"; exit 1; }

# 运行 make
make || { echo "Failed to run make"; exit 1; }

# 运行 sudo make install
sudo make install || { echo "Failed to run sudo make install"; exit 1; }

echo "Mumps installation completed successfully."
#################################################################################
# 4进入 ipopt 目录并安装
echo "Entering Ipopt directory and installing..."
cd ../Ipopt || { echo "Failed to change directory to Ipopt"; exit 1; }


# 运行 configure 脚本
./configure || { echo "Failed to run ./configure"; exit 1; }

# 运行 make
make || { echo "Failed to run make"; exit 1; }

# 运行 sudo make install
sudo make install || { echo "Failed to run sudo make install"; exit 1; }

echo "ipopt installation completed successfully."
#################################################################################
# 5进入 cppad目录并安装
cd ../CppAD || { echo "Failed to change directory to Ipopt"; exit 1; }
# 进入构建目录
cd build || { echo "Failed to change directory to build"; exit 1; }

# 执行 CMake 配置
cmake .. || { echo "Failed to run cmake"; exit 1; }

# 编译项目
make

# 安装项目
sudo make install
echo "All installation completed successfully."

