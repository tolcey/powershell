$tarih= (get-date).ToString("dd-MM-yy")

Search-ADAccount -LockedOut -UsersOnly -ResultPageSize 2000 -resultSetSize $null | Select-Object Name, SamAccountName, DistinguishedName | Export-CSV “C:\KilitliKullanıcılar-$tarih.csv” -NoTypeInformation

$MailSender = " Gönderenin Adı<E-posta Adresi>" #Örnek; Tolga Ceyhan <iletisim@tolgaceyhan.com#
$Subject = "E-Posta Başlığı" #Epostanıza başlık giriniz.#
$EmailBody = "Kilitli kullanıcı listesine ekte ulaşabilirsiniz"
$SMTPServer = 'SMTP Adresi' #SMTP adresini giriniz.#
$filepath = "C:\KilitliKullanıcılar-$tarih.csv" 

If ((Get-Item $filepath).Length -gt 0kb) { 
Send-MailMessage -Encoding UTF8 -To "Alıcının E-posta Adresi" `
-From $MailSender -SmtpServer $SMTPServer `
-Subject $Subject `
-BodyAsHtml $EmailBody `
-Attachments $filepath `

}
else
{}