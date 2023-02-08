function CountElements{
	$elements=New-Object System.Collections.ArrayList
	$shareds = New-Object System.Collections.ArrayList
	$repeated=0
	$repShared=0
	(DIR -Name 'tile_[0-9]*_[0-9].json').ForEach{
		$fileName=$_
		$currJsonString=(TYPE $_)
		$currJsonObj=ConvertFrom-Json $currJsonString
		$currElements=$currJsonObj.geometries
		$currShareds = $currJsonObj.sharedGeometries
		$currElements.ForEach{
			IF (!$elements.Contains($_.entityId)){
				$elements.Add($_.entityId)>>$null
			}
		}
		$currShareds.ForEach{
			IF(!$shareds.Contains($_.id)){
				$shareds.Add($_.id)>>$null
			}
		}
		$repeated+=$currElements.Count;
		$repShared+=$currShareds.Count;
	}
	$mess1 = "Unique Count: "+$elements.Count.ToString()+" Elements, "+$shareds.Count.ToString()+" Shared Elements"
	Write-Host -ForegroundColor Red $mess1
	$mess1 = "Count: "+$repeated.ToString()+" Elements, "+$repShared.Count.ToString()+" Shared Elements"
	Write-Host -ForegroundColor Blue $mess1
}


function FindJsonForElement($entityId){
	(DIR -Name 'tile_[0-9]*_[0-9].json').ForEach{
		$currJsonFile=$_
		$currJsonString=(TYPE $_)
		$currJsonObj=ConvertFrom-Json $currJsonString
		$currJsonObj.geometries.ForEach{
			IF($_.entityId -Like $entityId){
				echo $currJsonFile
			}
		}
	}
}