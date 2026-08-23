# ========================
# Locale (English output)
# ========================
export LANG=en_US.UTF-8
unset LC_ALL

# ========================
# Editor
# ========================
export EDITOR=vim
export VISUAL=vim

# ========================
# Environment
# ========================
export PATH=$PATH:/home/mituk/.local/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

if (( $+commands[ccache] )); then
  export CC=/usr/lib/ccache/gcc
  export CXX=/usr/lib/ccache/g++
  export CCACHE_DIR=$HOME/.cache/ccache/
fi

export _colcon_cd_root=/opt/ros/humble

export RCUTILS_COLORIZED_OUTPUT=1

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=file://$HOME/cyclonedds.xml

export IGN_GAZEBO_SYSTEM_PLUGIN_PATH=${IGN_GAZEBO_SYSTEM_PLUGIN_PATH:+$IGN_GAZEBO_SYSTEM_PATH:}/opt/ros/humble/lib
export IGN_IP=127.0.0.1

export CMAKE_PREFIX_PATH="/opt/acados${CMAKE_PREFIX_PATH:+:$CMAKE_PREFIX_PATH}"
export ACADOS_SOURCE_DIR="/opt/acados"
export LD_LIBRARY_PATH="/opt/acados/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

export STM32CLT_PATH=/opt/st/stm32cubeclt_1.20.0
export OOEDO_LIBRARY_PATH=$HOME/workspace/ooedo/lib
export OOEDO_STM32_DRIVER_PATH=$HOME/workspace/ooedo/stm32-driver
