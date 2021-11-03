cls
$ImagePath = "C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina\PngImages"


$files = Get-ChildItem -Path $ImagePath | where name -Like *.png

$csv = Import-Csv -Path "C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina\Purina feed.csv"

foreach($_ in $csv) {
    
    $NameSreachString = ($_.GTIN + "*")
    $Images =Get-ChildItem -Path $ImagePath | where Name -Like $NameSreachString
    
    
    foreach($Image in $Images) {
        
        $result = $Image.FullName.Replace("C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina", "https://github.com/totapp91/Purina/raw/master")
        $result = $result.Replace("\", "/")
        $result = $result.Replace(" ", "%20")
        $Urls += $result
        $Urls += "|"

    }
    
    $Urls = $Urls.Substring(0, $Urls.Length-1)
    $_.Imageurl +=$Urls

    Remove-Variable Urls
    
    
}

foreach ($_ in $csv) {
    Export-Csv -InputObject $_ -Path "C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina\PurinaFeed_Pngimages.csv" -Append -Encoding utf8
}