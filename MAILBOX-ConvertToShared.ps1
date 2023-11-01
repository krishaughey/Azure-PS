#Convert Licensed Mailboxes to Shared from List of Email Addresses
## Author: https://www.alitajran.com/convert-user-mailbox-to-shared-mailbox-with-powershell/ (EDITED to RemoteMailbox)
##### Run Exchange Management Shell as administrator

$MailboxList= Get-Content "C:\Temp\MailboxList.txt"

foreach ($MailboxName in $MailboxList) {
    $Mailbox = Get-RemoteMailbox -Identity $MailboxName -ErrorAction SilentlyContinue
    
    if ($Mailbox -eq $null) {
        Write-Host "Mailbox '$MailboxName' not found." -ForegroundColor Red
    }
    elseif ($Mailbox.RecipientTypeDetails -eq "SharedMailbox") {
        Write-Host "Mailbox '$MailboxName' is already a shared mailbox." -ForegroundColor Cyan
    }
    else {
        Set-RemoteMailbox -Identity $MailboxName -Type Shared -ErrorAction SilentlyContinue

        $UpdatedMailbox = Get-RemoteMailbox -Identity $MailboxName

        if ($UpdatedMailbox.RecipientTypeDetails -eq "RemoteSharedMailbox") {
            Write-Host "Mailbox '$MailboxName' converted to shared mailbox successfully." -ForegroundColor Green
        }
        else {
            Write-Host "Failed to convert mailbox '$MailboxName' to user mailbox." -ForegroundColor Red
        }
    }
}
