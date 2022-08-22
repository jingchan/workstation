. "$HOME/.cargo/env"

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/jingchan/Library/Android/sdk
export ANDROID_NDK_HOME=/Users/jingchan/Library/Android/sdk/ndk/25.0.8775105
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# Python
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH

# Gradle
export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')

