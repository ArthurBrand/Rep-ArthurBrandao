#Conectar no seu Tenant Azure
Connect-AzAccount

#Variaveis

#exemplo resourcegroup = 'rg-test'

$resourceGroup = "Digite o nome do seu resource group"
$nomeVm = 'Digite o nome da sua VM'
$regiao = 'Digite a região da máquina'
$virtualNetworkName = 'A Virtual network da maquina'
$SubnetName = 'Subnet da maquina'
$NSG = 'A NSG da maquina'


#------------------------------------------------------------- SOMENTE SE NÃO TIVER OS RECURSOS NECESSÁRIOS DA VM ------------------------------------   
#Caso não tenha um resource group ainda execute essa linha
New-AzResourceGroup -Name $resourceGroup -Location $regiao

#Caso não tenha uma virtual e subnet execute essa função
$vnet = @{
    Name = $virtualNetworkName
    ResourceGroupName = $resourceGroup
    Location = $regiao
    AddressPrefix = 'enderecodeip'    
}
$virtualNetwork = New-AzVirtualNetwork @vnet

#Criar subnet para a virtual criada
$subnet = @{
    Name = $SubnetName
    VirtualNetwork = $virtualNetwork
    AddressPrefix = 'enderecosubnet'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

#criar network security group

New-AzNetworkSecurityGroup -Name $NSG -ResourceGroupName $resourceGroup  -Location  $regiao

#------------------------------------------------------------------------------------------------------------------------------------------------------

#Criando a vm WINDOWS

New-AzVm `
    -ResourceGroupName $resourceGroup `
    -Name $nomeVm `
    -Location $regiao `
    -size Standard_B2s `
    -VirtualNetworkName $virtualNetworkName `
    -SubnetName $SubnetName `
    -SecurityGroupName $NSG

#Criando a VM Linux Ubuntu

New-AzVm `
    -ResourceGroupName $resourceGroup `
    -Name $nomeVm `
    -image UbuntuLTS `
    -size Standard_B2s `
    -Location $regiao `
    -VirtualNetworkName $virtualNetworkName `
    -SubnetName $SubnetName `
    -SecurityGroupName $NSG

#Observação o parâmentro SIZE define o tipo da instância
