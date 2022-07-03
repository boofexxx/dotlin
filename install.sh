#!/usr/bin/env zsh

CWD="`dirname $(readlink -f $0)`"
CPATH="${HOME}/.config"

COMP=('go' 'zig' 'clang' 'gcc' 'gdb' 'valgrind' 'make' 'cmake' 'pkg-config')
TOOLS=('wget' 'curl' 'htop' 'neovim' 'git' 'zsh' 'ccls' 'zls' 'zellij' 'ripgrep' 'jq')

function linkup() {
    if [ -e ${HOME}/.zshrc ]; then
        mv ${HOME}/.zshrc ${HOME}/.zshrc~
    fi
    if [ -e ${HOME}/.zprofile ]; then
        mv ${HOME}/.zprofile ${HOME}/.zprofile~
    fi
    if [ -e ${HOME}/.gitconfig ]; then
        mv ${HOME}/.gitconfig ${HOME}/.gitconfig~
    fi
    if [ -e ${CPATH}/nvim ]; then
        mv ${CPATH}/nvim ${CPATH}/nvim~
    fi
    if [ -e ${CPATH}/zellij ]; then
        mv ${CPATH}/zellij ${CPATH}/zellij~
    fi
    if [ -e ${CPATH}/alacritty ]; then
        mv ${CPATH}/alacritty ${CPATH}/alacritty~
    fi
    ln -s ${CWD}/zshrc       ${HOME}/.zshrc
    ln -s ${CWD}/zprofile    ${HOME}/.zprofile
    ln -s ${CWD}/gitconfig   ${HOME}/.gitconfig
    ln -s ${CWD}/nvim        ${CPATH}/nvim
    ln -s ${CWD}/zellij      ${CPATH}/zellij
    ln -s ${CWD}/x/alacritty ${CPATH}/alacritty
}

function cleanup() {
    rm -f ${HOME}/.zshrc
    rm -f ${HOME}/.zprofile
    rm -f ${HOME}/.gitconfig
    rm -f ${CPATH}/nvim
    rm -f ${CPATH}/zellij
    rm -f ${CPATH}/alacritty
}

function main() {
    if [ ! -e ${CPATH} ]; then
        mkdir ${CPATH}
    fi
    cleanup
    linkup
}

main
