<#
    Author: Marcos Silvestrini
    Date: 08/02/2023
    Description: Script for create a list of all certificates presents in folder certificates
    Dependencies: none
#>
$ROOT_PATH = $PSScriptRoot | Split-Path -Parent
$LIST_FILES = (Get-ChildItem -Recurse "$ROOT_PATH\certificates" -Include @("*.pdf", "*.jpg")  |
    Rename-Item -NewName { $_.Name -replace ' ', '_' } |
    Where-object { $_.Name -notlike ".gitkeep" -and !$_.PSISContainer }).FullName

$FILES = $LIST_FILES -replace ("F:\\Projetos\\learning-path\\", "")
$FILES = $FILES -replace ("\\", "/")
$FILES > "$ROOT_PATH\build\certificates"