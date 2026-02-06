<div id="partitura-logo" align="center">
    <br />
    <img src="./icons/stable/codium_cnl.svg" alt="Partitura Logo" width="200"/>
    <h1>Partitura</h1>
    <h3>AI Agent Orchestration Code Editor built on VS Code</h3>
</div>

<div id="badges" align="center">

[![current release](https://img.shields.io/github/release/Gabriel-Feang/partitura-code.svg)](https://github.com/Gabriel-Feang/partitura-code/releases)
[![license](https://img.shields.io/github/license/Gabriel-Feang/partitura-code.svg)](https://github.com/Gabriel-Feang/partitura-code/blob/master/LICENSE)

</div>

**Partitura is a customized build of VS Code designed for AI agent orchestration. It provides a code editing environment integrated with the Partitura agent management system.**

## Table of Contents

- [Download/Install](#download-install)
  - [Install with Brew](#install-with-brew)
- [Build](#build)
- [About](#about)
- [Supported Platforms](#supported-platforms)

## <a id="download-install"></a>Download/Install

Download latest release here:
[stable](https://github.com/Gabriel-Feang/partitura-code/releases) or
[insiders](https://github.com/Gabriel-Feang/partitura-code-insiders/releases)

#### <a id="install-with-brew"></a>Install with Brew (Mac)

If you are on a Mac and have [Homebrew](https://brew.sh/) installed:
```bash
# stable
brew install --cask partitura
```

## <a id="build"></a>Build

Build instructions can be found [here](https://github.com/Gabriel-Feang/partitura-code/blob/master/docs/howto-build.md)

## <a id="about"></a>About

Partitura is an AI agent orchestration system with a Go backend and Flutter desktop frontend. This repository contains the build scripts and customizations for the code editor component, based on Microsoft's VS Code.

The build scripts clone Microsoft's vscode repo, apply Partitura customizations, run the build commands, and produce the final binaries. These binaries are licensed under the MIT license. Telemetry is disabled.

## <a id="supported-platforms"></a>Supported Platforms

- [x] macOS (`zip`, `dmg`) macOS 10.15 or newer x64
- [x] macOS (`zip`, `dmg`) macOS 11.0 or newer arm64
- [x] GNU/Linux x64 (`deb`, `rpm`, `AppImage`, `snap`, `tar.gz`)
- [x] GNU/Linux arm64 (`deb`, `rpm`, `snap`, `tar.gz`)
- [x] Windows 10 / Server 2012 R2 or newer x64
- [x] Windows 10 / Server 2012 R2 or newer arm64

## <a id="license"></a>License

[MIT](https://github.com/Gabriel-Feang/partitura-code/blob/master/LICENSE)
