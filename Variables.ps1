$ErrorActionPreference = 'Stop'

$Defaults = @{
    SIGNSSH_PROVIDER        = 'azure-key-vault'
    SIGNSSH_AZURE_CLIENT_ID = '<Client ID>'
    SIGNSSH_AZURE_KEY_VAULT = '<Azure Key Vault Name>'
    SIGNSSH_AZURE_TENANT_ID = '<Tenant ID>'
    SIGNSSH_KEY             = '<Key Name>'
}

try {
    $ChangedCount = 0

    foreach ($Variable in $Defaults.GetEnumerator()) {
        $CurrentValue = [Environment]::GetEnvironmentVariable(
            $Variable.Key,
            'Machine'
        )

        if ($CurrentValue -cne $Variable.Value) {
            [Environment]::SetEnvironmentVariable(
                $Variable.Key,
                $Variable.Value,
                'Machine'
            )

            $WrittenValue = [Environment]::GetEnvironmentVariable(
                $Variable.Key,
                'Machine'
            )

            if ($WrittenValue -cne $Variable.Value) {
                throw "Failed to configure machine variable: $($Variable.Key)"
            }

            $ChangedCount++
        }
    }

    Write-Output "Environments defaults configured successfully. Variables changed: $ChangedCount"
    exit 0
}
catch {
    Write-Error "Failed to configure environment defaults: $($_.Exception.Message)"
    exit 1
}