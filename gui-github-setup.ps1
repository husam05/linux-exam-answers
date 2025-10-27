# GUI Setup Tool for GitHub Exam QR Codes
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "GitHub Exam QR Code Setup"
$form.Size = New-Object System.Drawing.Size(600, 700)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::WhiteSmoke

# Title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$titleLabel.Size = New-Object System.Drawing.Size(560, 30)
$titleLabel.Text = "Automated GitHub Repository Setup for Exam QR Codes"
$titleLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::DarkBlue
$form.Controls.Add($titleLabel)

# Progress TextBox
$progressBox = New-Object System.Windows.Forms.TextBox
$progressBox.Location = New-Object System.Drawing.Point(20, 60)
$progressBox.Size = New-Object System.Drawing.Size(560, 300)
$progressBox.Multiline = $true
$progressBox.ScrollBars = "Vertical"
$progressBox.ReadOnly = $true
$progressBox.BackColor = [System.Drawing.Color]::Black
$progressBox.ForeColor = [System.Drawing.Color]::Lime
$progressBox.Font = New-Object System.Drawing.Font("Consolas", 9)
$form.Controls.Add($progressBox)

# Function to add progress text
function Add-Progress($text, $color = "Lime") {
    $progressBox.AppendText("$text`r`n")
    $progressBox.SelectionStart = $progressBox.TextLength
    $progressBox.ScrollToCaret()
    $form.Refresh()
}

# Repository Name Input
$repoLabel = New-Object System.Windows.Forms.Label
$repoLabel.Location = New-Object System.Drawing.Point(20, 380)
$repoLabel.Size = New-Object System.Drawing.Size(120, 20)
$repoLabel.Text = "Repository Name:"
$form.Controls.Add($repoLabel)

$repoTextBox = New-Object System.Windows.Forms.TextBox
$repoTextBox.Location = New-Object System.Drawing.Point(150, 378)
$repoTextBox.Size = New-Object System.Drawing.Size(200, 20)
$repoTextBox.Text = "linux-exam-answers"
$form.Controls.Add($repoTextBox)

# Token Expiration Input
$expirationLabel = New-Object System.Windows.Forms.Label
$expirationLabel.Location = New-Object System.Drawing.Point(370, 380)
$expirationLabel.Size = New-Object System.Drawing.Size(100, 20)
$expirationLabel.Text = "Token Expiry (days):"
$form.Controls.Add($expirationLabel)

$expirationTextBox = New-Object System.Windows.Forms.TextBox
$expirationTextBox.Location = New-Object System.Drawing.Point(480, 378)
$expirationTextBox.Size = New-Object System.Drawing.Size(50, 20)
$expirationTextBox.Text = "30"
$form.Controls.Add($expirationTextBox)

# Buttons
$startButton = New-Object System.Windows.Forms.Button
$startButton.Location = New-Object System.Drawing.Point(20, 420)
$startButton.Size = New-Object System.Drawing.Size(120, 35)
$startButton.Text = "Start Setup"
$startButton.BackColor = [System.Drawing.Color]::DarkGreen
$startButton.ForeColor = [System.Drawing.Color]::White
$startButton.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($startButton)

$openTokensButton = New-Object System.Windows.Forms.Button
$openTokensButton.Location = New-Object System.Drawing.Point(160, 420)
$openTokensButton.Size = New-Object System.Drawing.Size(120, 35)
$openTokensButton.Text = "Open Tokens Page"
$openTokensButton.BackColor = [System.Drawing.Color]::DarkBlue
$openTokensButton.ForeColor = [System.Drawing.Color]::White
$openTokensButton.Enabled = $false
$form.Controls.Add($openTokensButton)

$updateLatexButton = New-Object System.Windows.Forms.Button
$updateLatexButton.Location = New-Object System.Drawing.Point(300, 420)
$updateLatexButton.Size = New-Object System.Drawing.Size(120, 35)
$updateLatexButton.Text = "Update LaTeX"
$updateLatexButton.BackColor = [System.Drawing.Color]::DarkOrange
$updateLatexButton.ForeColor = [System.Drawing.Color]::White
$updateLatexButton.Enabled = $false
$form.Controls.Add($updateLatexButton)

$compileButton = New-Object System.Windows.Forms.Button
$compileButton.Location = New-Object System.Drawing.Point(440, 420)
$compileButton.Size = New-Object System.Drawing.Size(120, 35)
$compileButton.Text = "Compile PDF"
$compileButton.BackColor = [System.Drawing.Color]::DarkRed
$compileButton.ForeColor = [System.Drawing.Color]::White
$compileButton.Enabled = $false
$form.Controls.Add($compileButton)

# Status Labels
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Location = New-Object System.Drawing.Point(20, 470)
$statusLabel.Size = New-Object System.Drawing.Size(560, 60)
$statusLabel.Text = "Ready to start setup. Click 'Start Setup' to begin."
$statusLabel.Font = New-Object System.Drawing.Font("Arial", 10)
$statusLabel.ForeColor = [System.Drawing.Color]::DarkGreen
$form.Controls.Add($statusLabel)

# Token Input Form
function Show-TokenInputForm {
    $tokenForm = New-Object System.Windows.Forms.Form
    $tokenForm.Text = "Enter Personal Access Tokens"
    $tokenForm.Size = New-Object System.Drawing.Size(500, 400)
    $tokenForm.StartPosition = "CenterParent"
    
    $y = 20
    $tokens = @{}
    $textBoxes = @{}
    
    foreach ($sheet in @('A','B','C','D','E','F')) {
        $label = New-Object System.Windows.Forms.Label
        $label.Location = New-Object System.Drawing.Point(20, $y)
        $label.Size = New-Object System.Drawing.Size(100, 20)
        $label.Text = "Sheet $sheet Token:"
        $tokenForm.Controls.Add($label)
        
        $textBox = New-Object System.Windows.Forms.TextBox
        $textBox.Location = New-Object System.Drawing.Point(130, $y)
        $textBox.Size = New-Object System.Drawing.Size(320, 20)
        $textBox.Text = "ghp_your_token_here"
        $tokenForm.Controls.Add($textBox)
        $textBoxes[$sheet] = $textBox
        
        $y += 35
    }
    
    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Location = New-Object System.Drawing.Point(200, $y + 20)
    $okButton.Size = New-Object System.Drawing.Size(75, 23)
    $okButton.Text = "OK"
    $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $tokenForm.Controls.Add($okButton)
    
    $tokenForm.AcceptButton = $okButton
    
    if ($tokenForm.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        foreach ($sheet in @('A','B','C','D','E','F')) {
            $tokens[$sheet] = $textBoxes[$sheet].Text
        }
        return $tokens
    }
    return $null
}

# Function to install GitHub CLI
function Install-GitHubCLI {
    Add-Progress "Installing GitHub CLI..."
    
    # Try winget first (Windows 10/11)
    if (Get-Command winget -ErrorAction SilentlyContinue) {
        Add-Progress "Using winget to install GitHub CLI..."
        try {
            $result = winget install --id GitHub.cli --accept-package-agreements --accept-source-agreements
            Add-Progress "✅ GitHub CLI installed via winget"
            return $true
        } catch {
            Add-Progress "Winget installation failed, trying alternative method..."
        }
    }
    
    # Try Chocolatey
    if (Get-Command choco -ErrorAction SilentlyContinue) {
        Add-Progress "Using Chocolatey to install GitHub CLI..."
        try {
            choco install gh -y
            Add-Progress "✅ GitHub CLI installed via Chocolatey"
            return $true
        } catch {
            Add-Progress "Chocolatey installation failed, trying manual method..."
        }
    }
    
    # Manual installation via PowerShell
    Add-Progress "Installing GitHub CLI manually..."
    try {
        $downloadUrl = "https://github.com/cli/cli/releases/latest/download/gh_windows_amd64.msi"
        $tempPath = "$env:TEMP\gh_installer.msi"
        
        Add-Progress "Downloading GitHub CLI installer..."
        Invoke-WebRequest -Uri $downloadUrl -OutFile $tempPath -UseBasicParsing
        
        Add-Progress "Running installer..."
        Start-Process msiexec.exe -Wait -ArgumentList "/i `"$tempPath`" /quiet /norestart"
        
        # Refresh PATH
        $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
        
        Remove-Item $tempPath -Force -ErrorAction SilentlyContinue
        Add-Progress "✅ GitHub CLI installed manually"
        Add-Progress "Please restart PowerShell and run this script again"
        return $false
    } catch {
        Add-Progress "❌ Failed to install GitHub CLI automatically"
        Add-Progress "Please install manually from: https://cli.github.com/"
        Start-Process "https://cli.github.com/"
        return $false
    }
}

# Event Handlers
$startButton.Add_Click({
    $progressBox.Clear()
    Add-Progress "Starting GitHub repository setup..."
    Add-Progress "Checking GitHub CLI..."
    
    # Check GitHub CLI
    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
        Add-Progress "GitHub CLI not found. Installing automatically..."
        $statusLabel.Text = "Installing GitHub CLI... Please wait"
        $statusLabel.ForeColor = [System.Drawing.Color]::Orange
        
        $installed = Install-GitHubCLI
        if (-not $installed) {
            $statusLabel.Text = "Please restart PowerShell after GitHub CLI installation"
            $statusLabel.ForeColor = [System.Drawing.Color]::Red
            return
        }
        
        # Check again after installation
        if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
            Add-Progress "GitHub CLI installation completed but not found in PATH"
            Add-Progress "Please restart PowerShell and try again"
            $statusLabel.Text = "Please restart PowerShell and run script again"
            $statusLabel.ForeColor = [System.Drawing.Color]::Red
            return
        }
    }
    
    Add-Progress "✅ GitHub CLI found"
    
    # Check authentication
    try {
        $username = (gh api user --jq .login 2>$null).Trim()
        if (-not $username) {
            Add-Progress "Please login to GitHub CLI first..."
            gh auth login
            $username = (gh api user --jq .login).Trim()
        }
        Add-Progress "✅ Logged in as: $username"
    } catch {
        Add-Progress "ERROR: Please login to GitHub CLI first"
        $statusLabel.Text = "ERROR: Please login to GitHub CLI first"
        $statusLabel.ForeColor = [System.Drawing.Color]::Red
        return
    }
    
    # Create repository
    $repoName = $repoTextBox.Text
    Add-Progress "Creating private repository: $repoName"
    
    try {
        gh repo create $repoName --private --description "Private repository for Linux exam answer keys" --clone 2>$null
        Add-Progress "✅ Repository created successfully"
    } catch {
        Add-Progress "Repository might exist, attempting to clone..."
        gh repo clone "$username/$repoName" 2>$null
        Add-Progress "✅ Repository ready"
    }
    
    # Upload files
    Add-Progress "Uploading answer files..."
    Set-Location $repoName
    
    $answerFiles = @("sheet-a-answers.md", "sheet-b-answers.md", "sheet-c-answers.md", 
                     "sheet-d-answers.md", "sheet-e-answers.md", "sheet-f-answers.md")
    
    foreach ($file in $answerFiles) {
        if (Test-Path "..\github-answers\$file") {
            Copy-Item "..\github-answers\$file" . -Force
            Add-Progress "✅ Copied $file"
        }
    }
    
    git add . 2>$null
    git commit -m "Add exam answer sheets" 2>$null
    git push origin main 2>$null
    Add-Progress "✅ Files uploaded to GitHub"
    
    Set-Location ..
    
    $statusLabel.Text = "Repository setup complete! Next: Create tokens and update LaTeX"
    $statusLabel.ForeColor = [System.Drawing.Color]::Green
    $openTokensButton.Enabled = $true
    $updateLatexButton.Enabled = $true
})

$openTokensButton.Add_Click({
    Add-Progress "Opening GitHub Personal Access Token page..."
    Start-Process "https://github.com/settings/tokens/new"
    Add-Progress "Please create 6 tokens (one for each sheet A-F)"
    Add-Progress "Token settings: Expiration=$($expirationTextBox.Text) days, Scope=repo"
    $statusLabel.Text = "Create 6 personal access tokens, then click 'Update LaTeX'"
})

$updateLatexButton.Add_Click({
    # Get tokens from user
    $tokens = Show-TokenInputForm
    if (-not $tokens) {
        Add-Progress "Token input cancelled"
        return
    }
    
    Add-Progress "Updating LaTeX file with GitHub URLs..."
    
    # Get username
    $username = (gh api user --jq .login).Trim()
    
    # Update LaTeX file
    $latexFile = "Professional_Exam_Sheets.tex"
    if (Test-Path $latexFile) {
        $content = Get-Content $latexFile -Raw
        
        foreach ($sheet in @('A','B','C','D','E','F')) {
            $oldPattern = "https://github.com/hussamalkinani/linux-exam-answers/blob/main/sheet-$($sheet.ToLower())-answers.md\?token=GHSAT0AAAAAACXJ7$sheet"
            $newUrl = "https://github.com/$username/$($repoTextBox.Text)/blob/main/sheet-$($sheet.ToLower())-answers.md?token=$($tokens[$sheet])"
            $content = $content -replace [regex]::Escape($oldPattern), $newUrl
            Add-Progress "✅ Updated Sheet $sheet URL"
        }
        
        Set-Content $latexFile $content -Encoding UTF8
        Add-Progress "✅ LaTeX file updated successfully!"
        
        $statusLabel.Text = "LaTeX file updated! Ready to compile PDF"
        $statusLabel.ForeColor = [System.Drawing.Color]::Green
        $compileButton.Enabled = $true
    } else {
        Add-Progress "ERROR: Professional_Exam_Sheets.tex not found"
        $statusLabel.Text = "ERROR: LaTeX file not found"
        $statusLabel.ForeColor = [System.Drawing.Color]::Red
    }
})

$compileButton.Add_Click({
    Add-Progress "Compiling LaTeX to PDF..."
    
    if (Get-Command pdflatex -ErrorAction SilentlyContinue) {
        try {
            pdflatex "Professional_Exam_Sheets.tex" | Out-Null
            pdflatex "Professional_Exam_Sheets.tex" | Out-Null
            
            if (Test-Path "Professional_Exam_Sheets.pdf") {
                Add-Progress "✅ PDF compiled successfully!"
                Add-Progress "Opening PDF for review..."
                Start-Process "Professional_Exam_Sheets.pdf"
                
                $statusLabel.Text = "✅ Setup complete! PDF ready with QR codes"
                $statusLabel.ForeColor = [System.Drawing.Color]::Green
            } else {
                Add-Progress "❌ PDF compilation failed"
                $statusLabel.Text = "PDF compilation failed"
                $statusLabel.ForeColor = [System.Drawing.Color]::Red
            }
        } catch {
            Add-Progress "❌ Error during compilation: $($_.Exception.Message)"
            $statusLabel.Text = "Compilation error occurred"
            $statusLabel.ForeColor = [System.Drawing.Color]::Red
        }
    } else {
        Add-Progress "❌ pdflatex not found. Please install MiKTeX or TeX Live"
        Add-Progress "Download from: https://miktex.org/download"
        $statusLabel.Text = "pdflatex not found. Please install LaTeX distribution"
        $statusLabel.ForeColor = [System.Drawing.Color]::Red
    }
})

# Show the form
Add-Progress "GitHub Exam QR Code Setup Tool Ready"
Add-Progress "Click 'Start Setup' to begin automated repository creation"
$form.ShowDialog()