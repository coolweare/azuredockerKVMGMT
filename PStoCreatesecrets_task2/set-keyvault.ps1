#setting variables for keyvualt creation
$resourcegroupname = Read-Host -Prompt 'input Resource group name'
$keyvault = Read-Host -Prompt 'Input keyvault name'
$secretname = Read-host -Prompt 'input secret name'
$secret = Read-Host -AsSecureString 'Input keyvault secret'

Set-AzKeyVaultSecret -VaultName $keyvault -Name $secretname -SecretValue $secret