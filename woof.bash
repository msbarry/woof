#################################
#  _       ______  ____  ______ #
# | |     / / __ \/ __ \/ ____/ #
# | | /| / / / / / / / / /_     #
# | |/ |/ / /_/ / /_/ / __/     #
# |__/|__/\____/\____/_/        #
#################################

# Some utilities for sending notifiations to yourself from the command line
# (mac only). Just add them to your ~/.bashrc and fill in these parameters.
# See them all in action:
#
# music <long running command> && woof command succeeed || woof command failed
 
TWITTER_HANDLE= # twitter handle
EMAIL_ADDRESS= # email address
CELL_EMAIL_ADDRESS= # email address for your cell phone (ie 1234567890@vtext.com)
TERMINAL_APP="com.apple.Terminal" # replace with iterm if you use that
THEME_SONG="~/waiting.mp3" # replace with a path to your theme song
                           # we recommend jeopardy
 
 
# play music file in THEME_SONG continuously
playmusic() {
  if [ ! -f ${THEME_SONG} ]
  then
    echo "You need to download a theme song to ${THEME_SONG}.  We recommend the jeopardy theme"
  else
    while :; do afplay ${THEME_SONG}; done;
  fi
}
 
# Play your theme song until a command finishes
# Usage: music git status
music() {
  playmusic &
  tokill=$!
  echo $tokill
  $*;
  kill $tokill
  killall afplay
}
 
# Display a growl notification (install https://github.com/alloy/terminal-notifier first)
# Usage: notify your job just finished
notify() {
  terminal-notifier -title "$*" -message "$*" -activate ${TERMINAL_APP} # replace with iterm if you use that
}
 
# Send yourself a text 
# Usage: text your job just finished
text() {
  echo "$*" | mail -s "" ${CELL_EMAIL_ADDRESS}
}
 
# Send a tweet (set up https://github.com/twitter/twurl first)
# Usage: tweet my job just finished
tweet() {
  twurl -d "status=$*" /1.1/statuses/update.json
}
 
# Send yourself a twitter direct message (set up https://github.com/twitter/twurl first)
# Usage: dm_me your job just finished
dm_me() {
  twurl -d "text=$*&screen_name=${TWITTER_HANDLE}" /1.1/direct_messages/new.json
}
 
# Send yourself an email
# Usage: email your job just finished
email() {
  echo "$*" | mail -s "" ${EMAIL_ADDRESS}
}
 
# Also note that the "say" command is built into mac osx
# Usage: say your job just finished
 
# Send yourself a message by all available means
# Usage: woof your job just finished
woof() {
  email $*
  dm_me $*
  text $*
  notify $*
  say $*
  # uncomment this if you want to tweet as well:
  # tweet $*
}