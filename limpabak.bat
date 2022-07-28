::Consulta todas as chaves
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" > chaves.txt

::Filtra
findstr /i ".bak" chaves.txt > excluir.txt

::Excluir
FOR /F "tokens=*" %%A IN (excluir.txt) DO REG DELETE "%%A" /f