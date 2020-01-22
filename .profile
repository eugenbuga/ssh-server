# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

JAVA_HOME=/usr/local/openjdk-8
PATH=$JAVA_HOME/bin:$PATH

mesg n || true
