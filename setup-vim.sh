#!/bin/bash

function command_check () {
  cmd=$1 ; exists=$(command -v $cmd >/dev/null 2>&1)
  if [ $? -eq 0 ]; then echo "$cmd exists."
  else echo "$cmd does not exist! Install it and try again. Aborting."; exit -1
  fi
}

# Check if necessary commands exist.
echo "Checking for required commands on the system."
commands=(git curl wget)
for command in ${commands[*]}; do
  command_check $command
done

# Make necessary directories under ~/.vim.
echo "Creating directories under ~/.vim."
mkdir $HOME/.vim          > /dev/null 2>&1
mkdir $HOME/.vim/colors   > /dev/null 2>&1
mkdir $HOME/.vim/autoload > /dev/null 2>&1
mkdir $HOME/.vim/bundle   > /dev/null 2>&1

# Save project directory.
SETUP_VIM_DIRECTORY=$(PWD)

# Pathogen plugin.
echo "Installing the Pathogen plugin."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim > /dev/null 2>&1

# Autopair plugin.
echo "Installing the Autopair plugin."
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs > /dev/null 2>&1

# Command-T plugin.
echo "Installing the Command-T plugin."
cd ~/.vim && git clone https://github.com/wincent/command-t.git bundle/command-t

# Gruvbox color scheme.
echo "Installing the Gruvbox color scheme."
wget -O ~/.vim/colors/gruvbox.vim \
https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim > /dev/null 2>&1

# Copy _.vimrc to ~/.vimrc.
echo ""
echo "Overwriting ~/.vimrc."
cp $SETUP_VIM_DIRECTORY/_.vimrc $HOME/.vimrc

echo "If everything went well, a basic Vim environment should be set up!"
echo ""
echo "Make sure TERM set to 'xterm-256color' or some equivalent."
echo "It is currently set to:" $(echo $TERM)"."
echo ""
echo "Use one of the following as a hacky way to enable terminal colors:"
echo "GNU/Linux: echo TERM=xterm-256color >> ~/.bashrc"
echo "macOS:     echo TERM=xterm-256color >> ~/.bash_profile"
echo "Restart your shell or source your config after running one of the above."
echo ""
echo "Some installed plugins may need further compilation/setup."
echo "Refer to the documentation of any plugins that do not function properly."
