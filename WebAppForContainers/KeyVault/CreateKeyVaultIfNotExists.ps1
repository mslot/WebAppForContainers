[CmdLetBinding()]
param(
    [Parameter()]
    [string]$Name,
    [Parameter()]
    [string]$ResourceGroupName,
    [Parameter()]
    [string]$Location,
    [Parameter()]
    [string]$Sku = "Standard"
 )
    
$keyVaultResourceInfo=Get-AzResource -ResourceName $Name -ResourceGroupName $ResourceGroupName
  
if($keyVaultResourceInfo) {
    Write-Host "Already set up vault"
    Write-Host $keyVaultResourceInfo
}
else {
    New-AzKeyVault `
    -Name $Name `
    -Location $Location `
    -EnabledForDeployment `
    -EnabledForTemplateDeployment `
    -EnabledForDiskEncryption `
    -ResourceGroupName $ResourceGroupName `
    -Sku $Sku
}