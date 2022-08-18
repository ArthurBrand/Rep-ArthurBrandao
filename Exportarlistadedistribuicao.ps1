#Script desenvolvido para exportar membros de uma lista de distribuição.
# Versão 1.0 - 14/07/2022
#Import-Module MSOnline
#Import-Module ExchangeOnlineManagement

function ConectarAD-365 { 
Connect-MsolService
Connect-ExchangeOnline
}

function ExportarLista{
    Get-DistributionGroupMember -Identity "$lista" | Select-Object PrimarySmtpAddress | export-csv C:\temp\lista\$(($lista).ToString()).csv
    }

function executar{
ConectarAD-365
ExportarLista
}

$lista = Read-Host -Prompt 'Digite o nome da lista'
    if($lista){
         Write-Host "Processando e exportando os membros desta lista"
         executar
     }else{
            write-host "Nenhuma lista digitada"
     }   
