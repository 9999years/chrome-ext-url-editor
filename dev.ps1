[CmdletBinding(DefaultParametersetname="Server")]
Param(
	$Sass="sass",
	$SassDir="sass",
	$CssDir="css",
	$ExcludeClean=[Collections.ArrayList]::new(),
	[Parameter(ParameterSetName="Build")]
	[Switch]$Build,
	[Parameter(ParameterSetName="Clean")]
	[Switch]$Clean
)

$sassDirs = "$SassDir`:$CssDir"
$Watch = If($PSCmdlet.ParameterSetName -eq "Server") {
	"watch"
} Else {
	"update"
}

# keep this in sync with post-merge.sh
$sassArgs = ("--unix-newlines", "--sourcemap=none", "-E", "UTF-8", "--$Watch", $sassDirs)

Switch($PSCmdlet.ParameterSetName) {
	"Build" {
		& $Sass $sassArgs
	}

	"Server" {
		"Starting $Sass $sassArgs"
		Start-Process $Sass $sassArgs -WindowStyle Minimized
		$hugoArgs = ("server", "-D")
	}

	"Clean" {
		Get-ChildItem "css" -Exclude $ExcludeClean |
		Remove-Item -Recurse
	}
}
