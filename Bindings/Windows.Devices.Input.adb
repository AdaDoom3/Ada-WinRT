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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Input is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IMouseDevice_add_MouseMoved_Interface
      ; sender : Windows.Devices.Input.IMouseDevice
      ; args : Windows.Devices.Input.IMouseEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.IMouseDevice(sender), Windows.Devices.Input.IMouseEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateMouseCapabilities return Windows.Devices.Input.IMouseCapabilities is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.MouseCapabilities");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Input.IMouseCapabilities) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Input.IID_IMouseCapabilities'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateKeyboardCapabilities return Windows.Devices.Input.IKeyboardCapabilities is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.KeyboardCapabilities");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Input.IKeyboardCapabilities) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Input.IID_IKeyboardCapabilities'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateTouchCapabilities return Windows.Devices.Input.ITouchCapabilities is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.TouchCapabilities");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Devices.Input.ITouchCapabilities) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Devices.Input.IID_ITouchCapabilities'Access, RetVal'access);
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
   
   function GetPointerDevice
   (
      pointerId : Windows.UInt32
   )
   return Windows.Devices.Input.IPointerDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.PointerDevice");
      m_Factory     : IPointerDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Input.IPointerDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPointerDevice(pointerId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPointerDevices
   return Windows.Devices.Input.IVectorView_IPointerDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.PointerDevice");
      m_Factory     : IPointerDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Input.IVectorView_IPointerDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPointerDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPointerDevices(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForCurrentView
   return Windows.Devices.Input.IMouseDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.MouseDevice");
      m_Factory     : IMouseDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Input.IMouseDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMouseDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
