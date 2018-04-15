' --------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 3D Version 13.0 design 
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
oDesign.SetSolutionType "Transient"
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
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
if (oDefinitionManager.DoesMaterialExist("steel_1008_3DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:steel_1008_3DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 159.2, "Y:=", 0.2402), Array("NAME:Coordinate", _
  "X:=", 318.3, "Y:=", 0.8654), Array("NAME:Coordinate", "X:=", 477.5, "Y:=", _
  1.1106), Array("NAME:Coordinate", "X:=", 636.6, "Y:=", 1.2458), Array(_
  "NAME:Coordinate", "X:=", 795.8, "Y:=", 1.331), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.5), Array("NAME:Coordinate", "X:=", 3183.1, "Y:=", _
  1.6), Array("NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.683), Array(_
  "NAME:Coordinate", "X:=", 6366.2, "Y:=", 1.741), Array("NAME:Coordinate", _
  "X:=", 7957.7, "Y:=", 1.78), Array("NAME:Coordinate", "X:=", 15915.5, "Y:=", _
  1.905), Array("NAME:Coordinate", "X:=", 31831, "Y:=", 2.025), Array(_
  "NAME:Coordinate", "X:=", 47746.5, "Y:=", 2.085), Array("NAME:Coordinate", _
  "X:=", 63662, "Y:=", 2.13), Array("NAME:Coordinate", "X:=", 79577.5, "Y:=", _
  2.165), Array("NAME:Coordinate", "X:=", 159155, "Y:=", 2.28), Array(_
  "NAME:Coordinate", "X:=", 318310, "Y:=", 2.485), Array("NAME:Coordinate", _
  "X:=", 397887, "Y:=", 2.5851), Array("NAME:Coordinate", "X:=", 1.19366e+006, _
  "Y:=", 3.5861))), "mass_density:=", 7872, Array("NAME:stacking_type", _
  "property_type:=", "ChoiceProperty", "Choice:=", "Lamination"), _
  "stacking_factor:=", "0.95", Array("NAME:stacking_direction", _
  "property_type:=", "ChoiceProperty", "Choice:=", "V(3)"))
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
  "Name:=", "DiaGap", "Value:=", "54mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "164.1819463750201mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "2.5deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Band", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "54mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "164.1819463750201mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "2.5deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "54mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "164.1819463750201mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "2.5deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "2"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "HalfAxial", "halfAxial"
On Error Goto 0
oEditor.Copy Array("NAME:Selections", "Selections:=", _
  "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "2"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "MasterSheet"))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "MasterSheet")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "MasterSheet1:CreateUserDefinedPart:1", "InfoCore", "3"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "MasterSheet1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "SlaveSheet"))))
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignMaster Array("NAME:Master", "Objects:=", Array("MasterSheet"), _
  Array("NAME:CoordSysVector", "Origin:=", Array("0mm", "0mm", "0mm"), _
  "UPos:=", Array("45mm", "0mm", "0mm")), "ReverseV:=", true)
oModule.AssignSlave Array("NAME:Slave", "Objects:=", Array("SlaveSheet"), _
  Array("NAME:CoordSysVector", "Origin:=", Array("0mm", "0mm", "0mm"), _
  "UPos:=", Array("-45mm", "5.5109105961630896e-015mm", "0mm")), "ReverseV:=", _
  true, "Master:=", "Master", "RelationIsSame:=", true)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "55mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "36"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.6mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0.6mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "9.800000000000001mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "1.6mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "2.8mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", _
  "4.47mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), Array(_
  "NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "HalfSlot", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", _
  "Value:=", "164.1819463750201mm"), Array("NAME:Pair", "Name:=", "InfoCore", _
  "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Stator", "Flags:=", _
  "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "steel_1008_3DSF0.950", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "55mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "36"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.6mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0.6mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "9.800000000000001mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "1.6mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "2.8mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "4.47mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "7"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "5deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "164.1819463750201mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper", "SolveInside:=", true) 
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "10deg", _
  "NumClones:=", "36"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "55mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "90mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "36"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "4"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.6mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "0.6mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "9.800000000000001mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "1.6mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "2.8mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "4.47mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "2"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "7"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "5deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "164.1819463750201mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "2"))), Array("NAME:Attributes", "Name:=", "CoilTerm", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper", "SolveInside:=", true) 
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", _
  "CoilTerm"), Array("NAME:DuplicateAroundAxisParameters", _
  "CoordinateSystemID:=", -1, "CreateNewObjects:=", true, "WhichAxis:=", "Z", _
  "AngleStr:=", "10deg", "NumClones:=", "36"), Array("NAME:Options", _
  "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "CoilTerm"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "CoilTerm_0"))))
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "1.#INFohm", _
  "Inductance:=", "0H", "Voltage:=", "310.269 * sin(2*pi*50*time)", _
  "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "1.#INFohm", _
  "Inductance:=", "0H", "Voltage:=", "310.269 * sin(2*pi*50*time-2*pi/3)", _
  "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Resistance:=", "1.#INFohm", _
  "Inductance:=", "0H", "Voltage:=", "310.269 * sin(2*pi*50*time-4*pi/3)", _
  "ParallelBranchesNum:=", "1")
oModule.AssignCoilTerminal Array("NAME:PhA_0", "Objects:=", Array("CoilTerm_0"), _
  "Conductor number:=", 1, "Point out of terminal:=", false, "Winding:=", _
  "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_1", "Objects:=", Array("CoilTerm_1"), _
  "Conductor number:=", 1, "Point out of terminal:=", false, "Winding:=", _
  "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_2", "Objects:=", Array("CoilTerm_2"), _
  "Conductor number:=", 1, "Point out of terminal:=", false, "Winding:=", _
  "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhCRe_3", "Objects:=", Array(_
  "CoilTerm_3"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_4", "Objects:=", Array(_
  "CoilTerm_4"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_5", "Objects:=", Array(_
  "CoilTerm_5"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhB_6", "Objects:=", Array("CoilTerm_6"), _
  "Conductor number:=", 1, "Point out of terminal:=", false, "Winding:=", _
  "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_7", "Objects:=", Array("CoilTerm_7"), _
  "Conductor number:=", 1, "Point out of terminal:=", false, "Winding:=", _
  "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_8", "Objects:=", Array("CoilTerm_8"), _
  "Conductor number:=", 1, "Point out of terminal:=", false, "Winding:=", _
  "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhARe_9", "Objects:=", Array(_
  "CoilTerm_9"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_10", "Objects:=", Array(_
  "CoilTerm_10"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_11", "Objects:=", Array(_
  "CoilTerm_11"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhC_12", "Objects:=", Array(_
  "CoilTerm_12"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_13", "Objects:=", Array(_
  "CoilTerm_13"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_14", "Objects:=", Array(_
  "CoilTerm_14"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhBRe_15", "Objects:=", Array(_
  "CoilTerm_15"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_16", "Objects:=", Array(_
  "CoilTerm_16"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_17", "Objects:=", Array(_
  "CoilTerm_17"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhA_18", "Objects:=", Array(_
  "CoilTerm_18"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_19", "Objects:=", Array(_
  "CoilTerm_19"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhA_20", "Objects:=", Array(_
  "CoilTerm_20"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhCRe_21", "Objects:=", Array(_
  "CoilTerm_21"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_22", "Objects:=", Array(_
  "CoilTerm_22"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhCRe_23", "Objects:=", Array(_
  "CoilTerm_23"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhB_24", "Objects:=", Array(_
  "CoilTerm_24"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_25", "Objects:=", Array(_
  "CoilTerm_25"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhB_26", "Objects:=", Array(_
  "CoilTerm_26"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhARe_27", "Objects:=", Array(_
  "CoilTerm_27"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_28", "Objects:=", Array(_
  "CoilTerm_28"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhARe_29", "Objects:=", Array(_
  "CoilTerm_29"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseA")
oModule.AssignCoilTerminal Array("NAME:PhC_30", "Objects:=", Array(_
  "CoilTerm_30"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_31", "Objects:=", Array(_
  "CoilTerm_31"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhC_32", "Objects:=", Array(_
  "CoilTerm_32"), "Conductor number:=", 1, "Point out of terminal:=", false, _
  "Winding:=", "PhaseC")
oModule.AssignCoilTerminal Array("NAME:PhBRe_33", "Objects:=", Array(_
  "CoilTerm_33"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_34", "Objects:=", Array(_
  "CoilTerm_34"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
oModule.AssignCoilTerminal Array("NAME:PhBRe_35", "Objects:=", Array(_
  "CoilTerm_35"), "Conductor number:=", 1, "Point out of terminal:=", true, _
  "Winding:=", "PhaseB")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Coil", "RefineInside:=", true, _
  "Objects:=", Array("Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", _
  "Coil_5", "Coil_6", "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11", _
  "Coil_12", "Coil_13", "Coil_14", "Coil_15", "Coil_16", "Coil_17", "Coil_18", _
  "Coil_19", "Coil_20", "Coil_21", "Coil_22", "Coil_23", "Coil_24", "Coil_25", _
  "Coil_26", "Coil_27", "Coil_28", "Coil_29", "Coil_30", "Coil_31", "Coil_32", _
  "Coil_33", "Coil_34", "Coil_35"), "RestrictElem:=", false, "NumMaxElem:=", _
  "1000", "RestrictLength:=", true, "MaxLength:=", "7.27mm")
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Coil", "Objects:=", Array(_
  "Coil_0", "Coil_1", "Coil_2", "Coil_3", "Coil_4", "Coil_5", "Coil_6", _
  "Coil_7", "Coil_8", "Coil_9", "Coil_10", "Coil_11", "Coil_12", "Coil_13", _
  "Coil_14", "Coil_15", "Coil_16", "Coil_17", "Coil_18", "Coil_19", "Coil_20", _
  "Coil_21", "Coil_22", "Coil_23", "Coil_24", "Coil_25", "Coil_26", "Coil_27", _
  "Coil_28", "Coil_29", "Coil_30", "Coil_31", "Coil_32", "Coil_33", "Coil_34", _
  "Coil_35"), "NormalDevChoice:=", 2, "NormalDev:=", "30deg", _
  "AspectRatioChoice:=", 1)
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "53mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
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
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "164.1819463750201mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Rotor", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "steel_1008_3DSF0.950", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SquirrelCage", "Version:=", "12.11", _
  "NoOfParameters:=", 24, "Library:=", "syslib", Array("NAME:ParamVector", _
  Array("NAME:Pair", "Name:=", "DiaGap", "Value:=", "53mm"), Array(_
  "NAME:Pair", "Name:=", "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", _
  "Name:=", "Length", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", _
  "Skew", "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Slots", "Value:=", _
  "30"), Array("NAME:Pair", "Name:=", "SlotType", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "Hs0", "Value:=", "0.544mm"), Array("NAME:Pair", _
  "Name:=", "Hs01", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs1", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Hs2", "Value:=", _
  "8.949999999999999mm"), Array("NAME:Pair", "Name:=", "Bs0", "Value:=", _
  "1.1mm"), Array("NAME:Pair", "Name:=", "Bs1", "Value:=", "3.69mm"), Array(_
  "NAME:Pair", "Name:=", "Bs2", "Value:=", "0.8080000000000001mm"), Array(_
  "NAME:Pair", "Name:=", "Rs", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", "HalfSlot", _
  "Value:=", "0"), Array("NAME:Pair", "Name:=", "BarEndExt", "Value:=", "2mm"), _
  Array("NAME:Pair", "Name:=", "RingLength", "Value:=", "2mm"), Array(_
  "NAME:Pair", "Name:=", "RingHeight", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "RingDiaGap", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "CastRotor", "Value:=", "1"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "164.1819463750201mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "0"))), Array("NAME:Attributes", "Name:=", "Bar", "Flags:=", "", "Color:=", _
  "(119 198 206)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper_75C", "SolveInside:=", true) 
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Bar", _
  "Tool Parts:=", "Tool"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Bar")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetEddyEffect Array("NAME:Eddy Effect Setting", Array(_
  "NAME:EddyEffectVector", Array("NAME:Data", "Object Name:=", "Bar", _
  "Eddy Effect:=", true)))
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Bar", "RefineInside:=", true, _
  "Objects:=", Array("Bar"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "1.616mm")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "53mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "18mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
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
  "NAME:Pair", "Name:=", "SegAngle", "Value:=", "30deg"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "164.1819463750201mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "100"))), Array("NAME:Attributes", _
  "Name:=", "InnerRegion", "Flags:=", "", "Color:=", "(0 255 255)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "vacuum", "SolveInside:=", true) 
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp Array("NAME:Length_Main", "RefineInside:=", true, _
  "Objects:=", Array("Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", _
  "Shaft"), "RestrictElem:=", false, "NumMaxElem:=", "1000", _
  "RestrictLength:=", true, "MaxLength:=", "14.8mm")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion", "MasterSheet", "SlaveSheet"), Array(_
  "NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Move Array("NAME:Selections", "Selections:=", "CoilTerm_0,CoilTerm_1" & _
  ",CoilTerm_2,CoilTerm_3,CoilTerm_4,CoilTerm_5,CoilTerm_6,CoilTerm_7" & _
  ",CoilTerm_8,CoilTerm_9,CoilTerm_10,CoilTerm_11,CoilTerm_12,CoilTerm_13" & _
  ",CoilTerm_14,CoilTerm_15,CoilTerm_16,CoilTerm_17,CoilTerm_18" & _
  ",CoilTerm_19,CoilTerm_20,CoilTerm_21,CoilTerm_22,CoilTerm_23" & _
  ",CoilTerm_24,CoilTerm_25,CoilTerm_26,CoilTerm_27,CoilTerm_28" & _
  ",CoilTerm_29,CoilTerm_30,CoilTerm_31,CoilTerm_32,CoilTerm_33" & _
  ",CoilTerm_34,CoilTerm_35"), Array("NAME:TranslateParameters", _
  "CoordinateSystemID:=", -1, "TranslateVectorX:=", "0mm", _
  "TranslateVectorY:=", "0mm", "TranslateVectorZ:=", "30mm")
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Coil_12,Coil_13,Coil_14,Coil_15,Coil_16" & _
  ",Coil_17,Coil_18,Coil_19,Coil_20,Coil_21,Coil_22,Coil_23,Coil_24" & _
  ",Coil_25,Coil_26,Coil_27,Coil_28,Coil_29,Coil_30,Coil_31,Coil_32" & _
  ",Coil_33,Coil_34,Coil_35,CoilTerm_0,CoilTerm_1,CoilTerm_2,CoilTerm_3" & _
  ",CoilTerm_4,CoilTerm_5,CoilTerm_6,CoilTerm_7,CoilTerm_8,CoilTerm_9" & _
  ",CoilTerm_10,CoilTerm_11,CoilTerm_12,CoilTerm_13,CoilTerm_14" & _
  ",CoilTerm_15,CoilTerm_16,CoilTerm_17,CoilTerm_18,CoilTerm_19" & _
  ",CoilTerm_20,CoilTerm_21,CoilTerm_22,CoilTerm_23,CoilTerm_24" & _
  ",CoilTerm_25,CoilTerm_26,CoilTerm_27,CoilTerm_28,CoilTerm_29" & _
  ",CoilTerm_30,CoilTerm_31,CoilTerm_32,CoilTerm_33,CoilTerm_34" & _
  ",CoilTerm_35,Rotor,Bar", "Tool Parts:=", "Tool"), Array(_
  "NAME:SubtractParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.SeparateBody  Array("NAME:Selections", "Selections:=", "Rotor")
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "0deg", "HasRotateLimit:=", false, "NonCylindrical:=", false, _
  "Consider Mechanical Transient:=", true, "Angular Velocity:=", "1450rpm", _
  "Moment of Inertia:=", 0.000725069, "Damping:=", 0.00182161, _
  "Load Torque:=", "if(speed<75.9218, -1.#IND*speed, -1.#IND/speed)", _
  "Objects:=", Array("Band"))
oModule.EditMotionSetup Array("NAME:Data", "Consider Mechanical Transient:=", _
  false)
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
set oUnclassified = oEditor.GetObjectsInGroup("Unclassified")
Dim oObject
For Each oObject in oUnclassified
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", oObject), Array(_
  "NAME:ChangedProps", Array("NAME:Model", "Value:=", false))))
Next
oEditor.ShowWindow
