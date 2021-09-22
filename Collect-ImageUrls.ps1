cls
$ImagePath = "C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina\JPGimages"


$files = Get-ChildItem -Path $ImagePath | where name -Like *.jpg

$csv = Import-Csv -Path "C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina\Purina feed.csv"

foreach($_ in $csv) {
    
    $NameSreachString = ($_.GTIN + "*")
    $Images =Get-ChildItem -Path $ImagePath | where Name -Like $NameSreachString
    
    
    foreach($Image in $Images) {
        
        $Urls += $Image.Fullname
        $Urls += "|"

    }
    
    $Urls = $Urls.Substring(0, $Urls.Length-1)
    $_.Imageurl +=$Urls

    Remove-Variable Urls
    
    
}