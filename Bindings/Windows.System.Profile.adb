--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Profile is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetSystemIdForPublisher
   return Windows.System.Profile.ISystemIdentificationInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.SystemIdentification");
      m_Factory     : ISystemIdentificationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Profile.ISystemIdentificationInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemIdentificationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSystemIdForPublisher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSystemIdForUser
   (
      user : Windows.System.IUser
   )
   return Windows.System.Profile.ISystemIdentificationInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.SystemIdentification");
      m_Factory     : ISystemIdentificationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Profile.ISystemIdentificationInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISystemIdentificationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSystemIdForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VersionInfo
   return Windows.System.Profile.IAnalyticsVersionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.AnalyticsInfo");
      m_Factory     : IAnalyticsInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Profile.IAnalyticsVersionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnalyticsInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VersionInfo(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DeviceForm
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.AnalyticsInfo");
      m_Factory     : IAnalyticsInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnalyticsInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeviceForm(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsEducationEnvironment
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.EducationSettings");
      m_Factory     : IEducationSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEducationSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsEducationEnvironment(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CollectionLevel
   return Windows.System.Profile.PlatformDataCollectionLevel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings");
      m_Factory     : IPlatformDiagnosticsAndUsageDataSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Profile.PlatformDataCollectionLevel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticsAndUsageDataSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CollectionLevel(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_CollectionLevelChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings");
      m_Factory     : IPlatformDiagnosticsAndUsageDataSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticsAndUsageDataSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_CollectionLevelChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_CollectionLevelChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings");
      m_Factory     : IPlatformDiagnosticsAndUsageDataSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticsAndUsageDataSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_CollectionLevelChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CanCollectDiagnostics
   (
      level : Windows.System.Profile.PlatformDataCollectionLevel
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings");
      m_Factory     : IPlatformDiagnosticsAndUsageDataSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlatformDiagnosticsAndUsageDataSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CanCollectDiagnostics(level, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPackageSpecificToken
   (
      nonce : Windows.Storage.Streams.IBuffer
   )
   return Windows.System.Profile.IHardwareToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.HardwareIdentification");
      m_Factory     : IHardwareIdentificationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.System.Profile.IHardwareToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHardwareIdentificationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPackageSpecificToken(nonce, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsDemoModeEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.RetailInfo");
      m_Factory     : IRetailInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRetailInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsDemoModeEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Properties
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.RetailInfo");
      m_Factory     : IRetailInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRetailInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Properties(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RetailAccessCode
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RetailAccessCode(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ManufacturerName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ManufacturerName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ModelName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ModelName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DisplayModelName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DisplayModelName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Price
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Price(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsFeatured
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsFeatured(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FormFactor
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FormFactor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ScreenSize
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ScreenSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Weight
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Weight(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DisplayDescription
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DisplayDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BatteryLifeDescription
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BatteryLifeDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ProcessorDescription
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ProcessorDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Memory
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Memory(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StorageDescription
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StorageDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GraphicsDescription
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GraphicsDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FrontCameraDescription
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FrontCameraDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RearCameraDescription
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RearCameraDescription(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HasNfc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HasNfc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HasSdSlot
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HasSdSlot(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HasOpticalDrive
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HasOpticalDrive(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsOfficeInstalled
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsOfficeInstalled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WindowsEdition
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.KnownRetailInfoProperties");
      m_Factory     : IKnownRetailInfoPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKnownRetailInfoPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WindowsEdition(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.SharedModeSettings");
      m_Factory     : ISharedModeSettingsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISharedModeSettingsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ShouldAvoidLocalStorage
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Profile.SharedModeSettings");
      m_Factory     : ISharedModeSettingsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISharedModeSettingsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ShouldAvoidLocalStorage(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;