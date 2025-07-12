# script to change the file edittime
#
# Credit Shadowdara
# https://github.com/shadowdara/scripts

# Get the folder where the script is executed
$folder = Get-Location

# Ask the user for a new timestamp
$newDate = Read-Host "Enter the new date and time (Format: YYYY-MM-DD HH:MM:SS)"
$newDate = [datetime]::ParseExact($newDate, "yyyy-MM-dd HH:mm:ss", $null)

# Get all files in the folder
$files = Get-ChildItem -Path $folder -File

# Select a file to edit or enter 0 to change all files
Write-Host "Available files in the folder:"
$index = 1
$files | ForEach-Object { Write-Host "${index}: $($_.Name)"; $index++ }
Write-Host "0: Change all files"

$choice = Read-Host "Select a file (enter number) or 0 for all"

if ($choice -eq "0") {
    # Change all files in the folder
    foreach ($file in $files) {
        $file.CreationTime = $newDate
        $file.LastWriteTime = $newDate
        Write-Host "Updated: $($file.Name) -> $newDate"
    }
} else {
    # Change a single file
    $choiceIndex = [int]$choice - 1
    if ($choiceIndex -ge 0 -and $choiceIndex -lt $files.Count) {
        $file = $files[$choiceIndex]
        $file.CreationTime = $newDate
        $file.LastWriteTime = $newDate
        Write-Host "Updated: $($file.Name) -> $newDate"
    } else {
        Write-Host "Invalid selection!"
    }
}

Write-Host " "
Write-Host "*******************************************************"
Write-Host "*                                                     *"
Write-Host "*                     Finished!                       *"
Write-Host "*                                                     *"
Write-Host "*******************************************************"
Write-Host " "
Write-Host "Credit and More:"
Write-Host "https://github.com/shadowdara/scripts"

Read-Host
