#searches and creates new secrets in keyvault via json config folder

$KeyVaultName = Read-Host 'enter keyvaultname' 
$json = get-Content /home/joseph/key4.json | out-string | convertfrom-json


$json | ForEach {

$secretToSearch = Get-AzureKeyVaultSecret -VaultName $KeyVaultName -Name $_.key -ErrorAction SilentlyContinue

if($secretToSearch -ne $null)
{
    echo "The secret $_.key already exists !"
}
Else
{
    $NewSecret = Set-AzureKeyVaultSecret -VaultName $KeyVaultName -Name $_.key -SecretValue (ConvertTo-SecureString $_.value -AsPlainText -Force ) -Verbose
    Write-Host
    Write-Host "Source Vault Resource Id: "$(Get-AzureRmKeyVault -VaultName $KeyVaultName).ResourceId
}
}