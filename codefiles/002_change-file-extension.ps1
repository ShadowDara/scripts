# script to change the file extension of multiple files
#
# Credit Shadowdara
# https://github.com/shadowdara/scripts

$old_extension = Read-Host "Old File extension: "
$new_extension = Read-Host "New File extension: "

Get-ChildItem *.$old_extension | ForEach-Object {
    Rename-Item $_.FullName -NewName ($_.BaseName + "." + $new_extension)
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
