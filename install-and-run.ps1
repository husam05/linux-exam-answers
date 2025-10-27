# Quick GitHub CLI Installer and Setup Launcher
# This script will install GitHub CLI and then run the GUI setup

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub CLI Installer & Setup Launcher" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host

function Install-GitHubCLI {
    Write-Host "Installing GitHub CLI..." -ForegroundColor Yellow
    
    # Method 1: Try winget (Windows 10/11 preferred method)
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Write-Host "Using Windows Package Manager (winget)..." -ForegroundColor Green
        try {
            winget install --id GitHub.cli --accept-package-agreements --accept-source-agreements
            Write-Host "✅ GitHub CLI installed successfully via winget!" -ForegroundColor Green
            return $true
        } catch {
            Write-Host "Winget method failed, trying alternative..." -ForegroundColor Yellow
        }
    } else {
        Write-Host "Winget not available, trying alternative methods..." -ForegroundColor Yellow
    }
    
    # Method 2: Try Chocolatey
    if (Get-Command choco -ErrorAction SilentlyContinue) {
        Write-Host "Using Chocolatey package manager..." -ForegroundColor Green
        try {
            choco install gh -y
            Write-Host "✅ GitHub CLI installed successfully via Chocolatey!" -ForegroundColor Green
            return $true
        } catch {
            Write-Host "Chocolatey method failed, trying manual installation..." -ForegroundColor Yellow
        }
    }
    
    # Method 3: Manual download and install
    Write-Host "Downloading and installing GitHub CLI manually..." -ForegroundColor Green
    try {
        # Detect architecture
        $arch = if ([Environment]::Is64BitOperatingSystem) { "amd64" } else { "386" }
        $downloadUrl = "https://github.com/cli/cli/releases/latest/download/gh_windows_$arch.msi"
        $tempPath = "$env:TEMP\gh_installer.msi"
        
        Write-Host "Downloading from: $downloadUrl" -ForegroundColor Cyan
        Invoke-WebRequest -Uri $downloadUrl -OutFile $tempPath -UseBasicParsing
        
        Write-Host "Running installer (silent installation)..." -ForegroundColor Cyan
        $process = Start-Process msiexec.exe -Wait -PassThru -ArgumentList "/i `"$tempPath`" /quiet /norestart"
        
        if ($process.ExitCode -eq 0) {
            Write-Host "✅ GitHub CLI installed successfully!" -ForegroundColor Green
            
            # Clean up
            Remove-Item $tempPath -Force -ErrorAction SilentlyContinue
            
            # Refresh PATH environment variable
            $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
            
            return $true
        } else {
            Write-Host "❌ Installation failed with exit code: $($process.ExitCode)" -ForegroundColor Red
            return $false
        }
    } catch {
        Write-Host "❌ Manual installation failed: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "Please download and install manually from: https://cli.github.com/" -ForegroundColor Yellow
        Start-Process "https://cli.github.com/"
        return $false
    }
}

# Check if GitHub CLI is already installed
Write-Host "Checking for GitHub CLI..." -ForegroundColor Cyan
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Host "✅ GitHub CLI is already installed!" -ForegroundColor Green
    
    # Check version
    $version = gh --version | Select-String "gh version" | ForEach-Object { $_.ToString().Split()[2] }
    Write-Host "Version: $version" -ForegroundColor Green
} else {
    Write-Host "GitHub CLI not found. Installing now..." -ForegroundColor Yellow
    
    $installed = Install-GitHubCLI
    
    if ($installed) {
        Write-Host "`n✅ Installation completed successfully!" -ForegroundColor Green
        
        # Verify installation
        Start-Sleep -Seconds 2
        if (Get-Command gh -ErrorAction SilentlyContinue) {
            $version = gh --version | Select-String "gh version" | ForEach-Object { $_.ToString().Split()[2] }
            Write-Host "✅ GitHub CLI version $version is now available!" -ForegroundColor Green
        } else {
            Write-Host "⚠️  GitHub CLI installed but may require PowerShell restart" -ForegroundColor Yellow
            Write-Host "Please close and reopen PowerShell, then run this script again" -ForegroundColor Yellow
            Read-Host "Press Enter to exit"
            exit
        }
    } else {
        Write-Host "❌ Installation failed. Please install manually and try again." -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Launching GUI Setup Tool..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Check if GUI script exists
$guiScript = Join-Path $PSScriptRoot "gui-github-setup.ps1"
if (Test-Path $guiScript) {
    Write-Host "Starting GUI setup tool..." -ForegroundColor Green
    Start-Sleep -Seconds 2
    
    # Run the GUI script
    & $guiScript
} else {
    Write-Host "❌ GUI script not found: $guiScript" -ForegroundColor Red
    Write-Host "Please ensure gui-github-setup.ps1 is in the same directory" -ForegroundColor Yellow
    
    # Alternative: Run the command-line version
    $batchScript = Join-Path $PSScriptRoot "github-setup.bat"
    if (Test-Path $batchScript) {
        Write-Host "Found batch script alternative. Would you like to run it? (Y/N)" -ForegroundColor Yellow
        $response = Read-Host
        if ($response -eq 'Y' -or $response -eq 'y') {
            & $batchScript
        }
    }
}

Write-Host "`nSetup launcher completed!" -ForegroundColor Green
Read-Host "Press Enter to exit"