﻿function Get-PSNeo4jConfiguration {
    <#
    .SYNOPSIS
       Get PSNeo4j configuration values

    .DESCRIPTION
       Get PSNeo4j configuration values

    .EXAMPLE
        Get-PSNeo4jConfiguration

    .PARAMETER Source
        Get PSNeo4j configuration from the module variable, or config file.  Defaults to variable


    .FUNCTIONALITY
        Neo4j
    #>
    param(
        [validateset('Variable','Config')]
        [string]$Source = "Variable"
    )
    if($Source -eq 'Config' -and $SkipConfig) {
        Write-Warning "Configuration module not available.  Switching to 'Variable' data"
        $Source = 'Variable'
    }
    if($Source -eq 'Config') {
        $Config = Import-Configuration -CompanyName 'NA' -Name 'NA'
        [pscustomobject]$Config | Select-Object $Script:ConfigSchema.PSObject.Properties.Name
    }
    if($Source -eq 'Variable') {
        $Script:PSNeo4jConfig
    }
}