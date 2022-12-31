. "$HOME/.cargo/env"

export CLICOLOR=1

pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1"
  fi
}

# Homebrew
export PATH=/opt/homebrew/bin:$PATH
# Out-out of analytics for Homebrew.
export HOMEBREW_NO_ANALYTICS=1



export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=/Users/jingchan/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/jingchan/Library/Android/sdk
#export ANDROID_NDK_HOME=/Users/jingchan/Library/Android/sdk/ndk/21.4.7075529
export ANDROID_NDK_HOME=/Users/jingchan/Library/Android/sdk/ndk/25.1.8937393
export ANDROID_NDK_ROOT=/Users/jingchan/Library/Android/sdk/ndk/25.1.8937393
export OVR_HOME=/Users/jingchan/Code/ovr_sdk_mobile_1.50.0
export OVR_OPENXR_HOME=/Users/jingchan/Code/ovr_openxr_mobile_sdk_44.0/
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$PATH:/Users/jingchan/.bin

# Enabling this may prevent shaderc-rs from building.
#export VULKAN_SDK=/Users/jingchan/VulkanSDK/1.3.224.1/macOS
export VULKAN_SDK=/Users/jingchan/VulkanSDK/1.3.236.0/macOS
export PATH=$PATH:$VULKAN_SDK/bin
#export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:${DYLD_LIBRARY_PATH:-}
export VK_ADD_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
export VK_ICD_FILENAMES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
export VK_DRIVER_FILES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json

# Use direct path since we are disabling $VULKAN_SDK
# export PATH=$PATH:$VULKAN_SDK/bin
#export PATH=$PATH:/Users/jingchan/VulkanSDK/1.3.224.1/macOS/bin

# LLVM (Homebrew)
#export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib"
export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


LIBRARY_PATH+=("$(brew --prefix)/lib")
export LIBRARY_PATH
