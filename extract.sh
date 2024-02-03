function extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)  tar xjf "$1"   ;;
            *.tar.gz)   tar xzf "$1"   ;;
            *.bz2)      bunzip2 "$1"   ;;
            *.rar)      unrar x "$1"   ;;
            *.gz)       gunzip "$1"    ;;
            *.tar)      tar xf "$1"    ;;
            *.tbz2)     tar xjf "$1"   ;;
            *.tgz)      tar xzf "$1"   ;;
            *.zip)      unzip "$1"     ;;
            *.Z)        uncompress "$1" ;;
            *.7z)       7z x "$1"      ;;
            *.deb)      dpkg -i "$1"   ;;
            *.tar.xz)   tar xf "$1"    ;;
            *)          echo -e "\033[1;31mFile format not supported\033[0m" ;;
        esac
    else
        echo -e "\033[1;31mFile not found\033[0m"
    fi
}

#\033[1;31m sets the text to bold and colour to red
#\033[0m closes the text setting 