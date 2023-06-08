function re {
	cd ~/repos
}

Set-PSReadlineOption -EditMode vi

Import-Module -Name Terminal-Icons

Invoke-Expression (&starship init powershell)
