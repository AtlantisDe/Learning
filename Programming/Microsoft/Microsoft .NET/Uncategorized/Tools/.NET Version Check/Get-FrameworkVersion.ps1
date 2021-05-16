#requires -version 3

<#
.SYNOPSIS
Display a list of all versions of the .NET Framework installed on a particular computer.

.DESCRIPTION
This cmdlet examines a particular computer for all versions of the Windows .NET Framework installed on that computer.

Versions of .NET Core are not included.

The local computer is the default computer examined.

Versions commonly seen include the "3.5 series" and the "4.5 series". Within the "3.5" series are .NET versions 3.5, 3.0, and 2.0. Specific builds and various service packs can vary. When a user chooses to install .NET 3.5, all of 3.5, 3.0, and 2.0 are installed.

Within the "4.5" series are 4.5, 4.5.1, 4.5.2, 4.6, 4.6.1, 4.7, and 4.7.1 is (at this writing) the most recent. There are also special builds that apply to only Windows 8.1 and to Windows 10, compared to builds for all other supported versions of Windows.

See the examples. It's possible that as many as six different versions of the .NET Framework are installed on a particular computer.

Information about the specific versions installed is present in the registry of a computer. This cmdlet examines the relevant portions of the registry and reports on those contents.

There are three major ways to examine registries of remote computers. The first is to use RPC, which has been part of Windows since the beginning. The second is Windows Management Infrastructure (WMI), which has been superseded by the third method. The third method is called CIM, which stands for the Common Information Model.

This cmdlet supports the first (RPC) and the third (CIM). Using RPC to connect to the registry is built into the .NET Framework via an API called Microsoft.Win32.Registry. (And, in fact, it's part of PowerShell using the registry provider which is based on the Microsoft.Win32.Registry API.) This API works well when both the source and the target computers are members of the same Active Directory Domain Services domain. I expect that is the default for most users of this cmdlet, so that is the default configuration of the cmdlet. In order to use this capability, you only need to specify the Computer parameter.

CIM is supported in two different ways. Since many calls are made to a computer in order to obtain the necessary information, a persistent connection to the computer is required. When using CIM, that connection is called a CIM session.

The user of this cmdlet can specify the CIM session to be used via the parameter UserCimSession. However, that means all possible configuration options must have been executed by the caller on that parameter. All CIM session options and all CIM session parameters (credentials, computer name, DCOM options, etc.). When used, the UserCimSession parameter must be specified by itself.

Alternately, the cmdlet can create it's own CIM session to the computer. However, the range of options available for that session are limited to optionally using DCOM and optionally using non-default credentials.

.PARAMETER Computer
Specify the computer to be checked for .NET Framework versions.

This parameter may not be specified if UserCimSession is specified.

.PARAMETER UseCim
Indicates that the cmdlet should create it's own CIM session to the specified Computer.

You may also use the UseDcom and Credential parameters with this parameter.
.PARAMETER UseDcom
Indicates that the CIM session should use DCOM and not WinRM.

You can only use this parameter if UseCim has been specified.
.PARAMETER Credential
Indicates alternate credentials that should be used to connect to the destination computer when using CIM.

You can only use this parameter if UseCim has been specified.
.PARAMETER UserCimSession
Provides a pre-configured CIM session to be used to connect to a computer using CIM.

No other parameters may be specified when this parameter is used.
.EXAMPLE
Display all of the versions installed on the current computer, using the registry provider.

	PS C:\scripts> .\Get-FrameworkVersion.ps1
	v2.0.50727       2.0.50727.4927   SP2
	v3.0             3.0.30729.4926   SP2
	v3.5             3.5.30729.4926   SP1
	v4
					Client           4.7.02556
					Full             4.7.02556
	v4.0
					Client           4.0.0.0

	Current .NET Framework version: 4.7.1 on Windows 10 (4.7.02556 = release 461308)

	No versions of the .NET Framework are blocked on the computer
	PS C:\scripts>

.EXAMPLE
Display all of the versions installed on the current computer, using CIM.

	PS C:\scripts> .\Get-FrameworkVersion.ps1 -UseCim
	v2.0.50727       2.0.50727.4927   SP2
	v3.0             3.0.30729.4926   SP2
	v3.5             3.5.30729.4926   SP1
	v4
					Client           4.7.02556
					Full             4.7.02556
	v4.0
					Client           4.0.0.0

	Current .NET Framework version: 4.7.1 on Windows 10 (4.7.02556 = release 461308)

	No versions of the .NET Framework are blocked on the computer
	PS C:\scripts>

Also specifying UseDcom for the current computer has no impact. You can choose to, or not.
.EXAMPLE
Display all of the versions installed on a remote computer, using DCOM with CIM, and specifying alternate credentials.

	PS C:\scripts> $cred = Get-Credential contoso\administrator
	PS C:\scripts> .\Get-FrameworkVersion.ps1 -UseCim -UseDcom -Credential $cred -Computer Ex2016
	v4
					Client           4.6.01590
					Full             4.6.01590
	v4.0
					Client           4.0.0.0

	Current .NET Framework version: 4.6.2 (4.6.01590 = release 394806)

	No versions of the .NET Framework are blocked on the computer
	PS C:\scripts>

This works well, especially when the source and the target computers are in different domains.
.EXAMPLE
Connect to the remote computer using a custom CIM session, and provide that session to the cmdlet.

	PS C:\scripts> $cred = Get-Credential contoso\administrator
	PS C:\scripts> $opts = New-CimSessionOption -Protocol DCOM
	PS C:\scripts> $session = New-CimSession -SessionOption $opts -ComputerName Ex2016 -Credential $cred
	PS C:\scripts> .\Get-FrameworkVersion.ps1 -UserCimSession $session
	v4
					Client           4.6.01590
					Full             4.6.01590
	v4.0
					Client           4.0.0.0

	Current .NET Framework version: 4.6.2 (4.6.01590 = release 394806)

	BlockNetFramework47 = 1 (if 0 then not blocked, any other value, blocked)
	BlockNetFramework461 = 21 (if 0 then not blocked, any other value, blocked)
	PS C:\scripts>

This example is, actually, equivalent to specifying UseCim and UseDcom, but it illustrates that you can configure the CIM session in any way desired.
.INPUTS
	None. You cannot pipe objects to this script.

.OUTPUTS
	Up to dozen or so lines are output to the PowerShell host. See the examples.

.LINK
	https://www.essential.exchange/2018/01/10/get-frameworkversion-1-6/

.NOTES
	NAME: Get-FrameworkVersion.ps1
	VERSION: 1.6.0.0
	AUTHOR: Michael B. Smith, Owner, Smith Consulting, LLC
	LASTEDIT: January 9, 2018

	This script is provided AS IS without warranty of any kind. The author further disclaims all implied warranties including, without limitation, 
	any implied warranties of merchantability or of fitness for a particular purpose. The entire risk arising out of the use or performance of the
	script and documentation remains with you. In no event shall anyone involved in the creation, production, or delivery of the script be liable 
	for any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of business information,
	or other pecuniary loss) arising out of the use of or inability to use the script or documentation, even if the author has been advised of the 
	possibility of such damages.

	ChangeLog
	1.6.0.0 2018-01-09
	Add function 'timer' so that 'wv' output is timestamped.
	Add check for BlockNetFramework* registry values (to determine whether specific versions of the .NET Framework are blocked on the target computer)
	Updated examples.

	1.5.0.0 2017-12-06
	Implement support for remote computers, including using CIM. Major update.
	Add help text.
	
	1.0.0.0 2017-12-02
	Initial release.
	
	TODO
	Error detection/reporting is pretty hit-or-miss. If problems are reported, that may need to be addressed.
#>

[Cmdletbinding( DefaultParameterSetName = 'Registry', SupportsShouldProcess = $false, ConfirmImpact = 'None' )]
Param(
	[Parameter( Mandatory = $false, ParameterSetName = 'Registry' )]
	[Parameter( Mandatory = $false, ParameterSetName = 'CIM' )]
	[String] $Computer = '.',

	[Parameter( Mandatory = $true, ParameterSetName = 'CIM' )]
	[Switch] $UseCim,

	[Parameter( Mandatory = $false, ParameterSetName = 'CIM' )]
	[Switch] $UseDcom,

	[Parameter( Mandatory = $false, ParameterSetName = 'CIM' )]
	[System.Management.Automation.PsCredential] $Credential = $null,

	[Parameter( Mandatory = $true, ParameterSetName = 'UserCimSession' )]
	[ValidateNotNull()]
	[Microsoft.Management.Infrastructure.CimSession] $UserCimSession = $null
)

Set-StrictMode -Version Latest

## Registry hives

[UInt32] $HKCR = 2147483648 ## classes root
[UInt32] $HKCU = 2147483649 ## current user
[UInt32] $HKLM = 2147483650 ## local machine
[UInt32] $HKU = 2147483651 ## users
[UInt32] $HKCC = 2147483653 ## current config

##
## This article more-or-less describes the algorithms used here (except I've optimized
## them for PowerShell).
##
## How to: Determine Which .NET Framework Versions Are Installed
## https://docs.microsoft.com/en-us/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
##

## $rootkey defines where we look for versions of the Framework prior to .NET 4.5
$rootKey = 'SOFTWARE\Microsoft\NET Framework Setup\NDP'  ## HKLM:\

## $45Key defines where we look for versions of the Framework at .NET 4.5 and later
$45Key = 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\'  ## HKLM:\

## $45Table is a top-down stack-based set of versions that define the build numbers
## and the associated named versions of the framework
$45Table = [Ordered] @{
	461310 = '4.7.1'
	461308 = '4.7.1 on Windows 10'
	460805 = '4.7'
	460798 = '4.7 on Windows 10'
	394806 = '4.6.2'
	394802 = '4.6.2 on Windows 10'
	394271 = '4.6.1'
	394254 = '4.6.1 on Windows 10'
	393297 = '4.6'
	393295 = '4.6 on Windows 10'
	379893 = '4.5.2'
	378758 = '4.5.1'
	378675 = '4.5.1 on Windows 8.1'
	378389 = '4.5'
}

##
## function: timer
##
function timer {
	Get-Date -Format u
}

##
## function: wv (write-verbose)
##
function wv {
	$str = timer
	$str = ' ' + ( $args -join ' ' )
	Write-Verbose $str
}

##
## function: Get-CimRegValue
##
## Using a CimSession, retrieve a particular value from a particular registry key.
## This function isn't general purpose, it only handles dwords and strings. This is
## approximately equivalent to [Win32.RegistryKey]::OpenSubKey().GetValue().
##
function Get-CimRegValue {
	Param(
		[Microsoft.Management.Infrastructure.CimSession] $cimsession,
		[UInt32] $hive,
		[String] $key,
		[String] $value,
		[String] $method
	)

	wv 'Get-CimRegValue' 'hive' $hive 'key' $key 'value' $value 'method' $method
	$args = @{ hDefKey = $hive; sSubKeyName = $key; sValueName = $value }

	$r = Invoke-CimMethod -NameSpace 'root\cimv2' -ClassName StdRegProv -CimSession $cimsession -Arguments $args -MethodName $method
	if ( $r.ReturnValue -ne 0 ) {
		wv "Get-CimRegValue: Returnvalue for $method $value = $( $r.ReturnValue )"
		## value of 1 means "not found" - which is OK
		if ( $r.ReturnValue -ne 1 ) {
			Write-Warning "Get-CimRegValue: Returnvalue for $method $value = $( $r.ReturnValue )"
		}
		$r = $null
		return $null
	}

	$val = $null
	switch ( $method ) {
		'GetDwordValue' {
			$val = $r.uValue
			wv "Get-CimRegValue: dword $value = $val"
		}
		'GetStringValue' {
			$val = $r.sValue
			wv "Get-CimRegValue: string $value= $val"
		}
		Default {
			throw "Invalid method $method"
		}
	}
	$r = $null
	
	return $val
}

##
## function: print-key-values
##
## process-key and process-key-cim acquire values from a particular registry key. This
## function outputs those values to the PowerShell host.
##
function print-key-values {
	Param(
		[String] $name,
		[Uint32] $install,
		[String] $version,
		[UInt32] $SP,
		[Int] $tabs
	)

	$tab = ' ' * 17 ## 17 spaces, based on maxlength of observed .NET versions

	if ( $null -eq $install ) { $install = 0 }
	if ( $null -eq $version ) { $version = '' }
	if ( $null -eq $SP      ) { $SP = 0 }

	if ( $install -eq 0 ) {
		$str = ( $tab * $tabs ) + $name.PadRight( 16 ) + ' ' + $version.PadRight( 16 )
		wv 'process-key: install -eq blank:' $str
		Write-Host $str
	}
	else {
		wv 'process-key: install' $install 'name' $name 'version' $version
		if ( $install -eq 1 ) {
			if ( $SP -gt 0 ) {
				$str = ( $tab * $tabs ) + $name.PadRight( 16 ) + ' ' + $version.PadRight( 16 ) + ' SP' + $SP
				Write-Host $str
			}
			else {
				$str = ( $tab * $tabs ) + $name.PadRight( 16 ) + ' ' + $version.PadRight( 16 )
				Write-Host $str
			}
		}
	}
}

##
## function: process-key
##
## process-key acquires (using .NET) values from the specified key, and then calls a helper
## function so that those values are displayed to the user.
##
function process-key {
	Param(
		[String] $name,
		[Microsoft.Win32.RegistryKey] $key,
		[Int] $tabs
	)

	wv 'process-key: name' $name 'tabs' $tabs 'fullname' $key.Name

	$install = $key.GetValue( 'Install' )	## whether or not the build is installed (this seems senseless?)
	$version = $key.GetValue( 'Version' )	## version of build installed
	$SP = $key.GetValue( 'SP' )		## service pack of build installed

	wv 'process-key: install' $install 'version' $version 'SP' $SP

	print-key-values $name $install $version $SP $tabs
	
	return $version
}

##
## function: process-key-cim
##
## process-key-cim acquires (using CIM) values from the specified key, and then calls a helper
## function so that those values are displayed to the user.
##
function process-key-cim {
	Param(
		[Microsoft.Management.Infrastructure.CimSession] $cimsession,
		[String] $baseKey,
		[String] $subKey,
		[Int] $tabs
	)

	wv 'process-key-cim: baseKey' $baseKey 'subKey' $subKey 'tabs' $tabs

	$targetKey = Join-Path $baseKey $subKey
	wv 'process-key-cim: targetKey' $targetKey

	$install = Get-CimRegValue $cimsession $HKLM $targetKey 'Install' 'GetDWordValue'
	$version = Get-CimRegValue $cimsession $HKLM $targetKey 'Version' 'GetStringValue'
	$SP = Get-CimRegValue $cimsession $HKLM $targetKey 'SP'      'GetDWordValue'

	wv 'process-key-cim: install' $install 'version' $version 'SP' $SP

	print-key-values $subKey $install $version $SP $tabs

	return $version
}

##
## function: report-current-version
##
## This function checks values obtained from the .NET 4.5 registry key to determine what version 
## (if any) of .NET 4.5 or higher is installed on the target computer.
##
function report-current-version {
	Param(
		[String] $version,
		[UInt32] $release
	)

	## $45Table is a top-down stack.

	$text = ''
	$lastKey = $null
	$lastValue = $null

	$current = $45Table.GetEnumerator()

	while ( $current.MoveNext() ) {
		$build = $current.Key
		if ( $release -eq $build ) {
			$text = $current.Value
			break
		}
		if ( $release -gt $build ) {
			if ( $null -eq $lastValue ) {
				## Top-Of-Stack (TOS)
				$text = 'more recent than ' + $current.Value
				break
			}
		
			$text = 'between ' + $current.Value + ' and ' + $lastValue
			break
		}
		$lastKey = $current.Key
		$lastValue = $current.Value
	}

	if ( $text -eq '' ) {
		## this happens when $release is less than the value at bottom-of-stack (BOS)
		$text = 'cannot classify release'
	}

	Write-Host ''
	Write-Host ( 'Current .NET Framework version: ' + $text + ' (' + $version + ' = release ' + $release + ')' )
	
	$current = $null
}

##
## function check-registry-using-net
##
## Attempt to check the specified computer (or localhost, if no other computer was specified) by using
## functions from Microsoft.Win32.Registry in the .NET Framework. In a domain environment, this will
## usually work and is faster than CIM.
##
function check-registry-using-net {
	[Bool] $LocalComputer = if ( $computer -eq '.' -or
		$computer -eq 'localhost' -or
		$computer -eq '127.0.0.1' -or
		$computer -eq $env:ComputerName ) {
		$true
	}
	else {
		$false
	}

	if ( $LocalComputer ) {
		## open the local registry
		$registry = [Microsoft.Win32.RegistryKey]::OpenBaseKey(
			[Microsoft.Win32.RegistryHive]::LocalMachine,
			[Microsoft.Win32.RegistryView]::Default )
	}
	else {
		## use the Remote Registry service
		$registry = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey(
			[Microsoft.Win32.RegistryHive]::LocalMachine,
			$computer ) 
	}

	if ( $null -eq $registry ) {
		Write-Error "Could not open registry to computer $computer"
		return
	}
	
	$registrySubKey = $registry.OpenSubKey( $rootKey )
	$registryValues = $registrySubKey.GetSubKeyNames()

	foreach ( $name in $registryValues ) {
		if ( $name.StartsWith( 'v' ) ) {
			$subKey = $registrySubKey.OpenSubKey( $name )

			$version = process-key $name $subKey 0
			if ( $version -and $version.Length -gt 0 ) {
				continue
			}

			foreach ( $subkeyName in $subKey.GetSubKeyNames() ) {
				$grandChildKey = $subKey.OpenSubKey( $subkeyName )

				$null = process-key $subkeyName $grandChildKey 1

				$grandChildKey.Close()
				$grandChildKey = $null
			}
			
			$subKey.Close()
			$subKey = $null
		}
	}

	## Check for .NET 4.5 and above versions installed

	$key = $registry.OpenSubKey( $45Key )
	if ( $null -ne $key ) {
		wv 'Found Framework version(s) at 4.5 or later'
	
		$version = $key.GetValue( 'Version' )
		$release = $key.GetValue( 'Release' )

		report-current-version $version $release
		
		$key.Close()
		$key = $null
	}
	
	[Bool] $noneWritten = $true

	if ( $registrySubKey.ValueCount -gt 0 ) {
		[Bool] $first = $true

		$valueNames = $registrySubKey.GetValueNames()
		foreach ( $name in $valueNames ) {
			if ( $name.StartsWith( 'BlockNetFramework' ) ) {
				$value = $registrySubKey.GetValue( $name )
				if ( $null -ne $value ) {
					if ( $first ) {
						Write-Host ' '
						$first = $false
					}
					$noneWritten = $false
					Write-Host ( $name + ' = ' + $value + ' (if 0 then not blocked, any other value, blocked)' )
				}
			}
		}
	}

	if ( $noneWritten ) {
		Write-Host ' '
		Write-Host 'No versions of the .NET Framework are blocked on the computer'
	}

	$registrySubKey.Close()
	$registrySubKey = $null

	$registry.Close()
	$registry = $null
}

##
## function check-registry-using-cim
##
## Attempt to check the specified computer (or localhost, if no other computer was specified) by using
## functions built on CIM. CIM is usually based off WinRM, but I allow for the CIM connection to use DCOM.
## This provides connection capabilities not available when using the remote registry service (e.g., 
## non-domain-joined source computers, use of specific credentials, etc.).
##
function check-registry-using-cim {
	if ( $null -eq $UserCimSession ) {
		$parameters = @{ }
	
		$opts = $null
		if ( $UseDcom ) {
			$opts = New-CimSessionOption -Protocol DCOM
			$parameters.SessionOption = $opts
		}
		if ( $computer ) {
			$parameters.ComputerName = $Computer
		}
		if ( $credential ) {
			$parameters.Credential = $Credential
		}
	
		$cimsession = New-CimSession @parameters
		if ( $null -eq $cimsession ) {
			throw "Could not create CIM session to $computer"
		}
	}
	else {
		$cimsession = $UserCimSession
	}

	wv 'about to enumkeys for' $rootKey
	$arguments = @{ hDefKey = $HKLM; sSubKeyName = $rootKey }
	$results = Invoke-CimMethod -NameSpace 'root\cimv2' -ClassName StdRegProv -MethodName EnumKey -Arguments $arguments -CimSession $cimsession
	wv "enumkey result $( $results.ReturnValue )"
	if ( $results.ReturnValue -eq 0 ) {
		foreach ( $name in $results.sNames ) {
			if ( $name.StartsWith( 'v' ) ) {
				$version = process-key-cim $cimsession $rootKey $name 0
				if ( $version -and $version.Length -gt 0 ) {
					continue
				}
				
				## no $version was found, so we've got v4 or v4.0 probably. Gotta look at the subkeys.
				$subKey = Join-Path $rootKey $name
				$args = @{ hDefKey = $HKLM; sSubKeyName = $subKey }
				$r4 = Invoke-CimMethod -NameSpace 'root\cimv2' -ClassName StdRegProv -MethodName EnumKey -Arguments $args -CimSession $cimsession
				if ( $r4.ReturnValue -eq 0 ) {
					foreach ( $subKeyName in $r4.sNames ) {
						$null = process-key-cim $cimsession $subKey $subKeyName 1
					}
				}
				else {
					Write-Error "enumkeys for $subKey, $( $r4.ReturnValue )"
				}
			}
		}
		
		$version = Get-CimRegValue $cimsession $HKLM $45Key 'Version' 'GetStringValue'
		$release = Get-CimRegValue $cimsession $HKLM $45Key 'Release' 'GetDWordValue'
		
		if ( $null -ne $version -and $null -ne $release ) {
			report-current-version $version $release
		}

		$values = Invoke-CimMethod -NameSpace 'root\cimv2' -ClassName StdRegProv -MethodName EnumValues -Arguments $arguments -CimSession $cimsession
		if ( $values.ReturnValue -eq 0 ) {
			[Bool] $first = $true
			[Bool] $noneWritten = $true
				
			foreach ( $name in $values.sNames ) {
				wv "examining $name"
				if ( $name.StartsWith( 'BlockNetFramework' ) ) {
					$value = Get-CimRegValue $cimsession $HKLM $rootKey $name 'GetDWordValue'
					if ( $null -ne $value ) {
						if ( $first ) {
							Write-Host ' '
							$first = $false
						}
						$noneWritten = $false
						Write-Host ( $name + ' = ' + $value + ' (if 0 then not blocked, any other value, blocked)' )
					}
				}
			}

			if ( $noneWritten ) {
				Write-Host ' '
				Write-Host 'No versions of the .NET Framework are blocked on the computer'
			}
		}
	}
	else {
		Write-Error "enumkeys for $rootKey, $( $results.ReturnValue )"
	}
	
	if ( $null -eq $UserCimSession ) {
		Remove-CimSession $cimsession
	}
}

##
## Main
##

if ( $UseCim -or $null -ne $UserCimSession ) {
	check-registry-using-cim
}
else {
	check-registry-using-net
}
