# Task 1 - Azure PowerShell

# Check Azure connection
Get-AzContext

# Check Resource Group
Get-AzResourceGroup -Name "AzureTask1-RG"

# Configure Managed Disk
$diskConfig = New-AzDiskConfig `
    -Location "indiasouthcentral" `
    -CreateOption Empty `
    -DiskSizeGB 32 `
    -SkuName "Standard_LRS"

# Create Managed Disk
New-AzDisk `
    -ResourceGroupName "AzureTask1-RG" `
    -DiskName "MyManagedDiskPS" `
    -Disk $diskConfig

# Verify Managed Disk
Get-AzDisk `
    -ResourceGroupName "AzureTask1-RG" `
    -DiskName "MyManagedDiskPS" |
    Select-Object Name, Location, DiskSizeGB, DiskState, ProvisioningState, Sku