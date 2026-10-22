@echo off
title Desencriptar Portefolio
echo A desencriptar ficheiro...

powershell -NoProfile -ExecutionPolicy Bypass -Command "$sha = [System.Security.Cryptography.SHA256]::Create(); $key = $sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes('isi_password_2026_segredo_ipca!')); $iv = New-Object byte[] 16; $aes = [System.Security.Cryptography.Aes]::Create(); $aes.Key = $key; $aes.IV = $iv; $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC; $aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7; $encBytes = [System.IO.File]::ReadAllBytes('portefolio_cripto_cript.xlsx'); $decBytes = $aes.CreateDecryptor().TransformFinalBlock($encBytes, 0, $encBytes.Length); [System.IO.File]::WriteAllBytes('portefolio_desencriptado.xlsx', $decBytes); Write-Host 'Concluido com sucesso!' -ForegroundColor Green;"

if exist portefolio_desencriptado.xlsx (
    echo.
    echo Sucesso: 'portefolio_desencriptado.xlsx' gerado!
) else (
    echo.
    echo Erro ao desencriptar. Confirma se 'portefolio_cripto_cript.xlsx' esta na mesma pasta.
)

pause