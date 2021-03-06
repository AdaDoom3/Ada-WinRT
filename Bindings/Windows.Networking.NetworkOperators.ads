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
with Windows.Foundation.Collections;
with Windows; use Windows;
limited with Windows.Networking.Connectivity;
with Windows.Foundation;
limited with Windows.Devices.Sms;
limited with Windows.Storage.Streams;
limited with Windows.Data.Xml.Dom;
--------------------------------------------------------------------------------
package Windows.Networking.NetworkOperators is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DataClasses is (
      None,
      Gprs,
      Edge,
      Umts,
      Hsdpa,
      Hsupa,
      LteAdvanced,
      Cdma1xRtt,
      Cdma1xEvdo,
      Cdma1xEvdoRevA,
      Cdma1xEvdv,
      Cdma3xRtt,
      Cdma1xEvdoRevB,
      CdmaUmb,
      Custom
   );
   for DataClasses use (
      None => 0,
      Gprs => 1,
      Edge => 2,
      Umts => 4,
      Hsdpa => 8,
      Hsupa => 16,
      LteAdvanced => 32,
      Cdma1xRtt => 65536,
      Cdma1xEvdo => 131072,
      Cdma1xEvdoRevA => 262144,
      Cdma1xEvdv => 524288,
      Cdma3xRtt => 1048576,
      Cdma1xEvdoRevB => 2097152,
      CdmaUmb => 4194304,
      Custom => 2147483648
   );
   for DataClasses'Size use 32;
   
   type DataClasses_Ptr is access DataClasses;
   
   type MobileBroadbandDeviceType is (
      Unknown,
      Embedded,
      Removable,
      Remote
   );
   for MobileBroadbandDeviceType use (
      Unknown => 0,
      Embedded => 1,
      Removable => 2,
      Remote => 3
   );
   for MobileBroadbandDeviceType'Size use 32;
   
   type MobileBroadbandDeviceType_Ptr is access MobileBroadbandDeviceType;
   
   type NetworkDeviceStatus is (
      DeviceNotReady,
      DeviceReady,
      SimNotInserted,
      BadSim,
      DeviceHardwareFailure,
      AccountNotActivated,
      DeviceLocked,
      DeviceBlocked
   );
   for NetworkDeviceStatus use (
      DeviceNotReady => 0,
      DeviceReady => 1,
      SimNotInserted => 2,
      BadSim => 3,
      DeviceHardwareFailure => 4,
      AccountNotActivated => 5,
      DeviceLocked => 6,
      DeviceBlocked => 7
   );
   for NetworkDeviceStatus'Size use 32;
   
   type NetworkDeviceStatus_Ptr is access NetworkDeviceStatus;
   
   type NetworkRegistrationState is (
      None,
      Deregistered,
      Searching,
      Home,
      Roaming,
      Partner,
      Denied
   );
   for NetworkRegistrationState use (
      None => 0,
      Deregistered => 1,
      Searching => 2,
      Home => 3,
      Roaming => 4,
      Partner => 5,
      Denied => 6
   );
   for NetworkRegistrationState'Size use 32;
   
   type NetworkRegistrationState_Ptr is access NetworkRegistrationState;
   
   type MobileBroadbandRadioState is (
      Off,
      On
   );
   for MobileBroadbandRadioState use (
      Off => 0,
      On => 1
   );
   for MobileBroadbandRadioState'Size use 32;
   
   type MobileBroadbandRadioState_Ptr is access MobileBroadbandRadioState;
   
   type NetworkOperatorEventMessageType is (
      Gsm,
      Cdma,
      Ussd,
      DataPlanThresholdReached,
      DataPlanReset,
      DataPlanDeleted,
      ProfileConnected,
      ProfileDisconnected,
      RegisteredRoaming,
      RegisteredHome,
      TetheringEntitlementCheck,
      TetheringOperationalStateChanged,
      TetheringNumberOfClientsChanged
   );
   for NetworkOperatorEventMessageType use (
      Gsm => 0,
      Cdma => 1,
      Ussd => 2,
      DataPlanThresholdReached => 3,
      DataPlanReset => 4,
      DataPlanDeleted => 5,
      ProfileConnected => 6,
      ProfileDisconnected => 7,
      RegisteredRoaming => 8,
      RegisteredHome => 9,
      TetheringEntitlementCheck => 10,
      TetheringOperationalStateChanged => 11,
      TetheringNumberOfClientsChanged => 12
   );
   for NetworkOperatorEventMessageType'Size use 32;
   
   type NetworkOperatorEventMessageType_Ptr is access NetworkOperatorEventMessageType;
   
   type MobileBroadbandAccountWatcherStatus is (
      Created,
      Started,
      EnumerationCompleted,
      Stopped,
      Aborted
   );
   for MobileBroadbandAccountWatcherStatus use (
      Created => 0,
      Started => 1,
      EnumerationCompleted => 2,
      Stopped => 3,
      Aborted => 4
   );
   for MobileBroadbandAccountWatcherStatus'Size use 32;
   
   type MobileBroadbandAccountWatcherStatus_Ptr is access MobileBroadbandAccountWatcherStatus;
   
   type TetheringOperationalState is (
      Unknown,
      On,
      Off,
      InTransition
   );
   for TetheringOperationalState use (
      Unknown => 0,
      On => 1,
      Off => 2,
      InTransition => 3
   );
   for TetheringOperationalState'Size use 32;
   
   type TetheringOperationalState_Ptr is access TetheringOperationalState;
   
   type TetheringCapability is (
      Enabled,
      DisabledByGroupPolicy,
      DisabledByHardwareLimitation,
      DisabledByOperator,
      DisabledBySku,
      DisabledByRequiredAppNotInstalled,
      DisabledDueToUnknownCause,
      DisabledBySystemCapability
   );
   for TetheringCapability use (
      Enabled => 0,
      DisabledByGroupPolicy => 1,
      DisabledByHardwareLimitation => 2,
      DisabledByOperator => 3,
      DisabledBySku => 4,
      DisabledByRequiredAppNotInstalled => 5,
      DisabledDueToUnknownCause => 6,
      DisabledBySystemCapability => 7
   );
   for TetheringCapability'Size use 32;
   
   type TetheringCapability_Ptr is access TetheringCapability;
   
   type TetheringOperationStatus is (
      Success,
      Unknown,
      MobileBroadbandDeviceOff,
      WiFiDeviceOff,
      EntitlementCheckTimeout,
      EntitlementCheckFailure,
      OperationInProgress,
      BluetoothDeviceOff,
      NetworkLimitedConnectivity
   );
   for TetheringOperationStatus use (
      Success => 0,
      Unknown => 1,
      MobileBroadbandDeviceOff => 2,
      WiFiDeviceOff => 3,
      EntitlementCheckTimeout => 4,
      EntitlementCheckFailure => 5,
      OperationInProgress => 6,
      BluetoothDeviceOff => 7,
      NetworkLimitedConnectivity => 8
   );
   for TetheringOperationStatus'Size use 32;
   
   type TetheringOperationStatus_Ptr is access TetheringOperationStatus;
   
   type MobileBroadbandPinLockState is (
      Unknown,
      Unlocked,
      PinRequired,
      PinUnblockKeyRequired
   );
   for MobileBroadbandPinLockState use (
      Unknown => 0,
      Unlocked => 1,
      PinRequired => 2,
      PinUnblockKeyRequired => 3
   );
   for MobileBroadbandPinLockState'Size use 32;
   
   type MobileBroadbandPinLockState_Ptr is access MobileBroadbandPinLockState;
   
   type MobileBroadbandPinType is (
      None,
      Custom,
      Pin1,
      Pin2,
      SimPin,
      FirstSimPin,
      NetworkPin,
      NetworkSubsetPin,
      ServiceProviderPin,
      CorporatePin,
      SubsidyLock
   );
   for MobileBroadbandPinType use (
      None => 0,
      Custom => 1,
      Pin1 => 2,
      Pin2 => 3,
      SimPin => 4,
      FirstSimPin => 5,
      NetworkPin => 6,
      NetworkSubsetPin => 7,
      ServiceProviderPin => 8,
      CorporatePin => 9,
      SubsidyLock => 10
   );
   for MobileBroadbandPinType'Size use 32;
   
   type MobileBroadbandPinType_Ptr is access MobileBroadbandPinType;
   
   type MobileBroadbandPinFormat is (
      Unknown,
      Numeric,
      Alphanumeric
   );
   for MobileBroadbandPinFormat use (
      Unknown => 0,
      Numeric => 1,
      Alphanumeric => 2
   );
   for MobileBroadbandPinFormat'Size use 32;
   
   type MobileBroadbandPinFormat_Ptr is access MobileBroadbandPinFormat;
   
   type MobileBroadbandUiccAppOperationStatus is (
      Success,
      InvalidUiccFilePath,
      AccessConditionNotHeld,
      UiccBusy
   );
   for MobileBroadbandUiccAppOperationStatus use (
      Success => 0,
      InvalidUiccFilePath => 1,
      AccessConditionNotHeld => 2,
      UiccBusy => 3
   );
   for MobileBroadbandUiccAppOperationStatus'Size use 32;
   
   type MobileBroadbandUiccAppOperationStatus_Ptr is access MobileBroadbandUiccAppOperationStatus;
   
   type UiccAppKind is (
      Unknown,
      MF,
      MFSim,
      MFRuim,
      USim,
      CSim,
      ISim
   );
   for UiccAppKind use (
      Unknown => 0,
      MF => 1,
      MFSim => 2,
      MFRuim => 3,
      USim => 4,
      CSim => 5,
      ISim => 6
   );
   for UiccAppKind'Size use 32;
   
   type UiccAppKind_Ptr is access UiccAppKind;
   
   type UiccAppRecordKind is (
      Unknown,
      Transparent,
      RecordOriented
   );
   for UiccAppRecordKind use (
      Unknown => 0,
      Transparent => 1,
      RecordOriented => 2
   );
   for UiccAppRecordKind'Size use 32;
   
   type UiccAppRecordKind_Ptr is access UiccAppRecordKind;
   
   type UiccAccessCondition is (
      AlwaysAllowed,
      Pin1,
      Pin2,
      Pin3,
      Pin4,
      Administrative5,
      Administrative6,
      NeverAllowed
   );
   for UiccAccessCondition use (
      AlwaysAllowed => 0,
      Pin1 => 1,
      Pin2 => 2,
      Pin3 => 3,
      Pin4 => 4,
      Administrative5 => 5,
      Administrative6 => 6,
      NeverAllowed => 7
   );
   for UiccAccessCondition'Size use 32;
   
   type UiccAccessCondition_Ptr is access UiccAccessCondition;
   
   type MobileBroadbandModemStatus is (
      Success,
      OtherFailure,
      Busy,
      NoDeviceSupport
   );
   for MobileBroadbandModemStatus use (
      Success => 0,
      OtherFailure => 1,
      Busy => 2,
      NoDeviceSupport => 3
   );
   for MobileBroadbandModemStatus'Size use 32;
   
   type MobileBroadbandModemStatus_Ptr is access MobileBroadbandModemStatus;
   
   type HotspotAuthenticationResponseCode is (
      NoError,
      LoginSucceeded,
      LoginFailed,
      RadiusServerError,
      NetworkAdministratorError,
      LoginAborted,
      AccessGatewayInternalError
   );
   for HotspotAuthenticationResponseCode use (
      NoError => 0,
      LoginSucceeded => 50,
      LoginFailed => 100,
      RadiusServerError => 102,
      NetworkAdministratorError => 105,
      LoginAborted => 151,
      AccessGatewayInternalError => 255
   );
   for HotspotAuthenticationResponseCode'Size use 32;
   
   type HotspotAuthenticationResponseCode_Ptr is access HotspotAuthenticationResponseCode;
   
   type ProfileMediaType is (
      Wlan,
      Wwan
   );
   for ProfileMediaType use (
      Wlan => 0,
      Wwan => 1
   );
   for ProfileMediaType'Size use 32;
   
   type ProfileMediaType_Ptr is access ProfileMediaType;
   
   type UssdResultCode is (
      NoActionRequired,
      ActionRequired,
      Terminated,
      OtherLocalClient,
      OperationNotSupported,
      NetworkTimeout
   );
   for UssdResultCode use (
      NoActionRequired => 0,
      ActionRequired => 1,
      Terminated => 2,
      OtherLocalClient => 3,
      OperationNotSupported => 4,
      NetworkTimeout => 5
   );
   for UssdResultCode'Size use 32;
   
   type UssdResultCode_Ptr is access UssdResultCode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type ProfileUsage is record
      UsageInMegabytes : Windows.UInt32;
      LastSyncTime : Windows.Foundation.DateTime;
   end record;
   pragma Convention (C_Pass_By_Copy , ProfileUsage);
   
   type ProfileUsage_Ptr is access ProfileUsage;
   
   type LegacyNetworkOperatorsContract is null record;
   pragma Convention (C_Pass_By_Copy , LegacyNetworkOperatorsContract);
   
   type LegacyNetworkOperatorsContract_Ptr is access LegacyNetworkOperatorsContract;
   
   type NetworkOperatorsFdnContract is null record;
   pragma Convention (C_Pass_By_Copy , NetworkOperatorsFdnContract);
   
   type NetworkOperatorsFdnContract_Ptr is access NetworkOperatorsFdnContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo_Interface;
   type AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo is access all AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo_Interface'Class;
   type AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo_Ptr is access all AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo;
   type AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult_Interface;
   type AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult is access all AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult_Interface'Class;
   type AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult_Ptr is access all AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded_Interface;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded_Interface'Class;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded_Ptr is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated_Interface;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated_Interface'Class;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated_Ptr is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved_Interface;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved_Interface'Class;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved_Ptr is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped_Interface;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped_Ptr is access all TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped;
   type AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration_Interface;
   type AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration is access all AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration_Interface'Class;
   type AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration_Ptr is access all AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration;
   type AsyncOperationCompletedHandler_MobileBroadbandModemStatus_Interface;
   type AsyncOperationCompletedHandler_MobileBroadbandModemStatus is access all AsyncOperationCompletedHandler_MobileBroadbandModemStatus_Interface'Class;
   type AsyncOperationCompletedHandler_MobileBroadbandModemStatus_Ptr is access all AsyncOperationCompletedHandler_MobileBroadbandModemStatus;
   type AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult_Interface;
   type AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult is access all AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult_Ptr is access all AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult;
   type TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived_Interface;
   type TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived is access all TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived_Interface'Class;
   type TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived_Ptr is access all TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived;
   type AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult_Interface;
   type AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult is access all AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult_Ptr is access all AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult_Interface;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult is access all AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult_Ptr is access all AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult_Interface;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult is access all AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult_Ptr is access all AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult_Interface;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult is access all AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult_Interface'Class;
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult_Ptr is access all AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult;
   type TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged_Interface;
   type TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged is access all TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged_Interface'Class;
   type TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged_Ptr is access all TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged;
   type AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult_Interface;
   type AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult is access all AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult_Ptr is access all AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult;
   type AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults_Interface;
   type AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults is access all AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults_Interface'Class;
   type AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults_Ptr is access all AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults;
   type AsyncOperationCompletedHandler_IUssdReply_Interface;
   type AsyncOperationCompletedHandler_IUssdReply is access all AsyncOperationCompletedHandler_IUssdReply_Interface'Class;
   type AsyncOperationCompletedHandler_IUssdReply_Ptr is access all AsyncOperationCompletedHandler_IUssdReply;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMobileBroadbandAccountStatics_Interface;
   type IMobileBroadbandAccountStatics is access all IMobileBroadbandAccountStatics_Interface'Class;
   type IMobileBroadbandAccountStatics_Ptr is access all IMobileBroadbandAccountStatics;
   type IMobileBroadbandAccount_Interface;
   type IMobileBroadbandAccount is access all IMobileBroadbandAccount_Interface'Class;
   type IMobileBroadbandAccount_Ptr is access all IMobileBroadbandAccount;
   type IMobileBroadbandAccount2_Interface;
   type IMobileBroadbandAccount2 is access all IMobileBroadbandAccount2_Interface'Class;
   type IMobileBroadbandAccount2_Ptr is access all IMobileBroadbandAccount2;
   type IMobileBroadbandAccount3_Interface;
   type IMobileBroadbandAccount3 is access all IMobileBroadbandAccount3_Interface'Class;
   type IMobileBroadbandAccount3_Ptr is access all IMobileBroadbandAccount3;
   type IMobileBroadbandDeviceInformation_Interface;
   type IMobileBroadbandDeviceInformation is access all IMobileBroadbandDeviceInformation_Interface'Class;
   type IMobileBroadbandDeviceInformation_Ptr is access all IMobileBroadbandDeviceInformation;
   type IMobileBroadbandDeviceInformation2_Interface;
   type IMobileBroadbandDeviceInformation2 is access all IMobileBroadbandDeviceInformation2_Interface'Class;
   type IMobileBroadbandDeviceInformation2_Ptr is access all IMobileBroadbandDeviceInformation2;
   type IMobileBroadbandDeviceInformation3_Interface;
   type IMobileBroadbandDeviceInformation3 is access all IMobileBroadbandDeviceInformation3_Interface'Class;
   type IMobileBroadbandDeviceInformation3_Ptr is access all IMobileBroadbandDeviceInformation3;
   type IMobileBroadbandNetwork_Interface;
   type IMobileBroadbandNetwork is access all IMobileBroadbandNetwork_Interface'Class;
   type IMobileBroadbandNetwork_Ptr is access all IMobileBroadbandNetwork;
   type IMobileBroadbandNetwork2_Interface;
   type IMobileBroadbandNetwork2 is access all IMobileBroadbandNetwork2_Interface'Class;
   type IMobileBroadbandNetwork2_Ptr is access all IMobileBroadbandNetwork2;
   type IMobileBroadbandNetwork3_Interface;
   type IMobileBroadbandNetwork3 is access all IMobileBroadbandNetwork3_Interface'Class;
   type IMobileBroadbandNetwork3_Ptr is access all IMobileBroadbandNetwork3;
   type INetworkOperatorTetheringAccessPointConfiguration_Interface;
   type INetworkOperatorTetheringAccessPointConfiguration is access all INetworkOperatorTetheringAccessPointConfiguration_Interface'Class;
   type INetworkOperatorTetheringAccessPointConfiguration_Ptr is access all INetworkOperatorTetheringAccessPointConfiguration;
   type INetworkOperatorTetheringOperationResult_Interface;
   type INetworkOperatorTetheringOperationResult is access all INetworkOperatorTetheringOperationResult_Interface'Class;
   type INetworkOperatorTetheringOperationResult_Ptr is access all INetworkOperatorTetheringOperationResult;
   type INetworkOperatorTetheringManagerStatics_Interface;
   type INetworkOperatorTetheringManagerStatics is access all INetworkOperatorTetheringManagerStatics_Interface'Class;
   type INetworkOperatorTetheringManagerStatics_Ptr is access all INetworkOperatorTetheringManagerStatics;
   type INetworkOperatorTetheringManagerStatics2_Interface;
   type INetworkOperatorTetheringManagerStatics2 is access all INetworkOperatorTetheringManagerStatics2_Interface'Class;
   type INetworkOperatorTetheringManagerStatics2_Ptr is access all INetworkOperatorTetheringManagerStatics2;
   type INetworkOperatorTetheringManagerStatics3_Interface;
   type INetworkOperatorTetheringManagerStatics3 is access all INetworkOperatorTetheringManagerStatics3_Interface'Class;
   type INetworkOperatorTetheringManagerStatics3_Ptr is access all INetworkOperatorTetheringManagerStatics3;
   type INetworkOperatorTetheringManager_Interface;
   type INetworkOperatorTetheringManager is access all INetworkOperatorTetheringManager_Interface'Class;
   type INetworkOperatorTetheringManager_Ptr is access all INetworkOperatorTetheringManager;
   type INetworkOperatorTetheringClient_Interface;
   type INetworkOperatorTetheringClient is access all INetworkOperatorTetheringClient_Interface'Class;
   type INetworkOperatorTetheringClient_Ptr is access all INetworkOperatorTetheringClient;
   type INetworkOperatorTetheringClientManager_Interface;
   type INetworkOperatorTetheringClientManager is access all INetworkOperatorTetheringClientManager_Interface'Class;
   type INetworkOperatorTetheringClientManager_Ptr is access all INetworkOperatorTetheringClientManager;
   type IMobileBroadbandAccountEventArgs_Interface;
   type IMobileBroadbandAccountEventArgs is access all IMobileBroadbandAccountEventArgs_Interface'Class;
   type IMobileBroadbandAccountEventArgs_Ptr is access all IMobileBroadbandAccountEventArgs;
   type IMobileBroadbandAccountUpdatedEventArgs_Interface;
   type IMobileBroadbandAccountUpdatedEventArgs is access all IMobileBroadbandAccountUpdatedEventArgs_Interface'Class;
   type IMobileBroadbandAccountUpdatedEventArgs_Ptr is access all IMobileBroadbandAccountUpdatedEventArgs;
   type IMobileBroadbandAccountWatcher_Interface;
   type IMobileBroadbandAccountWatcher is access all IMobileBroadbandAccountWatcher_Interface'Class;
   type IMobileBroadbandAccountWatcher_Ptr is access all IMobileBroadbandAccountWatcher;
   type IMobileBroadbandModemStatics_Interface;
   type IMobileBroadbandModemStatics is access all IMobileBroadbandModemStatics_Interface'Class;
   type IMobileBroadbandModemStatics_Ptr is access all IMobileBroadbandModemStatics;
   type IMobileBroadbandModemConfiguration_Interface;
   type IMobileBroadbandModemConfiguration is access all IMobileBroadbandModemConfiguration_Interface'Class;
   type IMobileBroadbandModemConfiguration_Ptr is access all IMobileBroadbandModemConfiguration;
   type IMobileBroadbandModemConfiguration2_Interface;
   type IMobileBroadbandModemConfiguration2 is access all IMobileBroadbandModemConfiguration2_Interface'Class;
   type IMobileBroadbandModemConfiguration2_Ptr is access all IMobileBroadbandModemConfiguration2;
   type IMobileBroadbandModem_Interface;
   type IMobileBroadbandModem is access all IMobileBroadbandModem_Interface'Class;
   type IMobileBroadbandModem_Ptr is access all IMobileBroadbandModem;
   type IMobileBroadbandModem2_Interface;
   type IMobileBroadbandModem2 is access all IMobileBroadbandModem2_Interface'Class;
   type IMobileBroadbandModem2_Ptr is access all IMobileBroadbandModem2;
   type IMobileBroadbandPinManager_Interface;
   type IMobileBroadbandPinManager is access all IMobileBroadbandPinManager_Interface'Class;
   type IMobileBroadbandPinManager_Ptr is access all IMobileBroadbandPinManager;
   type IMobileBroadbandPinOperationResult_Interface;
   type IMobileBroadbandPinOperationResult is access all IMobileBroadbandPinOperationResult_Interface'Class;
   type IMobileBroadbandPinOperationResult_Ptr is access all IMobileBroadbandPinOperationResult;
   type IMobileBroadbandPin_Interface;
   type IMobileBroadbandPin is access all IMobileBroadbandPin_Interface'Class;
   type IMobileBroadbandPin_Ptr is access all IMobileBroadbandPin;
   type IMobileBroadbandDeviceServiceInformation_Interface;
   type IMobileBroadbandDeviceServiceInformation is access all IMobileBroadbandDeviceServiceInformation_Interface'Class;
   type IMobileBroadbandDeviceServiceInformation_Ptr is access all IMobileBroadbandDeviceServiceInformation;
   type IMobileBroadbandDeviceService_Interface;
   type IMobileBroadbandDeviceService is access all IMobileBroadbandDeviceService_Interface'Class;
   type IMobileBroadbandDeviceService_Ptr is access all IMobileBroadbandDeviceService;
   type IMobileBroadbandDeviceServiceDataReceivedEventArgs_Interface;
   type IMobileBroadbandDeviceServiceDataReceivedEventArgs is access all IMobileBroadbandDeviceServiceDataReceivedEventArgs_Interface'Class;
   type IMobileBroadbandDeviceServiceDataReceivedEventArgs_Ptr is access all IMobileBroadbandDeviceServiceDataReceivedEventArgs;
   type IMobileBroadbandDeviceServiceDataSession_Interface;
   type IMobileBroadbandDeviceServiceDataSession is access all IMobileBroadbandDeviceServiceDataSession_Interface'Class;
   type IMobileBroadbandDeviceServiceDataSession_Ptr is access all IMobileBroadbandDeviceServiceDataSession;
   type IMobileBroadbandDeviceServiceCommandResult_Interface;
   type IMobileBroadbandDeviceServiceCommandResult is access all IMobileBroadbandDeviceServiceCommandResult_Interface'Class;
   type IMobileBroadbandDeviceServiceCommandResult_Ptr is access all IMobileBroadbandDeviceServiceCommandResult;
   type IMobileBroadbandDeviceServiceCommandSession_Interface;
   type IMobileBroadbandDeviceServiceCommandSession is access all IMobileBroadbandDeviceServiceCommandSession_Interface'Class;
   type IMobileBroadbandDeviceServiceCommandSession_Ptr is access all IMobileBroadbandDeviceServiceCommandSession;
   type IMobileBroadbandUiccAppsResult_Interface;
   type IMobileBroadbandUiccAppsResult is access all IMobileBroadbandUiccAppsResult_Interface'Class;
   type IMobileBroadbandUiccAppsResult_Ptr is access all IMobileBroadbandUiccAppsResult;
   type IMobileBroadbandUicc_Interface;
   type IMobileBroadbandUicc is access all IMobileBroadbandUicc_Interface'Class;
   type IMobileBroadbandUicc_Ptr is access all IMobileBroadbandUicc;
   type IMobileBroadbandUiccAppRecordDetailsResult_Interface;
   type IMobileBroadbandUiccAppRecordDetailsResult is access all IMobileBroadbandUiccAppRecordDetailsResult_Interface'Class;
   type IMobileBroadbandUiccAppRecordDetailsResult_Ptr is access all IMobileBroadbandUiccAppRecordDetailsResult;
   type IMobileBroadbandUiccAppReadRecordResult_Interface;
   type IMobileBroadbandUiccAppReadRecordResult is access all IMobileBroadbandUiccAppReadRecordResult_Interface'Class;
   type IMobileBroadbandUiccAppReadRecordResult_Ptr is access all IMobileBroadbandUiccAppReadRecordResult;
   type IMobileBroadbandUiccApp_Interface;
   type IMobileBroadbandUiccApp is access all IMobileBroadbandUiccApp_Interface'Class;
   type IMobileBroadbandUiccApp_Ptr is access all IMobileBroadbandUiccApp;
   type IMobileBroadbandNetworkRegistrationStateChange_Interface;
   type IMobileBroadbandNetworkRegistrationStateChange is access all IMobileBroadbandNetworkRegistrationStateChange_Interface'Class;
   type IMobileBroadbandNetworkRegistrationStateChange_Ptr is access all IMobileBroadbandNetworkRegistrationStateChange;
   type IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails_Interface;
   type IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails is access all IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails_Interface'Class;
   type IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails_Ptr is access all IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails;
   type IMobileBroadbandRadioStateChange_Interface;
   type IMobileBroadbandRadioStateChange is access all IMobileBroadbandRadioStateChange_Interface'Class;
   type IMobileBroadbandRadioStateChange_Ptr is access all IMobileBroadbandRadioStateChange;
   type IMobileBroadbandRadioStateChangeTriggerDetails_Interface;
   type IMobileBroadbandRadioStateChangeTriggerDetails is access all IMobileBroadbandRadioStateChangeTriggerDetails_Interface'Class;
   type IMobileBroadbandRadioStateChangeTriggerDetails_Ptr is access all IMobileBroadbandRadioStateChangeTriggerDetails;
   type IMobileBroadbandPinLockStateChange_Interface;
   type IMobileBroadbandPinLockStateChange is access all IMobileBroadbandPinLockStateChange_Interface'Class;
   type IMobileBroadbandPinLockStateChange_Ptr is access all IMobileBroadbandPinLockStateChange;
   type IMobileBroadbandPinLockStateChangeTriggerDetails_Interface;
   type IMobileBroadbandPinLockStateChangeTriggerDetails is access all IMobileBroadbandPinLockStateChangeTriggerDetails_Interface'Class;
   type IMobileBroadbandPinLockStateChangeTriggerDetails_Ptr is access all IMobileBroadbandPinLockStateChangeTriggerDetails;
   type IMobileBroadbandDeviceServiceTriggerDetails_Interface;
   type IMobileBroadbandDeviceServiceTriggerDetails is access all IMobileBroadbandDeviceServiceTriggerDetails_Interface'Class;
   type IMobileBroadbandDeviceServiceTriggerDetails_Ptr is access all IMobileBroadbandDeviceServiceTriggerDetails;
   type IKnownCSimFilePathsStatics_Interface;
   type IKnownCSimFilePathsStatics is access all IKnownCSimFilePathsStatics_Interface'Class;
   type IKnownCSimFilePathsStatics_Ptr is access all IKnownCSimFilePathsStatics;
   type IKnownRuimFilePathsStatics_Interface;
   type IKnownRuimFilePathsStatics is access all IKnownRuimFilePathsStatics_Interface'Class;
   type IKnownRuimFilePathsStatics_Ptr is access all IKnownRuimFilePathsStatics;
   type IKnownSimFilePathsStatics_Interface;
   type IKnownSimFilePathsStatics is access all IKnownSimFilePathsStatics_Interface'Class;
   type IKnownSimFilePathsStatics_Ptr is access all IKnownSimFilePathsStatics;
   type IKnownUSimFilePathsStatics_Interface;
   type IKnownUSimFilePathsStatics is access all IKnownUSimFilePathsStatics_Interface'Class;
   type IKnownUSimFilePathsStatics_Ptr is access all IKnownUSimFilePathsStatics;
   type IMobileBroadbandCellCdma_Interface;
   type IMobileBroadbandCellCdma is access all IMobileBroadbandCellCdma_Interface'Class;
   type IMobileBroadbandCellCdma_Ptr is access all IMobileBroadbandCellCdma;
   type IMobileBroadbandCellGsm_Interface;
   type IMobileBroadbandCellGsm is access all IMobileBroadbandCellGsm_Interface'Class;
   type IMobileBroadbandCellGsm_Ptr is access all IMobileBroadbandCellGsm;
   type IMobileBroadbandCellLte_Interface;
   type IMobileBroadbandCellLte is access all IMobileBroadbandCellLte_Interface'Class;
   type IMobileBroadbandCellLte_Ptr is access all IMobileBroadbandCellLte;
   type IMobileBroadbandCellTdscdma_Interface;
   type IMobileBroadbandCellTdscdma is access all IMobileBroadbandCellTdscdma_Interface'Class;
   type IMobileBroadbandCellTdscdma_Ptr is access all IMobileBroadbandCellTdscdma;
   type IMobileBroadbandCellUmts_Interface;
   type IMobileBroadbandCellUmts is access all IMobileBroadbandCellUmts_Interface'Class;
   type IMobileBroadbandCellUmts_Ptr is access all IMobileBroadbandCellUmts;
   type IMobileBroadbandCellsInfo_Interface;
   type IMobileBroadbandCellsInfo is access all IMobileBroadbandCellsInfo_Interface'Class;
   type IMobileBroadbandCellsInfo_Ptr is access all IMobileBroadbandCellsInfo;
   type IMobileBroadbandAntennaSar_Interface;
   type IMobileBroadbandAntennaSar is access all IMobileBroadbandAntennaSar_Interface'Class;
   type IMobileBroadbandAntennaSar_Ptr is access all IMobileBroadbandAntennaSar;
   type IMobileBroadbandSarManager_Interface;
   type IMobileBroadbandSarManager is access all IMobileBroadbandSarManager_Interface'Class;
   type IMobileBroadbandSarManager_Ptr is access all IMobileBroadbandSarManager;
   type IMobileBroadbandTransmissionStateChangedEventArgs_Interface;
   type IMobileBroadbandTransmissionStateChangedEventArgs is access all IMobileBroadbandTransmissionStateChangedEventArgs_Interface'Class;
   type IMobileBroadbandTransmissionStateChangedEventArgs_Ptr is access all IMobileBroadbandTransmissionStateChangedEventArgs;
   type IHotspotAuthenticationEventDetails_Interface;
   type IHotspotAuthenticationEventDetails is access all IHotspotAuthenticationEventDetails_Interface'Class;
   type IHotspotAuthenticationEventDetails_Ptr is access all IHotspotAuthenticationEventDetails;
   type IHotspotAuthenticationContextStatics_Interface;
   type IHotspotAuthenticationContextStatics is access all IHotspotAuthenticationContextStatics_Interface'Class;
   type IHotspotAuthenticationContextStatics_Ptr is access all IHotspotAuthenticationContextStatics;
   type IHotspotAuthenticationContext_Interface;
   type IHotspotAuthenticationContext is access all IHotspotAuthenticationContext_Interface'Class;
   type IHotspotAuthenticationContext_Ptr is access all IHotspotAuthenticationContext;
   type IHotspotCredentialsAuthenticationResult_Interface;
   type IHotspotCredentialsAuthenticationResult is access all IHotspotCredentialsAuthenticationResult_Interface'Class;
   type IHotspotCredentialsAuthenticationResult_Ptr is access all IHotspotCredentialsAuthenticationResult;
   type IHotspotAuthenticationContext2_Interface;
   type IHotspotAuthenticationContext2 is access all IHotspotAuthenticationContext2_Interface'Class;
   type IHotspotAuthenticationContext2_Ptr is access all IHotspotAuthenticationContext2;
   type IProvisionFromXmlDocumentResults_Interface;
   type IProvisionFromXmlDocumentResults is access all IProvisionFromXmlDocumentResults_Interface'Class;
   type IProvisionFromXmlDocumentResults_Ptr is access all IProvisionFromXmlDocumentResults;
   type IProvisionedProfile_Interface;
   type IProvisionedProfile is access all IProvisionedProfile_Interface'Class;
   type IProvisionedProfile_Ptr is access all IProvisionedProfile;
   type IProvisioningAgent_Interface;
   type IProvisioningAgent is access all IProvisioningAgent_Interface'Class;
   type IProvisioningAgent_Ptr is access all IProvisioningAgent;
   type IProvisioningAgentStaticMethods_Interface;
   type IProvisioningAgentStaticMethods is access all IProvisioningAgentStaticMethods_Interface'Class;
   type IProvisioningAgentStaticMethods_Ptr is access all IProvisioningAgentStaticMethods;
   type IUssdMessage_Interface;
   type IUssdMessage is access all IUssdMessage_Interface'Class;
   type IUssdMessage_Ptr is access all IUssdMessage;
   type IUssdMessageFactory_Interface;
   type IUssdMessageFactory is access all IUssdMessageFactory_Interface'Class;
   type IUssdMessageFactory_Ptr is access all IUssdMessageFactory;
   type IUssdReply_Interface;
   type IUssdReply is access all IUssdReply_Interface'Class;
   type IUssdReply_Ptr is access all IUssdReply;
   type IUssdSession_Interface;
   type IUssdSession is access all IUssdSession_Interface'Class;
   type IUssdSession_Ptr is access all IUssdSession;
   type IUssdSessionStatics_Interface;
   type IUssdSessionStatics is access all IUssdSessionStatics_Interface'Class;
   type IUssdSessionStatics_Ptr is access all IUssdSessionStatics;
   type INetworkOperatorNotificationEventDetails_Interface;
   type INetworkOperatorNotificationEventDetails is access all INetworkOperatorNotificationEventDetails_Interface'Class;
   type INetworkOperatorNotificationEventDetails_Ptr is access all INetworkOperatorNotificationEventDetails;
   type INetworkOperatorTetheringEntitlementCheck_Interface;
   type INetworkOperatorTetheringEntitlementCheck is access all INetworkOperatorTetheringEntitlementCheck_Interface'Class;
   type INetworkOperatorTetheringEntitlementCheck_Ptr is access all INetworkOperatorTetheringEntitlementCheck;
   type IFdnAccessManagerStatics_Interface;
   type IFdnAccessManagerStatics is access all IFdnAccessManagerStatics_Interface'Class;
   type IFdnAccessManagerStatics_Ptr is access all IFdnAccessManagerStatics;
   type IIterator_IMobileBroadbandUiccApp_Interface;
   type IIterator_IMobileBroadbandUiccApp is access all IIterator_IMobileBroadbandUiccApp_Interface'Class;
   type IIterator_IMobileBroadbandUiccApp_Ptr is access all IIterator_IMobileBroadbandUiccApp;
   type IIterable_IMobileBroadbandUiccApp_Interface;
   type IIterable_IMobileBroadbandUiccApp is access all IIterable_IMobileBroadbandUiccApp_Interface'Class;
   type IIterable_IMobileBroadbandUiccApp_Ptr is access all IIterable_IMobileBroadbandUiccApp;
   type IVectorView_IMobileBroadbandUiccApp_Interface;
   type IVectorView_IMobileBroadbandUiccApp is access all IVectorView_IMobileBroadbandUiccApp_Interface'Class;
   type IVectorView_IMobileBroadbandUiccApp_Ptr is access all IVectorView_IMobileBroadbandUiccApp;
   type IAsyncOperation_IMobileBroadbandCellsInfo_Interface;
   type IAsyncOperation_IMobileBroadbandCellsInfo is access all IAsyncOperation_IMobileBroadbandCellsInfo_Interface'Class;
   type IAsyncOperation_IMobileBroadbandCellsInfo_Ptr is access all IAsyncOperation_IMobileBroadbandCellsInfo;
   type IAsyncOperation_INetworkOperatorTetheringOperationResult_Interface;
   type IAsyncOperation_INetworkOperatorTetheringOperationResult is access all IAsyncOperation_INetworkOperatorTetheringOperationResult_Interface'Class;
   type IAsyncOperation_INetworkOperatorTetheringOperationResult_Ptr is access all IAsyncOperation_INetworkOperatorTetheringOperationResult;
   type IIterator_INetworkOperatorTetheringClient_Interface;
   type IIterator_INetworkOperatorTetheringClient is access all IIterator_INetworkOperatorTetheringClient_Interface'Class;
   type IIterator_INetworkOperatorTetheringClient_Ptr is access all IIterator_INetworkOperatorTetheringClient;
   type IIterable_INetworkOperatorTetheringClient_Interface;
   type IIterable_INetworkOperatorTetheringClient is access all IIterable_INetworkOperatorTetheringClient_Interface'Class;
   type IIterable_INetworkOperatorTetheringClient_Ptr is access all IIterable_INetworkOperatorTetheringClient;
   type IVectorView_INetworkOperatorTetheringClient_Interface;
   type IVectorView_INetworkOperatorTetheringClient is access all IVectorView_INetworkOperatorTetheringClient_Interface'Class;
   type IVectorView_INetworkOperatorTetheringClient_Ptr is access all IVectorView_INetworkOperatorTetheringClient;
   type IIterator_IMobileBroadbandDeviceServiceInformation_Interface;
   type IIterator_IMobileBroadbandDeviceServiceInformation is access all IIterator_IMobileBroadbandDeviceServiceInformation_Interface'Class;
   type IIterator_IMobileBroadbandDeviceServiceInformation_Ptr is access all IIterator_IMobileBroadbandDeviceServiceInformation;
   type IIterable_IMobileBroadbandDeviceServiceInformation_Interface;
   type IIterable_IMobileBroadbandDeviceServiceInformation is access all IIterable_IMobileBroadbandDeviceServiceInformation_Interface'Class;
   type IIterable_IMobileBroadbandDeviceServiceInformation_Ptr is access all IIterable_IMobileBroadbandDeviceServiceInformation;
   type IVectorView_IMobileBroadbandDeviceServiceInformation_Interface;
   type IVectorView_IMobileBroadbandDeviceServiceInformation is access all IVectorView_IMobileBroadbandDeviceServiceInformation_Interface'Class;
   type IVectorView_IMobileBroadbandDeviceServiceInformation_Ptr is access all IVectorView_IMobileBroadbandDeviceServiceInformation;
   type IAsyncOperation_IMobileBroadbandModemConfiguration_Interface;
   type IAsyncOperation_IMobileBroadbandModemConfiguration is access all IAsyncOperation_IMobileBroadbandModemConfiguration_Interface'Class;
   type IAsyncOperation_IMobileBroadbandModemConfiguration_Ptr is access all IAsyncOperation_IMobileBroadbandModemConfiguration;
   type IAsyncOperation_MobileBroadbandModemStatus_Interface;
   type IAsyncOperation_MobileBroadbandModemStatus is access all IAsyncOperation_MobileBroadbandModemStatus_Interface'Class;
   type IAsyncOperation_MobileBroadbandModemStatus_Ptr is access all IAsyncOperation_MobileBroadbandModemStatus;
   type IIterator_MobileBroadbandPinType_Interface;
   type IIterator_MobileBroadbandPinType is access all IIterator_MobileBroadbandPinType_Interface'Class;
   type IIterator_MobileBroadbandPinType_Ptr is access all IIterator_MobileBroadbandPinType;
   type IIterable_MobileBroadbandPinType_Interface;
   type IIterable_MobileBroadbandPinType is access all IIterable_MobileBroadbandPinType_Interface'Class;
   type IIterable_MobileBroadbandPinType_Ptr is access all IIterable_MobileBroadbandPinType;
   type IVectorView_MobileBroadbandPinType_Interface;
   type IVectorView_MobileBroadbandPinType is access all IVectorView_MobileBroadbandPinType_Interface'Class;
   type IVectorView_MobileBroadbandPinType_Ptr is access all IVectorView_MobileBroadbandPinType;
   type IAsyncOperation_IMobileBroadbandPinOperationResult_Interface;
   type IAsyncOperation_IMobileBroadbandPinOperationResult is access all IAsyncOperation_IMobileBroadbandPinOperationResult_Interface'Class;
   type IAsyncOperation_IMobileBroadbandPinOperationResult_Ptr is access all IAsyncOperation_IMobileBroadbandPinOperationResult;
   type IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult_Interface;
   type IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult is access all IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult_Interface'Class;
   type IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult_Ptr is access all IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult;
   type IAsyncOperation_IMobileBroadbandUiccAppsResult_Interface;
   type IAsyncOperation_IMobileBroadbandUiccAppsResult is access all IAsyncOperation_IMobileBroadbandUiccAppsResult_Interface'Class;
   type IAsyncOperation_IMobileBroadbandUiccAppsResult_Ptr is access all IAsyncOperation_IMobileBroadbandUiccAppsResult;
   type IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult_Interface;
   type IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult is access all IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult_Interface'Class;
   type IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult_Ptr is access all IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult;
   type IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult_Interface;
   type IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult is access all IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult_Interface'Class;
   type IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult_Ptr is access all IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult;
   type IIterator_IMobileBroadbandNetworkRegistrationStateChange_Interface;
   type IIterator_IMobileBroadbandNetworkRegistrationStateChange is access all IIterator_IMobileBroadbandNetworkRegistrationStateChange_Interface'Class;
   type IIterator_IMobileBroadbandNetworkRegistrationStateChange_Ptr is access all IIterator_IMobileBroadbandNetworkRegistrationStateChange;
   type IIterable_IMobileBroadbandNetworkRegistrationStateChange_Interface;
   type IIterable_IMobileBroadbandNetworkRegistrationStateChange is access all IIterable_IMobileBroadbandNetworkRegistrationStateChange_Interface'Class;
   type IIterable_IMobileBroadbandNetworkRegistrationStateChange_Ptr is access all IIterable_IMobileBroadbandNetworkRegistrationStateChange;
   type IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Interface;
   type IVectorView_IMobileBroadbandNetworkRegistrationStateChange is access all IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Interface'Class;
   type IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Ptr is access all IVectorView_IMobileBroadbandNetworkRegistrationStateChange;
   type IIterator_IMobileBroadbandRadioStateChange_Interface;
   type IIterator_IMobileBroadbandRadioStateChange is access all IIterator_IMobileBroadbandRadioStateChange_Interface'Class;
   type IIterator_IMobileBroadbandRadioStateChange_Ptr is access all IIterator_IMobileBroadbandRadioStateChange;
   type IIterable_IMobileBroadbandRadioStateChange_Interface;
   type IIterable_IMobileBroadbandRadioStateChange is access all IIterable_IMobileBroadbandRadioStateChange_Interface'Class;
   type IIterable_IMobileBroadbandRadioStateChange_Ptr is access all IIterable_IMobileBroadbandRadioStateChange;
   type IVectorView_IMobileBroadbandRadioStateChange_Interface;
   type IVectorView_IMobileBroadbandRadioStateChange is access all IVectorView_IMobileBroadbandRadioStateChange_Interface'Class;
   type IVectorView_IMobileBroadbandRadioStateChange_Ptr is access all IVectorView_IMobileBroadbandRadioStateChange;
   type IIterator_IMobileBroadbandPinLockStateChange_Interface;
   type IIterator_IMobileBroadbandPinLockStateChange is access all IIterator_IMobileBroadbandPinLockStateChange_Interface'Class;
   type IIterator_IMobileBroadbandPinLockStateChange_Ptr is access all IIterator_IMobileBroadbandPinLockStateChange;
   type IIterable_IMobileBroadbandPinLockStateChange_Interface;
   type IIterable_IMobileBroadbandPinLockStateChange is access all IIterable_IMobileBroadbandPinLockStateChange_Interface'Class;
   type IIterable_IMobileBroadbandPinLockStateChange_Ptr is access all IIterable_IMobileBroadbandPinLockStateChange;
   type IVectorView_IMobileBroadbandPinLockStateChange_Interface;
   type IVectorView_IMobileBroadbandPinLockStateChange is access all IVectorView_IMobileBroadbandPinLockStateChange_Interface'Class;
   type IVectorView_IMobileBroadbandPinLockStateChange_Ptr is access all IVectorView_IMobileBroadbandPinLockStateChange;
   type IIterator_IMobileBroadbandCellCdma_Interface;
   type IIterator_IMobileBroadbandCellCdma is access all IIterator_IMobileBroadbandCellCdma_Interface'Class;
   type IIterator_IMobileBroadbandCellCdma_Ptr is access all IIterator_IMobileBroadbandCellCdma;
   type IIterable_IMobileBroadbandCellCdma_Interface;
   type IIterable_IMobileBroadbandCellCdma is access all IIterable_IMobileBroadbandCellCdma_Interface'Class;
   type IIterable_IMobileBroadbandCellCdma_Ptr is access all IIterable_IMobileBroadbandCellCdma;
   type IVectorView_IMobileBroadbandCellCdma_Interface;
   type IVectorView_IMobileBroadbandCellCdma is access all IVectorView_IMobileBroadbandCellCdma_Interface'Class;
   type IVectorView_IMobileBroadbandCellCdma_Ptr is access all IVectorView_IMobileBroadbandCellCdma;
   type IIterator_IMobileBroadbandCellGsm_Interface;
   type IIterator_IMobileBroadbandCellGsm is access all IIterator_IMobileBroadbandCellGsm_Interface'Class;
   type IIterator_IMobileBroadbandCellGsm_Ptr is access all IIterator_IMobileBroadbandCellGsm;
   type IIterable_IMobileBroadbandCellGsm_Interface;
   type IIterable_IMobileBroadbandCellGsm is access all IIterable_IMobileBroadbandCellGsm_Interface'Class;
   type IIterable_IMobileBroadbandCellGsm_Ptr is access all IIterable_IMobileBroadbandCellGsm;
   type IVectorView_IMobileBroadbandCellGsm_Interface;
   type IVectorView_IMobileBroadbandCellGsm is access all IVectorView_IMobileBroadbandCellGsm_Interface'Class;
   type IVectorView_IMobileBroadbandCellGsm_Ptr is access all IVectorView_IMobileBroadbandCellGsm;
   type IIterator_IMobileBroadbandCellLte_Interface;
   type IIterator_IMobileBroadbandCellLte is access all IIterator_IMobileBroadbandCellLte_Interface'Class;
   type IIterator_IMobileBroadbandCellLte_Ptr is access all IIterator_IMobileBroadbandCellLte;
   type IIterable_IMobileBroadbandCellLte_Interface;
   type IIterable_IMobileBroadbandCellLte is access all IIterable_IMobileBroadbandCellLte_Interface'Class;
   type IIterable_IMobileBroadbandCellLte_Ptr is access all IIterable_IMobileBroadbandCellLte;
   type IVectorView_IMobileBroadbandCellLte_Interface;
   type IVectorView_IMobileBroadbandCellLte is access all IVectorView_IMobileBroadbandCellLte_Interface'Class;
   type IVectorView_IMobileBroadbandCellLte_Ptr is access all IVectorView_IMobileBroadbandCellLte;
   type IIterator_IMobileBroadbandCellTdscdma_Interface;
   type IIterator_IMobileBroadbandCellTdscdma is access all IIterator_IMobileBroadbandCellTdscdma_Interface'Class;
   type IIterator_IMobileBroadbandCellTdscdma_Ptr is access all IIterator_IMobileBroadbandCellTdscdma;
   type IIterable_IMobileBroadbandCellTdscdma_Interface;
   type IIterable_IMobileBroadbandCellTdscdma is access all IIterable_IMobileBroadbandCellTdscdma_Interface'Class;
   type IIterable_IMobileBroadbandCellTdscdma_Ptr is access all IIterable_IMobileBroadbandCellTdscdma;
   type IVectorView_IMobileBroadbandCellTdscdma_Interface;
   type IVectorView_IMobileBroadbandCellTdscdma is access all IVectorView_IMobileBroadbandCellTdscdma_Interface'Class;
   type IVectorView_IMobileBroadbandCellTdscdma_Ptr is access all IVectorView_IMobileBroadbandCellTdscdma;
   type IIterator_IMobileBroadbandCellUmts_Interface;
   type IIterator_IMobileBroadbandCellUmts is access all IIterator_IMobileBroadbandCellUmts_Interface'Class;
   type IIterator_IMobileBroadbandCellUmts_Ptr is access all IIterator_IMobileBroadbandCellUmts;
   type IIterable_IMobileBroadbandCellUmts_Interface;
   type IIterable_IMobileBroadbandCellUmts is access all IIterable_IMobileBroadbandCellUmts_Interface'Class;
   type IIterable_IMobileBroadbandCellUmts_Ptr is access all IIterable_IMobileBroadbandCellUmts;
   type IVectorView_IMobileBroadbandCellUmts_Interface;
   type IVectorView_IMobileBroadbandCellUmts is access all IVectorView_IMobileBroadbandCellUmts_Interface'Class;
   type IVectorView_IMobileBroadbandCellUmts_Ptr is access all IVectorView_IMobileBroadbandCellUmts;
   type IIterator_IMobileBroadbandAntennaSar_Interface;
   type IIterator_IMobileBroadbandAntennaSar is access all IIterator_IMobileBroadbandAntennaSar_Interface'Class;
   type IIterator_IMobileBroadbandAntennaSar_Ptr is access all IIterator_IMobileBroadbandAntennaSar;
   type IIterable_IMobileBroadbandAntennaSar_Interface;
   type IIterable_IMobileBroadbandAntennaSar is access all IIterable_IMobileBroadbandAntennaSar_Interface'Class;
   type IIterable_IMobileBroadbandAntennaSar_Ptr is access all IIterable_IMobileBroadbandAntennaSar;
   type IVectorView_IMobileBroadbandAntennaSar_Interface;
   type IVectorView_IMobileBroadbandAntennaSar is access all IVectorView_IMobileBroadbandAntennaSar_Interface'Class;
   type IVectorView_IMobileBroadbandAntennaSar_Ptr is access all IVectorView_IMobileBroadbandAntennaSar;
   type IAsyncOperation_IHotspotCredentialsAuthenticationResult_Interface;
   type IAsyncOperation_IHotspotCredentialsAuthenticationResult is access all IAsyncOperation_IHotspotCredentialsAuthenticationResult_Interface'Class;
   type IAsyncOperation_IHotspotCredentialsAuthenticationResult_Ptr is access all IAsyncOperation_IHotspotCredentialsAuthenticationResult;
   type IAsyncOperation_IProvisionFromXmlDocumentResults_Interface;
   type IAsyncOperation_IProvisionFromXmlDocumentResults is access all IAsyncOperation_IProvisionFromXmlDocumentResults_Interface'Class;
   type IAsyncOperation_IProvisionFromXmlDocumentResults_Ptr is access all IAsyncOperation_IProvisionFromXmlDocumentResults;
   type IAsyncOperation_IUssdReply_Interface;
   type IAsyncOperation_IUssdReply is access all IAsyncOperation_IUssdReply_Interface'Class;
   type IAsyncOperation_IUssdReply_Ptr is access all IAsyncOperation_IUssdReply;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAccountStatics : aliased constant Windows.IID := (2860469540, 44993, 20424, (174, 154, 169, 23, 83, 16, 250, 173 ));
   
   type IMobileBroadbandAccountStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AvailableNetworkAccountIds
   (
      This       : access IMobileBroadbandAccountStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNetworkAccountId
   (
      This       : access IMobileBroadbandAccountStatics_Interface
      ; networkAccountId : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandAccount
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAccount : aliased constant Windows.IID := (918703309, 52962, 17376, (166, 3, 238, 134, 163, 109, 101, 112 ));
   
   type IMobileBroadbandAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAccountId
   (
      This       : access IMobileBroadbandAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceProviderGuid
   (
      This       : access IMobileBroadbandAccount_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceProviderName
   (
      This       : access IMobileBroadbandAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentNetwork
   (
      This       : access IMobileBroadbandAccount_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentDeviceInformation
   (
      This       : access IMobileBroadbandAccount_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAccount2 : aliased constant Windows.IID := (955592476, 4406, 16983, (149, 159, 182, 88, 163, 82, 182, 212 ));
   
   type IMobileBroadbandAccount2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetConnectionProfiles
   (
      This       : access IMobileBroadbandAccount2_Interface
      ; RetVal : access Windows.Networking.Connectivity.IVectorView_IConnectionProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAccount3 : aliased constant Windows.IID := (153755169, 37753, 19355, (173, 49, 213, 254, 226, 247, 72, 198 ));
   
   type IMobileBroadbandAccount3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AccountExperienceUrl
   (
      This       : access IMobileBroadbandAccount3_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceInformation : aliased constant Windows.IID := (3872424296, 58241, 19566, (155, 232, 254, 21, 105, 105, 164, 70 ));
   
   type IMobileBroadbandDeviceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkDeviceStatus
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.NetworkDeviceStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Manufacturer
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Model
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FirmwareInformation
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CellularClass
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.Devices.Sms.CellularClass
   )
   return Windows.HRESULT is abstract;
   
   function get_DataClasses
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.DataClasses
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomDataClass
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MobileEquipmentId
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TelephoneNumbers
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SubscriberId
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SimIccId
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceType
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentRadioState
   (
      This       : access IMobileBroadbandDeviceInformation_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandRadioState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceInformation2 : aliased constant Windows.IID := (776370929, 63794, 18231, (167, 34, 3, 186, 114, 55, 12, 184 ));
   
   type IMobileBroadbandDeviceInformation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PinManager
   (
      This       : access IMobileBroadbandDeviceInformation2_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandPinManager
   )
   return Windows.HRESULT is abstract;
   
   function get_Revision
   (
      This       : access IMobileBroadbandDeviceInformation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SerialNumber
   (
      This       : access IMobileBroadbandDeviceInformation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceInformation3 : aliased constant Windows.IID := (3767252157, 23856, 19290, (146, 204, 213, 77, 248, 129, 212, 158 ));
   
   type IMobileBroadbandDeviceInformation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SimSpn
   (
      This       : access IMobileBroadbandDeviceInformation3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SimPnn
   (
      This       : access IMobileBroadbandDeviceInformation3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SimGid1
   (
      This       : access IMobileBroadbandDeviceInformation3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandNetwork : aliased constant Windows.IID := (3412300428, 777, 19638, (168, 193, 106, 90, 60, 142, 31, 246 ));
   
   type IMobileBroadbandNetwork_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAdapter
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkAdapter
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkRegistrationState
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.NetworkRegistrationState
   )
   return Windows.HRESULT is abstract;
   
   function get_RegistrationNetworkError
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PacketAttachNetworkError
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivationNetworkError
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessPointName
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RegisteredDataClass
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.DataClasses
   )
   return Windows.HRESULT is abstract;
   
   function get_RegisteredProviderId
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RegisteredProviderName
   (
      This       : access IMobileBroadbandNetwork_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ShowConnectionUI
   (
      This       : access IMobileBroadbandNetwork_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandNetwork2 : aliased constant Windows.IID := (1515576098, 25335, 19421, (186, 29, 71, 116, 65, 150, 11, 160 ));
   
   type IMobileBroadbandNetwork2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetVoiceCallSupportAsync
   (
      This       : access IMobileBroadbandNetwork2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RegistrationUiccApps
   (
      This       : access IMobileBroadbandNetwork2_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandUiccApp -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandNetwork3 : aliased constant Windows.IID := (862390922, 51183, 17484, (171, 108, 223, 126, 247, 163, 144, 254 ));
   
   type IMobileBroadbandNetwork3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCellsInfoAsync
   (
      This       : access IMobileBroadbandNetwork3_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandCellsInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringAccessPointConfiguration : aliased constant Windows.IID := (197919364, 16686, 16445, (172, 198, 183, 87, 227, 71, 116, 164 ));
   
   type INetworkOperatorTetheringAccessPointConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Ssid
   (
      This       : access INetworkOperatorTetheringAccessPointConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Ssid
   (
      This       : access INetworkOperatorTetheringAccessPointConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Passphrase
   (
      This       : access INetworkOperatorTetheringAccessPointConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Passphrase
   (
      This       : access INetworkOperatorTetheringAccessPointConfiguration_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringOperationResult : aliased constant Windows.IID := (3956409249, 442, 18285, (180, 179, 191, 61, 18, 200, 248, 12 ));
   
   type INetworkOperatorTetheringOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access INetworkOperatorTetheringOperationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.TetheringOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_AdditionalErrorMessage
   (
      This       : access INetworkOperatorTetheringOperationResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringManagerStatics : aliased constant Windows.IID := (1052555980, 63683, 16476, (153, 100, 112, 161, 238, 171, 225, 148 ));
   
   type INetworkOperatorTetheringManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTetheringCapability
   (
      This       : access INetworkOperatorTetheringManagerStatics_Interface
      ; networkAccountId : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.TetheringCapability
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNetworkAccountId
   (
      This       : access INetworkOperatorTetheringManagerStatics_Interface
      ; networkAccountId : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringManagerStatics2 : aliased constant Windows.IID := (1529041938, 13808, 18919, (155, 8, 22, 210, 120, 251, 170, 66 ));
   
   type INetworkOperatorTetheringManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTetheringCapabilityFromConnectionProfile
   (
      This       : access INetworkOperatorTetheringManagerStatics2_Interface
      ; profile : Windows.Networking.Connectivity.IConnectionProfile
      ; RetVal : access Windows.Networking.NetworkOperators.TetheringCapability
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromConnectionProfile
   (
      This       : access INetworkOperatorTetheringManagerStatics2_Interface
      ; profile : Windows.Networking.Connectivity.IConnectionProfile
      ; RetVal : access Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringManagerStatics3 : aliased constant Windows.IID := (2413473206, 19193, 20257, (155, 88, 213, 62, 159, 36, 35, 30 ));
   
   type INetworkOperatorTetheringManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromConnectionProfileWithTargetAdapter
   (
      This       : access INetworkOperatorTetheringManagerStatics3_Interface
      ; profile : Windows.Networking.Connectivity.IConnectionProfile
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
      ; RetVal : access Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringManager : aliased constant Windows.IID := (3562704288, 3718, 19864, (139, 164, 221, 112, 212, 183, 100, 211 ));
   
   type INetworkOperatorTetheringManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxClientCount
   (
      This       : access INetworkOperatorTetheringManager_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientCount
   (
      This       : access INetworkOperatorTetheringManager_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TetheringOperationalState
   (
      This       : access INetworkOperatorTetheringManager_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.TetheringOperationalState
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentAccessPointConfiguration
   (
      This       : access INetworkOperatorTetheringManager_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureAccessPointAsync
   (
      This       : access INetworkOperatorTetheringManager_Interface
      ; configuration : Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StartTetheringAsync
   (
      This       : access INetworkOperatorTetheringManager_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_INetworkOperatorTetheringOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StopTetheringAsync
   (
      This       : access INetworkOperatorTetheringManager_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_INetworkOperatorTetheringOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringClient : aliased constant Windows.IID := (1889346892, 22879, 18503, (187, 48, 100, 105, 53, 84, 41, 24 ));
   
   type INetworkOperatorTetheringClient_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MacAddress
   (
      This       : access INetworkOperatorTetheringClient_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HostNames
   (
      This       : access INetworkOperatorTetheringClient_Interface
      ; RetVal : access Windows.Networking.IVectorView_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringClientManager : aliased constant Windows.IID := (2444312598, 36298, 16933, (187, 237, 238, 248, 184, 215, 24, 215 ));
   
   type INetworkOperatorTetheringClientManager_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTetheringClients
   (
      This       : access INetworkOperatorTetheringClientManager_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_INetworkOperatorTetheringClient -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAccountEventArgs : aliased constant Windows.IID := (945014912, 30686, 19460, (190, 173, 161, 35, 176, 140, 159, 89 ));
   
   type IMobileBroadbandAccountEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAccountId
   (
      This       : access IMobileBroadbandAccountEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAccountUpdatedEventArgs : aliased constant Windows.IID := (2076384648, 42685, 18913, (128, 171, 107, 145, 53, 74, 87, 212 ));
   
   type IMobileBroadbandAccountUpdatedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAccountId
   (
      This       : access IMobileBroadbandAccountUpdatedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasDeviceInformationChanged
   (
      This       : access IMobileBroadbandAccountUpdatedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNetworkChanged
   (
      This       : access IMobileBroadbandAccountUpdatedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAccountWatcher : aliased constant Windows.IID := (1811100510, 9141, 17567, (146, 141, 94, 13, 62, 4, 71, 29 ));
   
   type IMobileBroadbandAccountWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AccountAdded
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; handler : TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccountAdded
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AccountUpdated
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; handler : TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccountUpdated
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AccountRemoved
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; handler : TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AccountRemoved
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; handler : TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; handler : TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandAccountWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IMobileBroadbandAccountWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandModemStatics : aliased constant Windows.IID := (4187936311, 55025, 19064, (140, 188, 100, 33, 166, 80, 99, 200 ));
   
   type IMobileBroadbandModemStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IMobileBroadbandModemStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromId
   (
      This       : access IMobileBroadbandModemStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandModem
   )
   return Windows.HRESULT is abstract;
   
   function GetDefault
   (
      This       : access IMobileBroadbandModemStatics_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandModem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandModemConfiguration : aliased constant Windows.IID := (4242552227, 54989, 17184, (185, 130, 190, 157, 62, 199, 137, 15 ));
   
   type IMobileBroadbandModemConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uicc
   (
      This       : access IMobileBroadbandModemConfiguration_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandUicc
   )
   return Windows.HRESULT is abstract;
   
   function get_HomeProviderId
   (
      This       : access IMobileBroadbandModemConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HomeProviderName
   (
      This       : access IMobileBroadbandModemConfiguration_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandModemConfiguration2 : aliased constant Windows.IID := (839906757, 58464, 17070, (170, 81, 105, 98, 30, 122, 68, 119 ));
   
   type IMobileBroadbandModemConfiguration2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SarManager
   (
      This       : access IMobileBroadbandModemConfiguration2_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandSarManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandModem : aliased constant Windows.IID := (3493161234, 59897, 20327, (160, 61, 67, 24, 154, 49, 107, 241 ));
   
   type IMobileBroadbandModem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentAccount
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceInformation
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxDeviceServiceCommandSizeInBytes
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxDeviceServiceDataSizeInBytes
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceServices
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandDeviceServiceInformation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceService
   (
      This       : access IMobileBroadbandModem_Interface
      ; deviceServiceId : Windows.Guid
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function get_IsResetSupported
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ResetAsync
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentConfigurationAsync
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandModemConfiguration -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentNetwork
   (
      This       : access IMobileBroadbandModem_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandModem2 : aliased constant Windows.IID := (310782760, 47595, 20194, (187, 227, 113, 31, 83, 238, 163, 115 ));
   
   type IMobileBroadbandModem2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetIsPassthroughEnabledAsync
   (
      This       : access IMobileBroadbandModem2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetIsPassthroughEnabledAsync
   (
      This       : access IMobileBroadbandModem2_Interface
      ; value : Windows.Boolean
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_MobileBroadbandModemStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandPinManager : aliased constant Windows.IID := (2203483869, 28191, 19355, (164, 19, 43, 31, 80, 204, 54, 223 ));
   
   type IMobileBroadbandPinManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedPins
   (
      This       : access IMobileBroadbandPinManager_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_MobileBroadbandPinType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetPin
   (
      This       : access IMobileBroadbandPinManager_Interface
      ; pinType : Windows.Networking.NetworkOperators.MobileBroadbandPinType
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandPin
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandPinOperationResult : aliased constant Windows.IID := (299752498, 12775, 18933, (182, 99, 18, 61, 59, 239, 3, 98 ));
   
   type IMobileBroadbandPinOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSuccessful
   (
      This       : access IMobileBroadbandPinOperationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AttemptsRemaining
   (
      This       : access IMobileBroadbandPinOperationResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandPin : aliased constant Windows.IID := (3865171721, 59257, 17855, (130, 129, 117, 50, 61, 249, 227, 33 ));
   
   type IMobileBroadbandPin_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IMobileBroadbandPin_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandPinType
   )
   return Windows.HRESULT is abstract;
   
   function get_LockState
   (
      This       : access IMobileBroadbandPin_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandPinLockState
   )
   return Windows.HRESULT is abstract;
   
   function get_Format
   (
      This       : access IMobileBroadbandPin_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandPinFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Enabled
   (
      This       : access IMobileBroadbandPin_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxLength
   (
      This       : access IMobileBroadbandPin_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MinLength
   (
      This       : access IMobileBroadbandPin_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_AttemptsRemaining
   (
      This       : access IMobileBroadbandPin_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function EnableAsync
   (
      This       : access IMobileBroadbandPin_Interface
      ; currentPin : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DisableAsync
   (
      This       : access IMobileBroadbandPin_Interface
      ; currentPin : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function EnterAsync
   (
      This       : access IMobileBroadbandPin_Interface
      ; currentPin : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ChangeAsync
   (
      This       : access IMobileBroadbandPin_Interface
      ; currentPin : Windows.String
      ; newPin : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnblockAsync
   (
      This       : access IMobileBroadbandPin_Interface
      ; pinUnblockKey : Windows.String
      ; newPin : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceServiceInformation : aliased constant Windows.IID := (1406573403, 50413, 17904, (128, 58, 217, 65, 122, 109, 152, 70 ));
   
   type IMobileBroadbandDeviceServiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceServiceId
   (
      This       : access IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDataReadSupported
   (
      This       : access IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDataWriteSupported
   (
      This       : access IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceService : aliased constant Windows.IID := (582883922, 48512, 16556, (142, 31, 46, 7, 131, 106, 61, 189 ));
   
   type IMobileBroadbandDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceServiceId
   (
      This       : access IMobileBroadbandDeviceService_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedCommands
   (
      This       : access IMobileBroadbandDeviceService_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenDataSession
   (
      This       : access IMobileBroadbandDeviceService_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession
   )
   return Windows.HRESULT is abstract;
   
   function OpenCommandSession
   (
      This       : access IMobileBroadbandDeviceService_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceServiceDataReceivedEventArgs : aliased constant Windows.IID := (3064599518, 4992, 16611, (134, 24, 115, 203, 202, 72, 19, 140 ));
   
   type IMobileBroadbandDeviceServiceDataReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ReceivedData
   (
      This       : access IMobileBroadbandDeviceServiceDataReceivedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceServiceDataSession : aliased constant Windows.IID := (3671466803, 35791, 17033, (138, 55, 4, 92, 33, 105, 72, 106 ));
   
   type IMobileBroadbandDeviceServiceDataSession_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteDataAsync
   (
      This       : access IMobileBroadbandDeviceServiceDataSession_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function CloseSession
   (
      This       : access IMobileBroadbandDeviceServiceDataSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_DataReceived
   (
      This       : access IMobileBroadbandDeviceServiceDataSession_Interface
      ; eventHandler : TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DataReceived
   (
      This       : access IMobileBroadbandDeviceServiceDataSession_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceServiceCommandResult : aliased constant Windows.IID := (2968808123, 38102, 17593, (165, 56, 240, 129, 11, 100, 83, 137 ));
   
   type IMobileBroadbandDeviceServiceCommandResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StatusCode
   (
      This       : access IMobileBroadbandDeviceServiceCommandResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseData
   (
      This       : access IMobileBroadbandDeviceServiceCommandResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceServiceCommandSession : aliased constant Windows.IID := (4228483653, 37179, 18708, (182, 195, 174, 99, 4, 89, 62, 117 ));
   
   type IMobileBroadbandDeviceServiceCommandSession_Interface is interface and Windows.IInspectable_Interface;
   
   function SendQueryCommandAsync
   (
      This       : access IMobileBroadbandDeviceServiceCommandSession_Interface
      ; commandId : Windows.UInt32
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendSetCommandAsync
   (
      This       : access IMobileBroadbandDeviceServiceCommandSession_Interface
      ; commandId : Windows.UInt32
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CloseSession
   (
      This       : access IMobileBroadbandDeviceServiceCommandSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandUiccAppsResult : aliased constant Windows.IID := (1950953707, 33111, 19009, (132, 148, 107, 245, 76, 155, 29, 43 ));
   
   type IMobileBroadbandUiccAppsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IMobileBroadbandUiccAppsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandUiccAppOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_UiccApps
   (
      This       : access IMobileBroadbandUiccAppsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandUiccApp -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandUicc : aliased constant Windows.IID := (3862230673, 21082, 19682, (143, 206, 170, 65, 98, 87, 145, 84 ));
   
   type IMobileBroadbandUicc_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SimIccId
   (
      This       : access IMobileBroadbandUicc_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetUiccAppsAsync
   (
      This       : access IMobileBroadbandUicc_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandUiccAppRecordDetailsResult : aliased constant Windows.IID := (3642320943, 48660, 18740, (152, 29, 47, 87, 185, 237, 131, 230 ));
   
   type IMobileBroadbandUiccAppRecordDetailsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandUiccAppOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.UiccAppRecordKind
   )
   return Windows.HRESULT is abstract;
   
   function get_RecordCount
   (
      This       : access IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_RecordSize
   (
      This       : access IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadAccessCondition
   (
      This       : access IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.UiccAccessCondition
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteAccessCondition
   (
      This       : access IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.UiccAccessCondition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandUiccAppReadRecordResult : aliased constant Windows.IID := (1690915461, 13710, 18373, (130, 73, 105, 95, 56, 59, 43, 219 ));
   
   type IMobileBroadbandUiccAppReadRecordResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IMobileBroadbandUiccAppReadRecordResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandUiccAppOperationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IMobileBroadbandUiccAppReadRecordResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandUiccApp : aliased constant Windows.IID := (1293354326, 39073, 17373, (178, 236, 80, 201, 12, 242, 72, 223 ));
   
   type IMobileBroadbandUiccApp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IMobileBroadbandUiccApp_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IMobileBroadbandUiccApp_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.UiccAppKind
   )
   return Windows.HRESULT is abstract;
   
   function GetRecordDetailsAsync
   (
      This       : access IMobileBroadbandUiccApp_Interface
      ; uiccFilePath : Windows.Foundation.Collections.IIterable_UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadRecordAsync
   (
      This       : access IMobileBroadbandUiccApp_Interface
      ; uiccFilePath : Windows.Foundation.Collections.IIterable_UInt32
      ; recordIndex : Windows.Int32
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandNetworkRegistrationStateChange : aliased constant Windows.IID := (3199177953, 38415, 18868, (160, 141, 125, 133, 233, 104, 199, 236 ));
   
   type IMobileBroadbandNetworkRegistrationStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Network
   (
      This       : access IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails : aliased constant Windows.IID := (2299747583, 10424, 18090, (177, 55, 28, 75, 15, 33, 237, 254 ));
   
   type IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkRegistrationStateChanges
   (
      This       : access IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandNetworkRegistrationStateChange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandRadioStateChange : aliased constant Windows.IID := (2958337377, 38963, 19181, (151, 23, 67, 72, 178, 26, 36, 179 ));
   
   type IMobileBroadbandRadioStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IMobileBroadbandRadioStateChange_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RadioState
   (
      This       : access IMobileBroadbandRadioStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandRadioState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandRadioStateChangeTriggerDetails : aliased constant Windows.IID := (1898977998, 2364, 17094, (176, 219, 173, 31, 117, 166, 84, 69 ));
   
   type IMobileBroadbandRadioStateChangeTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RadioStateChanges
   (
      This       : access IMobileBroadbandRadioStateChangeTriggerDetails_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandRadioStateChange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandPinLockStateChange : aliased constant Windows.IID := (3189139262, 7940, 20373, (139, 144, 231, 245, 89, 221, 231, 229 ));
   
   type IMobileBroadbandPinLockStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PinType
   (
      This       : access IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandPinType
   )
   return Windows.HRESULT is abstract;
   
   function get_PinLockState
   (
      This       : access IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandPinLockState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandPinLockStateChangeTriggerDetails : aliased constant Windows.IID := (3543711889, 16017, 19768, (144, 54, 174, 232, 58, 110, 121, 173 ));
   
   type IMobileBroadbandPinLockStateChangeTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PinLockStateChanges
   (
      This       : access IMobileBroadbandPinLockStateChangeTriggerDetails_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandPinLockStateChange -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandDeviceServiceTriggerDetails : aliased constant Windows.IID := (1241865072, 47534, 17496, (146, 65, 166, 165, 251, 241, 138, 12 ));
   
   type IMobileBroadbandDeviceServiceTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IMobileBroadbandDeviceServiceTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceServiceId
   (
      This       : access IMobileBroadbandDeviceServiceTriggerDetails_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ReceivedData
   (
      This       : access IMobileBroadbandDeviceServiceTriggerDetails_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownCSimFilePathsStatics : aliased constant Windows.IID := (3025710829, 18929, 19490, (176, 115, 150, 213, 17, 191, 156, 53 ));
   
   type IKnownCSimFilePathsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EFSpn
   (
      This       : access IKnownCSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid1
   (
      This       : access IKnownCSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid2
   (
      This       : access IKnownCSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownRuimFilePathsStatics : aliased constant Windows.IID := (948160697, 65316, 17777, (168, 103, 9, 249, 96, 66, 110, 20 ));
   
   type IKnownRuimFilePathsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EFSpn
   (
      This       : access IKnownRuimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid1
   (
      This       : access IKnownRuimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid2
   (
      This       : access IKnownRuimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownSimFilePathsStatics : aliased constant Windows.IID := (2160925283, 14245, 17363, (128, 163, 204, 210, 62, 143, 236, 238 ));
   
   type IKnownSimFilePathsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EFOns
   (
      This       : access IKnownSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_EFSpn
   (
      This       : access IKnownSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid1
   (
      This       : access IKnownSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid2
   (
      This       : access IKnownSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownUSimFilePathsStatics : aliased constant Windows.IID := (2083841409, 7963, 17396, (149, 48, 139, 9, 45, 50, 215, 31 ));
   
   type IKnownUSimFilePathsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EFSpn
   (
      This       : access IKnownUSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_EFOpl
   (
      This       : access IKnownUSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_EFPnn
   (
      This       : access IKnownUSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid1
   (
      This       : access IKnownUSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Gid2
   (
      This       : access IKnownUSimFilePathsStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandCellCdma : aliased constant Windows.IID := (100774836, 16666, 20270, (130, 135, 118, 245, 101, 12, 96, 205 ));
   
   type IMobileBroadbandCellCdma_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BaseStationId
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseStationPNCode
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseStationLatitude
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseStationLongitude
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BaseStationLastBroadcastGpsTime
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkId
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PilotSignalStrengthInDB
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemId
   (
      This       : access IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandCellGsm : aliased constant Windows.IID := (3432087302, 32480, 18360, (158, 31, 195, 180, 141, 249, 223, 91 ));
   
   type IMobileBroadbandCellGsm_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BaseStationId
   (
      This       : access IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CellId
   (
      This       : access IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelNumber
   (
      This       : access IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationAreaCode
   (
      This       : access IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderId
   (
      This       : access IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReceivedSignalStrengthInDBm
   (
      This       : access IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TimingAdvanceInBitPeriods
   (
      This       : access IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandCellLte : aliased constant Windows.IID := (2442643579, 11128, 17773, (139, 83, 170, 162, 93, 10, 247, 65 ));
   
   type IMobileBroadbandCellLte_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CellId
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelNumber
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalCellId
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderId
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReferenceSignalReceivedPowerInDBm
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ReferenceSignalReceivedQualityInDBm
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TimingAdvanceInBitPeriods
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TrackingAreaCode
   (
      This       : access IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandCellTdscdma : aliased constant Windows.IID := (249173589, 56078, 16770, (140, 218, 204, 65, 154, 123, 222, 8 ));
   
   type IMobileBroadbandCellTdscdma_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CellId
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CellParameterId
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelNumber
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationAreaCode
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PathLossInDB
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderId
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReceivedSignalCodePowerInDBm
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TimingAdvanceInBitPeriods
   (
      This       : access IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandCellUmts : aliased constant Windows.IID := (2008331694, 18888, 20245, (178, 133, 76, 38, 167, 246, 114, 21 ));
   
   type IMobileBroadbandCellUmts_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CellId
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ChannelNumber
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationAreaCode
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PathLossInDB
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryScramblingCode
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Foundation.IReference_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderId
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ReceivedSignalCodePowerInDBm
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SignalToNoiseRatioInDB
   (
      This       : access IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Foundation.IReference_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandCellsInfo : aliased constant Windows.IID := (2309576234, 58482, 19877, (146, 156, 222, 97, 113, 29, 210, 97 ));
   
   type IMobileBroadbandCellsInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NeighboringCellsCdma
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellCdma -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NeighboringCellsGsm
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellGsm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NeighboringCellsLte
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellLte -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NeighboringCellsTdscdma
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellTdscdma -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NeighboringCellsUmts
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellUmts -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServingCellsCdma
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellCdma -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServingCellsGsm
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellGsm -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServingCellsLte
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellLte -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServingCellsTdscdma
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellTdscdma -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ServingCellsUmts
   (
      This       : access IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandCellUmts -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandAntennaSar : aliased constant Windows.IID := (3115273086, 52217, 16649, (144, 190, 92, 6, 191, 213, 19, 182 ));
   
   type IMobileBroadbandAntennaSar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AntennaIndex
   (
      This       : access IMobileBroadbandAntennaSar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SarBackoffIndex
   (
      This       : access IMobileBroadbandAntennaSar_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandSarManager : aliased constant Windows.IID := (3853674547, 38526, 16585, (164, 133, 25, 192, 221, 32, 158, 34 ));
   
   type IMobileBroadbandSarManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsBackoffEnabled
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsWiFiHardwareIntegrated
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSarControlledByHardware
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Antennas
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IVectorView_IMobileBroadbandAntennaSar -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HysteresisTimerPeriod
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function add_TransmissionStateChanged
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; handler : TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TransmissionStateChanged
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function EnableBackoffAsync
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DisableBackoffAsync
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetConfigurationAsync
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; antennas : Windows.Networking.NetworkOperators.IIterable_IMobileBroadbandAntennaSar
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RevertSarToHardwareControlAsync
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SetTransmissionStateChangedHysteresisAsync
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; timerPeriod : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetIsTransmittingAsync
   (
      This       : access IMobileBroadbandSarManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StartTransmissionStateMonitoring
   (
      This       : access IMobileBroadbandSarManager_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StopTransmissionStateMonitoring
   (
      This       : access IMobileBroadbandSarManager_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMobileBroadbandTransmissionStateChangedEventArgs : aliased constant Windows.IID := (1630419061, 1034, 20377, (164, 249, 97, 215, 195, 45, 161, 41 ));
   
   type IMobileBroadbandTransmissionStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTransmitting
   (
      This       : access IMobileBroadbandTransmissionStateChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHotspotAuthenticationEventDetails : aliased constant Windows.IID := (3881224081, 4097, 19941, (131, 199, 222, 97, 216, 136, 49, 208 ));
   
   type IHotspotAuthenticationEventDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EventToken
   (
      This       : access IHotspotAuthenticationEventDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHotspotAuthenticationContextStatics : aliased constant Windows.IID := (3881224081, 4098, 19941, (131, 199, 222, 97, 216, 136, 49, 208 ));
   
   type IHotspotAuthenticationContextStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryGetAuthenticationContext
   (
      This       : access IHotspotAuthenticationContextStatics_Interface
      ; evenToken : Windows.String
      ; context : access Windows.Networking.NetworkOperators.IHotspotAuthenticationContext
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHotspotAuthenticationContext : aliased constant Windows.IID := (3881224081, 4099, 19941, (131, 199, 222, 97, 216, 136, 49, 208 ));
   
   type IHotspotAuthenticationContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WirelessNetworkId
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkAdapter
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkAdapter
   )
   return Windows.HRESULT is abstract;
   
   function get_RedirectMessageUrl
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_RedirectMessageXml
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationUrl
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function IssueCredentials
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; userName : Windows.String
      ; password : Windows.String
      ; extraParameters : Windows.String
      ; markAsManualConnectOnFailure : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function AbortAuthentication
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; markAsManual : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SkipAuthentication
   (
      This       : access IHotspotAuthenticationContext_Interface
   )
   return Windows.HRESULT is abstract;
   
   function TriggerAttentionRequired
   (
      This       : access IHotspotAuthenticationContext_Interface
      ; packageRelativeApplicationId : Windows.String
      ; applicationParameters : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHotspotCredentialsAuthenticationResult : aliased constant Windows.IID := (3881224081, 4101, 19941, (131, 199, 222, 97, 216, 136, 49, 208 ));
   
   type IHotspotCredentialsAuthenticationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasNetworkErrorOccurred
   (
      This       : access IHotspotCredentialsAuthenticationResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseCode
   (
      This       : access IHotspotCredentialsAuthenticationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.HotspotAuthenticationResponseCode
   )
   return Windows.HRESULT is abstract;
   
   function get_LogoffUrl
   (
      This       : access IHotspotCredentialsAuthenticationResult_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationReplyXml
   (
      This       : access IHotspotCredentialsAuthenticationResult_Interface
      ; RetVal : access Windows.Data.Xml.Dom.IXmlDocument
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHotspotAuthenticationContext2 : aliased constant Windows.IID := (3881224081, 4100, 19941, (131, 199, 222, 97, 216, 136, 49, 208 ));
   
   type IHotspotAuthenticationContext2_Interface is interface and Windows.IInspectable_Interface;
   
   function IssueCredentialsAsync
   (
      This       : access IHotspotAuthenticationContext2_Interface
      ; userName : Windows.String
      ; password : Windows.String
      ; extraParameters : Windows.String
      ; markAsManualConnectOnFailure : Windows.Boolean
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IHotspotCredentialsAuthenticationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProvisionFromXmlDocumentResults : aliased constant Windows.IID := (561447136, 33283, 4575, (173, 185, 244, 206, 70, 45, 145, 55 ));
   
   type IProvisionFromXmlDocumentResults_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllElementsProvisioned
   (
      This       : access IProvisionFromXmlDocumentResults_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ProvisionResultsXml
   (
      This       : access IProvisionFromXmlDocumentResults_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProvisionedProfile : aliased constant Windows.IID := (561447136, 33282, 4575, (173, 185, 244, 206, 70, 45, 145, 55 ));
   
   type IProvisionedProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function UpdateCost
   (
      This       : access IProvisionedProfile_Interface
      ; value : Windows.Networking.Connectivity.NetworkCostType
   )
   return Windows.HRESULT is abstract;
   
   function UpdateUsage
   (
      This       : access IProvisionedProfile_Interface
      ; value : Windows.Networking.NetworkOperators.ProfileUsage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProvisioningAgent : aliased constant Windows.IID := (561447136, 33281, 4575, (173, 185, 244, 206, 70, 45, 145, 55 ));
   
   type IProvisioningAgent_Interface is interface and Windows.IInspectable_Interface;
   
   function ProvisionFromXmlDocumentAsync
   (
      This       : access IProvisioningAgent_Interface
      ; provisioningXmlDocument : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IProvisionFromXmlDocumentResults -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetProvisionedProfile
   (
      This       : access IProvisioningAgent_Interface
      ; mediaType : Windows.Networking.NetworkOperators.ProfileMediaType
      ; profileName : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IProvisionedProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProvisioningAgentStaticMethods : aliased constant Windows.IID := (561447136, 33025, 4575, (173, 185, 244, 206, 70, 45, 145, 55 ));
   
   type IProvisioningAgentStaticMethods_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromNetworkAccountId
   (
      This       : access IProvisioningAgentStaticMethods_Interface
      ; networkAccountId : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IProvisioningAgent
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUssdMessage : aliased constant Windows.IID := (798674818, 8196, 19805, (191, 129, 42, 186, 27, 75, 228, 168 ));
   
   type IUssdMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataCodingScheme
   (
      This       : access IUssdMessage_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_DataCodingScheme
   (
      This       : access IUssdMessage_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function GetPayload
   (
      This       : access IUssdMessage_Interface
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   function SetPayload
   (
      This       : access IUssdMessage_Interface
      ; value : Windows.UInt8_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function get_PayloadAsText
   (
      This       : access IUssdMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PayloadAsText
   (
      This       : access IUssdMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUssdMessageFactory : aliased constant Windows.IID := (798674818, 4099, 19805, (191, 129, 42, 186, 27, 75, 228, 168 ));
   
   type IUssdMessageFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMessage
   (
      This       : access IUssdMessageFactory_Interface
      ; messageText : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IUssdMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUssdReply : aliased constant Windows.IID := (798674818, 8197, 19805, (191, 129, 42, 186, 27, 75, 228, 168 ));
   
   type IUssdReply_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ResultCode
   (
      This       : access IUssdReply_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.UssdResultCode
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IUssdReply_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IUssdMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUssdSession : aliased constant Windows.IID := (798674818, 8194, 19805, (191, 129, 42, 186, 27, 75, 228, 168 ));
   
   type IUssdSession_Interface is interface and Windows.IInspectable_Interface;
   
   function SendMessageAndGetReplyAsync
   (
      This       : access IUssdSession_Interface
      ; message : Windows.Networking.NetworkOperators.IUssdMessage
      ; RetVal : access Windows.Networking.NetworkOperators.IAsyncOperation_IUssdReply -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IUssdSession_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IUssdSessionStatics : aliased constant Windows.IID := (798674818, 4097, 19805, (191, 129, 42, 186, 27, 75, 228, 168 ));
   
   type IUssdSessionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromNetworkAccountId
   (
      This       : access IUssdSessionStatics_Interface
      ; networkAccountId : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IUssdSession
   )
   return Windows.HRESULT is abstract;
   
   function CreateFromNetworkInterfaceId
   (
      This       : access IUssdSessionStatics_Interface
      ; networkInterfaceId : Windows.String
      ; RetVal : access Windows.Networking.NetworkOperators.IUssdSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorNotificationEventDetails : aliased constant Windows.IID := (3160975825, 33505, 17544, (159, 44, 18, 118, 194, 70, 143, 172 ));
   
   type INetworkOperatorNotificationEventDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NotificationType
   (
      This       : access INetworkOperatorNotificationEventDetails_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.NetworkOperatorEventMessageType
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkAccountId
   (
      This       : access INetworkOperatorNotificationEventDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EncodingType
   (
      This       : access INetworkOperatorNotificationEventDetails_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access INetworkOperatorNotificationEventDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RuleId
   (
      This       : access INetworkOperatorNotificationEventDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SmsMessage
   (
      This       : access INetworkOperatorNotificationEventDetails_Interface
      ; RetVal : access Windows.Devices.Sms.ISmsMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkOperatorTetheringEntitlementCheck : aliased constant Windows.IID := (17338733, 40602, 19190, (141, 163, 96, 73, 59, 25, 194, 4 ));
   
   type INetworkOperatorTetheringEntitlementCheck_Interface is interface and Windows.IInspectable_Interface;
   
   function AuthorizeTethering
   (
      This       : access INetworkOperatorTetheringEntitlementCheck_Interface
      ; allow : Windows.Boolean
      ; entitlementFailureReason : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFdnAccessManagerStatics : aliased constant Windows.IID := (4071244693, 61926, 17177, (170, 62, 71, 124, 166, 75, 43, 223 ));
   
   type IFdnAccessManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestUnlockAsync
   (
      This       : access IFdnAccessManagerStatics_Interface
      ; contactListId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandUiccApp : aliased constant Windows.IID := (1269958255, 7029, 22479, (167, 34, 30, 88, 191, 197, 174, 80 ));
   
   type IIterator_IMobileBroadbandUiccApp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandUiccApp_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandUiccApp_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandUiccApp_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandUiccApp_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandUiccApp : aliased constant Windows.IID := (2941485332, 48404, 21424, (177, 209, 132, 29, 202, 164, 81, 173 ));
   
   type IIterable_IMobileBroadbandUiccApp_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandUiccApp_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandUiccApp
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandUiccApp : aliased constant Windows.IID := (3521331699, 20022, 22725, (146, 191, 221, 51, 9, 46, 57, 12 ));
   
   type IVectorView_IMobileBroadbandUiccApp_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandUiccApp_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandUiccApp_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandUiccApp_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandUiccApp_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMobileBroadbandCellsInfo : aliased constant Windows.IID := (3121676754, 29209, 21537, (160, 135, 76, 197, 241, 242, 95, 196 ));
   
   type IAsyncOperation_IMobileBroadbandCellsInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandCellsInfo_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMobileBroadbandCellsInfo_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_INetworkOperatorTetheringOperationResult : aliased constant Windows.IID := (1612394733, 39807, 21686, (182, 27, 36, 160, 155, 197, 99, 4 ));
   
   type IAsyncOperation_INetworkOperatorTetheringOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_INetworkOperatorTetheringOperationResult_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_INetworkOperatorTetheringOperationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_INetworkOperatorTetheringOperationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_INetworkOperatorTetheringClient : aliased constant Windows.IID := (1448333413, 50952, 21313, (188, 5, 211, 185, 206, 205, 42, 199 ));
   
   type IIterator_INetworkOperatorTetheringClient_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_INetworkOperatorTetheringClient_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_INetworkOperatorTetheringClient_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_INetworkOperatorTetheringClient_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_INetworkOperatorTetheringClient_Interface
      ; items : Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_INetworkOperatorTetheringClient : aliased constant Windows.IID := (1197665459, 44872, 23395, (137, 183, 120, 164, 32, 86, 84, 159 ));
   
   type IIterable_INetworkOperatorTetheringClient_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_INetworkOperatorTetheringClient_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_INetworkOperatorTetheringClient
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_INetworkOperatorTetheringClient : aliased constant Windows.IID := (3793577879, 20214, 21823, (183, 249, 94, 215, 75, 206, 189, 126 ));
   
   type IVectorView_INetworkOperatorTetheringClient_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_INetworkOperatorTetheringClient_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_INetworkOperatorTetheringClient_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_INetworkOperatorTetheringClient_Interface
      ; value : Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_INetworkOperatorTetheringClient_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandDeviceServiceInformation : aliased constant Windows.IID := (3637999350, 18066, 21601, (145, 85, 129, 110, 99, 186, 200, 116 ));
   
   type IIterator_IMobileBroadbandDeviceServiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandDeviceServiceInformation_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandDeviceServiceInformation : aliased constant Windows.IID := (2287016021, 28646, 22164, (131, 167, 153, 30, 41, 3, 61, 229 ));
   
   type IIterable_IMobileBroadbandDeviceServiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandDeviceServiceInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandDeviceServiceInformation : aliased constant Windows.IID := (2896686612, 16714, 20636, (157, 99, 54, 30, 102, 49, 252, 132 ));
   
   type IVectorView_IMobileBroadbandDeviceServiceInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandDeviceServiceInformation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandDeviceServiceInformation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandDeviceServiceInformation_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandDeviceServiceInformation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMobileBroadbandModemConfiguration : aliased constant Windows.IID := (3451781123, 55978, 23689, (146, 230, 164, 127, 252, 36, 24, 162 ));
   
   type IAsyncOperation_IMobileBroadbandModemConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandModemConfiguration_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandModemConfiguration_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMobileBroadbandModemConfiguration_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_MobileBroadbandModemStatus : aliased constant Windows.IID := (2869765547, 26829, 21675, (177, 156, 98, 71, 17, 101, 157, 61 ));
   
   type IAsyncOperation_MobileBroadbandModemStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_MobileBroadbandModemStatus_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_MobileBroadbandModemStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_MobileBroadbandModemStatus_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_MobileBroadbandModemStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_MobileBroadbandModemStatus_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandModemStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_MobileBroadbandPinType : aliased constant Windows.IID := (602918668, 8078, 23513, (139, 87, 240, 133, 1, 33, 32, 28 ));
   
   type IIterator_MobileBroadbandPinType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_MobileBroadbandPinType_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandPinType
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_MobileBroadbandPinType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_MobileBroadbandPinType_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_MobileBroadbandPinType_Interface
      ; items : Windows.Networking.NetworkOperators.MobileBroadbandPinType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_MobileBroadbandPinType : aliased constant Windows.IID := (2639622765, 33086, 20731, (148, 152, 135, 170, 135, 45, 214, 202 ));
   
   type IIterable_MobileBroadbandPinType_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_MobileBroadbandPinType_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_MobileBroadbandPinType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_MobileBroadbandPinType : aliased constant Windows.IID := (859393043, 652, 21822, (134, 123, 60, 124, 33, 182, 242, 45 ));
   
   type IVectorView_MobileBroadbandPinType_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_MobileBroadbandPinType_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.MobileBroadbandPinType
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_MobileBroadbandPinType_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_MobileBroadbandPinType_Interface
      ; value : Windows.Networking.NetworkOperators.MobileBroadbandPinType
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_MobileBroadbandPinType_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.MobileBroadbandPinType_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMobileBroadbandPinOperationResult : aliased constant Windows.IID := (796288540, 12148, 23778, (153, 249, 71, 209, 163, 161, 54, 51 ));
   
   type IAsyncOperation_IMobileBroadbandPinOperationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandPinOperationResult_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandPinOperationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMobileBroadbandPinOperationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult : aliased constant Windows.IID := (744962728, 27189, 20733, (148, 34, 54, 21, 161, 194, 140, 203 ));
   
   type IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMobileBroadbandUiccAppsResult : aliased constant Windows.IID := (3474778495, 6785, 23782, (138, 213, 85, 255, 139, 14, 141, 27 ));
   
   type IAsyncOperation_IMobileBroadbandUiccAppsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppsResult_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult : aliased constant Windows.IID := (125105318, 48574, 23039, (170, 28, 166, 46, 60, 111, 157, 55 ));
   
   type IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult : aliased constant Windows.IID := (670860419, 12504, 23523, (188, 30, 140, 202, 11, 36, 29, 243 ));
   
   type IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandNetworkRegistrationStateChange : aliased constant Windows.IID := (2628843608, 58761, 22439, (157, 1, 44, 98, 145, 86, 124, 199 ));
   
   type IIterator_IMobileBroadbandNetworkRegistrationStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandNetworkRegistrationStateChange : aliased constant Windows.IID := (194034480, 26124, 20934, (155, 140, 49, 221, 132, 134, 225, 14 ));
   
   type IIterable_IMobileBroadbandNetworkRegistrationStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandNetworkRegistrationStateChange
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandNetworkRegistrationStateChange : aliased constant Windows.IID := (125204981, 26952, 21288, (138, 180, 114, 230, 58, 117, 41, 189 ));
   
   type IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandNetworkRegistrationStateChange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandRadioStateChange : aliased constant Windows.IID := (3230191299, 2277, 24373, (162, 185, 9, 0, 208, 40, 200, 59 ));
   
   type IIterator_IMobileBroadbandRadioStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandRadioStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandRadioStateChange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandRadioStateChange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandRadioStateChange_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandRadioStateChange : aliased constant Windows.IID := (3280317866, 22348, 23256, (152, 194, 97, 48, 149, 37, 19, 45 ));
   
   type IIterable_IMobileBroadbandRadioStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandRadioStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandRadioStateChange
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandRadioStateChange : aliased constant Windows.IID := (3392995873, 22728, 20842, (173, 223, 208, 168, 105, 251, 170, 73 ));
   
   type IVectorView_IMobileBroadbandRadioStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandRadioStateChange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandRadioStateChange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandRadioStateChange_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandRadioStateChange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandPinLockStateChange : aliased constant Windows.IID := (3860547487, 31705, 21840, (188, 105, 249, 194, 247, 28, 106, 5 ));
   
   type IIterator_IMobileBroadbandPinLockStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandPinLockStateChange_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandPinLockStateChange : aliased constant Windows.IID := (2857010944, 39235, 22947, (134, 71, 211, 115, 253, 94, 14, 43 ));
   
   type IIterable_IMobileBroadbandPinLockStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandPinLockStateChange
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandPinLockStateChange : aliased constant Windows.IID := (544781808, 40865, 20566, (129, 199, 73, 2, 70, 165, 188, 19 ));
   
   type IVectorView_IMobileBroadbandPinLockStateChange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandPinLockStateChange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandPinLockStateChange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandPinLockStateChange_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandPinLockStateChange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandCellCdma : aliased constant Windows.IID := (3093527026, 21353, 20623, (162, 223, 222, 179, 183, 44, 51, 120 ));
   
   type IIterator_IMobileBroadbandCellCdma_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandCellCdma_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandCellCdma : aliased constant Windows.IID := (1189624354, 19520, 24359, (187, 205, 37, 93, 253, 151, 234, 147 ));
   
   type IIterable_IMobileBroadbandCellCdma_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandCellCdma
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandCellCdma : aliased constant Windows.IID := (680967220, 29697, 23842, (191, 159, 219, 130, 93, 9, 201, 81 ));
   
   type IVectorView_IMobileBroadbandCellCdma_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandCellCdma_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandCellCdma_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandCellCdma_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandCellCdma_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandCellGsm : aliased constant Windows.IID := (2347107892, 16417, 23234, (189, 138, 169, 105, 176, 144, 181, 141 ));
   
   type IIterator_IMobileBroadbandCellGsm_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandCellGsm_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandCellGsm : aliased constant Windows.IID := (2212883176, 14471, 22942, (190, 191, 140, 81, 54, 45, 180, 76 ));
   
   type IIterable_IMobileBroadbandCellGsm_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandCellGsm
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandCellGsm : aliased constant Windows.IID := (4151968104, 918, 20753, (164, 135, 167, 149, 242, 70, 70, 183 ));
   
   type IVectorView_IMobileBroadbandCellGsm_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandCellGsm_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandCellGsm_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandCellGsm_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandCellGsm_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandCellLte : aliased constant Windows.IID := (409705739, 61196, 21514, (143, 231, 77, 188, 92, 29, 20, 218 ));
   
   type IIterator_IMobileBroadbandCellLte_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellLte
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandCellLte_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellLte_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandCellLte : aliased constant Windows.IID := (1171874259, 57896, 23293, (177, 140, 212, 207, 163, 144, 52, 50 ));
   
   type IIterable_IMobileBroadbandCellLte_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandCellLte
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandCellLte : aliased constant Windows.IID := (577809747, 18848, 21939, (147, 86, 0, 124, 59, 140, 45, 227 ));
   
   type IVectorView_IMobileBroadbandCellLte_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandCellLte_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellLte
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandCellLte_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandCellLte_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandCellLte
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandCellLte_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellLte_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandCellTdscdma : aliased constant Windows.IID := (3708480292, 3838, 21832, (132, 72, 225, 83, 212, 144, 61, 247 ));
   
   type IIterator_IMobileBroadbandCellTdscdma_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandCellTdscdma_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandCellTdscdma : aliased constant Windows.IID := (1847481407, 7408, 23731, (179, 252, 181, 89, 33, 60, 88, 226 ));
   
   type IIterable_IMobileBroadbandCellTdscdma_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandCellTdscdma
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandCellTdscdma : aliased constant Windows.IID := (1256788831, 24617, 21679, (138, 230, 67, 44, 18, 175, 206, 223 ));
   
   type IVectorView_IMobileBroadbandCellTdscdma_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandCellTdscdma_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandCellTdscdma_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandCellTdscdma_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandCellTdscdma_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandCellUmts : aliased constant Windows.IID := (3693399477, 5621, 23069, (166, 11, 174, 18, 249, 244, 47, 6 ));
   
   type IIterator_IMobileBroadbandCellUmts_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandCellUmts_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandCellUmts : aliased constant Windows.IID := (540616038, 27083, 24282, (182, 65, 85, 16, 231, 237, 26, 18 ));
   
   type IIterable_IMobileBroadbandCellUmts_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandCellUmts
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandCellUmts : aliased constant Windows.IID := (2968079314, 11730, 21293, (150, 15, 77, 26, 129, 133, 176, 33 ));
   
   type IVectorView_IMobileBroadbandCellUmts_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandCellUmts_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandCellUmts_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandCellUmts_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandCellUmts_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IMobileBroadbandAntennaSar : aliased constant Windows.IID := (53640981, 58383, 21201, (187, 108, 190, 187, 216, 21, 81, 52 ));
   
   type IIterator_IMobileBroadbandAntennaSar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMobileBroadbandAntennaSar_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMobileBroadbandAntennaSar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMobileBroadbandAntennaSar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMobileBroadbandAntennaSar_Interface
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IMobileBroadbandAntennaSar : aliased constant Windows.IID := (4251367852, 16604, 23239, (170, 241, 45, 52, 3, 229, 252, 187 ));
   
   type IIterable_IMobileBroadbandAntennaSar_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMobileBroadbandAntennaSar_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IIterator_IMobileBroadbandAntennaSar
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IMobileBroadbandAntennaSar : aliased constant Windows.IID := (2320159596, 35620, 24364, (173, 111, 106, 147, 106, 23, 191, 198 ));
   
   type IVectorView_IMobileBroadbandAntennaSar_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMobileBroadbandAntennaSar_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMobileBroadbandAntennaSar_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMobileBroadbandAntennaSar_Interface
      ; value : Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMobileBroadbandAntennaSar_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IHotspotCredentialsAuthenticationResult : aliased constant Windows.IID := (1378320856, 10696, 23945, (137, 55, 29, 28, 32, 50, 240, 200 ));
   
   type IAsyncOperation_IHotspotCredentialsAuthenticationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IHotspotCredentialsAuthenticationResult_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IHotspotCredentialsAuthenticationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IHotspotCredentialsAuthenticationResult_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IProvisionFromXmlDocumentResults : aliased constant Windows.IID := (2677007160, 50865, 22036, (161, 79, 137, 119, 167, 126, 23, 242 ));
   
   type IAsyncOperation_IProvisionFromXmlDocumentResults_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IProvisionFromXmlDocumentResults_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IProvisionFromXmlDocumentResults_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IProvisionFromXmlDocumentResults_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IUssdReply : aliased constant Windows.IID := (2647695459, 24915, 23293, (130, 136, 135, 112, 221, 207, 242, 219 ));
   
   type IAsyncOperation_IUssdReply_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUssdReply_Interface
      ; handler : Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IUssdReply
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUssdReply_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.AsyncOperationCompletedHandler_IUssdReply
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUssdReply_Interface
      ; RetVal : access Windows.Networking.NetworkOperators.IUssdReply
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo : aliased constant Windows.IID := (2566497271, 37538, 21553, (144, 47, 155, 240, 16, 103, 171, 96 ));
   
   type AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandCellsInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandCellsInfo_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandCellsInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult : aliased constant Windows.IID := (2838935847, 30007, 22982, (137, 222, 51, 243, 106, 151, 37, 171 ));
   
   type AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_INetworkOperatorTetheringOperationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_INetworkOperatorTetheringOperationResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_INetworkOperatorTetheringOperationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded : aliased constant Windows.IID := (1111278622, 65164, 23165, (159, 238, 170, 224, 78, 248, 87, 0 ));
   
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded_Interface(Callback : access procedure (sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountAdded_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated : aliased constant Windows.IID := (243683478, 8186, 22418, (141, 79, 134, 35, 227, 199, 127, 86 ));
   
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated_Interface(Callback : access procedure (sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountUpdated_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved : aliased constant Windows.IID := (1111278622, 65164, 23165, (159, 238, 170, 224, 78, 248, 87, 0 ));
   
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved_Interface(Callback : access procedure (sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_AccountRemoved_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (3839663356, 62562, 23293, (133, 109, 4, 172, 226, 41, 208, 14 ));
   
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped : aliased constant Windows.IID := (3839663356, 62562, 23293, (133, 109, 4, 172, 226, 41, 208, 14 ));
   
   type TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandAccountWatcher_add_Stopped_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration : aliased constant Windows.IID := (3239970377, 33335, 23699, (187, 219, 46, 218, 82, 22, 253, 63 ));
   
   type AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandModemConfiguration ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandModemConfiguration_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandModemConfiguration
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_MobileBroadbandModemStatus : aliased constant Windows.IID := (3093463832, 61007, 23284, (158, 59, 175, 153, 79, 169, 108, 81 ));
   
   type AsyncOperationCompletedHandler_MobileBroadbandModemStatus_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_MobileBroadbandModemStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_MobileBroadbandModemStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_MobileBroadbandModemStatus_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_MobileBroadbandModemStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult : aliased constant Windows.IID := (1499123860, 24803, 21321, (143, 230, 234, 142, 203, 187, 37, 65 ));
   
   type AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandPinOperationResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandPinOperationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived : aliased constant Windows.IID := (838376614, 56703, 21285, (144, 32, 98, 125, 139, 71, 234, 2 ));
   
   type TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived_Interface(Callback : access procedure (sender : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession ; args : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandDeviceServiceDataSession_add_DataReceived_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult : aliased constant Windows.IID := (569429583, 36659, 24177, (164, 87, 221, 165, 83, 176, 214, 187 ));
   
   type AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandDeviceServiceCommandResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandDeviceServiceCommandResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult : aliased constant Windows.IID := (2704010582, 50802, 22878, (166, 123, 73, 171, 194, 133, 173, 220 ));
   
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppsResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult : aliased constant Windows.IID := (3501537368, 3668, 22417, (130, 237, 51, 19, 220, 117, 218, 69 ));
   
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppRecordDetailsResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppRecordDetailsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult : aliased constant Windows.IID := (3088618163, 19625, 24260, (137, 113, 47, 188, 25, 181, 108, 169 ));
   
   type AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMobileBroadbandUiccAppReadRecordResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IMobileBroadbandUiccAppReadRecordResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged : aliased constant Windows.IID := (1410090292, 52613, 23230, (128, 19, 19, 203, 20, 14, 209, 139 ));
   
   type TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged_Interface(Callback : access procedure (sender : Windows.Networking.NetworkOperators.IMobileBroadbandSarManager ; args : Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMobileBroadbandSarManager_add_TransmissionStateChanged_Interface
      ; sender : Windows.Networking.NetworkOperators.IMobileBroadbandSarManager
      ; args : Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult : aliased constant Windows.IID := (2133150699, 18207, 20480, (148, 206, 16, 44, 195, 51, 5, 95 ));
   
   type AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IHotspotCredentialsAuthenticationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IHotspotCredentialsAuthenticationResult_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IHotspotCredentialsAuthenticationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults : aliased constant Windows.IID := (2055138843, 6137, 23105, (134, 27, 195, 14, 161, 39, 208, 241 ));
   
   type AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IProvisionFromXmlDocumentResults ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IProvisionFromXmlDocumentResults_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IProvisionFromXmlDocumentResults
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IUssdReply : aliased constant Windows.IID := (2475015567, 24084, 21882, (167, 241, 99, 243, 61, 158, 202, 207 ));
   
   type AsyncOperationCompletedHandler_IUssdReply_Interface(Callback : access procedure (asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IUssdReply ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IUssdReply'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUssdReply_Interface
      ; asyncInfo : Windows.Networking.NetworkOperators.IAsyncOperation_IUssdReply
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MobileBroadbandAccount is Windows.Networking.NetworkOperators.IMobileBroadbandAccount;
   subtype MobileBroadbandNetwork is Windows.Networking.NetworkOperators.IMobileBroadbandNetwork;
   subtype MobileBroadbandDeviceInformation is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation;
   subtype MobileBroadbandPinManager is Windows.Networking.NetworkOperators.IMobileBroadbandPinManager;
   subtype MobileBroadbandUiccApp is Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp;
   subtype MobileBroadbandCellsInfo is Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo;
   subtype NetworkOperatorTetheringAccessPointConfiguration is Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration;
   function CreateNetworkOperatorTetheringAccessPointConfiguration return Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration;
   
   subtype NetworkOperatorTetheringOperationResult is Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult;
   subtype NetworkOperatorTetheringManager is Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager;
   subtype NetworkOperatorTetheringClient is Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient;
   subtype MobileBroadbandAccountEventArgs is Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs;
   subtype MobileBroadbandAccountUpdatedEventArgs is Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs;
   subtype MobileBroadbandAccountWatcher is Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher;
   function CreateMobileBroadbandAccountWatcher return Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher;
   
   subtype MobileBroadbandModem is Windows.Networking.NetworkOperators.IMobileBroadbandModem;
   subtype MobileBroadbandUicc is Windows.Networking.NetworkOperators.IMobileBroadbandUicc;
   subtype MobileBroadbandSarManager is Windows.Networking.NetworkOperators.IMobileBroadbandSarManager;
   subtype MobileBroadbandModemConfiguration is Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration;
   subtype MobileBroadbandDeviceServiceInformation is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation;
   subtype MobileBroadbandDeviceService is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceService;
   subtype MobileBroadbandPin is Windows.Networking.NetworkOperators.IMobileBroadbandPin;
   subtype MobileBroadbandPinOperationResult is Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult;
   subtype MobileBroadbandDeviceServiceDataSession is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession;
   subtype MobileBroadbandDeviceServiceCommandSession is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandSession;
   subtype MobileBroadbandDeviceServiceDataReceivedEventArgs is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs;
   subtype MobileBroadbandDeviceServiceCommandResult is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult;
   subtype MobileBroadbandUiccAppsResult is Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult;
   subtype MobileBroadbandUiccAppRecordDetailsResult is Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult;
   subtype MobileBroadbandUiccAppReadRecordResult is Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult;
   subtype MobileBroadbandNetworkRegistrationStateChange is Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange;
   subtype MobileBroadbandNetworkRegistrationStateChangeTriggerDetails is Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails;
   subtype MobileBroadbandRadioStateChange is Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange;
   subtype MobileBroadbandRadioStateChangeTriggerDetails is Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChangeTriggerDetails;
   subtype MobileBroadbandPinLockStateChange is Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange;
   subtype MobileBroadbandPinLockStateChangeTriggerDetails is Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChangeTriggerDetails;
   subtype MobileBroadbandDeviceServiceTriggerDetails is Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceTriggerDetails;
   subtype MobileBroadbandCellCdma is Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma;
   subtype MobileBroadbandCellGsm is Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm;
   subtype MobileBroadbandCellLte is Windows.Networking.NetworkOperators.IMobileBroadbandCellLte;
   subtype MobileBroadbandCellTdscdma is Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma;
   subtype MobileBroadbandCellUmts is Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts;
   subtype MobileBroadbandAntennaSar is Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar;
   subtype MobileBroadbandTransmissionStateChangedEventArgs is Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs;
   subtype HotspotAuthenticationEventDetails is Windows.Networking.NetworkOperators.IHotspotAuthenticationEventDetails;
   subtype HotspotAuthenticationContext is Windows.Networking.NetworkOperators.IHotspotAuthenticationContext;
   subtype HotspotCredentialsAuthenticationResult is Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult;
   subtype ProvisionFromXmlDocumentResults is Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults;
   subtype ProvisionedProfile is Windows.Networking.NetworkOperators.IProvisionedProfile;
   subtype ProvisioningAgent is Windows.Networking.NetworkOperators.IProvisioningAgent;
   function CreateProvisioningAgent return Windows.Networking.NetworkOperators.IProvisioningAgent;
   
   subtype UssdMessage is Windows.Networking.NetworkOperators.IUssdMessage;
   function CreateMessage
   (
      messageText : Windows.String
   )
   return Windows.Networking.NetworkOperators.IUssdMessage;
   
   subtype UssdReply is Windows.Networking.NetworkOperators.IUssdReply;
   subtype UssdSession is Windows.Networking.NetworkOperators.IUssdSession;
   subtype NetworkOperatorNotificationEventDetails is Windows.Networking.NetworkOperators.INetworkOperatorNotificationEventDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_AvailableNetworkAccountIds
   return Windows.Foundation.Collections.IVectorView_String;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IMobileBroadbandAccount;
   
   function CreateFromConnectionProfileWithTargetAdapter
   (
      profile : Windows.Networking.Connectivity.IConnectionProfile
      ; adapter : Windows.Networking.Connectivity.INetworkAdapter
   )
   return Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager;
   
   function GetTetheringCapability
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.TetheringCapability;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager;
   
   function GetTetheringCapabilityFromConnectionProfile
   (
      profile : Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.Networking.NetworkOperators.TetheringCapability;
   
   function CreateFromConnectionProfile
   (
      profile : Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager;
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IMobileBroadbandModem;
   
   function GetDefault
   return Windows.Networking.NetworkOperators.IMobileBroadbandModem;
   
   function get_EFSpn
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid1
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid2
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_EFSpn_KnownRuimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid1_KnownRuimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid2_KnownRuimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_EFOns
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_EFSpn_KnownSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid1_KnownSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid2_KnownSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_EFSpn_KnownUSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_EFOpl
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_EFPnn
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid1_KnownUSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function get_Gid2_KnownUSimFilePaths
   return Windows.Foundation.Collections.IVectorView_UInt32;
   
   function TryGetAuthenticationContext
   (
      evenToken : Windows.String
      ; context : access Windows.Networking.NetworkOperators.IHotspotAuthenticationContext
   )
   return Windows.Boolean;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IProvisioningAgent;
   
   function CreateFromNetworkAccountId
   (
      networkAccountId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IUssdSession;
   
   function CreateFromNetworkInterfaceId
   (
      networkInterfaceId : Windows.String
   )
   return Windows.Networking.NetworkOperators.IUssdSession;
   
   function RequestUnlockAsync
   (
      contactListId : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
end;
