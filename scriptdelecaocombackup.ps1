#Connect-ExchangeOnline
#Connect-MsolService

#Coletar lista
Import-CSV "C:\temp\lista\testedistrib.csv" -Encoding UTF8 -Delimiter ";" | ForEach-Object {
    
    $listdistrib = $_.Nomelista
    
    write-host "Exportando usuário da lista "$listdistrib

    Get-DistributionGroupMember -Identity "$listdistrib" | Select-Object PrimarySmtpAddress | export-csv C:\lista\$(($listdistrib).ToString()).csv
	
	#Remove-DistributionGroup -Identity "$listdistrib"
}



#Exportar usuario de cada lista
#Get-DistributionGroupMember -Identity "$lista" | Select-Object PrimarySmtpAddress | export-csv C:\temp\lista\$(($lista).ToString()).csv

#Deleção

#Remove-DistributionGroup -Identity "Temporary Staff"


