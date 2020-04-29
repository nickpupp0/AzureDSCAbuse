$resourceGroup = ' '
$vmName = ' '
$storageName = ' '

Publish-AzVMDscConfiguration -ConfigurationPath <path to config file> -ResourceGroupName $resourceGroup -StorageAccountName $storageName -force
Set-AzVMDscExtension -Version '2.80' -ResourceGroupName $resourceGroup -VMName $vmName -ArchiveStorageAccountName $storageName -ArchiveBlobName 'scheduled_task_config.ps1.zip' -AutoUpdate -ConfigurationName 'ReverseShellConfig'