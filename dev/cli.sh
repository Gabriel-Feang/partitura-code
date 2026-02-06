export CARGO_NET_GIT_FETCH_WITH_CLI="true"
export VSCODE_CLI_APP_NAME="partitura"
export VSCODE_CLI_BINARY_NAME="partitura-server-insiders"
export VSCODE_CLI_DOWNLOAD_URL="https://github.com/Gabriel-Feang/partitura-code-insiders/releases"
export VSCODE_CLI_QUALITY="insider"
export VSCODE_CLI_UPDATE_URL="https://raw.githubusercontent.com/Gabriel-Feang/partitura-code-versions/refs/heads/master"

cargo build --release --target aarch64-apple-darwin --bin=code

cp target/aarch64-apple-darwin/release/code "../../VSCode-darwin-arm64/Partitura - Insiders.app/Contents/Resources/app/bin/partitura-tunnel-insiders"

"../../VSCode-darwin-arm64/Partitura - Insiders.app/Contents/Resources/app/bin/partitura-insiders" serve-web
