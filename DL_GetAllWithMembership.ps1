# Get All O365 Distribution Groups with Membership
##### author: Kristopher F. Haughey

$Groups = Get-DistributionGroup -ResultSize Unlimited
$Groups | ForEach-Object {
$group = $_.Name
Get-DistributionGroupMember $group -ResultSize Unlimited | ForEach-Object {
      New-Object -TypeName PSObject -Property @{
       Group = $group
       Member = $_.Name
       EmailAddress = $_.PrimarySMTPAddress
       RecipientType= $_.RecipientType
      }
   }
} |
 
Export-CSV "C:\Temp\O365_DLMembership_20201029.csv" -NoTypeInformation
