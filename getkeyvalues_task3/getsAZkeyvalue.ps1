#>

	[CmdletBinding(SupportsShouldProcess=$true)]
	Param(
		[Parameter(Mandatory=$true)]
        [string]$VaultName,
		[Parameter(Mandatory=$true)]
        [string]$SecretName,
		[bool]$PlainText = $true
    )
	
	Write-Verbose -Message $PSCmdlet.MyInvocation.MyCommand
    Write-Verbose -Message "Get $SecretName from $VaultName"

	if( $PlainText -eq $true ){
		return (Get-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName).SecretValueText
	}
	else
	{
		return (Get-AzKeyVaultSecret -VaultName $VaultName -Name $SecretName).SecretValue
	}

Export-ModuleMember Invoke-GetAzureSecretConfigFunction
Register-SitecoreInstallExtension -Command Invoke-GetAzureSecretConfigFunction -As GetSecret -Type ConfigFunction
