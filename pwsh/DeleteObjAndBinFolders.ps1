#Deletes all bin and obj folders in the current directory
function bin_() {
	(DIR -Recurse -Name -Attributes D).ForEach{
		IF($_.EndsWith("\bin")){
			RMDIR $_ -Recurse}
	}
}
function obj_() {
	(DIR -Recurse -Name -Attributes D).ForEach{
		IF($_.EndsWith("\obj")){
			RMDIR $_ -Recurse}
	}
}
IF ( $args.Count -lt 1 ){
	ECHO ("`< `"obj`" `| `"bin`" `>")
	echo ("obj - Delete OBJ folders")
	echo ("bin - Delete BIN folders")
	return
}
ELSEIF ($args[0] -eq "obj"){
	obj_;
}
ELSEIF ($args[0] -eq "bin"){
	bin_;
}
ELSE { return }