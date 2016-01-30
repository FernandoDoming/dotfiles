# Path to Oh My Fish install.
set -gx OMF_PATH "~/.local/share/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -g theme_display_ruby yes
set -g theme_display_user yes
set -g theme_title_display_process yes

# Load autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# Alias
alias apache='sudo apachectl'
alias finder='open'

function http
	printf 'Serving '; pwd
	printf 'Access the following IP: '; ipconfig getifaddr en0
	python -m SimpleHTTPServer $argv 2> /dev/null
end

# Greet
function fish_greeting
	printf 'Welcome '; whoami
	echo '######## Uptime ########'
	uptime
end
