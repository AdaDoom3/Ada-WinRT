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
with Windows.Networking;
with Windows.Storage.Streams;
with Windows.Devices.Enumeration;
with Windows.Security.Credentials;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.WiFiDirect is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWiFiDirectDevice_Interface
      ; asyncInfo : Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectDevice_add_ConnectionStatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.IWiFiDirectDevice
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.IWiFiDirectDevice(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectAdvertisementPublisher_add_StatusChanged_Interface
      ; sender : Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher
      ; args : Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher(sender), Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWiFiDirectConnectionListener_add_ConnectionRequested_Interface
      ; sender : Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener
      ; args : Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener(sender), Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateWiFiDirectConnectionParameters return Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectConnectionParameters");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.WiFiDirect.IID_IWiFiDirectConnectionParameters'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWiFiDirectInformationElement return Windows.Devices.WiFiDirect.IWiFiDirectInformationElement is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectInformationElement");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.WiFiDirect.IWiFiDirectInformationElement) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.WiFiDirect.IID_IWiFiDirectInformationElement'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWiFiDirectAdvertisementPublisher return Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisher");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.WiFiDirect.IID_IWiFiDirectAdvertisementPublisher'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWiFiDirectConnectionListener return Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectConnectionListener");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.WiFiDirect.IID_IWiFiDirectConnectionListener'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectDevice");
      m_Factory     : IWiFiDirectDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectDevice");
      m_Factory     : IWiFiDirectDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   (
      type_x : Windows.Devices.WiFiDirect.WiFiDirectDeviceSelectorType
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectDevice");
      m_Factory     : IWiFiDirectDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
      ; connectionParameters : Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters
   )
   return Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectDevice");
      m_Factory     : IWiFiDirectDeviceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.WiFiDirect.IAsyncOperation_IWiFiDirectDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectDeviceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, connectionParameters, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDevicePairingKinds
   (
      configurationMethod : Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
   )
   return Windows.Devices.Enumeration.DevicePairingKinds is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectConnectionParameters");
      m_Factory     : IWiFiDirectConnectionParametersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Enumeration.DevicePairingKinds;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectConnectionParametersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDevicePairingKinds(configurationMethod, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectInformationElement");
      m_Factory     : IWiFiDirectInformationElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectInformationElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromBuffer(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromDeviceInformation
   (
      deviceInformation : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.WiFiDirect.WiFiDirectInformationElement");
      m_Factory     : IWiFiDirectInformationElementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.WiFiDirect.IVector_IWiFiDirectInformationElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWiFiDirectInformationElementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromDeviceInformation(deviceInformation, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
