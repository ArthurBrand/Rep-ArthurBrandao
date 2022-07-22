#Script criado dia 22/07/2022

#Install-Module -Name MicrosoftTeams -Force -AllowClobber
Import-Module MicrosoftTeams

function conexao{ 
    Connect-MicrosoftTeams
    Connect-MsolService
}

function teams{
    Grant-CsTenantDialPlan -Identity $conta -PolicyName Categoria5
    Grant-CsOnlineVoiceRoutingPolicy -Identity $conta -PolicyName "Rota SEDE Prioritario"
    Set-CsPhoneNumberAssignment -Identity $conta -PhoneNumber +55$telefone -PhoneNumberType DirectRouting
}

function executar{
    conexao
    Start-Sleep -Seconds 2.0
    teams
    Start-Sleep -Seconds 1.5
    break
}

$conta = read-host -Prompt 'Digite o email da conta'
$telefone = read-host -Prompt 'Digite o telefone a ser atribuido'

If($conta){
    executar
  }

