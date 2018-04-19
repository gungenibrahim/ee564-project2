' --------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 2D Version 13.0 design 
' Can specify one arg to setup external circuit                       
' --------------------------------------------------------------------

Set oAnsoftApp = CreateObject("AnsoftMaxwell.MaxwellScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
Set oDesign = oProject.GetActiveDesign()
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient", "XY"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "2"))))
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("steel_1010_2DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:steel_1010_2DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 238.7, "Y:=", 0.1903), Array("NAME:Coordinate", _
  "X:=", 318.3, "Y:=", 0.3044), Array("NAME:Coordinate", "X:=", 358.1, "Y:=", _
  0.38045), Array("NAME:Coordinate", "X:=", 437.7, "Y:=", 0.47555), Array(_
  "NAME:Coordinate", "X:=", 477.5, "Y:=", 0.5326), Array("NAME:Coordinate", _
  "X:=", 636.6, "Y:=", 0.7513), Array("NAME:Coordinate", "X:=", 795.8, "Y:=", _
  0.8845), Array("NAME:Coordinate", "X:=", 1114.1, "Y:=", 1.0464), Array(_
  "NAME:Coordinate", "X:=", 1273.2, "Y:=", 1.1416), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.237), Array("NAME:Coordinate", "X:=", 2228.2, "Y:=", _
  1.3328), Array("NAME:Coordinate", "X:=", 3183.1, "Y:=", 1.448), Array(_
  "NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.545), Array("NAME:Coordinate", _
  "X:=", 6366.2, "Y:=", 1.6135), Array("NAME:Coordinate", "X:=", 7957.7, _
  "Y:=", 1.644), Array("NAME:Coordinate", "X:=", 15915.5, "Y:=", 1.7775), _
  Array("NAME:Coordinate", "X:=", 31831, "Y:=", 1.8925), Array(_
  "NAME:Coordinate", "X:=", 47746.5, "Y:=", 1.941), Array("NAME:Coordinate", _
  "X:=", 63662, "Y:=", 1.9705), Array("NAME:Coordinate", "X:=", 79577.5, _
  "Y:=", 1.99525), Array("NAME:Coordinate", "X:=", 159155, "Y:=", 2.1), _
  Array("NAME:Coordinate", "X:=", 318310, "Y:=", 2.3), Array(_
  "NAME:Coordinate", "X:=", 1.90986e+006, "Y:=", 4.3))), "mass_density:=", _
  7872) 
end if
if (oDefinitionManager.DoesMaterialExist("copper_75C")) then
else
oDefinitionManager.AddMaterial Array("NAME:copper_75C", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "conductivity:=", "5.8e+007")
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "54.725mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "1.25deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Band", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "54.725mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "1.25deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "steel_1010_2DSF0.950", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "54.725mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "1.25deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "2"), _
  Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions"
Set oModule = oDesign.GetModule("BoundarySetup")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "2.7554552980815448e-015mm", "YPosition:=", _
  "45mm", "ZPosition:=", "0mm"))
oModule.AssignVectorPotential Array("NAME:VectorPotential1", "Edges:=", Array(edgeID), _
  "Value:=", "0", "CoordinateSystem:=", "")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "22.5mm", "YPosition:=", "0mm", "ZPosition:=", _
  "0mm"))
oModule.AssignMaster Array("NAME:Master1", "Edges:=", Array(edgeID), _
  "ReverseV:=", false)
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "-22.5mm", "YPosition:=", _
  "2.7554552980815448e-015mm", "ZPosition:=", "0mm"))
oModule.AssignSlave Array("NAME:Slave1", "Edges:=", Array(edgeID), _
  "ReverseU:=", true, "Master:=", "Master1", "SameAsMaster:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "ModelDepth:=", _
  "110mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "55mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "36"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.6mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0.6mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "9.800000000000001mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "1.6mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "2.85mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", _
  "4.47mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array(_
  "NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "HalfSlot", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), _
  Array("NAME:Attributes", "Name:=", "Stator", "Flags:=", "", "Color:=", _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "steel_1010_2DSF0.950", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "55mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "36"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.6mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0.6mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "9.800000000000001mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "1.6mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "2.85mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "4.47mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "7"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "5deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", "2"))), Array(_
  "NAME:Attributes", "Name:=", "Coil", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper", "SolveInside:=", true) 
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "10deg", _
  "NumClones:=", "36"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_0,Coil_18"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_1,Coil_19"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_2,Coil_20"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_3,Coil_21"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_4,Coil_22"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_5,Coil_23"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_6,Coil_24"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_7,Coil_25"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_8,Coil_26"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_9,Coil_27"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_10,Coil_28"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_11,Coil_29"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_12,Coil_30"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_13,Coil_31"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_14,Coil_32"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_15,Coil_33"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_16,Coil_34"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "Coil_17,Coil_35"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "55mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "36"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.6mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0.6mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "9.800000000000001mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "1.6mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "2.85mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "4.47mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "7"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "5deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", "3"))), Array(_
  "NAME:Attributes", "Name:=", "CoilRe", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper", "SolveInside:=", true) 
oEditor.Rotate Array("NAME:Selections", "Selections:=", "CoilRe"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "-70deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "CoilRe"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "10deg", _
  "NumClones:=", "36"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "CoilRe"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "CoilRe_0"))))
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_0,CoilRe_18"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_1,CoilRe_19"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_2,CoilRe_20"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_3,CoilRe_21"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_4,CoilRe_22"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_5,CoilRe_23"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_6,CoilRe_24"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_7,CoilRe_25"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_8,CoilRe_26"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_9,CoilRe_27"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_10,CoilRe_28"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_11,CoilRe_29"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_12,CoilRe_30"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_13,CoilRe_31"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_14,CoilRe_32"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_15,CoilRe_33"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_16,CoilRe_34"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.Unite Array("NAME:Selections", "Selections:=", "CoilRe_17,CoilRe_35"), _
  Array("NAME:UniteParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "32.1938ohm", _
  "Inductance:=", "0.0076439H", "Voltage:=", "310.269 * sin(2*pi*50*time)", _
  "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "32.1938ohm", _
  "Inductance:=", "0.0076439H", "Voltage:=", _
  "310.269 * sin(2*pi*50*time-2*pi/3)", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "32.1938ohm", _
  "Inductance:=", "0.0076439H", "Voltage:=", _
  "310.269 * sin(2*pi*50*time-4*pi/3)", "ParallelBranchesNum:=", "1")
oModule.AssignCoil Array("NAME:PhA_0", "Objects:=", Array("Coil_0"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_0", "Objects:=", Array("CoilRe_7"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_1", "Objects:=", Array("Coil_1"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_1", "Objects:=", Array("CoilRe_8"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_2", "Objects:=", Array("Coil_2"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_2", "Objects:=", Array("CoilRe_9"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhCRe_3", "Objects:=", Array("Coil_3"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_3", "Objects:=", Array("CoilRe_10"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_4", "Objects:=", Array("Coil_4"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_4", "Objects:=", Array("CoilRe_11"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_5", "Objects:=", Array("Coil_5"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_5", "Objects:=", Array("CoilRe_12"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhB_6", "Objects:=", Array("Coil_6"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_6", "Objects:=", Array("CoilRe_13"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_7", "Objects:=", Array("Coil_7"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_7", "Objects:=", Array("CoilRe_14"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_8", "Objects:=", Array("Coil_8"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_8", "Objects:=", Array("CoilRe_15"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhARe_9", "Objects:=", Array("Coil_9"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_9", "Objects:=", Array("CoilRe_16"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_10", "Objects:=", Array("Coil_10"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_10", "Objects:=", Array("CoilRe_17"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_11", "Objects:=", Array("Coil_11"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhC_12", "Objects:=", Array("Coil_12"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_13", "Objects:=", Array("Coil_13"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_14", "Objects:=", Array("Coil_14"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhBRe_15", "Objects:=", Array("Coil_15"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_16", "Objects:=", Array("Coil_16"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_17", "Objects:=", Array("Coil_17"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhA_29", "Objects:=", Array("CoilRe_0"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhCRe_30", "Objects:=", Array("CoilRe_1"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_31", "Objects:=", Array("CoilRe_2"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_32", "Objects:=", Array("CoilRe_3"), _
  "Conductor number:=", 65, "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhB_33", "Objects:=", Array("CoilRe_4"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_34", "Objects:=", Array("CoilRe_5"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_35", "Objects:=", Array("CoilRe_6"), _
  "Conductor number:=", 65, "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Coil", "RefineInside:=", true, _
  "Objects:=", Array("Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", _
  "Coil_5", "Coil_6", "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11", _
  "Coil_12", "Coil_13", "Coil_14", "Coil_15", "Coil_16", "Coil_17", _
  "CoilRe_0", "CoilRe_1", "CoilRe_2", "CoilRe_3", "CoilRe_4", "CoilRe_5", _
  "CoilRe_6", "CoilRe_7", "CoilRe_8", "CoilRe_9", "CoilRe_10", "CoilRe_11", _
  "CoilRe_12", "CoilRe_13", "CoilRe_14", "CoilRe_15", "CoilRe_16", _
  "CoilRe_17"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "1.83mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "54.45mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "30"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "1"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.544mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), Array(_
  "NAME:Pair", "Name:=", "Hs2", "Value:=", "8.949999999999999mm"), Array(_
  "NAME:Pair", "Name:=", "Bs0", "Value:=", "1.1mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "3.69mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "0.8080000000000001mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Rotor", _
  "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "steel_1010_2DSF0.950", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SquirrelCage", "Version:=", "12.11", _
  "NoOfParameters:=", 24, "Library:=", "syslib", Array("NAME:ParamVector", _
  Array("NAME:Pair", "Name:=", "DiaGap", "Value:=", "54.45mm"), Array(_
  "NAME:Pair", "Name:=", "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", _
  "Name:=", "Length", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", "30"), _
  Array("NAME:Pair", "Name:=", "SlotType", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "Hs0", "Value:=", "0.544mm"), Array("NAME:Pair", "Name:=", "Hs01", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.949999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "1.1mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "3.69mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "0.8080000000000001mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "BarEndExt", "Value:=", "5mm"), Array("NAME:Pair", _
  "Name:=", "RingLength", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", _
  "RingHeight", "Value:=", "5mm"), Array("NAME:Pair", "Name:=", "RingDiaGap", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "CastRotor", "Value:=", "1"), _
  Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", "15deg"), Array(_
  "NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", _
  "Name:=", "InfoCoil", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Bar", "Flags:=", "", "Color:=", "(119 198 206)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "copper_75C", _
  "SolveInside:=", true) 
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Bar", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Bar")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignEndConnection Array("NAME:EndConnection1", "Objects:=", Array(_
  "Bar", "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", "Bar_Separate4", _
  "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", "Bar_Separate8", _
  "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", "Bar_Separate12", _
  "Bar_Separate13", "Bar_Separate14"), "ResistanceValue:=", "4.0617e-006ohm", _
  "InductanceValue:=", "6.88958e-009H")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Bar", "RefineInside:=", true, _
  "Objects:=", Array("Bar", "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", _
  "Bar_Separate4", "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", _
  "Bar_Separate8", "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", _
  "Bar_Separate12", "Bar_Separate13", "Bar_Separate14"), "RestrictElem:=", _
  false, "NumMaxElem:=", "1000", "RestrictLength:=", true, "MaxLength:=", _
  "0.404mm")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Bar", "Objects:=", Array("Bar", _
  "Bar_Separate1", "Bar_Separate2", "Bar_Separate3", "Bar_Separate4", _
  "Bar_Separate5", "Bar_Separate6", "Bar_Separate7", "Bar_Separate8", _
  "Bar_Separate9", "Bar_Separate10", "Bar_Separate11", "Bar_Separate12", _
  "Bar_Separate13", "Bar_Separate14"), "SurfDevChoice:=", 2, "SurfDev:=", _
  "0.027225mm", "NormalDevChoice:=", 2, "NormalDev:=", "15deg", _
  "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "54.45mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "30"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "1"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.544mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0mm"), Array(_
  "NAME:Pair", "Name:=", "Hs2", "Value:=", "8.949999999999999mm"), Array(_
  "NAME:Pair", "Name:=", "Bs0", "Value:=", "1.1mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "3.69mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "0.8080000000000001mm"), Array("NAME:Pair", "Name:=", "Rs", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "FilletType", "Value:=", _
  "0"), Array("NAME:Pair", "Name:=", "HalfSlot", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "15deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "100"))), Array("NAME:Attributes", "Name:=", _
  "InnerRegion", "Flags:=", "", "Color:=", "(0 255 255)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "vacuum", _
  "SolveInside:=", true) 
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Main", "Objects:=", Array(_
  "Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.045mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Main", "RefineInside:=", true, _
  "Objects:=", Array("Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", _
  "Shaft"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "3.555mm")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion"), Array("NAME:ChangedProps", Array(_
  "NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Coil_12,Coil_13,Coil_14,Coil_15,Coil_16" & _
  ",Coil_17,CoilRe_0,CoilRe_1,CoilRe_2,CoilRe_3,CoilRe_4,CoilRe_5,CoilRe_6" & _
  ",CoilRe_7,CoilRe_8,CoilRe_9,CoilRe_10,CoilRe_11,CoilRe_12,CoilRe_13" & _
  ",CoilRe_14,CoilRe_15,CoilRe_16,CoilRe_17,Rotor", "Tool Parts:=", _
  "Tool"), Array("NAME:SubtractParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Rotor")
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "0deg", "HasRotateLimit:=", false, "NonCylindrical:=", false, _
  "Consider Mechanical Transient:=", true, "Angular Velocity:=", "1470rpm", _
  "Moment of Inertia:=", 0.000740421, "Damping:=", 0.00141847, _
  "Load Torque:=", "if(speed<116.239, -0.00604904*speed, -81.7316/speed)", _
  "Objects:=", Array("Band"))
oModule.EditMotionSetup "MotionSetup1", Array("NAME:Data", _
  "Consider Mechanical Transient:=", false)
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "StopTime:=", "0.2s", _
  "TimeStep:=", "0.0002s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.002ms" 
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Torque", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Moving1.Torque")), Array()
oModule.CreateReport "Winding Currents", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("Current(PhaseA)", _
  "Current(PhaseB)", "Current(PhaseC)")), Array()
oEditor.ShowWindow
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetupYConnection Array(Array("NAME:YConnection", "Windings:=", _
  "PhaseA,PhaseB,PhaseC"))
