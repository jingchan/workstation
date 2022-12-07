. "$HOME/.cargo/env"

export CLICOLOR=1

# Homebrew
export PATH=/opt/homebrew/bin:$PATH
# Out-out of analytics for Homebrew.
export HOMEBREW_NO_ANALYTICS=1



export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/jingchan/Library/Android/sdk
#export ANDROID_NDK_HOME=/Users/jingchan/Library/Android/sdk/ndk/21.4.7075529
export ANDROID_NDK_HOME=/Users/jingchan/Library/Android/sdk/ndk/25.1.8937393
export ANDROID_NDK_ROOT=/Users/jingchan/Library/Android/sdk/ndk/25.1.8937393
# Enabling this will prevent shaderc-rs from building.
#export VULKAN_SDK=/Users/jingchan/VulkanSDK/1.3.224.1/macOS
export OVR_HOME=/Users/jingchan/Code/ovr_sdk_mobile_1.50.0
export OVR_OPENXR_HOME=/Users/jingchan/Code/ovr_openxr_mobile_sdk_44.0/
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$PATH:/Users/jingchan/.bin

# Use direct path since we are disabling $VULKAN_SDK
# export PATH=$PATH:$VULKAN_SDK/bin
#export PATH=$PATH:/Users/jingchan/VulkanSDK/1.3.224.1/macOS/bin

## LLVM (Homebrew)
#export LDFLAGS="$LDFLAGS:-L/opt/homebrew/opt/llvm/lib"
#export LDFLAGS="$LDFLAGS:-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
#export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

