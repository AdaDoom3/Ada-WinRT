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
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.System.Profile is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type SystemIdentificationSource is (
      None,
      Tpm,
      Uefi,
      Registry
   );
   for SystemIdentificationSource use (
      None => 0,
      Tpm => 1,
      Uefi => 2,
      Registry => 3
   );
   for SystemIdentificationSource'Size use 32;
   
   type SystemIdentificationSource_Ptr is access SystemIdentificationSource;
   
   type PlatformDataCollectionLevel is (
      Security,
      Basic,
      Enhanced,
      Full
   );
   for PlatformDataCollectionLevel use (
      Security => 0,
      Basic => 1,
      Enhanced => 2,
      Full => 3
   );
   for PlatformDataCollectionLevel'Size use 32;
   
   type PlatformDataCollectionLevel_Ptr is access PlatformDataCollectionLevel;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ProfileHardwareTokenContract is null record;
   pragma Convention (C_Pass_By_Copy , ProfileHardwareTokenContract);
   
   type ProfileHardwareTokenContract_Ptr is access ProfileHardwareTokenContract;
   
   type ProfileRetailInfoContract is null record;
   pragma Convention (C_Pass_By_Copy , ProfileRetailInfoContract);
   
   type ProfileRetailInfoContract_Ptr is access ProfileRetailInfoContract;
   
   type ProfileSharedModeContract is null record;
   pragma Convention (C_Pass_By_Copy , ProfileSharedModeContract);
   
   type ProfileSharedModeContract_Ptr is access ProfileSharedModeContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISystemIdentificationInfo_Interface;
   type ISystemIdentificationInfo is access all ISystemIdentificationInfo_Interface'Class;
   type ISystemIdentificationInfo_Ptr is access all ISystemIdentificationInfo;
   type ISystemIdentificationStatics_Interface;
   type ISystemIdentificationStatics is access all ISystemIdentificationStatics_Interface'Class;
   type ISystemIdentificationStatics_Ptr is access all ISystemIdentificationStatics;
   type IAnalyticsInfoStatics_Interface;
   type IAnalyticsInfoStatics is access all IAnalyticsInfoStatics_Interface'Class;
   type IAnalyticsInfoStatics_Ptr is access all IAnalyticsInfoStatics;
   type IAnalyticsVersionInfo_Interface;
   type IAnalyticsVersionInfo is access all IAnalyticsVersionInfo_Interface'Class;
   type IAnalyticsVersionInfo_Ptr is access all IAnalyticsVersionInfo;
   type IEducationSettingsStatics_Interface;
   type IEducationSettingsStatics is access all IEducationSettingsStatics_Interface'Class;
   type IEducationSettingsStatics_Ptr is access all IEducationSettingsStatics;
   type IPlatformDiagnosticsAndUsageDataSettingsStatics_Interface;
   type IPlatformDiagnosticsAndUsageDataSettingsStatics is access all IPlatformDiagnosticsAndUsageDataSettingsStatics_Interface'Class;
   type IPlatformDiagnosticsAndUsageDataSettingsStatics_Ptr is access all IPlatformDiagnosticsAndUsageDataSettingsStatics;
   type IHardwareToken_Interface;
   type IHardwareToken is access all IHardwareToken_Interface'Class;
   type IHardwareToken_Ptr is access all IHardwareToken;
   type IHardwareIdentificationStatics_Interface;
   type IHardwareIdentificationStatics is access all IHardwareIdentificationStatics_Interface'Class;
   type IHardwareIdentificationStatics_Ptr is access all IHardwareIdentificationStatics;
   type IRetailInfoStatics_Interface;
   type IRetailInfoStatics is access all IRetailInfoStatics_Interface'Class;
   type IRetailInfoStatics_Ptr is access all IRetailInfoStatics;
   type IKnownRetailInfoPropertiesStatics_Interface;
   type IKnownRetailInfoPropertiesStatics is access all IKnownRetailInfoPropertiesStatics_Interface'Class;
   type IKnownRetailInfoPropertiesStatics_Ptr is access all IKnownRetailInfoPropertiesStatics;
   type ISharedModeSettingsStatics_Interface;
   type ISharedModeSettingsStatics is access all ISharedModeSettingsStatics_Interface'Class;
   type ISharedModeSettingsStatics_Ptr is access all ISharedModeSettingsStatics;
   type ISharedModeSettingsStatics2_Interface;
   type ISharedModeSettingsStatics2 is access all ISharedModeSettingsStatics2_Interface'Class;
   type ISharedModeSettingsStatics2_Ptr is access all ISharedModeSettingsStatics2;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISystemIdentificationInfo : aliased constant Windows.IID := (207986301, 50114, 19763, (162, 223, 33, 188, 65, 145, 110, 179 ));
   
   type ISystemIdentificationInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISystemIdentificationInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access ISystemIdentificationInfo_Interface
      ; RetVal : access Windows.System.Profile.SystemIdentificationSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISystemIdentificationStatics : aliased constant Windows.IID := (1434580010, 54239, 19859, (163, 125, 196, 26, 97, 108, 109, 1 ));
   
   type ISystemIdentificationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSystemIdForPublisher
   (
      This       : access ISystemIdentificationStatics_Interface
      ; RetVal : access Windows.System.Profile.ISystemIdentificationInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetSystemIdForUser
   (
      This       : access ISystemIdentificationStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.System.Profile.ISystemIdentificationInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAnalyticsInfoStatics : aliased constant Windows.IID := (492757094, 6285, 23465, (67, 135, 172, 174, 176, 231, 227, 5 ));
   
   type IAnalyticsInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VersionInfo
   (
      This       : access IAnalyticsInfoStatics_Interface
      ; RetVal : access Windows.System.Profile.IAnalyticsVersionInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceForm
   (
      This       : access IAnalyticsInfoStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAnalyticsVersionInfo : aliased constant Windows.IID := (2455843000, 39253, 19572, (189, 193, 124, 208, 222, 207, 155, 3 ));
   
   type IAnalyticsVersionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceFamily
   (
      This       : access IAnalyticsVersionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceFamilyVersion
   (
      This       : access IAnalyticsVersionInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEducationSettingsStatics : aliased constant Windows.IID := (4233359599, 19774, 19987, (155, 35, 80, 95, 77, 9, 30, 146 ));
   
   type IEducationSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEducationEnvironment
   (
      This       : access IEducationSettingsStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPlatformDiagnosticsAndUsageDataSettingsStatics : aliased constant Windows.IID := (3068283931, 31516, 19250, (140, 98, 166, 101, 151, 206, 114, 58 ));
   
   type IPlatformDiagnosticsAndUsageDataSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CollectionLevel
   (
      This       : access IPlatformDiagnosticsAndUsageDataSettingsStatics_Interface
      ; RetVal : access Windows.System.Profile.PlatformDataCollectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function add_CollectionLevelChanged
   (
      This       : access IPlatformDiagnosticsAndUsageDataSettingsStatics_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CollectionLevelChanged
   (
      This       : access IPlatformDiagnosticsAndUsageDataSettingsStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function CanCollectDiagnostics
   (
      This       : access IPlatformDiagnosticsAndUsageDataSettingsStatics_Interface
      ; level : Windows.System.Profile.PlatformDataCollectionLevel
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHardwareToken : aliased constant Windows.IID := (687264960, 64274, 16548, (129, 103, 127, 78, 3, 210, 114, 76 ));
   
   type IHardwareToken_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHardwareToken_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Signature
   (
      This       : access IHardwareToken_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Certificate
   (
      This       : access IHardwareToken_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHardwareIdentificationStatics : aliased constant Windows.IID := (2534564064, 61808, 19010, (189, 85, 169, 0, 178, 18, 218, 226 ));
   
   type IHardwareIdentificationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPackageSpecificToken
   (
      This       : access IHardwareIdentificationStatics_Interface
      ; nonce : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.System.Profile.IHardwareToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRetailInfoStatics : aliased constant Windows.IID := (118671032, 35730, 20266, (132, 153, 3, 31, 23, 152, 214, 239 ));
   
   type IRetailInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsDemoModeEnabled
   (
      This       : access IRetailInfoStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IRetailInfoStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownRetailInfoPropertiesStatics : aliased constant Windows.IID := (2572620152, 20495, 18558, (142, 117, 41, 229, 81, 114, 135, 18 ));
   
   type IKnownRetailInfoPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RetailAccessCode
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ManufacturerName
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelName
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayModelName
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Price
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFeatured
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FormFactor
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ScreenSize
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Weight
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayDescription
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BatteryLifeDescription
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProcessorDescription
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Memory
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StorageDescription
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GraphicsDescription
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FrontCameraDescription
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RearCameraDescription
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNfc
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasSdSlot
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasOpticalDrive
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOfficeInstalled
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_WindowsEdition
   (
      This       : access IKnownRetailInfoPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISharedModeSettingsStatics : aliased constant Windows.IID := (2302538766, 51926, 19792, (140, 73, 111, 207, 192, 62, 219, 41 ));
   
   type ISharedModeSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access ISharedModeSettingsStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISharedModeSettingsStatics2 : aliased constant Windows.IID := (1619626148, 52465, 20200, (165, 226, 253, 106, 29, 12, 250, 200 ));
   
   type ISharedModeSettingsStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShouldAvoidLocalStorage
   (
      This       : access ISharedModeSettingsStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SystemIdentificationInfo is Windows.System.Profile.ISystemIdentificationInfo;
   subtype AnalyticsVersionInfo is Windows.System.Profile.IAnalyticsVersionInfo;
   subtype HardwareToken is Windows.System.Profile.IHardwareToken;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetSystemIdForPublisher
   return Windows.System.Profile.ISystemIdentificationInfo;
   
   function GetSystemIdForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.Profile.ISystemIdentificationInfo;
   
   function get_VersionInfo
   return Windows.System.Profile.IAnalyticsVersionInfo;
   
   function get_DeviceForm
   return Windows.String;
   
   function get_IsEducationEnvironment
   return Windows.Boolean;
   
   function get_CollectionLevel
   return Windows.System.Profile.PlatformDataCollectionLevel;
   
   function add_CollectionLevelChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_CollectionLevelChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function CanCollectDiagnostics
   (
      level : Windows.System.Profile.PlatformDataCollectionLevel
   )
   return Windows.Boolean;
   
   function GetPackageSpecificToken
   (
      nonce : Windows.Storage.Streams.IBuffer
   )
   return Windows.System.Profile.IHardwareToken;
   
   function get_IsDemoModeEnabled
   return Windows.Boolean;
   
   function get_Properties
   return Windows.Address;
   
   function get_RetailAccessCode
   return Windows.String;
   
   function get_ManufacturerName
   return Windows.String;
   
   function get_ModelName
   return Windows.String;
   
   function get_DisplayModelName
   return Windows.String;
   
   function get_Price
   return Windows.String;
   
   function get_IsFeatured
   return Windows.String;
   
   function get_FormFactor
   return Windows.String;
   
   function get_ScreenSize
   return Windows.String;
   
   function get_Weight
   return Windows.String;
   
   function get_DisplayDescription
   return Windows.String;
   
   function get_BatteryLifeDescription
   return Windows.String;
   
   function get_ProcessorDescription
   return Windows.String;
   
   function get_Memory
   return Windows.String;
   
   function get_StorageDescription
   return Windows.String;
   
   function get_GraphicsDescription
   return Windows.String;
   
   function get_FrontCameraDescription
   return Windows.String;
   
   function get_RearCameraDescription
   return Windows.String;
   
   function get_HasNfc
   return Windows.String;
   
   function get_HasSdSlot
   return Windows.String;
   
   function get_HasOpticalDrive
   return Windows.String;
   
   function get_IsOfficeInstalled
   return Windows.String;
   
   function get_WindowsEdition
   return Windows.String;
   
   function get_IsEnabled
   return Windows.Boolean;
   
   function get_ShouldAvoidLocalStorage
   return Windows.Boolean;
   
end;
