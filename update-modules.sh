#!/usr/bin/env bash

modules=(
    github.com/acroca/go-symbols
    github.com/cweill/gotests/...
    github.com/davidrjenni/reftools/cmd/fillstruct
    github.com/fatih/gomodifytags
    github.com/go-delve/delve/cmd/dlv
    github.com/godoctor/godoctor
    github.com/golangci/golangci-lint/cmd/golangci-lint
    github.com/haya14busa/goplay/cmd/goplay
    github.com/josharian/impl
    github.com/mgechev/revive
    github.com/ramya-rao-a/go-outline
    github.com/rogpeppe/godef
    github.com/sqs/goreturns
    github.com/tylerb/gotype-live
    github.com/zmb3/gogetdoc
    github.com/nsf/gocode
    honnef.co/go/tools/cmd/staticcheck
    mvdan.cc/gofumpt
    github.com/uudashr/gopkgs/cmd/gopkgs

    # https://pkg.go.dev/golang.org/x/tools
    golang.org/x/lint/golint
    golang.org/x/tools/cmd/gorename
    golang.org/x/tools/cmd/guru
    golang.org/x/tools/gopls

    # devtools
    github.com/jondot/goweight
)

for module in "${modules[@]}"; do
    echo -e "  \e[1;32m==>\e[0m installing \e[1;35m$module\e[0m ..."

    go install "$module@latest" &>/dev/null || {
        echo -e "  \e[1;31m[ERROR]\e[0m \e[1;35m$module\e[0m Installation failed" >&2
    }
done

unset modules module

sudo rm -rf ~/.cache/{go,go-build}/
sudo rm -rf ~/.local/share/go/pkg/
