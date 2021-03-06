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
with Windows.UI.Xaml.Interop;
with Windows.Storage.Streams;
with Windows.UI.Xaml;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Markup is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   function QueryInterface
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl;
      riid       : in Windows.GUID_Ptr;
      pvObject   : not null access IUnknown
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown;
      RefCount : aliased UInt32 := 0;
      RetVal : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IMarkupExtension , Windows.IUnknown); 
      pragma suppress(Accessibility_Check); -- This can be called from Windows
   begin
      if riid.all = IID_IMarkupExtensionOverrides or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
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
            if riid.all = IID_IMarkupExtension then
               pvObject.all := Convert(This.m_IMarkupExtension);
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
      This       : access IMarkupExtensionOverrides_Interface_Impl
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
      This       : access IMarkupExtensionOverrides_Interface_Impl
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
      This       : access IMarkupExtensionOverrides_Interface_Impl;
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
      This       : access IMarkupExtensionOverrides_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Markup.IMarkupExtensionOverrides");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl;
      trustLevel : access Windows.TrustLevel
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
   begin
      trustLevel.all := FullTrust;
      return Hr;
   end;
   
   function ProvideValue
   (
      This       : access IMarkupExtensionOverrides_Interface_Impl
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
      This       : access IMarkupExtension_Interface_Impl;
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
      if riid.all = IID_IMarkupExtension or riid.all = IID_IInspectable or riid.all = IID_IUnknown then
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
      This       : access IMarkupExtension_Interface_Impl
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
      This       : access IMarkupExtension_Interface_Impl
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
      This       : access IMarkupExtension_Interface_Impl;
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
      This       : access IMarkupExtension_Interface_Impl;
      className  : access Windows.String
   )
   return Windows.HRESULT is
      Hr : Windows.HResult := S_OK;
      InterfaceName : Windows.String := To_String("Windows.UI.Xaml.Markup.IMarkupExtension");
   begin
      className.all := InterfaceName;
      return Hr;
   end;
   
   function GetTrustLevel
   (
      This       : access IMarkupExtension_Interface_Impl;
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
   return Windows.UI.Xaml.Markup.IMarkupExtension is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.MarkupExtension");
      m_Factory     : IMarkupExtensionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Markup.IMarkupExtension;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMarkupExtensionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(outer, inner, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Write
   (
      inputStreams : Windows.Storage.Streams.IVector_IRandomAccessStream
      ; outputStreams : Windows.Storage.Streams.IVector_IRandomAccessStream
      ; xamlMetadataProvider : Windows.UI.Xaml.Markup.IXamlMetadataProvider
   )
   return Windows.UI.Xaml.Markup.XamlBinaryWriterErrorInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBinaryWriter");
      m_Factory     : IXamlBinaryWriterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Markup.XamlBinaryWriterErrorInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBinaryWriterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Write(inputStreams, outputStreams, xamlMetadataProvider, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DataTemplateComponentProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DataTemplateComponentProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDataTemplateComponent
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Markup.IDataTemplateComponent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Markup.IDataTemplateComponent;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDataTemplateComponent(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetDataTemplateComponent
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Markup.IDataTemplateComponent
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetDataTemplateComponent(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SuspendRendering
   (
      target : Windows.UI.Xaml.IUIElement
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SuspendRendering(target);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ResumeRendering
   (
      target : Windows.UI.Xaml.IUIElement
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ResumeRendering(target);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function ConvertValue
   (
      type_x : Windows.UI.Xaml.Interop.TypeName
      ; value : Windows.Object
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConvertValue(type_x, value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetPropertyFromString
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromString(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromBoolean
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromBoolean(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromChar16
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt8
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromChar16(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromDateTime
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.DateTime
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromDateTime(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromDouble
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Double
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromDouble(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromInt32
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Int32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromInt32(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromUInt32
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromUInt32(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromInt64
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Int64
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromInt64(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromUInt64
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt64
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromUInt64(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromSingle
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Single
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromSingle(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromPoint
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Point
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromPoint(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromRect
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Rect
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromRect(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromSize
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.Size
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromSize(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromTimeSpan
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.TimeSpan
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromTimeSpan(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromByte
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.UInt8
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromByte(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromUri
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromUri(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetPropertyFromObject
   (
      dependencyObject : Windows.Object
      ; propertyToSet : Windows.UI.Xaml.IDependencyProperty
      ; value : Windows.Object
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlBindingHelper");
      m_Factory     : IXamlBindingHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlBindingHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPropertyFromObject(dependencyObject, propertyToSet, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure UnloadObject
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlMarkupHelper");
      m_Factory     : IXamlMarkupHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlMarkupHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnloadObject(element);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function Load
   (
      xaml : Windows.String
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlReader");
      m_Factory     : IXamlReaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlReaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Load(xaml, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadWithInitialTemplateValidation
   (
      xaml : Windows.String
   )
   return Windows.Object is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Markup.XamlReader");
      m_Factory     : IXamlReaderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Object;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlReaderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadWithInitialTemplateValidation(xaml, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
