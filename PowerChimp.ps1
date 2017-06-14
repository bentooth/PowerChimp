function Send-BlogEmail {
    param(
       [Parameter(Mandatory=$false,Position=0,ValueFromPipeline=$true)] 
       [string]$blogEmail
    )

    $EmailFrom = "EMAIL"
    $EmailTo = $blogEmail 
    $Subject = "SUBJECT" 
    $Body = "BODY" 

    $SMTPServer = "smtp.gmail.com" 
    $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
    $SMTPClient.EnableSsl = $true 
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential("EMAIL", "PASSWORD"); 
    $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)

    #Getting Auth error? Visit https://www.google.com/settings/security/lesssecureapps 
    #and Turn On Access for less secure apps

}

function Send-MassBlogFromList {

    $PathToBlogList = "C:\emails.txt"
    
    $emails = Get-Content $PathToBlogList

    foreach ($email in $emails) {

        Send-BlogEmail $email

    }

}
