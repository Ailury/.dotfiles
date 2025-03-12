check_and_add_string() {
    local string=$1
    local file="$HOME/.zshrc"
    string=$(eval echo "$string")
    
    # Check if the source exists in the zshrc
    if ! grep -qF -- "$string" "$file"; then
        printf "%s\n" "$string" >> "$file"
        echo "String added to file."
    else
        echo "Source already exists in file"
    fi
}

touch $HOME/.zshrc
zsh_plugin_dir=$HOME/.zsh
mkdir $zsh_plugin_dir
# Install theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $zsh_plugin_dir/powerlevel10k
plugin='source ${zsh_plugin_dir}/powerlevel10k/powerlevel10k.zsh-theme'
check_and_add_string $plugin

git clone https://github.com/zsh-users/zsh-autosuggestions $zsh_plugin_dir/zsh-autosuggestions
plugin='source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'
check_and_add_string $plugin

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_plugin_dir/zsh-syntax-highlighting
plugin='source ${zsh_plugin_dir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
check_and_add_string $plugin
