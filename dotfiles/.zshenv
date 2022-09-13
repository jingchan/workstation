. "$HOME/.cargo/env"

export CLICOLOR=1

# Out-out of analytics for Homebrew.
export HOMEBREW_NO_ANALYTICS=1

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/jingchan/Library/Android/sdk
#export ANDROID_NDK_HOME=/Users/jingchan/Library/Android/sdk/ndk/21.4.7075529
#export ANDROID_NDK_HOME=/Users/jingchan/Library/Android/sdk/ndk/25.1.8937393
export OVR_HOME=/Users/jingchan/Code/ovr_sdk_mobile_1.50.0
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$PATH:/Users/jingchan/.bin

# LLVM
#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

