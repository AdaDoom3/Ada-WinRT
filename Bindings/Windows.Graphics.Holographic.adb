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
with Windows.Graphics.DirectX.Direct3D11;
with Windows.UI.Core;
with Windows.Perception.Spatial;
with Windows.Perception;
with Windows.Graphics.DirectX;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Holographic is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IHolographicSpace_add_CameraAdded_Interface
      ; sender : Windows.Graphics.Holographic.IHolographicSpace
      ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Holographic.IHolographicSpace(sender), Windows.Graphics.Holographic.IHolographicSpaceCameraAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHolographicSpace_add_CameraRemoved_Interface
      ; sender : Windows.Graphics.Holographic.IHolographicSpace
      ; args : Windows.Graphics.Holographic.IHolographicSpaceCameraRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Holographic.IHolographicSpace(sender), Windows.Graphics.Holographic.IHolographicSpaceCameraRemovedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      size : Windows.Foundation.Size
   )
   return Windows.Graphics.Holographic.IHolographicQuadLayer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicQuadLayer");
      m_Factory     : Windows.Graphics.Holographic.IHolographicQuadLayerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicQuadLayer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicQuadLayerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(size, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPixelFormat
   (
      size : Windows.Foundation.Size
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.Graphics.Holographic.IHolographicQuadLayer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicQuadLayer");
      m_Factory     : Windows.Graphics.Holographic.IHolographicQuadLayerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicQuadLayer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicQuadLayerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPixelFormat(size, pixelFormat, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateForCoreWindow
   (
      window : Windows.UI.Core.ICoreWindow
   )
   return Windows.Graphics.Holographic.IHolographicSpace is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicSpace;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateForCoreWindow(window, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsConfigured
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsConfigured(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsAvailable
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsAvailable(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_IsAvailableChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_IsAvailableChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_IsAvailableChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicSpace");
      m_Factory     : IHolographicSpaceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicSpaceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_IsAvailableChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetDefault
   return Windows.Graphics.Holographic.IHolographicDisplay is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Holographic.HolographicDisplay");
      m_Factory     : IHolographicDisplayStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Holographic.IHolographicDisplay;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHolographicDisplayStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
