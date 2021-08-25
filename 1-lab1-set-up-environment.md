# LAB: How to set up your environment

## Install Azure PowerShell from PowerShell Gallery

### System requirements

Azure PowerShell works with PowerShell 5.1 or higher on Windows, or PowerShell 7 or higher on any platform.
If you are using PowerShell 5 on Windows, you also need .NET Framework 4.7.2 installed.

```powershell
# Install the Az module from the PowerShell Gallery
Install-Module -Name Az -Scope CurrentUser -AllowClobber
```

## Install Visual Studio Code and its extensions

If you're on Windows 7 or greater with the PowerShellGet module installed, you can easily install both Visual Studio Code and the PowerShell extension by running the following command:

```powershell
Install-Script Install-VSCode -Scope CurrentUser; Install-VSCode.ps1
```

[Installation script on GitHub](https://github.com/PowerShell/vscode-powershell/blob/master/scripts/Install-VSCode.ps1)

[Installation script on the PowerShell Gallery](https://www.powershellgallery.com/packages/Install-VSCode/)

Manually install [Visual Studio Code](https://code.visualstudio.com/#alt-downloads)

Recommended installation package for Windows: User Installer (64-bit)

## Visual Studio Code extensions

Search Extensions (Ctrl+Shift+X)

[PowerShell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)

[Azure CLI Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli)

[Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account) (On Windows, it requires [Node.js 6 or later](https://nodejs.org/en/) for Cloud Shell)

[Azure Resource Manager (ARM) Tools](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools)

[Bicep](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep)

[Azure Storage](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurestorage)

```powershell
# Installation of the Visual Studio Code extensions from the command line
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.azure-account
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension ms-azuretools.vscode-bicep
code --install-extension ms-azuretools.vscode-azurestorage
```

## Azure Cloud Shell

Configure [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview)

## SSH Client

Go to the Settings > Apps > Apps & features > Optional features > Add a feature > OpenSSH Client > Install.

```powershell
# You need to start PowerShell with the "Run as Admin" option
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
 
# Install the OpenSSH Client
Add-WindowsCapability -Name OpenSSH.Client~~~~0.0.1.0 -Online 
```

After installing the OpenSSH Client, you can now use the SSH client from PowerShell or the Command Prompt.

## Windows Package Manager (winget)

Download `Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle` file from https://github.com/microsoft/winget-cli/releases

```powershell
# Open Windows PowerShell
Add-AppxPackage -Path .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
```

### Installing various tools using winget

```powershell
# Install PowerShell 7 (optional)
winget install Microsoft.PowerShell

# Install Windows Terminal
winget install Microsoft.WindowsTerminal

# Install Azure CLI
winget install microsoft.azurecli

# Install Bicep
winget install microsoft.bicep

# Install Git-related CLI tools
winget install Git.Git
winget install GitHub.cli
```