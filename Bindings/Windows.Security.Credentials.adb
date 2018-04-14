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
with Windows.Security.Cryptography.Core;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Credentials is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IKeyCredentialRetrievalResult_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult
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
      This       : access AsyncOperationCompletedHandler_IKeyCredentialOperationResult_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialOperationResult
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
      This       : access AsyncOperationCompletedHandler_IKeyCredentialAttestationResult_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IKeyCredentialAttestationResult
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
      This       : access AsyncOperationCompletedHandler_IWebAccount_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IWebAccount
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
      This       : access AsyncOperationCompletedHandler_IWebAccountProvider_Interface
      ; asyncInfo : Windows.Security.Credentials.IAsyncOperation_IWebAccountProvider
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateWebAccountProvider
   (
      id : Windows.String
      ; displayName : Windows.String
      ; iconUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Credentials.IWebAccountProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.WebAccountProvider");
      m_Factory     : Windows.Security.Credentials.IWebAccountProviderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IWebAccountProvider := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountProviderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWebAccountProvider(id, displayName, iconUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWebAccount
   (
      webAccountProvider : Windows.Security.Credentials.IWebAccountProvider
      ; userName : Windows.String
      ; state : Windows.Security.Credentials.WebAccountState
   )
   return Windows.Security.Credentials.IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.WebAccount");
      m_Factory     : Windows.Security.Credentials.IWebAccountFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IWebAccount := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWebAccount(webAccountProvider, userName, state, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePasswordCredential return Windows.Security.Credentials.IPasswordCredential is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.PasswordCredential");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Security.Credentials.IPasswordCredential) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Credentials.IID_IPasswordCredential'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePasswordVault return Windows.Security.Credentials.IPasswordVault is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.PasswordVault");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Security.Credentials.IPasswordVault) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Credentials.IID_IPasswordVault'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePasswordCredentialPropertyStore return Windows.Foundation.Collections.IPropertySet is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.PasswordCredentialPropertyStore");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Foundation.Collections.IPropertySet) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Foundation.Collections.IID_IPropertySet'Access, RetVal'access);
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
   
   function IsSupportedAsync
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.KeyCredentialManager");
      m_Factory     : IKeyCredentialManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyCredentialManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupportedAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RenewAttestationAsync
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.KeyCredentialManager");
      m_Factory     : IKeyCredentialManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyCredentialManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RenewAttestationAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestCreateAsync
   (
      name : Windows.String
      ; option : Windows.Security.Credentials.KeyCredentialCreationOption
   )
   return Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.KeyCredentialManager");
      m_Factory     : IKeyCredentialManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyCredentialManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestCreateAsync(name, option, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenAsync
   (
      name : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.KeyCredentialManager");
      m_Factory     : IKeyCredentialManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IKeyCredentialRetrievalResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyCredentialManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenAsync(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeleteAsync
   (
      name : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.KeyCredentialManager");
      m_Factory     : IKeyCredentialManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyCredentialManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeleteAsync(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
