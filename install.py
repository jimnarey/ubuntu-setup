import os
import subprocess
import fileinput


def runcmd(cmd):
    """
    :type cmd: basestring
    """
    cmd_list = cmd.split()
    cmd_out = subprocess.Popen(cmd_list, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    stout, sterr = cmd_out.communicate()
    return sterr if sterr else stout


# def replace_in_file(filepath, findtext, replacetext):
#     with fileinput.FileInput(filepath, inplace=True, backup='.bak') as file:
#         for line in file:
#             print(line.replace(findtext, replacetext), end='')


def append_to_file(filepath, lines):
    with open(filepath, 'a') as file:
        for line in lines:
            file.write(line)


# Gallium section
# replace_in_file('/etc/apt/preferences.d/galliumos.pref', '900', '1')

# NVM Section
# nvm_zshrc = ['export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"',
#              '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"',
#              '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"']

# rbenv section
# rbenv_zshrc = ['export PATH=$HOME/.rbenv/bin:$PATH']

print(os.environ['SUDO_USER'])
