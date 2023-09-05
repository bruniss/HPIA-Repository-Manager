#--------------------------------------------
# Declare Global Variables and Functions here
#--------------------------------------------


#Sample function that provides the location of the script
function Get-ScriptDirectory
{
<#
	.SYNOPSIS
		Get-ScriptDirectory returns the proper location of the script.

	.OUTPUTS
		System.String
	
	.NOTES
		Returns the correct path within a packaged executable.
#>
	[OutputType([string])]
	param ()
	if ($null -ne $hostinvocation)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory

function Get-datesortable
{
	$global:datesortable = Get-Date -Format "HH':'mm':'ss"
	return $global:datesortable
}
function Add-Logs
{
	[CmdletBinding()]
	param ($text)
	Get-datesortable
	$console.Text += "[$global:datesortable] - $text
"
	Set-Alias alogs Add-Logs -Description "Add content to the TextBoxLogs"
	Set-Alias Add-Log Add-Logs -Description "Add content to the TextBoxLogs"
	
}

function Load_HPCMSLModule
{
	
	$m = 'HPCMSL'
	
	Add-Logs "Checking for required HP CMSL modules... "
	
	# If module is imported say that and do nothing
	if (Get-Module | Where-Object { $_.Name -eq $m })
	{
		Add-Logs  "Module already imported."  
	}
	else
	{
		
		# If module is not imported, but available on disk then import
		if (Get-Module -ListAvailable | Where-Object { $_.Name -eq $m })
		{
			Add-Logs -Message "Importing Module $m."  
			Import-Module $m -Verbose
			Add-Logs  "Done"  
		}
		else
		{
			
			# If module is not imported, not available on disk, but is in online gallery then install and import
			if (Find-Module -Name $m | Where-Object { $_.Name -eq $m })
			{
				Add-Logs  "Upgrading NuGet and updating PowerShellGet first."  
				if (!(Get-packageprovider -Name nuget -Force))
				{
					Install-PackageProvider -Name NuGet -ForceBootstrap
				}
				# next is PowerShellGet
				$lPSGet = find-module powershellget
				write-host 'Installing PowerShellGet version' $lPSGet.Version
				Install-Module -Name PowerShellGet -Force # -Verbose
				
				Write-Host 'should restart PowerShell after upating module PoweShellGet'
				
				# and finally module HPCMSL
				Add-Logs  "Installing and Importing Module $m."  
				Install-Module -Name $m -Force -SkipPublisherCheck -AcceptLicense -Scope CurrentUser #  -Verbose 
				Import-Module $m -Verbose
				Add-Logs  "Done" -Type 
			}
			else
			{
				
				# If module is not imported, not available and not in online gallery then abort
				write-host "Module $m not imported, not available and not in online gallery, exiting."
				Add-Logs  "Module $m not imported, not available and not in online gallery, exiting."
			}
		} 
	} 
	
} 


