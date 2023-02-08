# args[0] = inFile path
# args[1] = number of faces excluded
$orgText=Get-Content $args[0];
$excFaces=$args[1];
$orgText.ForEach{
	if($_ -match "element face"){
		$incFaces=[Decimal]$_.Split(' ').Get(2) - $excFaces;
	}
}
Get-Content $args[0] -TotalCount $incFaces;