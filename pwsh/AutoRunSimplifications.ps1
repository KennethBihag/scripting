$mode=`
# "Fast-Quadric-Mesh-Simplification"
# "MeshDecimatorTool"
 "Mesh-Simplify"
# "Spectral"
$inMeshFolder=`
 "D:\KennethBihag\3D models"
# "D:\KennethBihag\BIM models\meshes"
# "D:\KennethBihag\BIM models\meshes\Precast Hollow-Core Slab 8 (with Multiple Rooms and Curtain Wall)"
# "D:\KennethBihag\BIM models\meshes\SSW 4.2.1 (a) (iii) scenario 01, 02, 03-C - IFC4"
# "D:\KennethBihag\BIM models\meshes\SSW WRN 5 C"
$inMeshName=`
 "bunny"
# "dragon"
# "ifcRailing_1xa_1hqXX5fhC3oZT1Y_Zx"
# "Stairs"
# "ifcFlowFitting_2hbG9St0nAjwKd2Pz3CkG8"
# "inidoro_25tmYBJFTAQvYXi3Vm3roy"
# "ifcDoor_1pfG65rNL1t9mLjlq7azTt"
$inMeshExt=`
# ".off"
 ".obj"
# ".ply"
$inMeshPath=$inMeshFolder+"\"+$inMeshName+$inMeshExt
$outMeshFolder=$mode
switch($mode){
	"Mesh-Simplify"{
		$tool="E:\Mesh-Simplify\src\a.exe"
		for($percentage=0.5;$percentage -ge 0.01;$percentage=[math]::Round($percentage/2,2)){
			$outMeshPath=$outMeshFolder+"\"+$inMeshName+"("+$percentage+")"+$inMeshExt
			$outLog=$outMeshPath.Replace($inMeshExt,"_results.txt")
			$toolArgs="`"$inMeshPath`" `"$outMeshPath`" $percentage"
			Start-Process -FilePath $tool -ArgumentList $toolArgs `
				-Wait -NoNewWindow -RedirectStandardOutput $outLog
		}
	}
	"MeshDecimatorTool"{
		$tool='E:\MeshDecimator-master\SimplifyGeometryBody\bin\Release\SimplifyGeometryBody.exe'
		Start-Process $tool -NoNewWindow -Wait
		ECHO Not implemented yet for $mode
	}
	"Fast-Quadric-Mesh-Simplification"{
		$tool="E:\Fast-Quadric-Mesh-Simplification\bin64\Simplify.CMD.exe"
		for($percentage=0.5;$percentage -ge 0.01;$percentage=[math]::Round($percentage/2,2)){
			$outMeshPath=$outMeshFolder+"\"+$inMeshName+"("+$percentage+")"+$inMeshExt
			$outLog=$outMeshPath.Replace($inMeshExt,"_results.txt")
			$toolArgs="`"$inMeshPath`" `"$outMeshPath`" $percentage"
			Start-Process -FilePath $tool -ArgumentList $toolArgs `
				-Wait -NoNewWindow -RedirectStandardOutput $outLog
		}
	}
	"Spectral"{
		$tool="E:\spectral-mesh-simplification\bin\spectral-collapsing.exe"
		for($fixed=130;$fixed -ge 10;$fixed-=20){
			$outMeshPath=$outMeshFolder+"\"+$inMeshName+"_v"+[int]$fixed+$inMeshExt
			$outLog=$outMeshPath.Replace($inMeshExt,"_results.txt")
			$toolArgs="`"$inMeshPath`" `"$outMeshPath`" $fixed stream qem noflips=true keepborders=true recompute=true"
			Start-Process -FilePath $tool -ArgumentList $toolArgs `
				-Wait -NoNewWindow -RedirectStandardOutput $outLog
		}
	}
}