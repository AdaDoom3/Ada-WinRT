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
with Windows.UI;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.WebUI.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access MenuOpenedEventHandler_Interface
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback.all;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access MenuClosedEventHandler_Interface
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback.all;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access SizeChangedEventHandler_Interface
      ; eventArgs : Windows.UI.WebUI.Core.IWebUICommandBarSizeChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.WebUI.Core.IWebUICommandBarSizeChangedEventArgs(eventArgs));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked_Interface
      ; sender : Windows.UI.WebUI.Core.IWebUICommandBarIconButton
      ; args : Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.WebUI.Core.IWebUICommandBarIconButton(sender), Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked_Interface
      ; sender : Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton
      ; args : Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton(sender), Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access VectorChangedEventHandler_IWebUICommandBarElement_Interface
      ; sender : Windows.UI.WebUI.Core.IObservableVector_IWebUICommandBarElement
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, event);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateWebUICommandBarIconButton return Windows.UI.WebUI.Core.IWebUICommandBarIconButton is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.Core.WebUICommandBarIconButton");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.WebUI.Core.IWebUICommandBarIconButton) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.WebUI.Core.IID_IWebUICommandBarIconButton'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWebUICommandBarConfirmationButton return Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.Core.WebUICommandBarConfirmationButton");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.WebUI.Core.IID_IWebUICommandBarConfirmationButton'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWebUICommandBarBitmapIcon return Windows.UI.WebUI.Core.IWebUICommandBarBitmapIcon is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.Core.WebUICommandBarBitmapIcon");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.WebUI.Core.IWebUICommandBarBitmapIcon) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.WebUI.Core.IID_IWebUICommandBarBitmapIcon'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWebUICommandBarSymbolIcon return Windows.UI.WebUI.Core.IWebUICommandBarSymbolIcon is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.Core.WebUICommandBarSymbolIcon");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.UI.WebUI.Core.IWebUICommandBarSymbolIcon) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.UI.WebUI.Core.IID_IWebUICommandBarSymbolIcon'Access, RetVal'access);
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
   
   function GetForCurrentView
   return Windows.UI.WebUI.Core.IWebUICommandBar is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.WebUI.Core.WebUICommandBar");
      m_Factory     : IWebUICommandBarStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.WebUI.Core.IWebUICommandBar;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebUICommandBarStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
