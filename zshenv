#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export EDITOR=vim
export VISUAL=vim

export PATH=$PATH:/home/mituk/.local/bin

export LIBGL_ALWAYS_SOFTWARE=1

export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

export _colcon_cd_root=/opt/ros/humble
