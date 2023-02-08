if($args.Length -lt 1){
	ECHO "enter ASCII value of OpCode"
}
else{
	$code = $args[0].ToString()
	#ECHO ($code + " in hex is " + $code)
	#ECHO ($code + " in decimal is " + ([Int16]("0x"+$code)))
	DIR TKE*.html | ForEach {
		$fileName = $_.Name
		$line = 0; $_line=0;
			TYPE $_ | ForEach{
			++$line
			IF($_ -Match "Hexadecimal</TD>")
				{$_line=$line+1}
			IF($line -EQ $_line){
				$_ -match ">$code" >> $null
				$matchedHex = $matches[0] -Replace">",""
				IF($matchedHex -EQ $code){
					$fileName
				}
			}
		}
	}
}