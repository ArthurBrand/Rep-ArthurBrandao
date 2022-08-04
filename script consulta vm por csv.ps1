Install-Module -Name PowerShellGet -Force

Connect-AzAccount

Import-Csv -Path 'caminhodoarquivo.csv' -Encoding UTF8 -Delimiter ";" | ForEach-Object {
    
    $nome = $_.nomeVm
    

    Get-AzVM -status -Name $nome | Select Name, PowerState
}

