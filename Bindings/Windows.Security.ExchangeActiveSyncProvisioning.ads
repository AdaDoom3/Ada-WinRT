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
with Windows; use Windows;
with Windows.Foundation;
package Windows.Security.ExchangeActiveSyncProvisioning is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type EasRequireEncryptionResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      NotProvisionedOnAllVolumes,
      FixedDataNotSupported,
      HardwareNotCompliant,
      LockNotConfigured,
      ProtectionSuspended,
      OsVolumeNotProtected,
      ProtectionNotYetEnabled,
      NoFeatureLicense,
      OsNotProtected,
      UnexpectedFailure
   );
   for EasRequireEncryptionResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      NotProvisionedOnAllVolumes => 3,
      FixedDataNotSupported => 4,
      HardwareNotCompliant => 5,
      LockNotConfigured => 6,
      ProtectionSuspended => 7,
      OsVolumeNotProtected => 8,
      ProtectionNotYetEnabled => 9,
      NoFeatureLicense => 10,
      OsNotProtected => 11,
      UnexpectedFailure => 12
   );
   for EasRequireEncryptionResult'Size use 32;
   
   type EasRequireEncryptionResult_Ptr is access EasRequireEncryptionResult;
   
   type EasEncryptionProviderType is (
      NotEvaluated,
      WindowsEncryption,
      OtherEncryption
   );
   for EasEncryptionProviderType use (
      NotEvaluated => 0,
      WindowsEncryption => 1,
      OtherEncryption => 2
   );
   for EasEncryptionProviderType'Size use 32;
   
   type EasEncryptionProviderType_Ptr is access EasEncryptionProviderType;
   
   type EasMinPasswordLengthResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      RequestedPolicyIsStricter,
      RequestedPolicyNotEnforceable,
      InvalidParameter,
      CurrentUserHasBlankPassword,
      AdminsHaveBlankPassword,
      UserCannotChangePassword,
      AdminsCannotChangePassword,
      LocalControlledUsersCannotChangePassword,
      ConnectedAdminsProviderPolicyIsWeak,
      ConnectedUserProviderPolicyIsWeak,
      ChangeConnectedAdminsPassword,
      ChangeConnectedUserPassword
   );
   for EasMinPasswordLengthResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      RequestedPolicyIsStricter => 3,
      RequestedPolicyNotEnforceable => 4,
      InvalidParameter => 5,
      CurrentUserHasBlankPassword => 6,
      AdminsHaveBlankPassword => 7,
      UserCannotChangePassword => 8,
      AdminsCannotChangePassword => 9,
      LocalControlledUsersCannotChangePassword => 10,
      ConnectedAdminsProviderPolicyIsWeak => 11,
      ConnectedUserProviderPolicyIsWeak => 12,
      ChangeConnectedAdminsPassword => 13,
      ChangeConnectedUserPassword => 14
   );
   for EasMinPasswordLengthResult'Size use 32;
   
   type EasMinPasswordLengthResult_Ptr is access EasMinPasswordLengthResult;
   
   type EasDisallowConvenienceLogonResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      RequestedPolicyIsStricter
   );
   for EasDisallowConvenienceLogonResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      RequestedPolicyIsStricter => 3
   );
   for EasDisallowConvenienceLogonResult'Size use 32;
   
   type EasDisallowConvenienceLogonResult_Ptr is access EasDisallowConvenienceLogonResult;
   
   type EasMinPasswordComplexCharactersResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      RequestedPolicyIsStricter,
      RequestedPolicyNotEnforceable,
      InvalidParameter,
      CurrentUserHasBlankPassword,
      AdminsHaveBlankPassword,
      UserCannotChangePassword,
      AdminsCannotChangePassword,
      LocalControlledUsersCannotChangePassword,
      ConnectedAdminsProviderPolicyIsWeak,
      ConnectedUserProviderPolicyIsWeak,
      ChangeConnectedAdminsPassword,
      ChangeConnectedUserPassword
   );
   for EasMinPasswordComplexCharactersResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      RequestedPolicyIsStricter => 3,
      RequestedPolicyNotEnforceable => 4,
      InvalidParameter => 5,
      CurrentUserHasBlankPassword => 6,
      AdminsHaveBlankPassword => 7,
      UserCannotChangePassword => 8,
      AdminsCannotChangePassword => 9,
      LocalControlledUsersCannotChangePassword => 10,
      ConnectedAdminsProviderPolicyIsWeak => 11,
      ConnectedUserProviderPolicyIsWeak => 12,
      ChangeConnectedAdminsPassword => 13,
      ChangeConnectedUserPassword => 14
   );
   for EasMinPasswordComplexCharactersResult'Size use 32;
   
   type EasMinPasswordComplexCharactersResult_Ptr is access EasMinPasswordComplexCharactersResult;
   
   type EasPasswordExpirationResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      RequestedPolicyIsStricter,
      RequestedExpirationIncompatible,
      InvalidParameter,
      UserCannotChangePassword,
      AdminsCannotChangePassword,
      LocalControlledUsersCannotChangePassword
   );
   for EasPasswordExpirationResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      RequestedPolicyIsStricter => 3,
      RequestedExpirationIncompatible => 4,
      InvalidParameter => 5,
      UserCannotChangePassword => 6,
      AdminsCannotChangePassword => 7,
      LocalControlledUsersCannotChangePassword => 8
   );
   for EasPasswordExpirationResult'Size use 32;
   
   type EasPasswordExpirationResult_Ptr is access EasPasswordExpirationResult;
   
   type EasPasswordHistoryResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      RequestedPolicyIsStricter,
      InvalidParameter
   );
   for EasPasswordHistoryResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      RequestedPolicyIsStricter => 3,
      InvalidParameter => 4
   );
   for EasPasswordHistoryResult'Size use 32;
   
   type EasPasswordHistoryResult_Ptr is access EasPasswordHistoryResult;
   
   type EasMaxPasswordFailedAttemptsResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      RequestedPolicyIsStricter,
      InvalidParameter
   );
   for EasMaxPasswordFailedAttemptsResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      RequestedPolicyIsStricter => 3,
      InvalidParameter => 4
   );
   for EasMaxPasswordFailedAttemptsResult'Size use 32;
   
   type EasMaxPasswordFailedAttemptsResult_Ptr is access EasMaxPasswordFailedAttemptsResult;
   
   type EasMaxInactivityTimeLockResult is (
      NotEvaluated,
      Compliant,
      CanBeCompliant,
      RequestedPolicyIsStricter,
      InvalidParameter
   );
   for EasMaxInactivityTimeLockResult use (
      NotEvaluated => 0,
      Compliant => 1,
      CanBeCompliant => 2,
      RequestedPolicyIsStricter => 3,
      InvalidParameter => 4
   );
   for EasMaxInactivityTimeLockResult'Size use 32;
   
   type EasMaxInactivityTimeLockResult_Ptr is access EasMaxInactivityTimeLockResult;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type EasContract is null record;
   pragma Convention (C_Pass_By_Copy , EasContract);
   
   type EasContract_Ptr is access EasContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IEasComplianceResults_Interface;
   type AsyncOperationCompletedHandler_IEasComplianceResults is access all AsyncOperationCompletedHandler_IEasComplianceResults_Interface'Class;
   type AsyncOperationCompletedHandler_IEasComplianceResults_Ptr is access all AsyncOperationCompletedHandler_IEasComplianceResults;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IEasClientDeviceInformation_Interface;
   type IEasClientDeviceInformation is access all IEasClientDeviceInformation_Interface'Class;
   type IEasClientDeviceInformation_Ptr is access all IEasClientDeviceInformation;
   type IEasClientDeviceInformation2_Interface;
   type IEasClientDeviceInformation2 is access all IEasClientDeviceInformation2_Interface'Class;
   type IEasClientDeviceInformation2_Ptr is access all IEasClientDeviceInformation2;
   type IEasClientSecurityPolicy_Interface;
   type IEasClientSecurityPolicy is access all IEasClientSecurityPolicy_Interface'Class;
   type IEasClientSecurityPolicy_Ptr is access all IEasClientSecurityPolicy;
   type IEasComplianceResults_Interface;
   type IEasComplianceResults is access all IEasComplianceResults_Interface'Class;
   type IEasComplianceResults_Ptr is access all IEasComplianceResults;
   type IEasComplianceResults2_Interface;
   type IEasComplianceResults2 is access all IEasComplianceResults2_Interface'Class;
   type IEasComplianceResults2_Ptr is access all IEasComplianceResults2;
   type IAsyncOperation_IEasComplianceResults_Interface;
   type IAsyncOperation_IEasComplianceResults is access all IAsyncOperation_IEasComplianceResults_Interface'Class;
   type IAsyncOperation_IEasComplianceResults_Ptr is access all IAsyncOperation_IEasComplianceResults;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IEasClientDeviceInformation : aliased constant Windows.IID := (1423956353, 6504, 19619, (185, 88, 229, 149, 209, 101, 5, 235 ));
   
   type IEasClientDeviceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IEasClientDeviceInformation_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_OperatingSystem
   (
      This       : access IEasClientDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FriendlyName
   (
      This       : access IEasClientDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemManufacturer
   (
      This       : access IEasClientDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemProductName
   (
      This       : access IEasClientDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemSku
   (
      This       : access IEasClientDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEasClientDeviceInformation2 : aliased constant Windows.IID := (4289943843, 47910, 19818, (129, 188, 22, 90, 238, 10, 215, 84 ));
   
   type IEasClientDeviceInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SystemHardwareVersion
   (
      This       : access IEasClientDeviceInformation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemFirmwareVersion
   (
      This       : access IEasClientDeviceInformation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEasClientSecurityPolicy : aliased constant Windows.IID := (1169630050, 57274, 19099, (172, 237, 111, 226, 173, 203, 100, 32 ));
   
   type IEasClientSecurityPolicy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequireEncryption
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RequireEncryption
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MinPasswordLength
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_MinPasswordLength
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_DisallowConvenienceLogon
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_DisallowConvenienceLogon
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MinPasswordComplexCharacters
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_MinPasswordComplexCharacters
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PasswordExpiration
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_PasswordExpiration
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_PasswordHistory
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_PasswordHistory
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPasswordFailedAttempts
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxPasswordFailedAttempts
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxInactivityTimeLock
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxInactivityTimeLock
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function CheckCompliance
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.IEasComplianceResults
   )
   return Windows.HRESULT is abstract;
   
   function ApplyAsync
   (
      This       : access IEasClientSecurityPolicy_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.IAsyncOperation_IEasComplianceResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEasComplianceResults : aliased constant Windows.IID := (1178347932, 32537, 19558, (180, 3, 203, 69, 221, 87, 162, 179 ));
   
   type IEasComplianceResults_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Compliant
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RequireEncryptionResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasRequireEncryptionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_MinPasswordLengthResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasMinPasswordLengthResult
   )
   return Windows.HRESULT is abstract;
   
   function get_DisallowConvenienceLogonResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasDisallowConvenienceLogonResult
   )
   return Windows.HRESULT is abstract;
   
   function get_MinPasswordComplexCharactersResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasMinPasswordComplexCharactersResult
   )
   return Windows.HRESULT is abstract;
   
   function get_PasswordExpirationResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasPasswordExpirationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_PasswordHistoryResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasPasswordHistoryResult
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPasswordFailedAttemptsResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasMaxPasswordFailedAttemptsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxInactivityTimeLockResult
   (
      This       : access IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasMaxInactivityTimeLockResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEasComplianceResults2 : aliased constant Windows.IID := (801005769, 6824, 18421, (136, 187, 203, 62, 240, 191, 251, 21 ));
   
   type IEasComplianceResults2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncryptionProviderType
   (
      This       : access IEasComplianceResults2_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.EasEncryptionProviderType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IEasComplianceResults : aliased constant Windows.IID := (4231689018, 32237, 24210, (165, 105, 180, 51, 137, 238, 136, 39 ));
   
   type IAsyncOperation_IEasComplianceResults_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IEasComplianceResults_Interface
      ; handler : Windows.Security.ExchangeActiveSyncProvisioning.AsyncOperationCompletedHandler_IEasComplianceResults
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.AsyncOperationCompletedHandler_IEasComplianceResults
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IEasComplianceResults_Interface
      ; RetVal : access Windows.Security.ExchangeActiveSyncProvisioning.IEasComplianceResults
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IEasComplianceResults : aliased constant Windows.IID := (614732570, 60721, 24319, (151, 46, 117, 11, 149, 100, 4, 208 ));
   
   type AsyncOperationCompletedHandler_IEasComplianceResults_Interface(Callback : access procedure (asyncInfo : Windows.Security.ExchangeActiveSyncProvisioning.IAsyncOperation_IEasComplianceResults ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IEasComplianceResults'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEasComplianceResults_Interface
      ; asyncInfo : Windows.Security.ExchangeActiveSyncProvisioning.IAsyncOperation_IEasComplianceResults
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype EasClientDeviceInformation is Windows.Security.ExchangeActiveSyncProvisioning.IEasClientDeviceInformation;
   function CreateEasClientDeviceInformation return Windows.Security.ExchangeActiveSyncProvisioning.IEasClientDeviceInformation;
   
   subtype EasComplianceResults is Windows.Security.ExchangeActiveSyncProvisioning.IEasComplianceResults;
   subtype EasClientSecurityPolicy is Windows.Security.ExchangeActiveSyncProvisioning.IEasClientSecurityPolicy;
   function CreateEasClientSecurityPolicy return Windows.Security.ExchangeActiveSyncProvisioning.IEasClientSecurityPolicy;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
