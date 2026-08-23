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
