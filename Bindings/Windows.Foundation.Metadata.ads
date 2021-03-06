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
package Windows.Foundation.Metadata is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GCPressureAmount is (
      Low,
      Medium,
      High
   );
   for GCPressureAmount use (
      Low => 0,
      Medium => 1,
      High => 2
   );
   for GCPressureAmount'Size use 32;
   
   type GCPressureAmount_Ptr is access GCPressureAmount;
   
   type Platform is (
      Windows_x,
      WindowsPhone
   );
   for Platform use (
      Windows_x => 0,
      WindowsPhone => 1
   );
   for Platform'Size use 32;
   
   type Platform_Ptr is access Platform;
   
   type AttributeTargets is (
      Delegate,
      Enum,
      Event,
      Field,
      Interface_x,
      Method,
      Parameter,
      Property,
      RuntimeClass,
      Struct,
      InterfaceImpl,
      ApiContract,
      All_x
   );
   for AttributeTargets use (
      Delegate => 1,
      Enum => 2,
      Event => 4,
      Field => 8,
      Interface_x => 16,
      Method => 64,
      Parameter => 128,
      Property => 256,
      RuntimeClass => 512,
      Struct => 1024,
      InterfaceImpl => 2048,
      ApiContract => 8192,
      All_x => 4294967295
   );
   for AttributeTargets'Size use 32;
   
   type AttributeTargets_Ptr is access AttributeTargets;
   
   type FeatureStage is (
      AlwaysDisabled,
      DisabledByDefault,
      EnabledByDefault,
      AlwaysEnabled
   );
   for FeatureStage use (
      AlwaysDisabled => 0,
      DisabledByDefault => 1,
      EnabledByDefault => 2,
      AlwaysEnabled => 3
   );
   for FeatureStage'Size use 32;
   
   type FeatureStage_Ptr is access FeatureStage;
   
   type CompositionType is (
      Protected_x,
      Public
   );
   for CompositionType use (
      Protected_x => 1,
      Public => 2
   );
   for CompositionType'Size use 32;
   
   type CompositionType_Ptr is access CompositionType;
   
   type ThreadingModel is (
      InvalidThreading,
      STA,
      MTA,
      Both
   );
   for ThreadingModel use (
      InvalidThreading => 0,
      STA => 1,
      MTA => 2,
      Both => 3
   );
   for ThreadingModel'Size use 32;
   
   type ThreadingModel_Ptr is access ThreadingModel;
   
   type MarshalingType is (
      InvalidMarshaling,
      None,
      Agile,
      Standard_x
   );
   for MarshalingType use (
      InvalidMarshaling => 0,
      None => 1,
      Agile => 2,
      Standard_x => 3
   );
   for MarshalingType'Size use 32;
   
   type MarshalingType_Ptr is access MarshalingType;
   
   type DeprecationType is (
      Deprecate,
      Remove
   );
   for DeprecationType use (
      Deprecate => 0,
      Remove => 1
   );
   for DeprecationType'Size use 32;
   
   type DeprecationType_Ptr is access DeprecationType;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IApiInformationStatics_Interface;
   type IApiInformationStatics is access all IApiInformationStatics_Interface'Class;
   type IApiInformationStatics_Ptr is access all IApiInformationStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IApiInformationStatics : aliased constant Windows.IID := (2574531070, 63105, 18961, (180, 22, 193, 58, 71, 232, 186, 54 ));
   
   type IApiInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsTypePresent
   (
      This       : access IApiInformationStatics_Interface
      ; typeName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsMethodPresent
   (
      This       : access IApiInformationStatics_Interface
      ; typeName : Windows.String
      ; methodName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsMethodPresentWithArity
   (
      This       : access IApiInformationStatics_Interface
      ; typeName : Windows.String
      ; methodName : Windows.String
      ; inputParameterCount : Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsEventPresent
   (
      This       : access IApiInformationStatics_Interface
      ; typeName : Windows.String
      ; eventName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsPropertyPresent
   (
      This       : access IApiInformationStatics_Interface
      ; typeName : Windows.String
      ; propertyName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsReadOnlyPropertyPresent
   (
      This       : access IApiInformationStatics_Interface
      ; typeName : Windows.String
      ; propertyName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsWriteablePropertyPresent
   (
      This       : access IApiInformationStatics_Interface
      ; typeName : Windows.String
      ; propertyName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsEnumNamedValuePresent
   (
      This       : access IApiInformationStatics_Interface
      ; enumTypeName : Windows.String
      ; valueName : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsApiContractPresentByMajor
   (
      This       : access IApiInformationStatics_Interface
      ; contractName : Windows.String
      ; majorVersion : Windows.UInt16
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsApiContractPresentByMajorAndMinor
   (
      This       : access IApiInformationStatics_Interface
      ; contractName : Windows.String
      ; majorVersion : Windows.UInt16
      ; minorVersion : Windows.UInt16
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function IsTypePresent
   (
      typeName : Windows.String
   )
   return Windows.Boolean;
   
   function IsMethodPresent
   (
      typeName : Windows.String
      ; methodName : Windows.String
   )
   return Windows.Boolean;
   
   function IsMethodPresentWithArity
   (
      typeName : Windows.String
      ; methodName : Windows.String
      ; inputParameterCount : Windows.UInt32
   )
   return Windows.Boolean;
   
   function IsEventPresent
   (
      typeName : Windows.String
      ; eventName : Windows.String
   )
   return Windows.Boolean;
   
   function IsPropertyPresent
   (
      typeName : Windows.String
      ; propertyName : Windows.String
   )
   return Windows.Boolean;
   
   function IsReadOnlyPropertyPresent
   (
      typeName : Windows.String
      ; propertyName : Windows.String
   )
   return Windows.Boolean;
   
   function IsWriteablePropertyPresent
   (
      typeName : Windows.String
      ; propertyName : Windows.String
   )
   return Windows.Boolean;
   
   function IsEnumNamedValuePresent
   (
      enumTypeName : Windows.String
      ; valueName : Windows.String
   )
   return Windows.Boolean;
   
   function IsApiContractPresentByMajor
   (
      contractName : Windows.String
      ; majorVersion : Windows.UInt16
   )
   return Windows.Boolean;
   
   function IsApiContractPresentByMajorAndMinor
   (
      contractName : Windows.String
      ; majorVersion : Windows.UInt16
      ; minorVersion : Windows.UInt16
   )
   return Windows.Boolean;
   
end;
