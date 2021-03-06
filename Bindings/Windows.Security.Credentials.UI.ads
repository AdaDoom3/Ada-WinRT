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
limited with Windows.Storage.Streams;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Security.Credentials.UI is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AuthenticationProtocol is (
      Basic,
      Digest,
      Ntlm,
      Kerberos,
      Negotiate,
      CredSsp,
      Custom
   );
   for AuthenticationProtocol use (
      Basic => 0,
      Digest => 1,
      Ntlm => 2,
      Kerberos => 3,
      Negotiate => 4,
      CredSsp => 5,
      Custom => 6
   );
   for AuthenticationProtocol'Size use 32;
   
   type AuthenticationProtocol_Ptr is access AuthenticationProtocol;
   
   type CredentialSaveOption is (
      Unselected,
      Selected,
      Hidden
   );
   for CredentialSaveOption use (
      Unselected => 0,
      Selected => 1,
      Hidden => 2
   );
   for CredentialSaveOption'Size use 32;
   
   type CredentialSaveOption_Ptr is access CredentialSaveOption;
   
   type UserConsentVerifierAvailability is (
      Available,
      DeviceNotPresent,
      NotConfiguredForUser,
      DisabledByPolicy,
      DeviceBusy
   );
   for UserConsentVerifierAvailability use (
      Available => 0,
      DeviceNotPresent => 1,
      NotConfiguredForUser => 2,
      DisabledByPolicy => 3,
      DeviceBusy => 4
   );
   for UserConsentVerifierAvailability'Size use 32;
   
   type UserConsentVerifierAvailability_Ptr is access UserConsentVerifierAvailability;
   
   type UserConsentVerificationResult is (
      Verified,
      DeviceNotPresent,
      NotConfiguredForUser,
      DisabledByPolicy,
      DeviceBusy,
      RetriesExhausted,
      Canceled
   );
   for UserConsentVerificationResult use (
      Verified => 0,
      DeviceNotPresent => 1,
      NotConfiguredForUser => 2,
      DisabledByPolicy => 3,
      DeviceBusy => 4,
      RetriesExhausted => 5,
      Canceled => 6
   );
   for UserConsentVerificationResult'Size use 32;
   
   type UserConsentVerificationResult_Ptr is access UserConsentVerificationResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ICredentialPickerResults_Interface;
   type AsyncOperationCompletedHandler_ICredentialPickerResults is access all AsyncOperationCompletedHandler_ICredentialPickerResults_Interface'Class;
   type AsyncOperationCompletedHandler_ICredentialPickerResults_Ptr is access all AsyncOperationCompletedHandler_ICredentialPickerResults;
   type AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Interface;
   type AsyncOperationCompletedHandler_UserConsentVerifierAvailability is access all AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Interface'Class;
   type AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Ptr is access all AsyncOperationCompletedHandler_UserConsentVerifierAvailability;
   type AsyncOperationCompletedHandler_UserConsentVerificationResult_Interface;
   type AsyncOperationCompletedHandler_UserConsentVerificationResult is access all AsyncOperationCompletedHandler_UserConsentVerificationResult_Interface'Class;
   type AsyncOperationCompletedHandler_UserConsentVerificationResult_Ptr is access all AsyncOperationCompletedHandler_UserConsentVerificationResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICredentialPickerOptions_Interface;
   type ICredentialPickerOptions is access all ICredentialPickerOptions_Interface'Class;
   type ICredentialPickerOptions_Ptr is access all ICredentialPickerOptions;
   type ICredentialPickerStatics_Interface;
   type ICredentialPickerStatics is access all ICredentialPickerStatics_Interface'Class;
   type ICredentialPickerStatics_Ptr is access all ICredentialPickerStatics;
   type ICredentialPickerResults_Interface;
   type ICredentialPickerResults is access all ICredentialPickerResults_Interface'Class;
   type ICredentialPickerResults_Ptr is access all ICredentialPickerResults;
   type IUserConsentVerifierStatics_Interface;
   type IUserConsentVerifierStatics is access all IUserConsentVerifierStatics_Interface'Class;
   type IUserConsentVerifierStatics_Ptr is access all IUserConsentVerifierStatics;
   type IAsyncOperation_ICredentialPickerResults_Interface;
   type IAsyncOperation_ICredentialPickerResults is access all IAsyncOperation_ICredentialPickerResults_Interface'Class;
   type IAsyncOperation_ICredentialPickerResults_Ptr is access all IAsyncOperation_ICredentialPickerResults;
   type IAsyncOperation_UserConsentVerifierAvailability_Interface;
   type IAsyncOperation_UserConsentVerifierAvailability is access all IAsyncOperation_UserConsentVerifierAvailability_Interface'Class;
   type IAsyncOperation_UserConsentVerifierAvailability_Ptr is access all IAsyncOperation_UserConsentVerifierAvailability;
   type IAsyncOperation_UserConsentVerificationResult_Interface;
   type IAsyncOperation_UserConsentVerificationResult is access all IAsyncOperation_UserConsentVerificationResult_Interface'Class;
   type IAsyncOperation_UserConsentVerificationResult_Ptr is access all IAsyncOperation_UserConsentVerificationResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICredentialPickerOptions : aliased constant Windows.IID := (2522483532, 38394, 18047, (153, 43, 11, 34, 229, 133, 155, 246 ));
   
   type ICredentialPickerOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Caption
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Caption
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Message
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ErrorCode
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ErrorCode
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetName
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetName
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AuthenticationProtocol
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.Security.Credentials.UI.AuthenticationProtocol
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationProtocol
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.Security.Credentials.UI.AuthenticationProtocol
   )
   return Windows.HRESULT is abstract;
   
   function put_CustomAuthenticationProtocol
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomAuthenticationProtocol
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PreviousCredential
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviousCredential
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_AlwaysDisplayDialog
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysDisplayDialog
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CallerSavesCredential
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CallerSavesCredential
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CredentialSaveOption
   (
      This       : access ICredentialPickerOptions_Interface
      ; value : Windows.Security.Credentials.UI.CredentialSaveOption
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialSaveOption
   (
      This       : access ICredentialPickerOptions_Interface
      ; RetVal : access Windows.Security.Credentials.UI.CredentialSaveOption
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICredentialPickerStatics : aliased constant Windows.IID := (2855951475, 51690, 18306, (153, 251, 230, 215, 233, 56, 225, 45 ));
   
   type ICredentialPickerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function PickWithOptionsAsync
   (
      This       : access ICredentialPickerStatics_Interface
      ; options : Windows.Security.Credentials.UI.ICredentialPickerOptions
      ; RetVal : access Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickWithMessageAsync
   (
      This       : access ICredentialPickerStatics_Interface
      ; targetName : Windows.String
      ; message : Windows.String
      ; RetVal : access Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickWithCaptionAsync
   (
      This       : access ICredentialPickerStatics_Interface
      ; targetName : Windows.String
      ; message : Windows.String
      ; caption : Windows.String
      ; RetVal : access Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICredentialPickerResults : aliased constant Windows.IID := (424212890, 52272, 16652, (156, 56, 204, 8, 132, 197, 179, 215 ));
   
   type ICredentialPickerResults_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ErrorCode
   (
      This       : access ICredentialPickerResults_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialSaveOption
   (
      This       : access ICredentialPickerResults_Interface
      ; RetVal : access Windows.Security.Credentials.UI.CredentialSaveOption
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialSaved
   (
      This       : access ICredentialPickerResults_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Credential
   (
      This       : access ICredentialPickerResults_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialDomainName
   (
      This       : access ICredentialPickerResults_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialUserName
   (
      This       : access ICredentialPickerResults_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CredentialPassword
   (
      This       : access ICredentialPickerResults_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUserConsentVerifierStatics : aliased constant Windows.IID := (2941206417, 22092, 19932, (184, 181, 151, 52, 71, 98, 124, 101 ));
   
   type IUserConsentVerifierStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CheckAvailabilityAsync
   (
      This       : access IUserConsentVerifierStatics_Interface
      ; RetVal : access Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestVerificationAsync
   (
      This       : access IUserConsentVerifierStatics_Interface
      ; message : Windows.String
      ; RetVal : access Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICredentialPickerResults : aliased constant Windows.IID := (2214398372, 8701, 23553, (156, 246, 130, 147, 178, 146, 154, 159 ));
   
   type IAsyncOperation_ICredentialPickerResults_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICredentialPickerResults_Interface
      ; handler : Windows.Security.Credentials.UI.AsyncOperationCompletedHandler_ICredentialPickerResults
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICredentialPickerResults_Interface
      ; RetVal : access Windows.Security.Credentials.UI.AsyncOperationCompletedHandler_ICredentialPickerResults
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICredentialPickerResults_Interface
      ; RetVal : access Windows.Security.Credentials.UI.ICredentialPickerResults
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_UserConsentVerifierAvailability : aliased constant Windows.IID := (3721626867, 55320, 23939, (171, 75, 50, 17, 156, 40, 88, 124 ));
   
   type IAsyncOperation_UserConsentVerifierAvailability_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UserConsentVerifierAvailability_Interface
      ; handler : Windows.Security.Credentials.UI.AsyncOperationCompletedHandler_UserConsentVerifierAvailability
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UserConsentVerifierAvailability_Interface
      ; RetVal : access Windows.Security.Credentials.UI.AsyncOperationCompletedHandler_UserConsentVerifierAvailability
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UserConsentVerifierAvailability_Interface
      ; RetVal : access Windows.Security.Credentials.UI.UserConsentVerifierAvailability
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_UserConsentVerificationResult : aliased constant Windows.IID := (4250497021, 8984, 21903, (157, 190, 210, 29, 244, 55, 100, 165 ));
   
   type IAsyncOperation_UserConsentVerificationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_UserConsentVerificationResult_Interface
      ; handler : Windows.Security.Credentials.UI.AsyncOperationCompletedHandler_UserConsentVerificationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_UserConsentVerificationResult_Interface
      ; RetVal : access Windows.Security.Credentials.UI.AsyncOperationCompletedHandler_UserConsentVerificationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_UserConsentVerificationResult_Interface
      ; RetVal : access Windows.Security.Credentials.UI.UserConsentVerificationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICredentialPickerResults : aliased constant Windows.IID := (152737464, 21158, 21050, (140, 148, 127, 156, 17, 198, 218, 229 ));
   
   type AsyncOperationCompletedHandler_ICredentialPickerResults_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICredentialPickerResults'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICredentialPickerResults_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_UserConsentVerifierAvailability : aliased constant Windows.IID := (681083252, 44258, 23573, (160, 223, 88, 10, 38, 217, 66, 148 ));
   
   type AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_UserConsentVerifierAvailability'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_UserConsentVerificationResult : aliased constant Windows.IID := (218089161, 19499, 23764, (179, 140, 123, 141, 243, 255, 90, 251 ));
   
   type AsyncOperationCompletedHandler_UserConsentVerificationResult_Interface(Callback : access procedure (asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_UserConsentVerificationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_UserConsentVerificationResult_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CredentialPickerOptions is Windows.Security.Credentials.UI.ICredentialPickerOptions;
   function CreateCredentialPickerOptions return Windows.Security.Credentials.UI.ICredentialPickerOptions;
   
   subtype CredentialPickerResults is Windows.Security.Credentials.UI.ICredentialPickerResults;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function PickWithOptionsAsync
   (
      options : Windows.Security.Credentials.UI.ICredentialPickerOptions
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   
   function PickWithMessageAsync
   (
      targetName : Windows.String
      ; message : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   
   function PickWithCaptionAsync
   (
      targetName : Windows.String
      ; message : Windows.String
      ; caption : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   
   function CheckAvailabilityAsync
   return Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability;
   
   function RequestVerificationAsync
   (
      message : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult;
   
end;
