
$ImagePath = "C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina\images"


$files = Get-ChildItem -Path $ImagePath | where name -Like *.jpg

foreach($_ in $files) {
    
    Rename-Item -Path $_.Fullname -NewName ($_.Name).Replace(".tif", "")
}


$files = Get-ChildItem -Path $ImagePath | where name -Like *.jpg

foreach($_ in $files) {
    
    Move-Item -Path $_.Fullname -Destination "C:\Users\attila.toth\Documents\Azure DevOps\Web development\Purina\JPGimages"
}