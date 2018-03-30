--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Security.Authentication.Web.Core;
with Windows.Security.Credentials;
with Windows.Security.Cryptography.Core;
with Windows.Security.Authentication.Web;
with Windows.Storage.Streams;
with Windows.Web.Http;
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.Web.Provider is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      webTokenResponse : Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebProviderTokenResponse");
      m_Factory     : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponseFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebProviderTokenResponseFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(webTokenResponse, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      viewType : Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.Provider.IWebAccountClientView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountClientView");
      m_Factory     : Windows.Security.Authentication.Web.Provider.IWebAccountClientViewFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Provider.IWebAccountClientView := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountClientViewFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(viewType, applicationCallbackUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPairwiseId
   (
      viewType : Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
      ; accountPairwiseId : Windows.String
   )
   return Windows.Security.Authentication.Web.Provider.IWebAccountClientView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountClientView");
      m_Factory     : Windows.Security.Authentication.Web.Provider.IWebAccountClientViewFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Provider.IWebAccountClientView := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountClientViewFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPairwiseId(viewType, applicationCallbackUri, accountPairwiseId, RetVal'Access);
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
   
   
   function AddWebAccountWithScopeAndMapAsync
   (
      webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; perUserWebAccountId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountMapManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountMapManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddWebAccountWithScopeAndMapAsync(webAccountId, webAccountUserName, props, scope, perUserWebAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetPerAppToPerUserAccountAsync
   (
      perAppAccount : Windows.Security.Credentials.IWebAccount
      ; perUserWebAccountId : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountMapManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountMapManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPerAppToPerUserAccountAsync(perAppAccount, perUserWebAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPerUserFromPerAppAccountAsync
   (
      perAppAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountMapManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountMapManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPerUserFromPerAppAccountAsync(perAppAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ClearPerUserFromPerAppAccountAsync
   (
      perAppAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountMapManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountMapManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ClearPerUserFromPerAppAccountAsync(perAppAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UpdateWebAccountPropertiesAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; webAccountUserName : Windows.String
      ; additionalProperties : IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UpdateWebAccountPropertiesAsync(webAccount, webAccountUserName, additionalProperties, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AddWebAccountAsync
   (
      webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics_AddWebAccountAsync
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddWebAccountAsync(webAccountId, webAccountUserName, props, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeleteWebAccountAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeleteWebAccountAsync(webAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllProviderWebAccountsAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllProviderWebAccountsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function PushCookiesAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; cookies : Windows.Web.Http.IVectorView_IHttpCookie
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PushCookiesAsync(uri, cookies, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetViewAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; view : Windows.Security.Authentication.Web.Provider.IWebAccountClientView
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetViewAsync(webAccount, view, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ClearViewAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ClearViewAsync(webAccount, applicationCallbackUri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetViewsAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetViewsAsync(webAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetWebAccountPictureAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; webAccountPicture : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetWebAccountPictureAsync(webAccount, webAccountPicture, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ClearWebAccountPictureAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ClearWebAccountPictureAsync(webAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllProviderWebAccountsForUserAsync
   (
      user : Windows.System.IUser
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllProviderWebAccountsForUserAsync(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AddWebAccountForUserAsync
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddWebAccountForUserAsync(user, webAccountId, webAccountUserName, props, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AddWebAccountWithScopeForUserAsync
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddWebAccountWithScopeForUserAsync(user, webAccountId, webAccountUserName, props, scope, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AddWebAccountWithScopeAndMapForUserAsync
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; perUserWebAccountId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddWebAccountWithScopeAndMapForUserAsync(user, webAccountId, webAccountUserName, props, scope, perUserWebAccountId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function InvalidateAppCacheForAllAccountsAsync
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InvalidateAppCacheForAllAccountsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function InvalidateAppCacheForAccountAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InvalidateAppCacheForAccountAsync(webAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AddWebAccountWithScopeAsync
   (
      webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountScopeManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountScopeManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddWebAccountWithScopeAsync(webAccountId, webAccountUserName, props, scope, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SetScopeAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountScopeManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountScopeManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetScopeAsync(webAccount, scope, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetScope
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Authentication.Web.Provider.WebAccountScope is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountScopeManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Web.Provider.WebAccountScope;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountScopeManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetScope(webAccount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function PullCookiesAsync
   (
      uriString : Windows.String
      ; callerPFN : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Web.Provider.WebAccountManager");
      m_Factory     : IWebAccountManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWebAccountManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PullCookiesAsync(uriString, callerPFN, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;