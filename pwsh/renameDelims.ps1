IF($args.Count -lt 1){
	ECHO "< 'stu' | 'uts' | 'dts' > <directory>"
	RETURN;
}

$count=0;
$mode = $args[0];
DIR $args[1] -File -Recurse | ForEach {
	IF($mode -eq "stu" -and $_.Name.Contains(' ')){
		$count++;
		Write-Host ($_.Name+"; ") -NoNewLine
		Rename-Item $_ $_.Name.Replace(' ','_');
	}
	ELSE {
		IF ( $mode -eq "uts" -and $_.Name.Contains('_') ) {
		$count++;
		Write-Host ($_.Name+"; ") -NoNewLine
		Rename-Item $_ $_.Name.Replace('_',' ');
		}
	}
}
IF($count -eq 1){ $doneMess = "1 file renamed" }
ELSE{ $doneMess = $count.ToString()+" files renamed" }
ECHO ("`n"+$doneMess);