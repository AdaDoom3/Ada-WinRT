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
package body Windows.UI.Xaml.Resources is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(ICustomXamlResourceLoader , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_ICustomXamlResourceLoaderOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            if riid.all = IID_ICustomXamlResourceLoader then
               pvObject.all := Convert(This.m_ICustomXamlResourceLoader);
               Hr := S_OK;
            else
               Hr := E_NOINTERFACE;
            end if;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Resources.ICustomXamlResourceLoaderOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function GetResource
   (
      This       : access ICustomXamlResourceLoaderOverrides_Interface_Impl
      ; resourceId : Windows.String
      ; objectType : Windows.String
      ; propertyName : Windows.String
      ; propertyType : Windows.String
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_ICustomXamlResourceLoader or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'access, m_IUnknown'access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'access);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject);
         else
            Hr := E_NOINTERFACE;
         end if;
      end if;
      return Hr;
   end;
   
   function AddRef
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount + 1;
      RetVal := This.m_RefCount;   --InterlockedIncrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function Release
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl
   )
   return Windows.UInt32 is
      RetVal : Windows.UInt32;
   begin
      This.m_RefCount := This.m_RefCount - 1;
      RetVal := This.m_RefCount;   --InterlockedDecrement(This.m_RefCount'access)
      return RetVal;
   end;
   
   function GetIids
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      iidCount   : access Windows.UINT32;
      iids       : in Windows.IID_Ptr
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
   begin
      return Hr;
   end;
   
   function GetRuntimeClassName
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Resources.ICustomXamlResourceLoader");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access ICustomXamlResourceLoader_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      outer : Windows.Object
      ; inner : access Windows.Object
   )
   return Windows.UI.Xaml.Resources.ICustomXamlResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Resources.CustomXamlResourceLoader");
      m_Factory     : ICustomXamlResourceLoaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Resources.ICustomXamlResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICustomXamlResourceLoaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Current
   return Windows.UI.Xaml.Resources.ICustomXamlResourceLoader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Resources.CustomXamlResourceLoader");
      m_Factory     : ICustomXamlResourceLoaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Resources.ICustomXamlResourceLoader;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICustomXamlResourceLoaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_Current
   (
      value : Windows.UI.Xaml.Resources.ICustomXamlResourceLoader
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Resources.CustomXamlResourceLoader");
      m_Factory     : ICustomXamlResourceLoaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICustomXamlResourceLoaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_Current(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
end;
