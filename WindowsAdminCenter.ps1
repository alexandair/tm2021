configuration WindowsAdminCenter
{
    param
    (
        [System.String]
        $WacProductId = '{01A7219C-655E-4BED-8A7A-46D7851575B8}',

        [System.String]
        $WacDownloadPath = 'https://download.microsoft.com/download/1/0/5/1059800B-F375-451C-B37E-758FFC7C8C8B/WindowsAdminCenter2103.2.msi',
        [System.Int16]
        $Port = 6516,

        [System.String]
        $Thumbprint
    )

    Import-DscResource -ModuleName PSDscResources

    if ([System.String]::IsNullOrEmpty($Thumbprint))
    {
        $wacInstallArguments = "/qn /l*v c:\windows\temp\windowsadmincenter.msiinstall.log SME_PORT=$Port SSL_CERTIFICATE_OPTION=generate"
    }
    else
    {
        $wacInstallArguments = "/qn /l*v c:\windows\temp\windowsadmincenter.msiinstall.log SME_PORT=$Port SME_THUMBPRINT=$Thumbprint"
    }

    Node localhost
    {
        MsiPackage InstallWindowsAdminCenter
        {
            ProductId = $WacProductId
            Path      = $WacDownloadPath
            Arguments = $wacInstallArguments
            Ensure    = 'Present'
        }
    }
}