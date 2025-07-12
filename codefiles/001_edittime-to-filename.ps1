# PowerShell-Skript: Rename files to include edit time (LastWriteTime) as prefix
#
# Credit Shadowdara
# https://github.com/shadowdara/scripts

$folderPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $folderPath

# Regex-Muster für Datum im Format yyyy.MM.dd
$regex = '^\d{4}\.\d{2}\.\d{2} '

# Alle Dateien im aktuellen Ordner durchgehen
Get-ChildItem -File | ForEach-Object {
    $file = $_

    # Wenn der Name schon mit einem Datum beginnt, überspringen
    if ($file.Name -match $regex) {
        Write-Host "skipping (already has a date): $($file.Name)"
        return
    }

    $editDate = $file.LastWriteTime.ToString("yyyy.MM.dd")
    
    # Neuen Dateinamen zusammensetzen
    $newName = "$editDate $($file.Name)"
    
    # Wenn der neue Name bereits existiert, nicht umbenennen
    if (-not (Test-Path -LiteralPath $newName)) {
        Rename-Item -LiteralPath $file.FullName -NewName $newName
        Write-Host "Renamed: $($file.Name) -> $newName"
    } else {
        Write-Warning "File exists already: $newName - skipping"
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
