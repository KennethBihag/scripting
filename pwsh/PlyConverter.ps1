# converts .ply to .asc args[0] - input ply name
# args[1] - output format off or asc
$count=0;
function helpme(){
	ECHO ("< off|asc>" + " " + "[number of vertices]");
	return;
}
IF ($args[0] -eq "help" -or $args.Length -eq 0){ helpme; return;}
IF((Get-Content $args[0] -TotalCount 1) -ne "ply"){ECHO "Use a fucking .ply!!!"}
ELSE{
	$PSDefaultParameterValues=@{'Out-File:Encoding'='utf7'};
	$format = $args[1];
	$VertCnt=$args[2];
	if($VertCnt -ne $null){
		if($VertCnt.GetType().Name -ne 'Int32'){
			$VertCnt = $null;
		}
	}
	$outFile = ($args[0].Substring(0,$args[0].Length-4)+'.'+$format);
	IF(Test-Path $outFile){DEL $outFile};
	$header=$false;
	(Get-Content $args[0]).ForEach{
		$lineNum++;
		if($_ -Match "element vertex"){
			$vertices=[Int32]$_.Split()[2];
			if($VertCnt -eq $null){ $VertCnt = $vertices}
		}
		if($header){
			if(($lineNum -gt $headerLine) -and (($lineNum - $headerLine)-le $VertCnt) -and (($lineNum - $headerLine)-le $vertices)){
			$_ -match "-?\d*`.\d*e?-?\d* -?\d*`.\d*e?-?\d* -?\d*`.\d*e?-?\d*" | Out-Null;
			$matched = $matches[0];
			Out-File -InputObject $matched $outFile -Append;
			$count++;
				if($lineNum-$headerLine -eq $VertCnt){
					return ECHO ("The new file contains "+($count).ToString()+" vertices.");
				}
			}
		}
		if($_ -eq "end_header"){
			$headerLine=$lineNum;
			$header = $true;
		}
	}
}