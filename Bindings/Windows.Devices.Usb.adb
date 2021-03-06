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
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Usb is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUsbDevice_Interface
      ; asyncInfo : Windows.Devices.Usb.IAsyncOperation_IUsbDevice
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
      This       : access TypedEventHandler_IUsbInterruptInPipe_add_DataReceived_Interface
      ; sender : Windows.Devices.Usb.IUsbInterruptInPipe
      ; args : Windows.Devices.Usb.IUsbInterruptInEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Usb.IUsbInterruptInPipe(sender), Windows.Devices.Usb.IUsbInterruptInEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateUsbControlRequestType return Windows.Devices.Usb.IUsbControlRequestType is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbControlRequestType");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Usb.IUsbControlRequestType) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Usb.IID_IUsbControlRequestType'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWithEightByteBuffer
   (
      eightByteBuffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Devices.Usb.IUsbSetupPacket is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbSetupPacket");
      m_Factory     : Windows.Devices.Usb.IUsbSetupPacketFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbSetupPacket := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbSetupPacketFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithEightByteBuffer(eightByteBuffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUsbDeviceClass return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClass");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Usb.IUsbDeviceClass) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Usb.IID_IUsbDeviceClass'Access, RetVal'access);
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
   
   function get_CdcControl
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CdcControl(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Physical
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Physical(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PersonalHealthcare
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PersonalHealthcare(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ActiveSync
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ActiveSync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PalmSync
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PalmSync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DeviceFirmwareUpdate
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeviceFirmwareUpdate(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Irda
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Irda(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Measurement
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Measurement(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VendorSpecific
   return Windows.Devices.Usb.IUsbDeviceClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDeviceClasses");
      m_Factory     : IUsbDeviceClassesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbDeviceClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceClassesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VendorSpecific(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelector
   (
      vendorId : Windows.UInt32
      ; productId : Windows.UInt32
      ; winUsbInterfaceClass : Windows.Guid
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDevice");
      m_Factory     : IUsbDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(vendorId, productId, winUsbInterfaceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorGuidOnly
   (
      winUsbInterfaceClass : Windows.Guid
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDevice");
      m_Factory     : IUsbDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorGuidOnly(winUsbInterfaceClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceSelectorVidPidOnly
   (
      vendorId : Windows.UInt32
      ; productId : Windows.UInt32
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDevice");
      m_Factory     : IUsbDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelectorVidPidOnly(vendorId, productId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDeviceClassSelector
   (
      usbClass : Windows.Devices.Usb.IUsbDeviceClass
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDevice");
      m_Factory     : IUsbDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceClassSelector(usbClass, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Usb.IAsyncOperation_IUsbDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbDevice");
      m_Factory     : IUsbDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IAsyncOperation_IUsbDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromIdAsync(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbConfigurationDescriptor
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbConfigurationDescriptor");
      m_Factory     : IUsbConfigurationDescriptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbConfigurationDescriptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(descriptor, parsed, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.Devices.Usb.IUsbConfigurationDescriptor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbConfigurationDescriptor");
      m_Factory     : IUsbConfigurationDescriptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbConfigurationDescriptor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbConfigurationDescriptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(descriptor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbInterfaceDescriptor
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbInterfaceDescriptor");
      m_Factory     : IUsbInterfaceDescriptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbInterfaceDescriptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(descriptor, parsed, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.Devices.Usb.IUsbInterfaceDescriptor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbInterfaceDescriptor");
      m_Factory     : IUsbInterfaceDescriptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbInterfaceDescriptor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbInterfaceDescriptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(descriptor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryParse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
      ; parsed : access Windows.Devices.Usb.IUsbEndpointDescriptor
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbEndpointDescriptor");
      m_Factory     : IUsbEndpointDescriptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbEndpointDescriptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryParse(descriptor, parsed, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Parse
   (
      descriptor : Windows.Devices.Usb.IUsbDescriptor
   )
   return Windows.Devices.Usb.IUsbEndpointDescriptor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Usb.UsbEndpointDescriptor");
      m_Factory     : IUsbEndpointDescriptorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Usb.IUsbEndpointDescriptor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUsbEndpointDescriptorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Parse(descriptor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
