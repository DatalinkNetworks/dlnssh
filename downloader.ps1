# Settings:
$SIGNSSH_VERSION = "0.1.1"

#################################
$URL_AMD64 = "https://github.com/GoodiesHQ/signssh/releases/download/v${SIGNSSH_VERSION}/signssh-windows-amd64.zip"
$URL_ARM64 = "https://github.com/GoodiesHQ/signssh/releases/download/v${SIGNSSH_VERSION}/signssh-windows-arm64.zip"
$FILE_AMD64 = "$PSScriptRoot\signssh-windows-amd64.zip"
$FILE_ARM64 = "$PSScriptRoot\signssh-windows-arm64.zip"

# Download the files if they don't exist
if (-not (Test-Path -Path "$FILE_AMD64" -PathType Leaf)) {
    Invoke-WebRequest -Uri $URL_AMD64 -OutFile "$FILE_AMD64"
    Expand-Archive -Path "$FILE_AMD64" -Force
}
if (-not (Test-Path -Path "$FILE_ARM64" -PathType Leaf)) {
    Invoke-WebRequest -Uri $URL_ARM64 -OutFile "$FILE_ARM64"
    Expand-Archive -Path "$FILE_ARM64" -Force
}
