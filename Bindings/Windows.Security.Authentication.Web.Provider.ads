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
limited with Windows.Security.Authentication.Web.Core;
with Windows.Foundation.Collections;
limited with Windows.Security.Credentials;
with Windows.Foundation;
limited with Windows.Security.Cryptography.Core;
limited with Windows.Storage.Streams;
limited with Windows.Web.Http;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Security.Authentication.Web.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WebAccountProviderOperationKind is (
      RequestToken,
      GetTokenSilently,
      AddAccount,
      ManageAccount,
      DeleteAccount,
      RetrieveCookies,
      SignOutAccount
   );
   for WebAccountProviderOperationKind use (
      RequestToken => 0,
      GetTokenSilently => 1,
      AddAccount => 2,
      ManageAccount => 3,
      DeleteAccount => 4,
      RetrieveCookies => 5,
      SignOutAccount => 6
   );
   for WebAccountProviderOperationKind'Size use 32;
   
   type WebAccountProviderOperationKind_Ptr is access WebAccountProviderOperationKind;
   
   type WebAccountSelectionOptions is (
      Default,
      New_x
   );
   for WebAccountSelectionOptions use (
      Default => 0,
      New_x => 1
   );
   for WebAccountSelectionOptions'Size use 32;
   
   type WebAccountSelectionOptions_Ptr is access WebAccountSelectionOptions;
   
   type WebAccountClientViewType is (
      IdOnly,
      IdAndProperties
   );
   for WebAccountClientViewType use (
      IdOnly => 0,
      IdAndProperties => 1
   );
   for WebAccountClientViewType'Size use 32;
   
   type WebAccountClientViewType_Ptr is access WebAccountClientViewType;
   
   type WebAccountScope is (
      PerUser,
      PerApplication
   );
   for WebAccountScope use (
      PerUser => 0,
      PerApplication => 1
   );
   for WebAccountScope'Size use 32;
   
   type WebAccountScope_Ptr is access WebAccountScope;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWebAccountProviderOperation_Interface;
   type IWebAccountProviderOperation is access all IWebAccountProviderOperation_Interface'Class;
   type IWebAccountProviderOperation_Ptr is access all IWebAccountProviderOperation;
   type IWebProviderTokenRequest_Interface;
   type IWebProviderTokenRequest is access all IWebProviderTokenRequest_Interface'Class;
   type IWebProviderTokenRequest_Ptr is access all IWebProviderTokenRequest;
   type IWebProviderTokenRequest2_Interface;
   type IWebProviderTokenRequest2 is access all IWebProviderTokenRequest2_Interface'Class;
   type IWebProviderTokenRequest2_Ptr is access all IWebProviderTokenRequest2;
   type IWebProviderTokenResponse_Interface;
   type IWebProviderTokenResponse is access all IWebProviderTokenResponse_Interface'Class;
   type IWebProviderTokenResponse_Ptr is access all IWebProviderTokenResponse;
   type IWebProviderTokenResponseFactory_Interface;
   type IWebProviderTokenResponseFactory is access all IWebProviderTokenResponseFactory_Interface'Class;
   type IWebProviderTokenResponseFactory_Ptr is access all IWebProviderTokenResponseFactory;
   type IWebAccountClientView_Interface;
   type IWebAccountClientView is access all IWebAccountClientView_Interface'Class;
   type IWebAccountClientView_Ptr is access all IWebAccountClientView;
   type IWebAccountClientViewFactory_Interface;
   type IWebAccountClientViewFactory is access all IWebAccountClientViewFactory_Interface'Class;
   type IWebAccountClientViewFactory_Ptr is access all IWebAccountClientViewFactory;
   type IWebAccountManagerStatics_Interface;
   type IWebAccountManagerStatics is access all IWebAccountManagerStatics_Interface'Class;
   type IWebAccountManagerStatics_Ptr is access all IWebAccountManagerStatics;
   type IWebAccountManagerStatics2_Interface;
   type IWebAccountManagerStatics2 is access all IWebAccountManagerStatics2_Interface'Class;
   type IWebAccountManagerStatics2_Ptr is access all IWebAccountManagerStatics2;
   type IWebAccountScopeManagerStatics_Interface;
   type IWebAccountScopeManagerStatics is access all IWebAccountScopeManagerStatics_Interface'Class;
   type IWebAccountScopeManagerStatics_Ptr is access all IWebAccountScopeManagerStatics;
   type IWebAccountMapManagerStatics_Interface;
   type IWebAccountMapManagerStatics is access all IWebAccountMapManagerStatics_Interface'Class;
   type IWebAccountMapManagerStatics_Ptr is access all IWebAccountMapManagerStatics;
   type IWebAccountManagerStatics3_Interface;
   type IWebAccountManagerStatics3 is access all IWebAccountManagerStatics3_Interface'Class;
   type IWebAccountManagerStatics3_Ptr is access all IWebAccountManagerStatics3;
   type IWebAccountManagerStatics4_Interface;
   type IWebAccountManagerStatics4 is access all IWebAccountManagerStatics4_Interface'Class;
   type IWebAccountManagerStatics4_Ptr is access all IWebAccountManagerStatics4;
   type IWebAccountProviderBaseReportOperation_Interface;
   type IWebAccountProviderBaseReportOperation is access all IWebAccountProviderBaseReportOperation_Interface'Class;
   type IWebAccountProviderBaseReportOperation_Ptr is access all IWebAccountProviderBaseReportOperation;
   type IWebAccountProviderUIReportOperation_Interface;
   type IWebAccountProviderUIReportOperation is access all IWebAccountProviderUIReportOperation_Interface'Class;
   type IWebAccountProviderUIReportOperation_Ptr is access all IWebAccountProviderUIReportOperation;
   type IWebAccountProviderSilentReportOperation_Interface;
   type IWebAccountProviderSilentReportOperation is access all IWebAccountProviderSilentReportOperation_Interface'Class;
   type IWebAccountProviderSilentReportOperation_Ptr is access all IWebAccountProviderSilentReportOperation;
   type IWebAccountProviderTokenOperation_Interface;
   type IWebAccountProviderTokenOperation is access all IWebAccountProviderTokenOperation_Interface'Class;
   type IWebAccountProviderTokenOperation_Ptr is access all IWebAccountProviderTokenOperation;
   type IWebAccountProviderAddAccountOperation_Interface;
   type IWebAccountProviderAddAccountOperation is access all IWebAccountProviderAddAccountOperation_Interface'Class;
   type IWebAccountProviderAddAccountOperation_Ptr is access all IWebAccountProviderAddAccountOperation;
   type IWebAccountProviderManageAccountOperation_Interface;
   type IWebAccountProviderManageAccountOperation is access all IWebAccountProviderManageAccountOperation_Interface'Class;
   type IWebAccountProviderManageAccountOperation_Ptr is access all IWebAccountProviderManageAccountOperation;
   type IWebAccountProviderDeleteAccountOperation_Interface;
   type IWebAccountProviderDeleteAccountOperation is access all IWebAccountProviderDeleteAccountOperation_Interface'Class;
   type IWebAccountProviderDeleteAccountOperation_Ptr is access all IWebAccountProviderDeleteAccountOperation;
   type IWebAccountProviderSignOutAccountOperation_Interface;
   type IWebAccountProviderSignOutAccountOperation is access all IWebAccountProviderSignOutAccountOperation_Interface'Class;
   type IWebAccountProviderSignOutAccountOperation_Ptr is access all IWebAccountProviderSignOutAccountOperation;
   type IWebAccountProviderRetrieveCookiesOperation_Interface;
   type IWebAccountProviderRetrieveCookiesOperation is access all IWebAccountProviderRetrieveCookiesOperation_Interface'Class;
   type IWebAccountProviderRetrieveCookiesOperation_Ptr is access all IWebAccountProviderRetrieveCookiesOperation;
   type IWebAccountProviderTokenObjects_Interface;
   type IWebAccountProviderTokenObjects is access all IWebAccountProviderTokenObjects_Interface'Class;
   type IWebAccountProviderTokenObjects_Ptr is access all IWebAccountProviderTokenObjects;
   type IWebAccountProviderTokenObjects2_Interface;
   type IWebAccountProviderTokenObjects2 is access all IWebAccountProviderTokenObjects2_Interface'Class;
   type IWebAccountProviderTokenObjects2_Ptr is access all IWebAccountProviderTokenObjects2;
   type IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface;
   type IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync is access all IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface'Class;
   type IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Ptr is access all IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync;
   type IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface;
   type IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync is access all IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface'Class;
   type IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Ptr is access all IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync;
   type IIterable_IWebAccountManagerStatics_AddWebAccountAsync_Interface;
   type IIterable_IWebAccountManagerStatics_AddWebAccountAsync is access all IIterable_IWebAccountManagerStatics_AddWebAccountAsync_Interface'Class;
   type IIterable_IWebAccountManagerStatics_AddWebAccountAsync_Ptr is access all IIterable_IWebAccountManagerStatics_AddWebAccountAsync;
   type IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Interface;
   type IMapView_IWebAccountManagerStatics_AddWebAccountAsync is access all IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Interface'Class;
   type IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Ptr is access all IMapView_IWebAccountManagerStatics_AddWebAccountAsync;
   type IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface;
   type IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync is access all IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface'Class;
   type IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Ptr is access all IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync;
   type IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface;
   type IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync is access all IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface'Class;
   type IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Ptr is access all IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync;
   type IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface;
   type IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync is access all IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface'Class;
   type IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Ptr is access all IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync;
   type IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface;
   type IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync is access all IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface'Class;
   type IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Ptr is access all IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync is access all IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface'Class;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Ptr is access all IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync is access all IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface'Class;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Ptr is access all IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync is access all IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface'Class;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Ptr is access all IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync is access all IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface'Class;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Ptr is access all IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync is access all IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface'Class;
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Ptr is access all IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync is access all IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface'Class;
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Ptr is access all IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync;
   type IIterator_IWebProviderTokenResponse_Interface;
   type IIterator_IWebProviderTokenResponse is access all IIterator_IWebProviderTokenResponse_Interface'Class;
   type IIterator_IWebProviderTokenResponse_Ptr is access all IIterator_IWebProviderTokenResponse;
   type IIterable_IWebProviderTokenResponse_Interface;
   type IIterable_IWebProviderTokenResponse is access all IIterable_IWebProviderTokenResponse_Interface'Class;
   type IIterable_IWebProviderTokenResponse_Ptr is access all IIterable_IWebProviderTokenResponse;
   type IVectorView_IWebProviderTokenResponse_Interface;
   type IVectorView_IWebProviderTokenResponse is access all IVectorView_IWebProviderTokenResponse_Interface'Class;
   type IVectorView_IWebProviderTokenResponse_Ptr is access all IVectorView_IWebProviderTokenResponse;
   type IVector_IWebProviderTokenResponse_Interface;
   type IVector_IWebProviderTokenResponse is access all IVector_IWebProviderTokenResponse_Interface'Class;
   type IVector_IWebProviderTokenResponse_Ptr is access all IVector_IWebProviderTokenResponse;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderOperation : aliased constant Windows.IID := (1834820646, 4273, 16794, (164, 78, 249, 197, 22, 21, 116, 230 ));
   
   type IWebAccountProviderOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IWebAccountProviderOperation_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.WebAccountProviderOperationKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebProviderTokenRequest : aliased constant Windows.IID := (504919947, 34821, 17739, (159, 17, 70, 141, 42, 241, 9, 90 ));
   
   type IWebProviderTokenRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClientRequest
   (
      This       : access IWebProviderTokenRequest_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_WebAccounts
   (
      This       : access IWebProviderTokenRequest_Interface
      ; RetVal : access Windows.Security.Credentials.IVectorView_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_WebAccountSelectionOptions
   (
      This       : access IWebProviderTokenRequest_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.WebAccountSelectionOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationCallbackUri
   (
      This       : access IWebProviderTokenRequest_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function GetApplicationTokenBindingKeyAsync
   (
      This       : access IWebProviderTokenRequest_Interface
      ; keyType : Windows.Security.Authentication.Web.TokenBindingKeyType
      ; target : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebProviderTokenRequest2 : aliased constant Windows.IID := (3050778188, 4273, 19110, (136, 177, 11, 108, 158, 12, 30, 70 ));
   
   type IWebProviderTokenRequest2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetApplicationTokenBindingKeyIdAsync
   (
      This       : access IWebProviderTokenRequest2_Interface
      ; keyType : Windows.Security.Authentication.Web.TokenBindingKeyType
      ; target : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebProviderTokenResponse : aliased constant Windows.IID := (4011931539, 61269, 16774, (183, 206, 140, 178, 231, 249, 132, 158 ));
   
   type IWebProviderTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ClientResponse
   (
      This       : access IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebProviderTokenResponseFactory : aliased constant Windows.IID := (4199143834, 9658, 16503, (156, 250, 157, 180, 222, 167, 183, 26 ));
   
   type IWebProviderTokenResponseFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IWebProviderTokenResponseFactory_Interface
      ; webTokenResponse : Windows.Security.Authentication.Web.Core.IWebTokenResponse
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountClientView : aliased constant Windows.IID := (3887949498, 3015, 19558, (191, 212, 101, 211, 8, 44, 188, 168 ));
   
   type IWebAccountClientView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ApplicationCallbackUri
   (
      This       : access IWebAccountClientView_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IWebAccountClientView_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
   )
   return Windows.HRESULT is abstract;
   
   function get_AccountPairwiseId
   (
      This       : access IWebAccountClientView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountClientViewFactory : aliased constant Windows.IID := (1634539172, 56866, 18517, (163, 38, 6, 206, 191, 42, 63, 35 ));
   
   type IWebAccountClientViewFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IWebAccountClientViewFactory_Interface
      ; viewType : Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebAccountClientView
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithPairwiseId
   (
      This       : access IWebAccountClientViewFactory_Interface
      ; viewType : Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
      ; accountPairwiseId : Windows.String
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebAccountClientView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountManagerStatics : aliased constant Windows.IID := (3001606566, 54426, 16434, (132, 191, 26, 40, 71, 116, 123, 241 ));
   
   type IWebAccountManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function UpdateWebAccountPropertiesAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; webAccountUserName : Windows.String
      ; additionalProperties : IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function AddWebAccountAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics_AddWebAccountAsync
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeleteWebAccountAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FindAllProviderWebAccountsAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PushCookiesAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; cookies : Windows.Web.Http.IVectorView_IHttpCookie
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetViewAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; view : Windows.Security.Authentication.Web.Provider.IWebAccountClientView
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ClearViewAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetViewsAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetWebAccountPictureAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; webAccountPicture : Windows.Storage.Streams.IRandomAccessStream
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ClearWebAccountPictureAsync
   (
      This       : access IWebAccountManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountManagerStatics2 : aliased constant Windows.IID := (1755818025, 11615, 18003, (139, 176, 189, 47, 166, 189, 45, 135 ));
   
   type IWebAccountManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function PullCookiesAsync
   (
      This       : access IWebAccountManagerStatics2_Interface
      ; uriString : Windows.String
      ; callerPFN : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountScopeManagerStatics : aliased constant Windows.IID := (1550639996, 4786, 16954, (191, 61, 133, 184, 215, 229, 54, 86 ));
   
   type IWebAccountScopeManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AddWebAccountWithScopeAsync
   (
      This       : access IWebAccountScopeManagerStatics_Interface
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetScopeAsync
   (
      This       : access IWebAccountScopeManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetScope
   (
      This       : access IWebAccountScopeManagerStatics_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Security.Authentication.Web.Provider.WebAccountScope
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountMapManagerStatics : aliased constant Windows.IID := (3908715631, 14875, 18596, (142, 144, 30, 89, 202, 111, 84, 219 ));
   
   type IWebAccountMapManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AddWebAccountWithScopeAndMapAsync
   (
      This       : access IWebAccountMapManagerStatics_Interface
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; perUserWebAccountId : Windows.String
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetPerAppToPerUserAccountAsync
   (
      This       : access IWebAccountMapManagerStatics_Interface
      ; perAppAccount : Windows.Security.Credentials.IWebAccount
      ; perUserWebAccountId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetPerUserFromPerAppAccountAsync
   (
      This       : access IWebAccountMapManagerStatics_Interface
      ; perAppAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ClearPerUserFromPerAppAccountAsync
   (
      This       : access IWebAccountMapManagerStatics_Interface
      ; perAppAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountManagerStatics3 : aliased constant Windows.IID := (3712295846, 35407, 19106, (177, 94, 3, 245, 80, 175, 19, 89 ));
   
   type IWebAccountManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAllProviderWebAccountsForUserAsync
   (
      This       : access IWebAccountManagerStatics3_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddWebAccountForUserAsync
   (
      This       : access IWebAccountManagerStatics3_Interface
      ; user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddWebAccountWithScopeForUserAsync
   (
      This       : access IWebAccountManagerStatics3_Interface
      ; user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddWebAccountWithScopeAndMapForUserAsync
   (
      This       : access IWebAccountManagerStatics3_Interface
      ; user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; perUserWebAccountId : Windows.String
      ; RetVal : access Windows.Security.Credentials.IAsyncOperation_IWebAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountManagerStatics4 : aliased constant Windows.IID := (1508623058, 63451, 16687, (188, 63, 242, 254, 160, 68, 48, 180 ));
   
   type IWebAccountManagerStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function InvalidateAppCacheForAllAccountsAsync
   (
      This       : access IWebAccountManagerStatics4_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function InvalidateAppCacheForAccountAsync
   (
      This       : access IWebAccountManagerStatics4_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderBaseReportOperation : aliased constant Windows.IID := (3148131515, 39227, 19799, (187, 228, 20, 33, 227, 102, 139, 76 ));
   
   type IWebAccountProviderBaseReportOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompleted
   (
      This       : access IWebAccountProviderBaseReportOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportError
   (
      This       : access IWebAccountProviderBaseReportOperation_Interface
      ; value : Windows.Security.Authentication.Web.Core.IWebProviderError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderUIReportOperation : aliased constant Windows.IID := (687837907, 36736, 17147, (148, 79, 178, 16, 123, 189, 66, 230 ));
   
   type IWebAccountProviderUIReportOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportUserCanceled
   (
      This       : access IWebAccountProviderUIReportOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderSilentReportOperation : aliased constant Windows.IID := (3769976312, 15119, 17626, (146, 76, 123, 24, 186, 170, 98, 169 ));
   
   type IWebAccountProviderSilentReportOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportUserInteractionRequired
   (
      This       : access IWebAccountProviderSilentReportOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ReportUserInteractionRequiredWithError
   (
      This       : access IWebAccountProviderSilentReportOperation_Interface
      ; value : Windows.Security.Authentication.Web.Core.IWebProviderError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderTokenOperation : aliased constant Windows.IID := (2512786366, 8244, 19512, (148, 52, 210, 108, 20, 178, 180, 178 ));
   
   type IWebAccountProviderTokenOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProviderRequest
   (
      This       : access IWebAccountProviderTokenOperation_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebProviderTokenRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderResponses
   (
      This       : access IWebAccountProviderTokenOperation_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IVector_IWebProviderTokenResponse -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_CacheExpirationTime
   (
      This       : access IWebAccountProviderTokenOperation_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_CacheExpirationTime
   (
      This       : access IWebAccountProviderTokenOperation_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderAddAccountOperation : aliased constant Windows.IID := (1944837327, 17272, 19577, (147, 53, 165, 215, 171, 129, 89, 78 ));
   
   type IWebAccountProviderAddAccountOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function ReportCompleted
   (
      This       : access IWebAccountProviderAddAccountOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderManageAccountOperation : aliased constant Windows.IID := (3978353756, 53787, 17982, (169, 183, 193, 253, 14, 218, 233, 120 ));
   
   type IWebAccountProviderManageAccountOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccount
   (
      This       : access IWebAccountProviderManageAccountOperation_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IWebAccountProviderManageAccountOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderDeleteAccountOperation : aliased constant Windows.IID := (180046008, 40449, 18889, (163, 85, 125, 72, 202, 247, 214, 202 ));
   
   type IWebAccountProviderDeleteAccountOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccount
   (
      This       : access IWebAccountProviderDeleteAccountOperation_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderSignOutAccountOperation : aliased constant Windows.IID := (3096502813, 3157, 18364, (140, 114, 4, 166, 252, 124, 172, 7 ));
   
   type IWebAccountProviderSignOutAccountOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebAccount
   (
      This       : access IWebAccountProviderSignOutAccountOperation_Interface
      ; RetVal : access Windows.Security.Credentials.IWebAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationCallbackUri
   (
      This       : access IWebAccountProviderSignOutAccountOperation_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientId
   (
      This       : access IWebAccountProviderSignOutAccountOperation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderRetrieveCookiesOperation : aliased constant Windows.IID := (1510212673, 4003, 19121, (160, 28, 32, 177, 16, 53, 133, 148 ));
   
   type IWebAccountProviderRetrieveCookiesOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Context
   (
      This       : access IWebAccountProviderRetrieveCookiesOperation_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Cookies
   (
      This       : access IWebAccountProviderRetrieveCookiesOperation_Interface
      ; RetVal : access Windows.Web.Http.IVector_IHttpCookie -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access IWebAccountProviderRetrieveCookiesOperation_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IWebAccountProviderRetrieveCookiesOperation_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationCallbackUri
   (
      This       : access IWebAccountProviderRetrieveCookiesOperation_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderTokenObjects : aliased constant Windows.IID := (1083123787, 4904, 17115, (137, 164, 11, 206, 122, 113, 125, 142 ));
   
   type IWebAccountProviderTokenObjects_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IWebAccountProviderTokenObjects_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebAccountProviderOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebAccountProviderTokenObjects2 : aliased constant Windows.IID := (270579859, 23717, 20479, (149, 251, 184, 32, 39, 63, 195, 149 ));
   
   type IWebAccountProviderTokenObjects2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IWebAccountProviderTokenObjects2_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountManagerStatics_AddWebAccountAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebAccountManagerStatics_AddWebAccountAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountManagerStatics_AddWebAccountAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IWebAccountManagerStatics_AddWebAccountAsync : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IWebAccountManagerStatics_AddWebAccountAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface
      ; RetVal : access Windows.Foundation.Collections.IIterator_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync : aliased constant Windows.IID := (2894014194, 65207, 23338, (138, 196, 52, 91, 198, 44, 174, 222 ));
   
   type IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync_Interface
      ; first : access Windows.Address
      ; second : access Windows.Address
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWebProviderTokenResponse : aliased constant Windows.IID := (3948380765, 23254, 24288, (141, 198, 165, 60, 30, 130, 227, 171 ));
   
   type IIterator_IWebProviderTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebProviderTokenResponse_Interface
      ; items : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebProviderTokenResponse : aliased constant Windows.IID := (3921330742, 49271, 21818, (180, 174, 181, 143, 176, 184, 153, 24 ));
   
   type IIterable_IWebProviderTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IIterator_IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWebProviderTokenResponse : aliased constant Windows.IID := (451298487, 38969, 22619, (135, 146, 236, 213, 5, 11, 136, 187 ));
   
   type IVectorView_IWebProviderTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebProviderTokenResponse_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebProviderTokenResponse_Interface
      ; value : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebProviderTokenResponse_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IWebProviderTokenResponse : aliased constant Windows.IID := (1316672975, 14607, 24269, (183, 20, 60, 101, 75, 132, 203, 186 ));
   
   type IVector_IWebProviderTokenResponse_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; RetVal : access Windows.Security.Authentication.Web.Provider.IVectorView_IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; value : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; index : Windows.UInt32
      ; value : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; value : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IWebProviderTokenResponse_Interface
      ; items : Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WebProviderTokenRequest is Windows.Security.Authentication.Web.Provider.IWebProviderTokenRequest;
   subtype WebProviderTokenResponse is Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse;
   function Create
   (
      webTokenResponse : Windows.Security.Authentication.Web.Core.IWebTokenResponse
   )
   return Windows.Security.Authentication.Web.Provider.IWebProviderTokenResponse;
   
   subtype WebAccountClientView is Windows.Security.Authentication.Web.Provider.IWebAccountClientView;
   function Create
   (
      viewType : Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Security.Authentication.Web.Provider.IWebAccountClientView;
   
   function CreateWithPairwiseId
   (
      viewType : Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
      ; accountPairwiseId : Windows.String
   )
   return Windows.Security.Authentication.Web.Provider.IWebAccountClientView;
   
   subtype WebAccountProviderRequestTokenOperation is Windows.Security.Authentication.Web.Provider.IWebAccountProviderTokenOperation;
   subtype WebAccountProviderGetTokenSilentOperation is Windows.Security.Authentication.Web.Provider.IWebAccountProviderTokenOperation;
   subtype WebAccountProviderAddAccountOperation is Windows.Security.Authentication.Web.Provider.IWebAccountProviderAddAccountOperation;
   subtype WebAccountProviderManageAccountOperation is Windows.Security.Authentication.Web.Provider.IWebAccountProviderManageAccountOperation;
   subtype WebAccountProviderDeleteAccountOperation is Windows.Security.Authentication.Web.Provider.IWebAccountProviderDeleteAccountOperation;
   subtype WebAccountProviderSignOutAccountOperation is Windows.Security.Authentication.Web.Provider.IWebAccountProviderSignOutAccountOperation;
   subtype WebAccountProviderRetrieveCookiesOperation is Windows.Security.Authentication.Web.Provider.IWebAccountProviderRetrieveCookiesOperation;
   subtype WebAccountProviderTriggerDetails is Windows.Security.Authentication.Web.Provider.IWebAccountProviderTokenObjects;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function AddWebAccountWithScopeAndMapAsync
   (
      webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountMapManagerStatics_AddWebAccountWithScopeAndMapAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; perUserWebAccountId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function SetPerAppToPerUserAccountAsync
   (
      perAppAccount : Windows.Security.Credentials.IWebAccount
      ; perUserWebAccountId : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetPerUserFromPerAppAccountAsync
   (
      perAppAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function ClearPerUserFromPerAppAccountAsync
   (
      perAppAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction;
   
   function UpdateWebAccountPropertiesAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; webAccountUserName : Windows.String
      ; additionalProperties : IMapView_IWebAccountManagerStatics_UpdateWebAccountPropertiesAsync
   )
   return Windows.Foundation.IAsyncAction;
   
   function AddWebAccountAsync
   (
      webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics_AddWebAccountAsync
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function DeleteWebAccountAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction;
   
   function FindAllProviderWebAccountsAsync
   return Windows.Address;
   
   function PushCookiesAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
      ; cookies : Windows.Web.Http.IVectorView_IHttpCookie
   )
   return Windows.Foundation.IAsyncAction;
   
   function SetViewAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; view : Windows.Security.Authentication.Web.Provider.IWebAccountClientView
   )
   return Windows.Foundation.IAsyncAction;
   
   function ClearViewAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; applicationCallbackUri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetViewsAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Address;
   
   function SetWebAccountPictureAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; webAccountPicture : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Foundation.IAsyncAction;
   
   function ClearWebAccountPictureAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction;
   
   function FindAllProviderWebAccountsForUserAsync
   (
      user : Windows.System.IUser
   )
   return Windows.Address;
   
   function AddWebAccountForUserAsync
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountForUserAsync
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function AddWebAccountWithScopeForUserAsync
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeForUserAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function AddWebAccountWithScopeAndMapForUserAsync
   (
      user : Windows.System.IUser
      ; webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountManagerStatics3_AddWebAccountWithScopeAndMapForUserAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
      ; perUserWebAccountId : Windows.String
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function InvalidateAppCacheForAllAccountsAsync
   return Windows.Foundation.IAsyncAction;
   
   function InvalidateAppCacheForAccountAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Foundation.IAsyncAction;
   
   function AddWebAccountWithScopeAsync
   (
      webAccountId : Windows.String
      ; webAccountUserName : Windows.String
      ; props : IMapView_IWebAccountScopeManagerStatics_AddWebAccountWithScopeAsync
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
   )
   return Windows.Security.Credentials.IAsyncOperation_IWebAccount;
   
   function SetScopeAsync
   (
      webAccount : Windows.Security.Credentials.IWebAccount
      ; scope : Windows.Security.Authentication.Web.Provider.WebAccountScope
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetScope
   (
      webAccount : Windows.Security.Credentials.IWebAccount
   )
   return Windows.Security.Authentication.Web.Provider.WebAccountScope;
   
   function PullCookiesAsync
   (
      uriString : Windows.String
      ; callerPFN : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
end;
