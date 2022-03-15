$global:appLocation = Get-Location
Write-Host "Application is located at $appLocation"
$global:directorySize = (Get-ChildItem "$appLocation\Topics").count


function Get-HomeworkFolderNames()
{
    $global:folderNamesArray = @()
    $folderNamesArrayLength = $folderNamesArray.count
    
    for(($i = 0); $i -le $directorySize; $i++)
    {
        Write-Host "The length of the Folder Names Array is: $folderNamesArrayLength" 
        $folderNamesArrayLength = $folderNamesArray.count
        $folderName = Get-ChildItem -Path "$appLocation\Topics" -Directory | Select-Object -Index $i
        $folderNamesArray += ,$folderName
    }    

    for($j = 0; $j -lt $folderNamesArrayLength; $j++)
    {
        
        Write-Host $folderNamesArray[$j]
        Write-Host "buffer $j"
    }
    return $folderNamesArray
}

function Get-HomeworkFileNames()
{
    # check to see if $folderNamesArray holds the name of the file that is being compared to it (object being sorted in $fileName)

    
    $global:fileNameArray = @()

    $fileNamesArrayLength = $fileNameArray.count
    for($k = 0; $k -lt $fileNamesArrayLength; $k++){ #reads the contents of the directory that the application is placed in, adds them by name to the array
        $fileNamePlaceholder = Get-ChildItem -Path "$appLocation" -File | Select-Object -Index $k
        $fileNameArray += $fileNamePlaceholder

        if($fileNameArray -contains $fileName){ 
            Write-Host "THE FOLDER exists, THE FILE shall be moved there at some point soon!!!"
        } else {
            Write-Host "A folder corresponding to the FILE does not exist. Fucking dummy"
        }
    }
}


#calling the functions
Get-HomeworkFolderNames
Get-HomeworkFileNames