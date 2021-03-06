--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows; use Windows;
with Windows.Foundation.Collections;
package Windows.System.Diagnostics.TraceReporting is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PlatformDiagnosticEscalationType is (
      OnCompletion,
      OnFailure
   );
   for PlatformDiagnosticEscalationType use (
      OnCompletion => 0,
      OnFailure => 1
   );
   for PlatformDiagnosticEscalationType'Size use 32;
   
   type PlatformDiagnosticEscalationType_Ptr is access PlatformDiagnosticEscalationType;
   
   type PlatformDiagnosticTraceSlotType is (
      Alternative,
      AlwaysOn,
      Mini
   );
   for PlatformDiagnosticTraceSlotType use (
      Alternative => 0,
      AlwaysOn => 1,
      Mini => 2
   );
   for PlatformDiagnosticTraceSlotType'Size use 32;
   
   type PlatformDiagnosticTraceSlotType_Ptr is access PlatformDiagnosticTraceSlotType;
   
   type PlatformDiagnosticTracePriority is (
      Normal,
      UserElevated
   );
   for PlatformDiagnosticTracePriority use (
      Normal => 0,
      UserElevated => 1
   );
   for PlatformDiagnosticTracePriority'Size use 32;
   
   type PlatformDiagnosticTracePriority_Ptr is access PlatformDiagnosticTracePriority;
   
   type PlatformDiagnosticTraceSlotState is (
      NotRunning,
      Running,
      Throttled
   );
   for PlatformDiagnosticTraceSlotState use (
      NotRunning => 0,
      Running => 1,
      Throttled => 2
   );
   for PlatformDiagnosticTraceSlotState'Size use 32;
   
   type PlatformDiagnosticTraceSlotState_Ptr is access PlatformDiagnosticTraceSlotState;
   
   type PlatformDiagnosticActionState is (
      Success,
      FreeNetworkNotAvailable,
      ACPowerNotAvailable
   );
   for PlatformDiagnosticActionState use (
      Success => 0,
      FreeNetworkNotAvailable => 1,
      ACPowerNotAvailable => 2
   );
   for PlatformDiagnosticActionState'Size use 32;
   
   type PlatformDiagnosticActionState_Ptr is access PlatformDiagnosticActionState;
   
   type PlatformDiagnosticEventBufferLatencies is (
      Normal,
      CostDeferred,
      Realtime
   );
   for PlatformDiagnosticEventBufferLatencies use (
      Normal => 1,
      CostDeferred => 2,
      Realtime => 4
   );
   for PlatformDiagnosticEventBufferLatencies'Size use 32;
   
   type PlatformDiagnosticEventBufferLatencies_Ptr is access PlatformDiagnosticEventBufferLatencies;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPlatformDiagnosticTraceInfo_Interface;
   type IPlatformDiagnosticTraceInfo is access all IPlatformDiagnosticTraceInfo_Interface'Class;
   type IPlatformDiagnosticTraceInfo_Ptr is access all IPlatformDiagnosticTraceInfo;
   type IPlatformDiagnosticTraceRuntimeInfo_Interface;
   type IPlatformDiagnosticTraceRuntimeInfo is access all IPlatformDiagnosticTraceRuntimeInfo_Interface'Class;
   type IPlatformDiagnosticTraceRuntimeInfo_Ptr is access all IPlatformDiagnosticTraceRuntimeInfo;
   type IPlatformDiagnosticActionsStatics_Interface;
   type IPlatformDiagnosticActionsStatics is access all IPlatformDiagnosticActionsStatics_Interface'Class;
   type IPlatformDiagnosticActionsStatics_Ptr is access all IPlatformDiagnosticActionsStatics;
   type IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface;
   type IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario is access all IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface'Class;
   type IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Ptr is access all IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario;
   type IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface;
   type IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario is access all IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface'Class;
   type IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Ptr is access all IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario;
   type IIterator_IPlatformDiagnosticTraceInfo_Interface;
   type IIterator_IPlatformDiagnosticTraceInfo is access all IIterator_IPlatformDiagnosticTraceInfo_Interface'Class;
   type IIterator_IPlatformDiagnosticTraceInfo_Ptr is access all IIterator_IPlatformDiagnosticTraceInfo;
   type IIterable_IPlatformDiagnosticTraceInfo_Interface;
   type IIterable_IPlatformDiagnosticTraceInfo is access all IIterable_IPlatformDiagnosticTraceInfo_Interface'Class;
   type IIterable_IPlatformDiagnosticTraceInfo_Ptr is access all IIterable_IPlatformDiagnosticTraceInfo;
   type IVectorView_IPlatformDiagnosticTraceInfo_Interface;
   type IVectorView_IPlatformDiagnosticTraceInfo is access all IVectorView_IPlatformDiagnosticTraceInfo_Interface'Class;
   type IVectorView_IPlatformDiagnosticTraceInfo_Ptr is access all IVectorView_IPlatformDiagnosticTraceInfo;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPlatformDiagnosticTraceInfo : aliased constant Windows.IID := (4168150423, 54679, 19447, (136, 220, 207, 92, 125, 194, 161, 210 ));
   
   type IPlatformDiagnosticTraceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ScenarioId
   (
      This       : access IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ProfileHash
   (
      This       : access IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_IsExclusive
   (
      This       : access IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAutoLogger
   (
      This       : access IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxTraceDurationFileTime
   (
      This       : access IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_Priority
   (
      This       : access IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTracePriority
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlatformDiagnosticTraceRuntimeInfo : aliased constant Windows.IID := (1028480557, 472, 18280, (133, 84, 30, 177, 202, 97, 9, 134 ));
   
   type IPlatformDiagnosticTraceRuntimeInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RuntimeFileTime
   (
      This       : access IPlatformDiagnosticTraceRuntimeInfo_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_EtwRuntimeFileTime
   (
      This       : access IPlatformDiagnosticTraceRuntimeInfo_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlatformDiagnosticActionsStatics : aliased constant Windows.IID := (3239337210, 37522, 16999, (137, 10, 158, 163, 237, 7, 35, 18 ));
   
   type IPlatformDiagnosticActionsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsScenarioEnabled
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; scenarioId : Windows.Guid
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryEscalateScenario
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; scenarioId : Windows.Guid
      ; escalationType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEscalationType
      ; outputDirectory : Windows.String
      ; timestampOutputDirectory : Windows.Boolean
      ; forceEscalationUpload : Windows.Boolean
      ; triggers : IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function DownloadLatestSettingsForNamespace
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; partner : Windows.String
      ; feature : Windows.String
      ; isScenarioNamespace : Windows.Boolean
      ; downloadOverCostedNetwork : Windows.Boolean
      ; downloadOverBattery : Windows.Boolean
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState
   )
   return Windows.HRESULT is abstract;
   
   function GetActiveScenarioList
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Guid -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ForceUpload
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; latency : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEventBufferLatencies
      ; uploadOverCostedNetwork : Windows.Boolean
      ; uploadOverBattery : Windows.Boolean
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState
   )
   return Windows.HRESULT is abstract;
   
   function IsTraceRunning
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
      ; scenarioId : Windows.Guid
      ; traceProfileHash : Windows.UInt64
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotState
   )
   return Windows.HRESULT is abstract;
   
   function GetActiveTraceRuntime
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetKnownTraceList
   (
      This       : access IPlatformDiagnosticActionsStatics_Interface
      ; slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.IVectorView_IPlatformDiagnosticTraceInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPlatformDiagnosticTraceInfo : aliased constant Windows.IID := (452221325, 39099, 24145, (132, 43, 207, 105, 25, 37, 182, 194 ));
   
   type IIterator_IPlatformDiagnosticTraceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPlatformDiagnosticTraceInfo_Interface
      ; items : Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPlatformDiagnosticTraceInfo : aliased constant Windows.IID := (3971006727, 51579, 21246, (165, 230, 163, 62, 147, 73, 55, 105 ));
   
   type IIterable_IPlatformDiagnosticTraceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.IIterator_IPlatformDiagnosticTraceInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPlatformDiagnosticTraceInfo : aliased constant Windows.IID := (2400924567, 19907, 23410, (145, 250, 15, 220, 145, 93, 149, 12 ));
   
   type IVectorView_IPlatformDiagnosticTraceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPlatformDiagnosticTraceInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPlatformDiagnosticTraceInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPlatformDiagnosticTraceInfo_Interface
      ; value : Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPlatformDiagnosticTraceInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PlatformDiagnosticTraceInfo is Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo;
   subtype PlatformDiagnosticTraceRuntimeInfo is Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function IsScenarioEnabled
   (
      scenarioId : Windows.Guid
   )
   return Windows.Boolean;
   
   function TryEscalateScenario
   (
      scenarioId : Windows.Guid
      ; escalationType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEscalationType
      ; outputDirectory : Windows.String
      ; timestampOutputDirectory : Windows.Boolean
      ; forceEscalationUpload : Windows.Boolean
      ; triggers : IMapView_IPlatformDiagnosticActionsStatics_TryEscalateScenario
   )
   return Windows.Boolean;
   
   function DownloadLatestSettingsForNamespace
   (
      partner : Windows.String
      ; feature : Windows.String
      ; isScenarioNamespace : Windows.Boolean
      ; downloadOverCostedNetwork : Windows.Boolean
      ; downloadOverBattery : Windows.Boolean
   )
   return Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState;
   
   function GetActiveScenarioList
   return Windows.Foundation.Collections.IVectorView_Guid;
   
   function ForceUpload
   (
      latency : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEventBufferLatencies
      ; uploadOverCostedNetwork : Windows.Boolean
      ; uploadOverBattery : Windows.Boolean
   )
   return Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState;
   
   function IsTraceRunning
   (
      slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
      ; scenarioId : Windows.Guid
      ; traceProfileHash : Windows.UInt64
   )
   return Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotState;
   
   function GetActiveTraceRuntime
   (
      slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
   )
   return Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo;
   
   function GetKnownTraceList
   (
      slotType : Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
   )
   return Windows.System.Diagnostics.TraceReporting.IVectorView_IPlatformDiagnosticTraceInfo;
   
end;
