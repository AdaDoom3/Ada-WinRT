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
limited with Windows.Devices.Enumeration;
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.Bluetooth.GenericAttributeProfile is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type GattSessionStatus is (
      Closed,
      Active
   );
   for GattSessionStatus use (
      Closed => 0,
      Active => 1
   );
   for GattSessionStatus'Size use 32;
   
   type GattSessionStatus_Ptr is access GattSessionStatus;
   
   type GattCharacteristicProperties is (
      None,
      Broadcast,
      Read,
      WriteWithoutResponse,
      Write,
      Notify,
      Indicate,
      AuthenticatedSignedWrites,
      ExtendedProperties,
      ReliableWrites,
      WritableAuxiliaries
   );
   for GattCharacteristicProperties use (
      None => 0,
      Broadcast => 1,
      Read => 2,
      WriteWithoutResponse => 4,
      Write => 8,
      Notify => 16,
      Indicate => 32,
      AuthenticatedSignedWrites => 64,
      ExtendedProperties => 128,
      ReliableWrites => 256,
      WritableAuxiliaries => 512
   );
   for GattCharacteristicProperties'Size use 32;
   
   type GattCharacteristicProperties_Ptr is access GattCharacteristicProperties;
   
   type GattClientCharacteristicConfigurationDescriptorValue is (
      None,
      Notify,
      Indicate
   );
   for GattClientCharacteristicConfigurationDescriptorValue use (
      None => 0,
      Notify => 1,
      Indicate => 2
   );
   for GattClientCharacteristicConfigurationDescriptorValue'Size use 32;
   
   type GattClientCharacteristicConfigurationDescriptorValue_Ptr is access GattClientCharacteristicConfigurationDescriptorValue;
   
   type GattProtectionLevel is (
      Plain,
      AuthenticationRequired,
      EncryptionRequired,
      EncryptionAndAuthenticationRequired
   );
   for GattProtectionLevel use (
      Plain => 0,
      AuthenticationRequired => 1,
      EncryptionRequired => 2,
      EncryptionAndAuthenticationRequired => 3
   );
   for GattProtectionLevel'Size use 32;
   
   type GattProtectionLevel_Ptr is access GattProtectionLevel;
   
   type GattWriteOption is (
      WriteWithResponse,
      WriteWithoutResponse
   );
   for GattWriteOption use (
      WriteWithResponse => 0,
      WriteWithoutResponse => 1
   );
   for GattWriteOption'Size use 32;
   
   type GattWriteOption_Ptr is access GattWriteOption;
   
   type GattCommunicationStatus is (
      Success,
      Unreachable,
      ProtocolError,
      AccessDenied
   );
   for GattCommunicationStatus use (
      Success => 0,
      Unreachable => 1,
      ProtocolError => 2,
      AccessDenied => 3
   );
   for GattCommunicationStatus'Size use 32;
   
   type GattCommunicationStatus_Ptr is access GattCommunicationStatus;
   
   type GattSharingMode is (
      Unspecified,
      Exclusive,
      SharedReadOnly,
      SharedReadAndWrite
   );
   for GattSharingMode use (
      Unspecified => 0,
      Exclusive => 1,
      SharedReadOnly => 2,
      SharedReadAndWrite => 3
   );
   for GattSharingMode'Size use 32;
   
   type GattSharingMode_Ptr is access GattSharingMode;
   
   type GattOpenStatus is (
      Unspecified,
      Success,
      AlreadyOpened,
      NotFound,
      SharingViolation,
      AccessDenied
   );
   for GattOpenStatus use (
      Unspecified => 0,
      Success => 1,
      AlreadyOpened => 2,
      NotFound => 3,
      SharingViolation => 4,
      AccessDenied => 5
   );
   for GattOpenStatus'Size use 32;
   
   type GattOpenStatus_Ptr is access GattOpenStatus;
   
   type GattRequestState is (
      Pending,
      Completed,
      Canceled
   );
   for GattRequestState use (
      Pending => 0,
      Completed => 1,
      Canceled => 2
   );
   for GattRequestState'Size use 32;
   
   type GattRequestState_Ptr is access GattRequestState;
   
   type GattServiceProviderAdvertisementStatus is (
      Created,
      Stopped,
      Started,
      Aborted
   );
   for GattServiceProviderAdvertisementStatus use (
      Created => 0,
      Stopped => 1,
      Started => 2,
      Aborted => 3
   );
   for GattServiceProviderAdvertisementStatus'Size use 32;
   
   type GattServiceProviderAdvertisementStatus_Ptr is access GattServiceProviderAdvertisementStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IGattDeviceServicesResult_Interface;
   type AsyncOperationCompletedHandler_IGattDeviceServicesResult is access all AsyncOperationCompletedHandler_IGattDeviceServicesResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattDeviceServicesResult_Ptr is access all AsyncOperationCompletedHandler_IGattDeviceServicesResult;
   type AsyncOperationCompletedHandler_IGattSession_Interface;
   type AsyncOperationCompletedHandler_IGattSession is access all AsyncOperationCompletedHandler_IGattSession_Interface'Class;
   type AsyncOperationCompletedHandler_IGattSession_Ptr is access all AsyncOperationCompletedHandler_IGattSession;
   type TypedEventHandler_IGattSession_add_MaxPduSizeChanged_Interface;
   type TypedEventHandler_IGattSession_add_MaxPduSizeChanged is access all TypedEventHandler_IGattSession_add_MaxPduSizeChanged_Interface'Class;
   type TypedEventHandler_IGattSession_add_MaxPduSizeChanged_Ptr is access all TypedEventHandler_IGattSession_add_MaxPduSizeChanged;
   type TypedEventHandler_IGattSession_add_SessionStatusChanged_Interface;
   type TypedEventHandler_IGattSession_add_SessionStatusChanged is access all TypedEventHandler_IGattSession_add_SessionStatusChanged_Interface'Class;
   type TypedEventHandler_IGattSession_add_SessionStatusChanged_Ptr is access all TypedEventHandler_IGattSession_add_SessionStatusChanged;
   type AsyncOperationCompletedHandler_IGattDeviceService_Interface;
   type AsyncOperationCompletedHandler_IGattDeviceService is access all AsyncOperationCompletedHandler_IGattDeviceService_Interface'Class;
   type AsyncOperationCompletedHandler_IGattDeviceService_Ptr is access all AsyncOperationCompletedHandler_IGattDeviceService;
   type AsyncOperationCompletedHandler_GattOpenStatus_Interface;
   type AsyncOperationCompletedHandler_GattOpenStatus is access all AsyncOperationCompletedHandler_GattOpenStatus_Interface'Class;
   type AsyncOperationCompletedHandler_GattOpenStatus_Ptr is access all AsyncOperationCompletedHandler_GattOpenStatus;
   type AsyncOperationCompletedHandler_IGattCharacteristicsResult_Interface;
   type AsyncOperationCompletedHandler_IGattCharacteristicsResult is access all AsyncOperationCompletedHandler_IGattCharacteristicsResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattCharacteristicsResult_Ptr is access all AsyncOperationCompletedHandler_IGattCharacteristicsResult;
   type AsyncOperationCompletedHandler_IGattReadResult_Interface;
   type AsyncOperationCompletedHandler_IGattReadResult is access all AsyncOperationCompletedHandler_IGattReadResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattReadResult_Ptr is access all AsyncOperationCompletedHandler_IGattReadResult;
   type AsyncOperationCompletedHandler_GattCommunicationStatus_Interface;
   type AsyncOperationCompletedHandler_GattCommunicationStatus is access all AsyncOperationCompletedHandler_GattCommunicationStatus_Interface'Class;
   type AsyncOperationCompletedHandler_GattCommunicationStatus_Ptr is access all AsyncOperationCompletedHandler_GattCommunicationStatus;
   type AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface;
   type AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult is access all AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult_Ptr is access all AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult;
   type TypedEventHandler_IGattCharacteristic_add_ValueChanged_Interface;
   type TypedEventHandler_IGattCharacteristic_add_ValueChanged is access all TypedEventHandler_IGattCharacteristic_add_ValueChanged_Interface'Class;
   type TypedEventHandler_IGattCharacteristic_add_ValueChanged_Ptr is access all TypedEventHandler_IGattCharacteristic_add_ValueChanged;
   type AsyncOperationCompletedHandler_IGattDescriptorsResult_Interface;
   type AsyncOperationCompletedHandler_IGattDescriptorsResult is access all AsyncOperationCompletedHandler_IGattDescriptorsResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattDescriptorsResult_Ptr is access all AsyncOperationCompletedHandler_IGattDescriptorsResult;
   type AsyncOperationCompletedHandler_IGattWriteResult_Interface;
   type AsyncOperationCompletedHandler_IGattWriteResult is access all AsyncOperationCompletedHandler_IGattWriteResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattWriteResult_Ptr is access all AsyncOperationCompletedHandler_IGattWriteResult;
   type AsyncOperationCompletedHandler_IGattServiceProviderResult_Interface;
   type AsyncOperationCompletedHandler_IGattServiceProviderResult is access all AsyncOperationCompletedHandler_IGattServiceProviderResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattServiceProviderResult_Ptr is access all AsyncOperationCompletedHandler_IGattServiceProviderResult;
   type TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged_Interface;
   type TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged is access all TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged_Interface'Class;
   type TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged_Ptr is access all TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged;
   type AsyncOperationCompletedHandler_IGattLocalCharacteristicResult_Interface;
   type AsyncOperationCompletedHandler_IGattLocalCharacteristicResult is access all AsyncOperationCompletedHandler_IGattLocalCharacteristicResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattLocalCharacteristicResult_Ptr is access all AsyncOperationCompletedHandler_IGattLocalCharacteristicResult;
   type AsyncOperationCompletedHandler_IGattLocalDescriptorResult_Interface;
   type AsyncOperationCompletedHandler_IGattLocalDescriptorResult is access all AsyncOperationCompletedHandler_IGattLocalDescriptorResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattLocalDescriptorResult_Ptr is access all AsyncOperationCompletedHandler_IGattLocalDescriptorResult;
   type TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged_Interface;
   type TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged is access all TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged_Interface'Class;
   type TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged_Ptr is access all TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged;
   type TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested_Interface;
   type TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested is access all TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested_Interface'Class;
   type TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested_Ptr is access all TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested;
   type TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested_Interface;
   type TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested is access all TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested_Interface'Class;
   type TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested_Ptr is access all TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested;
   type AsyncOperationCompletedHandler_IGattClientNotificationResult_Interface;
   type AsyncOperationCompletedHandler_IGattClientNotificationResult is access all AsyncOperationCompletedHandler_IGattClientNotificationResult_Interface'Class;
   type AsyncOperationCompletedHandler_IGattClientNotificationResult_Ptr is access all AsyncOperationCompletedHandler_IGattClientNotificationResult;
   type TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged_Interface;
   type TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged is access all TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged_Interface'Class;
   type TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged_Ptr is access all TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged;
   type TypedEventHandler_IGattLocalDescriptor_add_ReadRequested_Interface;
   type TypedEventHandler_IGattLocalDescriptor_add_ReadRequested is access all TypedEventHandler_IGattLocalDescriptor_add_ReadRequested_Interface'Class;
   type TypedEventHandler_IGattLocalDescriptor_add_ReadRequested_Ptr is access all TypedEventHandler_IGattLocalDescriptor_add_ReadRequested;
   type TypedEventHandler_IGattLocalDescriptor_add_WriteRequested_Interface;
   type TypedEventHandler_IGattLocalDescriptor_add_WriteRequested is access all TypedEventHandler_IGattLocalDescriptor_add_WriteRequested_Interface'Class;
   type TypedEventHandler_IGattLocalDescriptor_add_WriteRequested_Ptr is access all TypedEventHandler_IGattLocalDescriptor_add_WriteRequested;
   type TypedEventHandler_IGattReadRequest_add_StateChanged_Interface;
   type TypedEventHandler_IGattReadRequest_add_StateChanged is access all TypedEventHandler_IGattReadRequest_add_StateChanged_Interface'Class;
   type TypedEventHandler_IGattReadRequest_add_StateChanged_Ptr is access all TypedEventHandler_IGattReadRequest_add_StateChanged;
   type TypedEventHandler_IGattWriteRequest_add_StateChanged_Interface;
   type TypedEventHandler_IGattWriteRequest_add_StateChanged is access all TypedEventHandler_IGattWriteRequest_add_StateChanged_Interface'Class;
   type TypedEventHandler_IGattWriteRequest_add_StateChanged_Ptr is access all TypedEventHandler_IGattWriteRequest_add_StateChanged;
   type AsyncOperationCompletedHandler_IGattReadRequest_Interface;
   type AsyncOperationCompletedHandler_IGattReadRequest is access all AsyncOperationCompletedHandler_IGattReadRequest_Interface'Class;
   type AsyncOperationCompletedHandler_IGattReadRequest_Ptr is access all AsyncOperationCompletedHandler_IGattReadRequest;
   type AsyncOperationCompletedHandler_IGattWriteRequest_Interface;
   type AsyncOperationCompletedHandler_IGattWriteRequest is access all AsyncOperationCompletedHandler_IGattWriteRequest_Interface'Class;
   type AsyncOperationCompletedHandler_IGattWriteRequest_Ptr is access all AsyncOperationCompletedHandler_IGattWriteRequest;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IGattProtocolErrorStatics_Interface;
   type IGattProtocolErrorStatics is access all IGattProtocolErrorStatics_Interface'Class;
   type IGattProtocolErrorStatics_Ptr is access all IGattProtocolErrorStatics;
   type IGattSessionStatics_Interface;
   type IGattSessionStatics is access all IGattSessionStatics_Interface'Class;
   type IGattSessionStatics_Ptr is access all IGattSessionStatics;
   type IGattSession_Interface;
   type IGattSession is access all IGattSession_Interface'Class;
   type IGattSession_Ptr is access all IGattSession;
   type IGattSessionStatusChangedEventArgs_Interface;
   type IGattSessionStatusChangedEventArgs is access all IGattSessionStatusChangedEventArgs_Interface'Class;
   type IGattSessionStatusChangedEventArgs_Ptr is access all IGattSessionStatusChangedEventArgs;
   type IGattDeviceServiceStatics_Interface;
   type IGattDeviceServiceStatics is access all IGattDeviceServiceStatics_Interface'Class;
   type IGattDeviceServiceStatics_Ptr is access all IGattDeviceServiceStatics;
   type IGattDeviceServiceStatics2_Interface;
   type IGattDeviceServiceStatics2 is access all IGattDeviceServiceStatics2_Interface'Class;
   type IGattDeviceServiceStatics2_Ptr is access all IGattDeviceServiceStatics2;
   type IGattDeviceService_Interface;
   type IGattDeviceService is access all IGattDeviceService_Interface'Class;
   type IGattDeviceService_Ptr is access all IGattDeviceService;
   type IGattDeviceService2_Interface;
   type IGattDeviceService2 is access all IGattDeviceService2_Interface'Class;
   type IGattDeviceService2_Ptr is access all IGattDeviceService2;
   type IGattDeviceService3_Interface;
   type IGattDeviceService3 is access all IGattDeviceService3_Interface'Class;
   type IGattDeviceService3_Ptr is access all IGattDeviceService3;
   type IGattDeviceServicesResult_Interface;
   type IGattDeviceServicesResult is access all IGattDeviceServicesResult_Interface'Class;
   type IGattDeviceServicesResult_Ptr is access all IGattDeviceServicesResult;
   type IGattCharacteristicStatics_Interface;
   type IGattCharacteristicStatics is access all IGattCharacteristicStatics_Interface'Class;
   type IGattCharacteristicStatics_Ptr is access all IGattCharacteristicStatics;
   type IGattCharacteristic_Interface;
   type IGattCharacteristic is access all IGattCharacteristic_Interface'Class;
   type IGattCharacteristic_Ptr is access all IGattCharacteristic;
   type IGattCharacteristic2_Interface;
   type IGattCharacteristic2 is access all IGattCharacteristic2_Interface'Class;
   type IGattCharacteristic2_Ptr is access all IGattCharacteristic2;
   type IGattCharacteristic3_Interface;
   type IGattCharacteristic3 is access all IGattCharacteristic3_Interface'Class;
   type IGattCharacteristic3_Ptr is access all IGattCharacteristic3;
   type IGattCharacteristicsResult_Interface;
   type IGattCharacteristicsResult is access all IGattCharacteristicsResult_Interface'Class;
   type IGattCharacteristicsResult_Ptr is access all IGattCharacteristicsResult;
   type IGattDescriptorStatics_Interface;
   type IGattDescriptorStatics is access all IGattDescriptorStatics_Interface'Class;
   type IGattDescriptorStatics_Ptr is access all IGattDescriptorStatics;
   type IGattDescriptor_Interface;
   type IGattDescriptor is access all IGattDescriptor_Interface'Class;
   type IGattDescriptor_Ptr is access all IGattDescriptor;
   type IGattDescriptor2_Interface;
   type IGattDescriptor2 is access all IGattDescriptor2_Interface'Class;
   type IGattDescriptor2_Ptr is access all IGattDescriptor2;
   type IGattDescriptorsResult_Interface;
   type IGattDescriptorsResult is access all IGattDescriptorsResult_Interface'Class;
   type IGattDescriptorsResult_Ptr is access all IGattDescriptorsResult;
   type IGattPresentationFormatTypesStatics_Interface;
   type IGattPresentationFormatTypesStatics is access all IGattPresentationFormatTypesStatics_Interface'Class;
   type IGattPresentationFormatTypesStatics_Ptr is access all IGattPresentationFormatTypesStatics;
   type IGattPresentationFormatStatics_Interface;
   type IGattPresentationFormatStatics is access all IGattPresentationFormatStatics_Interface'Class;
   type IGattPresentationFormatStatics_Ptr is access all IGattPresentationFormatStatics;
   type IGattPresentationFormatStatics2_Interface;
   type IGattPresentationFormatStatics2 is access all IGattPresentationFormatStatics2_Interface'Class;
   type IGattPresentationFormatStatics2_Ptr is access all IGattPresentationFormatStatics2;
   type IGattPresentationFormat_Interface;
   type IGattPresentationFormat is access all IGattPresentationFormat_Interface'Class;
   type IGattPresentationFormat_Ptr is access all IGattPresentationFormat;
   type IGattValueChangedEventArgs_Interface;
   type IGattValueChangedEventArgs is access all IGattValueChangedEventArgs_Interface'Class;
   type IGattValueChangedEventArgs_Ptr is access all IGattValueChangedEventArgs;
   type IGattServiceUuidsStatics_Interface;
   type IGattServiceUuidsStatics is access all IGattServiceUuidsStatics_Interface'Class;
   type IGattServiceUuidsStatics_Ptr is access all IGattServiceUuidsStatics;
   type IGattServiceUuidsStatics2_Interface;
   type IGattServiceUuidsStatics2 is access all IGattServiceUuidsStatics2_Interface'Class;
   type IGattServiceUuidsStatics2_Ptr is access all IGattServiceUuidsStatics2;
   type IGattCharacteristicUuidsStatics_Interface;
   type IGattCharacteristicUuidsStatics is access all IGattCharacteristicUuidsStatics_Interface'Class;
   type IGattCharacteristicUuidsStatics_Ptr is access all IGattCharacteristicUuidsStatics;
   type IGattCharacteristicUuidsStatics2_Interface;
   type IGattCharacteristicUuidsStatics2 is access all IGattCharacteristicUuidsStatics2_Interface'Class;
   type IGattCharacteristicUuidsStatics2_Ptr is access all IGattCharacteristicUuidsStatics2;
   type IGattDescriptorUuidsStatics_Interface;
   type IGattDescriptorUuidsStatics is access all IGattDescriptorUuidsStatics_Interface'Class;
   type IGattDescriptorUuidsStatics_Ptr is access all IGattDescriptorUuidsStatics;
   type IGattReliableWriteTransaction_Interface;
   type IGattReliableWriteTransaction is access all IGattReliableWriteTransaction_Interface'Class;
   type IGattReliableWriteTransaction_Ptr is access all IGattReliableWriteTransaction;
   type IGattReliableWriteTransaction2_Interface;
   type IGattReliableWriteTransaction2 is access all IGattReliableWriteTransaction2_Interface'Class;
   type IGattReliableWriteTransaction2_Ptr is access all IGattReliableWriteTransaction2;
   type IGattReadResult_Interface;
   type IGattReadResult is access all IGattReadResult_Interface'Class;
   type IGattReadResult_Ptr is access all IGattReadResult;
   type IGattReadResult2_Interface;
   type IGattReadResult2 is access all IGattReadResult2_Interface'Class;
   type IGattReadResult2_Ptr is access all IGattReadResult2;
   type IGattWriteResult_Interface;
   type IGattWriteResult is access all IGattWriteResult_Interface'Class;
   type IGattWriteResult_Ptr is access all IGattWriteResult;
   type IGattReadClientCharacteristicConfigurationDescriptorResult_Interface;
   type IGattReadClientCharacteristicConfigurationDescriptorResult is access all IGattReadClientCharacteristicConfigurationDescriptorResult_Interface'Class;
   type IGattReadClientCharacteristicConfigurationDescriptorResult_Ptr is access all IGattReadClientCharacteristicConfigurationDescriptorResult;
   type IGattReadClientCharacteristicConfigurationDescriptorResult2_Interface;
   type IGattReadClientCharacteristicConfigurationDescriptorResult2 is access all IGattReadClientCharacteristicConfigurationDescriptorResult2_Interface'Class;
   type IGattReadClientCharacteristicConfigurationDescriptorResult2_Ptr is access all IGattReadClientCharacteristicConfigurationDescriptorResult2;
   type IGattServiceProviderAdvertisingParameters_Interface;
   type IGattServiceProviderAdvertisingParameters is access all IGattServiceProviderAdvertisingParameters_Interface'Class;
   type IGattServiceProviderAdvertisingParameters_Ptr is access all IGattServiceProviderAdvertisingParameters;
   type IGattLocalCharacteristicParameters_Interface;
   type IGattLocalCharacteristicParameters is access all IGattLocalCharacteristicParameters_Interface'Class;
   type IGattLocalCharacteristicParameters_Ptr is access all IGattLocalCharacteristicParameters;
   type IGattLocalDescriptorParameters_Interface;
   type IGattLocalDescriptorParameters is access all IGattLocalDescriptorParameters_Interface'Class;
   type IGattLocalDescriptorParameters_Ptr is access all IGattLocalDescriptorParameters;
   type IGattServiceProviderStatics_Interface;
   type IGattServiceProviderStatics is access all IGattServiceProviderStatics_Interface'Class;
   type IGattServiceProviderStatics_Ptr is access all IGattServiceProviderStatics;
   type IGattServiceProvider_Interface;
   type IGattServiceProvider is access all IGattServiceProvider_Interface'Class;
   type IGattServiceProvider_Ptr is access all IGattServiceProvider;
   type IGattServiceProviderAdvertisementStatusChangedEventArgs_Interface;
   type IGattServiceProviderAdvertisementStatusChangedEventArgs is access all IGattServiceProviderAdvertisementStatusChangedEventArgs_Interface'Class;
   type IGattServiceProviderAdvertisementStatusChangedEventArgs_Ptr is access all IGattServiceProviderAdvertisementStatusChangedEventArgs;
   type IGattServiceProviderResult_Interface;
   type IGattServiceProviderResult is access all IGattServiceProviderResult_Interface'Class;
   type IGattServiceProviderResult_Ptr is access all IGattServiceProviderResult;
   type IGattLocalService_Interface;
   type IGattLocalService is access all IGattLocalService_Interface'Class;
   type IGattLocalService_Ptr is access all IGattLocalService;
   type IGattLocalCharacteristic_Interface;
   type IGattLocalCharacteristic is access all IGattLocalCharacteristic_Interface'Class;
   type IGattLocalCharacteristic_Ptr is access all IGattLocalCharacteristic;
   type IGattLocalCharacteristicResult_Interface;
   type IGattLocalCharacteristicResult is access all IGattLocalCharacteristicResult_Interface'Class;
   type IGattLocalCharacteristicResult_Ptr is access all IGattLocalCharacteristicResult;
   type IGattSubscribedClient_Interface;
   type IGattSubscribedClient is access all IGattSubscribedClient_Interface'Class;
   type IGattSubscribedClient_Ptr is access all IGattSubscribedClient;
   type IGattClientNotificationResult_Interface;
   type IGattClientNotificationResult is access all IGattClientNotificationResult_Interface'Class;
   type IGattClientNotificationResult_Ptr is access all IGattClientNotificationResult;
   type IGattClientNotificationResult2_Interface;
   type IGattClientNotificationResult2 is access all IGattClientNotificationResult2_Interface'Class;
   type IGattClientNotificationResult2_Ptr is access all IGattClientNotificationResult2;
   type IGattLocalDescriptor_Interface;
   type IGattLocalDescriptor is access all IGattLocalDescriptor_Interface'Class;
   type IGattLocalDescriptor_Ptr is access all IGattLocalDescriptor;
   type IGattLocalDescriptorResult_Interface;
   type IGattLocalDescriptorResult is access all IGattLocalDescriptorResult_Interface'Class;
   type IGattLocalDescriptorResult_Ptr is access all IGattLocalDescriptorResult;
   type IGattReadRequest_Interface;
   type IGattReadRequest is access all IGattReadRequest_Interface'Class;
   type IGattReadRequest_Ptr is access all IGattReadRequest;
   type IGattWriteRequest_Interface;
   type IGattWriteRequest is access all IGattWriteRequest_Interface'Class;
   type IGattWriteRequest_Ptr is access all IGattWriteRequest;
   type IGattReadRequestedEventArgs_Interface;
   type IGattReadRequestedEventArgs is access all IGattReadRequestedEventArgs_Interface'Class;
   type IGattReadRequestedEventArgs_Ptr is access all IGattReadRequestedEventArgs;
   type IGattWriteRequestedEventArgs_Interface;
   type IGattWriteRequestedEventArgs is access all IGattWriteRequestedEventArgs_Interface'Class;
   type IGattWriteRequestedEventArgs_Ptr is access all IGattWriteRequestedEventArgs;
   type IGattRequestStateChangedEventArgs_Interface;
   type IGattRequestStateChangedEventArgs is access all IGattRequestStateChangedEventArgs_Interface'Class;
   type IGattRequestStateChangedEventArgs_Ptr is access all IGattRequestStateChangedEventArgs;
   type IIterator_IGattDeviceService_Interface;
   type IIterator_IGattDeviceService is access all IIterator_IGattDeviceService_Interface'Class;
   type IIterator_IGattDeviceService_Ptr is access all IIterator_IGattDeviceService;
   type IIterable_IGattDeviceService_Interface;
   type IIterable_IGattDeviceService is access all IIterable_IGattDeviceService_Interface'Class;
   type IIterable_IGattDeviceService_Ptr is access all IIterable_IGattDeviceService;
   type IVectorView_IGattDeviceService_Interface;
   type IVectorView_IGattDeviceService is access all IVectorView_IGattDeviceService_Interface'Class;
   type IVectorView_IGattDeviceService_Ptr is access all IVectorView_IGattDeviceService;
   type IAsyncOperation_IGattDeviceServicesResult_Interface;
   type IAsyncOperation_IGattDeviceServicesResult is access all IAsyncOperation_IGattDeviceServicesResult_Interface'Class;
   type IAsyncOperation_IGattDeviceServicesResult_Ptr is access all IAsyncOperation_IGattDeviceServicesResult;
   type IAsyncOperation_IGattSession_Interface;
   type IAsyncOperation_IGattSession is access all IAsyncOperation_IGattSession_Interface'Class;
   type IAsyncOperation_IGattSession_Ptr is access all IAsyncOperation_IGattSession;
   type IAsyncOperation_IGattDeviceService_Interface;
   type IAsyncOperation_IGattDeviceService is access all IAsyncOperation_IGattDeviceService_Interface'Class;
   type IAsyncOperation_IGattDeviceService_Ptr is access all IAsyncOperation_IGattDeviceService;
   type IIterator_IGattCharacteristic_Interface;
   type IIterator_IGattCharacteristic is access all IIterator_IGattCharacteristic_Interface'Class;
   type IIterator_IGattCharacteristic_Ptr is access all IIterator_IGattCharacteristic;
   type IIterable_IGattCharacteristic_Interface;
   type IIterable_IGattCharacteristic is access all IIterable_IGattCharacteristic_Interface'Class;
   type IIterable_IGattCharacteristic_Ptr is access all IIterable_IGattCharacteristic;
   type IVectorView_IGattCharacteristic_Interface;
   type IVectorView_IGattCharacteristic is access all IVectorView_IGattCharacteristic_Interface'Class;
   type IVectorView_IGattCharacteristic_Ptr is access all IVectorView_IGattCharacteristic;
   type IAsyncOperation_GattOpenStatus_Interface;
   type IAsyncOperation_GattOpenStatus is access all IAsyncOperation_GattOpenStatus_Interface'Class;
   type IAsyncOperation_GattOpenStatus_Ptr is access all IAsyncOperation_GattOpenStatus;
   type IAsyncOperation_IGattCharacteristicsResult_Interface;
   type IAsyncOperation_IGattCharacteristicsResult is access all IAsyncOperation_IGattCharacteristicsResult_Interface'Class;
   type IAsyncOperation_IGattCharacteristicsResult_Ptr is access all IAsyncOperation_IGattCharacteristicsResult;
   type IIterator_IGattDescriptor_Interface;
   type IIterator_IGattDescriptor is access all IIterator_IGattDescriptor_Interface'Class;
   type IIterator_IGattDescriptor_Ptr is access all IIterator_IGattDescriptor;
   type IIterable_IGattDescriptor_Interface;
   type IIterable_IGattDescriptor is access all IIterable_IGattDescriptor_Interface'Class;
   type IIterable_IGattDescriptor_Ptr is access all IIterable_IGattDescriptor;
   type IVectorView_IGattDescriptor_Interface;
   type IVectorView_IGattDescriptor is access all IVectorView_IGattDescriptor_Interface'Class;
   type IVectorView_IGattDescriptor_Ptr is access all IVectorView_IGattDescriptor;
   type IIterator_IGattPresentationFormat_Interface;
   type IIterator_IGattPresentationFormat is access all IIterator_IGattPresentationFormat_Interface'Class;
   type IIterator_IGattPresentationFormat_Ptr is access all IIterator_IGattPresentationFormat;
   type IIterable_IGattPresentationFormat_Interface;
   type IIterable_IGattPresentationFormat is access all IIterable_IGattPresentationFormat_Interface'Class;
   type IIterable_IGattPresentationFormat_Ptr is access all IIterable_IGattPresentationFormat;
   type IVectorView_IGattPresentationFormat_Interface;
   type IVectorView_IGattPresentationFormat is access all IVectorView_IGattPresentationFormat_Interface'Class;
   type IVectorView_IGattPresentationFormat_Ptr is access all IVectorView_IGattPresentationFormat;
   type IAsyncOperation_IGattReadResult_Interface;
   type IAsyncOperation_IGattReadResult is access all IAsyncOperation_IGattReadResult_Interface'Class;
   type IAsyncOperation_IGattReadResult_Ptr is access all IAsyncOperation_IGattReadResult;
   type IAsyncOperation_GattCommunicationStatus_Interface;
   type IAsyncOperation_GattCommunicationStatus is access all IAsyncOperation_GattCommunicationStatus_Interface'Class;
   type IAsyncOperation_GattCommunicationStatus_Ptr is access all IAsyncOperation_GattCommunicationStatus;
   type IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface;
   type IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult is access all IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface'Class;
   type IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult_Ptr is access all IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult;
   type IAsyncOperation_IGattDescriptorsResult_Interface;
   type IAsyncOperation_IGattDescriptorsResult is access all IAsyncOperation_IGattDescriptorsResult_Interface'Class;
   type IAsyncOperation_IGattDescriptorsResult_Ptr is access all IAsyncOperation_IGattDescriptorsResult;
   type IAsyncOperation_IGattWriteResult_Interface;
   type IAsyncOperation_IGattWriteResult is access all IAsyncOperation_IGattWriteResult_Interface'Class;
   type IAsyncOperation_IGattWriteResult_Ptr is access all IAsyncOperation_IGattWriteResult;
   type IVector_IGattPresentationFormat_Interface;
   type IVector_IGattPresentationFormat is access all IVector_IGattPresentationFormat_Interface'Class;
   type IVector_IGattPresentationFormat_Ptr is access all IVector_IGattPresentationFormat;
   type IAsyncOperation_IGattServiceProviderResult_Interface;
   type IAsyncOperation_IGattServiceProviderResult is access all IAsyncOperation_IGattServiceProviderResult_Interface'Class;
   type IAsyncOperation_IGattServiceProviderResult_Ptr is access all IAsyncOperation_IGattServiceProviderResult;
   type IAsyncOperation_IGattLocalCharacteristicResult_Interface;
   type IAsyncOperation_IGattLocalCharacteristicResult is access all IAsyncOperation_IGattLocalCharacteristicResult_Interface'Class;
   type IAsyncOperation_IGattLocalCharacteristicResult_Ptr is access all IAsyncOperation_IGattLocalCharacteristicResult;
   type IIterator_IGattLocalCharacteristic_Interface;
   type IIterator_IGattLocalCharacteristic is access all IIterator_IGattLocalCharacteristic_Interface'Class;
   type IIterator_IGattLocalCharacteristic_Ptr is access all IIterator_IGattLocalCharacteristic;
   type IIterable_IGattLocalCharacteristic_Interface;
   type IIterable_IGattLocalCharacteristic is access all IIterable_IGattLocalCharacteristic_Interface'Class;
   type IIterable_IGattLocalCharacteristic_Ptr is access all IIterable_IGattLocalCharacteristic;
   type IVectorView_IGattLocalCharacteristic_Interface;
   type IVectorView_IGattLocalCharacteristic is access all IVectorView_IGattLocalCharacteristic_Interface'Class;
   type IVectorView_IGattLocalCharacteristic_Ptr is access all IVectorView_IGattLocalCharacteristic;
   type IAsyncOperation_IGattLocalDescriptorResult_Interface;
   type IAsyncOperation_IGattLocalDescriptorResult is access all IAsyncOperation_IGattLocalDescriptorResult_Interface'Class;
   type IAsyncOperation_IGattLocalDescriptorResult_Ptr is access all IAsyncOperation_IGattLocalDescriptorResult;
   type IIterator_IGattLocalDescriptor_Interface;
   type IIterator_IGattLocalDescriptor is access all IIterator_IGattLocalDescriptor_Interface'Class;
   type IIterator_IGattLocalDescriptor_Ptr is access all IIterator_IGattLocalDescriptor;
   type IIterable_IGattLocalDescriptor_Interface;
   type IIterable_IGattLocalDescriptor is access all IIterable_IGattLocalDescriptor_Interface'Class;
   type IIterable_IGattLocalDescriptor_Ptr is access all IIterable_IGattLocalDescriptor;
   type IVectorView_IGattLocalDescriptor_Interface;
   type IVectorView_IGattLocalDescriptor is access all IVectorView_IGattLocalDescriptor_Interface'Class;
   type IVectorView_IGattLocalDescriptor_Ptr is access all IVectorView_IGattLocalDescriptor;
   type IIterator_IGattSubscribedClient_Interface;
   type IIterator_IGattSubscribedClient is access all IIterator_IGattSubscribedClient_Interface'Class;
   type IIterator_IGattSubscribedClient_Ptr is access all IIterator_IGattSubscribedClient;
   type IIterable_IGattSubscribedClient_Interface;
   type IIterable_IGattSubscribedClient is access all IIterable_IGattSubscribedClient_Interface'Class;
   type IIterable_IGattSubscribedClient_Ptr is access all IIterable_IGattSubscribedClient;
   type IVectorView_IGattSubscribedClient_Interface;
   type IVectorView_IGattSubscribedClient is access all IVectorView_IGattSubscribedClient_Interface'Class;
   type IVectorView_IGattSubscribedClient_Ptr is access all IVectorView_IGattSubscribedClient;
   type IAsyncOperation_IGattClientNotificationResult_Interface;
   type IAsyncOperation_IGattClientNotificationResult is access all IAsyncOperation_IGattClientNotificationResult_Interface'Class;
   type IAsyncOperation_IGattClientNotificationResult_Ptr is access all IAsyncOperation_IGattClientNotificationResult;
   type IAsyncOperation_IGattReadRequest_Interface;
   type IAsyncOperation_IGattReadRequest is access all IAsyncOperation_IGattReadRequest_Interface'Class;
   type IAsyncOperation_IGattReadRequest_Ptr is access all IAsyncOperation_IGattReadRequest;
   type IAsyncOperation_IGattWriteRequest_Interface;
   type IAsyncOperation_IGattWriteRequest is access all IAsyncOperation_IGattWriteRequest_Interface'Class;
   type IAsyncOperation_IGattWriteRequest_Ptr is access all IAsyncOperation_IGattWriteRequest;
   type IIterator_IGattValueChangedEventArgs_Interface;
   type IIterator_IGattValueChangedEventArgs is access all IIterator_IGattValueChangedEventArgs_Interface'Class;
   type IIterator_IGattValueChangedEventArgs_Ptr is access all IIterator_IGattValueChangedEventArgs;
   type IIterable_IGattValueChangedEventArgs_Interface;
   type IIterable_IGattValueChangedEventArgs is access all IIterable_IGattValueChangedEventArgs_Interface'Class;
   type IIterable_IGattValueChangedEventArgs_Ptr is access all IIterable_IGattValueChangedEventArgs;
   type IVectorView_IGattValueChangedEventArgs_Interface;
   type IVectorView_IGattValueChangedEventArgs is access all IVectorView_IGattValueChangedEventArgs_Interface'Class;
   type IVectorView_IGattValueChangedEventArgs_Ptr is access all IVectorView_IGattValueChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IGattProtocolErrorStatics : aliased constant Windows.IID := (3393635781, 3788, 18441, (190, 163, 207, 121, 188, 153, 30, 55 ));
   
   type IGattProtocolErrorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InvalidHandle
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadNotPermitted
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteNotPermitted
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidPdu
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InsufficientAuthentication
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestNotSupported
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidOffset
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InsufficientAuthorization
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_PrepareQueueFull
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributeNotFound
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributeNotLong
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InsufficientEncryptionKeySize
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidAttributeValueLength
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UnlikelyError
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InsufficientEncryption
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UnsupportedGroupType
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_InsufficientResources
   (
      This       : access IGattProtocolErrorStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattSessionStatics : aliased constant Windows.IID := (778418524, 21407, 19895, (130, 168, 115, 189, 187, 247, 62, 191 ));
   
   type IGattSessionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromDeviceIdAsync
   (
      This       : access IGattSessionStatics_Interface
      ; deviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattSession : aliased constant Windows.IID := (3527102787, 57422, 19492, (153, 156, 156, 37, 111, 152, 86, 177 ));
   
   type IGattSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IGattSession_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.HRESULT is abstract;
   
   function get_CanMaintainConnection
   (
      This       : access IGattSession_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_MaintainConnection
   (
      This       : access IGattSession_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaintainConnection
   (
      This       : access IGattSession_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPduSize
   (
      This       : access IGattSession_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionStatus
   (
      This       : access IGattSession_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattSessionStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_MaxPduSizeChanged
   (
      This       : access IGattSession_Interface
      ; handler : TypedEventHandler_IGattSession_add_MaxPduSizeChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MaxPduSizeChanged
   (
      This       : access IGattSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SessionStatusChanged
   (
      This       : access IGattSession_Interface
      ; handler : TypedEventHandler_IGattSession_add_SessionStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SessionStatusChanged
   (
      This       : access IGattSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattSessionStatusChangedEventArgs : aliased constant Windows.IID := (1980086062, 33663, 16460, (171, 52, 49, 99, 243, 157, 223, 50 ));
   
   type IGattSessionStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IGattSessionStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IGattSessionStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattSessionStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDeviceServiceStatics : aliased constant Windows.IID := (426573858, 64173, 17884, (174, 91, 42, 195, 24, 78, 132, 219 ));
   
   type IGattDeviceServiceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IGattDeviceServiceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromUuid
   (
      This       : access IGattDeviceServiceStatics_Interface
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorFromShortId
   (
      This       : access IGattDeviceServiceStatics_Interface
      ; serviceShortId : Windows.UInt16
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ConvertShortIdToUuid
   (
      This       : access IGattDeviceServiceStatics_Interface
      ; shortId : Windows.UInt16
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDeviceServiceStatics2 : aliased constant Windows.IID := (100931694, 9382, 19213, (162, 242, 48, 204, 1, 84, 93, 37 ));
   
   type IGattDeviceServiceStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdWithSharingModeAsync
   (
      This       : access IGattDeviceServiceStatics2_Interface
      ; deviceId : Windows.String
      ; sharingMode : Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorForBluetoothDeviceId
   (
      This       : access IGattDeviceServiceStatics2_Interface
      ; bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorForBluetoothDeviceIdWithCacheMode
   (
      This       : access IGattDeviceServiceStatics2_Interface
      ; bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorForBluetoothDeviceIdAndUuid
   (
      This       : access IGattDeviceServiceStatics2_Interface
      ; bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode
   (
      This       : access IGattDeviceServiceStatics2_Interface
      ; bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; serviceUuid : Windows.Guid
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDeviceService : aliased constant Windows.IID := (2893773829, 45884, 18383, (153, 15, 107, 143, 85, 119, 223, 113 ));
   
   type IGattDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCharacteristics
   (
      This       : access IGattDeviceService_Interface
      ; characteristicUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattCharacteristic -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIncludedServices
   (
      This       : access IGattDeviceService_Interface
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IGattDeviceService_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uuid
   (
      This       : access IGattDeviceService_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributeHandle
   (
      This       : access IGattDeviceService_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDeviceService2 : aliased constant Windows.IID := (4233384459, 2829, 18184, (186, 224, 159, 253, 148, 137, 188, 89 ));
   
   type IGattDeviceService2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IGattDeviceService2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.IBluetoothLEDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentServices
   (
      This       : access IGattDeviceService2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAllCharacteristics
   (
      This       : access IGattDeviceService2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattCharacteristic -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAllIncludedServices
   (
      This       : access IGattDeviceService2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDeviceService3 : aliased constant Windows.IID := (2996021584, 3155, 17276, (169, 179, 92, 50, 16, 198, 229, 105 ));
   
   type IGattDeviceService3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceAccessInformation
   (
      This       : access IGattDeviceService3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDeviceAccessInformation
   )
   return Windows.HRESULT is abstract;
   
   function get_Session
   (
      This       : access IGattDeviceService3_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
   )
   return Windows.HRESULT is abstract;
   
   function get_SharingMode
   (
      This       : access IGattDeviceService3_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IGattDeviceService3_Interface
      ; RetVal : access Windows.Devices.Enumeration.IAsyncOperation_DeviceAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenAsync
   (
      This       : access IGattDeviceService3_Interface
      ; sharingMode : Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattOpenStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCharacteristicsAsync
   (
      This       : access IGattDeviceService3_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCharacteristicsWithCacheModeAsync
   (
      This       : access IGattDeviceService3_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCharacteristicsForUuidAsync
   (
      This       : access IGattDeviceService3_Interface
      ; characteristicUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCharacteristicsForUuidWithCacheModeAsync
   (
      This       : access IGattDeviceService3_Interface
      ; characteristicUuid : Windows.Guid
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattCharacteristicsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIncludedServicesAsync
   (
      This       : access IGattDeviceService3_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIncludedServicesWithCacheModeAsync
   (
      This       : access IGattDeviceService3_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIncludedServicesForUuidAsync
   (
      This       : access IGattDeviceService3_Interface
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetIncludedServicesForUuidWithCacheModeAsync
   (
      This       : access IGattDeviceService3_Interface
      ; serviceUuid : Windows.Guid
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDeviceServicesResult : aliased constant Windows.IID := (387830766, 365, 16797, (131, 138, 87, 108, 244, 117, 163, 216 ));
   
   type IGattDeviceServicesResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGattDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolError
   (
      This       : access IGattDeviceServicesResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Services
   (
      This       : access IGattDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDeviceService -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicStatics : aliased constant Windows.IID := (1506496707, 22836, 20328, (161, 152, 235, 134, 79, 164, 78, 107 ));
   
   type IGattCharacteristicStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ConvertShortIdToUuid
   (
      This       : access IGattCharacteristicStatics_Interface
      ; shortId : Windows.UInt16
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristic : aliased constant Windows.IID := (1506496705, 22836, 20328, (161, 152, 235, 134, 79, 164, 78, 107 ));
   
   type IGattCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDescriptors
   (
      This       : access IGattCharacteristic_Interface
      ; descriptorUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacteristicProperties
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectionLevel
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtectionLevel
   (
      This       : access IGattCharacteristic_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDescription
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uuid
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributeHandle
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_PresentationFormats
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattPresentationFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadValueAsync
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadValueWithCacheModeAsync
   (
      This       : access IGattCharacteristic_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteValueAsync
   (
      This       : access IGattCharacteristic_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteValueWithOptionAsync
   (
      This       : access IGattCharacteristic_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; writeOption : Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteOption
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadClientCharacteristicConfigurationDescriptorAsync
   (
      This       : access IGattCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteClientCharacteristicConfigurationDescriptorAsync
   (
      This       : access IGattCharacteristic_Interface
      ; clientCharacteristicConfigurationDescriptorValue : Windows.Devices.Bluetooth.GenericAttributeProfile.GattClientCharacteristicConfigurationDescriptorValue
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_ValueChanged
   (
      This       : access IGattCharacteristic_Interface
      ; valueChangedHandler : TypedEventHandler_IGattCharacteristic_add_ValueChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ValueChanged
   (
      This       : access IGattCharacteristic_Interface
      ; valueChangedEventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristic2 : aliased constant Windows.IID := (2920985976, 60422, 18276, (183, 128, 152, 53, 161, 211, 93, 110 ));
   
   type IGattCharacteristic2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Service
   (
      This       : access IGattCharacteristic2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function GetAllDescriptors
   (
      This       : access IGattCharacteristic2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristic3 : aliased constant Windows.IID := (1060922942, 37844, 16491, (184, 23, 219, 129, 248, 237, 83, 179 ));
   
   type IGattCharacteristic3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDescriptorsAsync
   (
      This       : access IGattCharacteristic3_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDescriptorsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDescriptorsWithCacheModeAsync
   (
      This       : access IGattCharacteristic3_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDescriptorsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDescriptorsForUuidAsync
   (
      This       : access IGattCharacteristic3_Interface
      ; descriptorUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDescriptorsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDescriptorsForUuidWithCacheModeAsync
   (
      This       : access IGattCharacteristic3_Interface
      ; descriptorUuid : Windows.Guid
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDescriptorsResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteValueWithResultAsync
   (
      This       : access IGattCharacteristic3_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteValueWithResultAndOptionAsync
   (
      This       : access IGattCharacteristic3_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; writeOption : Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteOption
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteClientCharacteristicConfigurationDescriptorWithResultAsync
   (
      This       : access IGattCharacteristic3_Interface
      ; clientCharacteristicConfigurationDescriptorValue : Windows.Devices.Bluetooth.GenericAttributeProfile.GattClientCharacteristicConfigurationDescriptorValue
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicsResult : aliased constant Windows.IID := (294949980, 45655, 20286, (157, 183, 246, 139, 201, 169, 174, 242 ));
   
   type IGattCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGattCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolError
   (
      This       : access IGattCharacteristicsResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Characteristics
   (
      This       : access IGattCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattCharacteristic -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDescriptorStatics : aliased constant Windows.IID := (2449825581, 32900, 17220, (180, 194, 40, 77, 225, 154, 133, 6 ));
   
   type IGattDescriptorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ConvertShortIdToUuid
   (
      This       : access IGattDescriptorStatics_Interface
      ; shortId : Windows.UInt16
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDescriptor : aliased constant Windows.IID := (2449825579, 32900, 17220, (180, 194, 40, 77, 225, 154, 133, 6 ));
   
   type IGattDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtectionLevel
   (
      This       : access IGattDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtectionLevel
   (
      This       : access IGattDescriptor_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_Uuid
   (
      This       : access IGattDescriptor_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributeHandle
   (
      This       : access IGattDescriptor_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function ReadValueAsync
   (
      This       : access IGattDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadValueWithCacheModeAsync
   (
      This       : access IGattDescriptor_Interface
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function WriteValueAsync
   (
      This       : access IGattDescriptor_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDescriptor2 : aliased constant Windows.IID := (2404793657, 54832, 16492, (186, 17, 16, 205, 209, 107, 14, 94 ));
   
   type IGattDescriptor2_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteValueWithResultAsync
   (
      This       : access IGattDescriptor2_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDescriptorsResult : aliased constant Windows.IID := (2613088755, 38375, 17545, (141, 37, 255, 129, 149, 90, 87, 185 ));
   
   type IGattDescriptorsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGattDescriptorsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolError
   (
      This       : access IGattDescriptorsResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Descriptors
   (
      This       : access IGattDescriptorsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattPresentationFormatTypesStatics : aliased constant Windows.IID := (4210145802, 12474, 16540, (190, 247, 207, 251, 109, 3, 184, 251 ));
   
   type IGattPresentationFormatTypesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Boolean
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Bit2
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Nibble
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt8
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt12
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt16
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt24
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt32
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt48
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt64
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_UInt128
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt8
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt12
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt16
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt24
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt32
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt48
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt64
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SInt128
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Float32
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Float64
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_SFloat
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Float
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_DUInt16
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Utf8
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Utf16
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Struct
   (
      This       : access IGattPresentationFormatTypesStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattPresentationFormatStatics : aliased constant Windows.IID := (426573856, 64173, 17884, (174, 91, 42, 195, 24, 78, 132, 219 ));
   
   type IGattPresentationFormatStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BluetoothSigAssignedNumbers
   (
      This       : access IGattPresentationFormatStatics_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattPresentationFormatStatics2 : aliased constant Windows.IID := (2848069395, 47151, 17246, (182, 52, 33, 253, 133, 164, 60, 7 ));
   
   type IGattPresentationFormatStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FromParts
   (
      This       : access IGattPresentationFormatStatics2_Interface
      ; formatType : Windows.UInt8
      ; exponent : Windows.Int32
      ; unit : Windows.UInt16
      ; namespaceId : Windows.UInt8
      ; description : Windows.UInt16
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattPresentationFormat : aliased constant Windows.IID := (426573857, 64173, 17884, (174, 91, 42, 195, 24, 78, 132, 219 ));
   
   type IGattPresentationFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FormatType
   (
      This       : access IGattPresentationFormat_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Exponent
   (
      This       : access IGattPresentationFormat_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Unit
   (
      This       : access IGattPresentationFormat_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Namespace
   (
      This       : access IGattPresentationFormat_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IGattPresentationFormat_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattValueChangedEventArgs : aliased constant Windows.IID := (3525040980, 1763, 20184, (162, 99, 172, 250, 200, 186, 115, 19 ));
   
   type IGattValueChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CharacteristicValue
   (
      This       : access IGattValueChangedEventArgs_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access IGattValueChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceUuidsStatics : aliased constant Windows.IID := (1841655896, 39610, 17431, (184, 242, 220, 224, 22, 211, 78, 226 ));
   
   type IGattServiceUuidsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Battery
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BloodPressure
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingSpeedAndCadence
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GenericAccess
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GenericAttribute
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Glucose
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HealthThermometer
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HeartRate
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RunningSpeedAndCadence
   (
      This       : access IGattServiceUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceUuidsStatics2 : aliased constant Windows.IID := (3534656757, 15637, 20345, (156, 12, 234, 175, 166, 117, 21, 92 ));
   
   type IGattServiceUuidsStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlertNotification
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentTime
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingPower
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceInformation
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HumanInterfaceDevice
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ImmediateAlert
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_LinkLoss
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationAndNavigation
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_NextDstChange
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneAlertStatus
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ReferenceTimeUpdate
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanParameters
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TxPower
   (
      This       : access IGattServiceUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicUuidsStatics : aliased constant Windows.IID := (1492796806, 45534, 18188, (183, 222, 13, 17, 255, 68, 244, 183 ));
   
   type IGattCharacteristicUuidsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BatteryLevel
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BloodPressureFeature
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BloodPressureMeasurement
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BodySensorLocation
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CscFeature
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CscMeasurement
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GlucoseFeature
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GlucoseMeasurement
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GlucoseMeasurementContext
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HeartRateControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HeartRateMeasurement
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_IntermediateCuffPressure
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_IntermediateTemperature
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_MeasurementInterval
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RecordAccessControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RscFeature
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RscMeasurement
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SCControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SensorLocation
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TemperatureMeasurement
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TemperatureType
   (
      This       : access IGattCharacteristicUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattCharacteristicUuidsStatics2 : aliased constant Windows.IID := (408269861, 54382, 18988, (156, 63, 237, 109, 234, 41, 231, 190 ));
   
   type IGattCharacteristicUuidsStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlertCategoryId
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_AlertCategoryIdBitMask
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_AlertLevel
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_AlertNotificationControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_AlertStatus
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GapAppearance
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BootKeyboardInputReport
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BootKeyboardOutputReport
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BootMouseInputReport
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrentTime
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingPowerControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingPowerFeature
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingPowerMeasurement
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CyclingPowerVector
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DateTime
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DayDateTime
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DayOfWeek
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GapDeviceName
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DstOffset
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ExactTime256
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_FirmwareRevisionString
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareRevisionString
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HidControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_HidInformation
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Ieee1107320601RegulatoryCertificationDataList
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_LnControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_LnFeature
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalTimeInformation
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_LocationAndSpeed
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ManufacturerNameString
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelNumberString
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Navigation
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_NewAlert
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GapPeripheralPreferredConnectionParameters
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GapPeripheralPrivacyFlag
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_PnpId
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionQuality
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolMode
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GapReconnectionAddress
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ReferenceTimeInformation
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Report
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportMap
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RingerControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_RingerSetting
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanIntervalWindow
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanRefresh
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SerialNumberString
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_GattServiceChanged
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SoftwareRevisionString
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedNewAlertCategory
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportUnreadAlertCategory
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemId
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeAccuracy
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeSource
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeUpdateControlPoint
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeUpdateState
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeWithDst
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeZone
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_TxPowerLevel
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_UnreadAlertStatus
   (
      This       : access IGattCharacteristicUuidsStatics2_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattDescriptorUuidsStatics : aliased constant Windows.IID := (2801296078, 40188, 17137, (145, 133, 255, 55, 183, 81, 129, 211 ));
   
   type IGattDescriptorUuidsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CharacteristicAggregateFormat
   (
      This       : access IGattDescriptorUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacteristicExtendedProperties
   (
      This       : access IGattDescriptorUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacteristicPresentationFormat
   (
      This       : access IGattDescriptorUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacteristicUserDescription
   (
      This       : access IGattDescriptorUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientCharacteristicConfiguration
   (
      This       : access IGattDescriptorUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ServerCharacteristicConfiguration
   (
      This       : access IGattDescriptorUuidsStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReliableWriteTransaction : aliased constant Windows.IID := (1671851783, 6890, 19532, (165, 15, 151, 186, 228, 116, 179, 72 ));
   
   type IGattReliableWriteTransaction_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteValue
   (
      This       : access IGattReliableWriteTransaction_Interface
      ; characteristic : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CommitAsync
   (
      This       : access IGattReliableWriteTransaction_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReliableWriteTransaction2 : aliased constant Windows.IID := (1360083335, 61202, 17967, (159, 178, 161, 164, 58, 103, 148, 22 ));
   
   type IGattReliableWriteTransaction2_Interface is interface and Windows.IInspectable_Interface;
   
   function CommitWithResultAsync
   (
      This       : access IGattReliableWriteTransaction2_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReadResult : aliased constant Windows.IID := (1671851784, 6890, 19532, (165, 15, 151, 186, 228, 116, 179, 72 ));
   
   type IGattReadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGattReadResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IGattReadResult_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReadResult2 : aliased constant Windows.IID := (2702135456, 64323, 18607, (186, 170, 99, 138, 92, 99, 41, 254 ));
   
   type IGattReadResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtocolError
   (
      This       : access IGattReadResult2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattWriteResult : aliased constant Windows.IID := (1234296241, 52011, 17655, (153, 252, 210, 154, 40, 113, 220, 155 ));
   
   type IGattWriteResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGattWriteResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolError
   (
      This       : access IGattWriteResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReadClientCharacteristicConfigurationDescriptorResult : aliased constant Windows.IID := (1671851785, 6890, 19532, (165, 15, 151, 186, 228, 116, 179, 72 ));
   
   type IGattReadClientCharacteristicConfigurationDescriptorResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IGattReadClientCharacteristicConfigurationDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ClientCharacteristicConfigurationDescriptor
   (
      This       : access IGattReadClientCharacteristicConfigurationDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattClientCharacteristicConfigurationDescriptorValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReadClientCharacteristicConfigurationDescriptorResult2 : aliased constant Windows.IID := (468821405, 47693, 17954, (134, 81, 244, 238, 21, 13, 10, 93 ));
   
   type IGattReadClientCharacteristicConfigurationDescriptorResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProtocolError
   (
      This       : access IGattReadClientCharacteristicConfigurationDescriptorResult2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProviderAdvertisingParameters : aliased constant Windows.IID := (3805163947, 25365, 19490, (155, 215, 120, 29, 188, 61, 141, 130 ));
   
   type IGattServiceProviderAdvertisingParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsConnectable
   (
      This       : access IGattServiceProviderAdvertisingParameters_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsConnectable
   (
      This       : access IGattServiceProviderAdvertisingParameters_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDiscoverable
   (
      This       : access IGattServiceProviderAdvertisingParameters_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDiscoverable
   (
      This       : access IGattServiceProviderAdvertisingParameters_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattLocalCharacteristicParameters : aliased constant Windows.IID := (4210507188, 19711, 17607, (132, 69, 4, 14, 110, 173, 0, 99 ));
   
   type IGattLocalCharacteristicParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function put_StaticValue
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_StaticValue
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_CharacteristicProperties
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacteristicProperties
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicProperties
   )
   return Windows.HRESULT is abstract;
   
   function put_ReadProtectionLevel
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadProtectionLevel
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_WriteProtectionLevel
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteProtectionLevel
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_UserDescription
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDescription
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PresentationFormats
   (
      This       : access IGattLocalCharacteristicParameters_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVector_IGattPresentationFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattLocalDescriptorParameters : aliased constant Windows.IID := (1608441450, 62401, 19302, (140, 75, 227, 210, 41, 59, 64, 233 ));
   
   type IGattLocalDescriptorParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function put_StaticValue
   (
      This       : access IGattLocalDescriptorParameters_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_StaticValue
   (
      This       : access IGattLocalDescriptorParameters_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_ReadProtectionLevel
   (
      This       : access IGattLocalDescriptorParameters_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadProtectionLevel
   (
      This       : access IGattLocalDescriptorParameters_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_WriteProtectionLevel
   (
      This       : access IGattLocalDescriptorParameters_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteProtectionLevel
   (
      This       : access IGattLocalDescriptorParameters_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProviderStatics : aliased constant Windows.IID := (830029923, 21078, 16468, (164, 244, 123, 190, 119, 85, 165, 126 ));
   
   type IGattServiceProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAsync
   (
      This       : access IGattServiceProviderStatics_Interface
      ; serviceUuid : Windows.Guid
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattServiceProviderResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProvider : aliased constant Windows.IID := (2015540173, 10377, 20358, (160, 81, 63, 10, 237, 28, 39, 96 ));
   
   type IGattServiceProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Service
   (
      This       : access IGattServiceProvider_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService
   )
   return Windows.HRESULT is abstract;
   
   function get_AdvertisementStatus
   (
      This       : access IGattServiceProvider_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisementStatus
   )
   return Windows.HRESULT is abstract;
   
   function add_AdvertisementStatusChanged
   (
      This       : access IGattServiceProvider_Interface
      ; handler : TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AdvertisementStatusChanged
   (
      This       : access IGattServiceProvider_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function StartAdvertising
   (
      This       : access IGattServiceProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function StartAdvertisingWithParameters
   (
      This       : access IGattServiceProvider_Interface
      ; parameters : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters
   )
   return Windows.HRESULT is abstract;
   
   function StopAdvertising
   (
      This       : access IGattServiceProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProviderAdvertisementStatusChangedEventArgs : aliased constant Windows.IID := (1504029285, 64033, 20476, (177, 85, 4, 217, 40, 1, 38, 134 ));
   
   type IGattServiceProviderAdvertisementStatusChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IGattServiceProviderAdvertisementStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IGattServiceProviderAdvertisementStatusChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisementStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattServiceProviderResult : aliased constant Windows.IID := (1984337624, 50494, 17036, (138, 72, 103, 175, 224, 44, 58, 230 ));
   
   type IGattServiceProviderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Error
   (
      This       : access IGattServiceProviderResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceProvider
   (
      This       : access IGattServiceProviderResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattLocalService : aliased constant Windows.IID := (4111721048, 63479, 18690, (184, 3, 87, 252, 199, 214, 254, 131 ));
   
   type IGattLocalService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uuid
   (
      This       : access IGattLocalService_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function CreateCharacteristicAsync
   (
      This       : access IGattLocalService_Interface
      ; characteristicUuid : Windows.Guid
      ; parameters : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalCharacteristicResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Characteristics
   (
      This       : access IGattLocalService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattLocalCharacteristic -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattLocalCharacteristic : aliased constant Windows.IID := (2933798765, 21522, 19828, (146, 168, 141, 235, 133, 38, 130, 156 ));
   
   type IGattLocalCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uuid
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_StaticValue
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacteristicProperties
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadProtectionLevel
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteProtectionLevel
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function CreateDescriptorAsync
   (
      This       : access IGattLocalCharacteristic_Interface
      ; descriptorUuid : Windows.Guid
      ; parameters : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalDescriptorResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Descriptors
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattLocalDescriptor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDescription
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PresentationFormats
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattPresentationFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SubscribedClients
   (
      This       : access IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattSubscribedClient -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_SubscribedClientsChanged
   (
      This       : access IGattLocalCharacteristic_Interface
      ; handler : TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SubscribedClientsChanged
   (
      This       : access IGattLocalCharacteristic_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadRequested
   (
      This       : access IGattLocalCharacteristic_Interface
      ; handler : TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadRequested
   (
      This       : access IGattLocalCharacteristic_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_WriteRequested
   (
      This       : access IGattLocalCharacteristic_Interface
      ; handler : TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WriteRequested
   (
      This       : access IGattLocalCharacteristic_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function NotifyValueAsync
   (
      This       : access IGattLocalCharacteristic_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function NotifyValueForSubscribedClientAsync
   (
      This       : access IGattLocalCharacteristic_Interface
      ; value : Windows.Storage.Streams.IBuffer
      ; subscribedClient : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattClientNotificationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattLocalCharacteristicResult : aliased constant Windows.IID := (2037767835, 368, 17303, (150, 102, 146, 248, 99, 241, 46, 230 ));
   
   type IGattLocalCharacteristicResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Characteristic
   (
      This       : access IGattLocalCharacteristicResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IGattLocalCharacteristicResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattSubscribedClient : aliased constant Windows.IID := (1936625665, 5540, 20162, (146, 72, 227, 242, 13, 70, 59, 233 ));
   
   type IGattSubscribedClient_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IGattSubscribedClient_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxNotificationSize
   (
      This       : access IGattSubscribedClient_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function add_MaxNotificationSizeChanged
   (
      This       : access IGattSubscribedClient_Interface
      ; handler : TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MaxNotificationSizeChanged
   (
      This       : access IGattSubscribedClient_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattClientNotificationResult : aliased constant Windows.IID := (1349342617, 274, 16794, (142, 59, 174, 33, 175, 171, 210, 194 ));
   
   type IGattClientNotificationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SubscribedClient
   (
      This       : access IGattClientNotificationResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IGattClientNotificationResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtocolError
   (
      This       : access IGattClientNotificationResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattClientNotificationResult2 : aliased constant Windows.IID := (2410595479, 17888, 18814, (149, 130, 41, 161, 254, 40, 26, 213 ));
   
   type IGattClientNotificationResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BytesSent
   (
      This       : access IGattClientNotificationResult2_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattLocalDescriptor : aliased constant Windows.IID := (4102995462, 30877, 19019, (134, 82, 189, 1, 123, 93, 47, 198 ));
   
   type IGattLocalDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uuid
   (
      This       : access IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_StaticValue
   (
      This       : access IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadProtectionLevel
   (
      This       : access IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_WriteProtectionLevel
   (
      This       : access IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
   )
   return Windows.HRESULT is abstract;
   
   function add_ReadRequested
   (
      This       : access IGattLocalDescriptor_Interface
      ; handler : TypedEventHandler_IGattLocalDescriptor_add_ReadRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ReadRequested
   (
      This       : access IGattLocalDescriptor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_WriteRequested
   (
      This       : access IGattLocalDescriptor_Interface
      ; handler : TypedEventHandler_IGattLocalDescriptor_add_WriteRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_WriteRequested
   (
      This       : access IGattLocalDescriptor_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattLocalDescriptorResult : aliased constant Windows.IID := (928485822, 12831, 17254, (191, 193, 59, 198, 184, 44, 121, 248 ));
   
   type IGattLocalDescriptorResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Descriptor
   (
      This       : access IGattLocalDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IGattLocalDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReadRequest : aliased constant Windows.IID := (4057818421, 27341, 17062, (164, 187, 215, 137, 218, 224, 4, 62 ));
   
   type IGattReadRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Offset
   (
      This       : access IGattReadRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IGattReadRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IGattReadRequest_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattRequestState
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access IGattReadRequest_Interface
      ; handler : TypedEventHandler_IGattReadRequest_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IGattReadRequest_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RespondWithValue
   (
      This       : access IGattReadRequest_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function RespondWithProtocolError
   (
      This       : access IGattReadRequest_Interface
      ; protocolError : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattWriteRequest : aliased constant Windows.IID := (2931206637, 56879, 20418, (169, 168, 148, 234, 120, 68, 241, 61 ));
   
   type IGattWriteRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IGattWriteRequest_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access IGattWriteRequest_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Option
   (
      This       : access IGattWriteRequest_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteOption
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IGattWriteRequest_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattRequestState
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access IGattWriteRequest_Interface
      ; handler : TypedEventHandler_IGattWriteRequest_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IGattWriteRequest_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Respond
   (
      This       : access IGattWriteRequest_Interface
   )
   return Windows.HRESULT is abstract;
   
   function RespondWithProtocolError
   (
      This       : access IGattWriteRequest_Interface
      ; protocolError : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattReadRequestedEventArgs : aliased constant Windows.IID := (2471064131, 62364, 18507, (138, 182, 153, 107, 164, 134, 207, 163 ));
   
   type IGattReadRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IGattReadRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IGattReadRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   function GetRequestAsync
   (
      This       : access IGattReadRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadRequest -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattWriteRequestedEventArgs : aliased constant Windows.IID := (770476990, 42810, 18202, (148, 213, 3, 125, 234, 221, 8, 6 ));
   
   type IGattWriteRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IGattWriteRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IGattWriteRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   function GetRequestAsync
   (
      This       : access IGattWriteRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteRequest -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGattRequestStateChangedEventArgs : aliased constant Windows.IID := (3895777580, 10174, 17587, (157, 13, 79, 198, 232, 8, 221, 63 ));
   
   type IGattRequestStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IGattRequestStateChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattRequestState
   )
   return Windows.HRESULT is abstract;
   
   function get_Error
   (
      This       : access IGattRequestStateChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.BluetoothError
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattDeviceService : aliased constant Windows.IID := (2347448870, 29642, 20723, (161, 211, 65, 140, 96, 169, 243, 178 ));
   
   type IIterator_IGattDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattDeviceService_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattDeviceService_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattDeviceService_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattDeviceService : aliased constant Windows.IID := (1259941411, 18579, 22194, (142, 255, 67, 156, 58, 183, 253, 31 ));
   
   type IIterable_IGattDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattDeviceService : aliased constant Windows.IID := (2089713629, 41377, 21130, (129, 209, 41, 103, 105, 34, 122, 8 ));
   
   type IVectorView_IGattDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattDeviceService_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattDeviceService_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattDeviceService_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattDeviceService_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattDeviceServicesResult : aliased constant Windows.IID := (3888539638, 59508, 20495, (134, 255, 118, 12, 166, 240, 122, 88 ));
   
   type IAsyncOperation_IGattDeviceServicesResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattDeviceServicesResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattDeviceServicesResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattDeviceServicesResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattDeviceServicesResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattSession : aliased constant Windows.IID := (1832957031, 18105, 20847, (130, 8, 219, 35, 183, 134, 234, 72 ));
   
   type IAsyncOperation_IGattSession_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattSession_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattSession
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattSession_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattSession
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattSession_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattDeviceService : aliased constant Windows.IID := (3857252978, 16527, 20565, (155, 211, 136, 64, 137, 130, 211, 1 ));
   
   type IAsyncOperation_IGattDeviceService_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattDeviceService_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattDeviceService_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattCharacteristic : aliased constant Windows.IID := (536627063, 17222, 21860, (183, 165, 89, 234, 227, 133, 244, 246 ));
   
   type IIterator_IGattCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattCharacteristic_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattCharacteristic_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattCharacteristic_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattCharacteristic : aliased constant Windows.IID := (3821365032, 32557, 23053, (173, 56, 3, 13, 57, 198, 15, 159 ));
   
   type IIterable_IGattCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattCharacteristic : aliased constant Windows.IID := (3409621934, 46433, 20559, (168, 8, 89, 157, 236, 235, 45, 244 ));
   
   type IVectorView_IGattCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattCharacteristic_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattCharacteristic_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattCharacteristic_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattCharacteristic_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_GattOpenStatus : aliased constant Windows.IID := (2553414060, 34679, 21480, (134, 224, 99, 250, 104, 75, 225, 189 ));
   
   type IAsyncOperation_GattOpenStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_GattOpenStatus_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_GattOpenStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_GattOpenStatus_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_GattOpenStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_GattOpenStatus_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattCharacteristicsResult : aliased constant Windows.IID := (158472522, 44060, 21814, (152, 134, 39, 229, 138, 24, 242, 115 ));
   
   type IAsyncOperation_IGattCharacteristicsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattCharacteristicsResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattCharacteristicsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattDescriptor : aliased constant Windows.IID := (1032713270, 52987, 24571, (133, 140, 72, 130, 206, 29, 160, 121 ));
   
   type IIterator_IGattDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattDescriptor_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattDescriptor : aliased constant Windows.IID := (820182980, 15011, 21017, (154, 24, 202, 45, 11, 101, 98, 232 ));
   
   type IIterable_IGattDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattDescriptor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattDescriptor : aliased constant Windows.IID := (425746088, 29654, 22368, (132, 155, 254, 95, 138, 43, 208, 92 ));
   
   type IVectorView_IGattDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattDescriptor_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattPresentationFormat : aliased constant Windows.IID := (536898643, 24026, 21273, (145, 177, 198, 242, 143, 230, 89, 51 ));
   
   type IIterator_IGattPresentationFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattPresentationFormat_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattPresentationFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattPresentationFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattPresentationFormat_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattPresentationFormat : aliased constant Windows.IID := (3613380337, 49422, 23419, (177, 48, 245, 160, 3, 20, 211, 93 ));
   
   type IIterable_IGattPresentationFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattPresentationFormat_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattPresentationFormat : aliased constant Windows.IID := (245547348, 8888, 23694, (146, 93, 212, 126, 26, 173, 49, 187 ));
   
   type IVectorView_IGattPresentationFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattPresentationFormat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattPresentationFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattPresentationFormat_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattPresentationFormat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattReadResult : aliased constant Windows.IID := (3557044904, 7700, 20944, (180, 155, 174, 44, 225, 170, 5, 229 ));
   
   type IAsyncOperation_IGattReadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattReadResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattReadResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattReadResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattReadResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattReadResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_GattCommunicationStatus : aliased constant Windows.IID := (1073124630, 7163, 21225, (158, 230, 229, 205, 183, 142, 22, 131 ));
   
   type IAsyncOperation_GattCommunicationStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_GattCommunicationStatus_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_GattCommunicationStatus_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_GattCommunicationStatus_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult : aliased constant Windows.IID := (3477357772, 16503, 22297, (131, 102, 70, 232, 107, 152, 54, 133 ));
   
   type IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattDescriptorsResult : aliased constant Windows.IID := (3467591879, 48695, 21157, (154, 27, 99, 57, 133, 19, 229, 151 ));
   
   type IAsyncOperation_IGattDescriptorsResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattDescriptorsResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattDescriptorsResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattDescriptorsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattDescriptorsResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattDescriptorsResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattWriteResult : aliased constant Windows.IID := (3896198452, 48404, 23195, (165, 59, 23, 204, 2, 162, 168, 168 ));
   
   type IAsyncOperation_IGattWriteResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattWriteResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattWriteResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattWriteResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattWriteResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattWriteResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IGattPresentationFormat : aliased constant Windows.IID := (3416667631, 7280, 21522, (142, 222, 115, 22, 39, 107, 158, 228 ));
   
   type IVector_IGattPresentationFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IVectorView_IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IGattPresentationFormat_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IGattPresentationFormat_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IGattPresentationFormat_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattServiceProviderResult : aliased constant Windows.IID := (561516584, 62882, 23961, (165, 171, 188, 230, 85, 79, 188, 2 ));
   
   type IAsyncOperation_IGattServiceProviderResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattServiceProviderResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattServiceProviderResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattServiceProviderResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattServiceProviderResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattServiceProviderResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattLocalCharacteristicResult : aliased constant Windows.IID := (529995342, 35029, 22141, (144, 249, 117, 212, 246, 69, 82, 116 ));
   
   type IAsyncOperation_IGattLocalCharacteristicResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattLocalCharacteristicResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattLocalCharacteristicResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattLocalCharacteristicResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattLocalCharacteristicResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattLocalCharacteristicResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattLocalCharacteristic : aliased constant Windows.IID := (3990308981, 36485, 21615, (131, 184, 30, 0, 170, 137, 100, 25 ));
   
   type IIterator_IGattLocalCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattLocalCharacteristic_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattLocalCharacteristic : aliased constant Windows.IID := (1887628627, 14326, 21090, (141, 9, 147, 155, 234, 158, 219, 213 ));
   
   type IIterable_IGattLocalCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattLocalCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattLocalCharacteristic : aliased constant Windows.IID := (3834011322, 28131, 23193, (154, 117, 126, 253, 142, 60, 176, 150 ));
   
   type IVectorView_IGattLocalCharacteristic_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattLocalCharacteristic_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattLocalCharacteristic_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattLocalCharacteristic_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattLocalCharacteristic_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattLocalDescriptorResult : aliased constant Windows.IID := (1056364552, 30031, 20544, (151, 172, 7, 3, 48, 156, 87, 79 ));
   
   type IAsyncOperation_IGattLocalDescriptorResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattLocalDescriptorResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattLocalDescriptorResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattLocalDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattLocalDescriptorResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattLocalDescriptorResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattLocalDescriptor : aliased constant Windows.IID := (134361157, 24412, 22988, (171, 211, 187, 207, 230, 250, 112, 48 ));
   
   type IIterator_IGattLocalDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattLocalDescriptor_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattLocalDescriptor : aliased constant Windows.IID := (2417420706, 51703, 23817, (176, 174, 85, 47, 166, 119, 150, 174 ));
   
   type IIterable_IGattLocalDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattLocalDescriptor_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattLocalDescriptor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattLocalDescriptor : aliased constant Windows.IID := (2135328972, 3004, 20592, (137, 116, 25, 252, 177, 172, 191, 108 ));
   
   type IVectorView_IGattLocalDescriptor_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattLocalDescriptor_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattLocalDescriptor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattLocalDescriptor_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattLocalDescriptor_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattSubscribedClient : aliased constant Windows.IID := (3741552917, 42495, 23898, (176, 123, 32, 180, 46, 7, 135, 101 ));
   
   type IIterator_IGattSubscribedClient_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattSubscribedClient_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattSubscribedClient_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattSubscribedClient_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattSubscribedClient_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattSubscribedClient : aliased constant Windows.IID := (2979554532, 62129, 20702, (140, 17, 255, 249, 236, 169, 52, 233 ));
   
   type IIterable_IGattSubscribedClient_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattSubscribedClient_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattSubscribedClient
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattSubscribedClient : aliased constant Windows.IID := (1664687481, 19367, 24389, (150, 129, 58, 104, 48, 137, 53, 59 ));
   
   type IVectorView_IGattSubscribedClient_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattSubscribedClient_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattSubscribedClient_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattSubscribedClient_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattSubscribedClient_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattClientNotificationResult : aliased constant Windows.IID := (3727148495, 25127, 22569, (185, 151, 136, 229, 117, 173, 6, 128 ));
   
   type IAsyncOperation_IGattClientNotificationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattClientNotificationResult_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattClientNotificationResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattClientNotificationResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattClientNotificationResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattClientNotificationResult_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattReadRequest : aliased constant Windows.IID := (1194512066, 55619, 23787, (130, 129, 141, 84, 162, 27, 154, 69 ));
   
   type IAsyncOperation_IGattReadRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattReadRequest_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattReadRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattReadRequest_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattReadRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattReadRequest_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IGattWriteRequest : aliased constant Windows.IID := (4220206104, 12128, 23363, (183, 115, 20, 96, 69, 129, 110, 3 ));
   
   type IAsyncOperation_IGattWriteRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IGattWriteRequest_Interface
      ; handler : Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattWriteRequest
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IGattWriteRequest_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.AsyncOperationCompletedHandler_IGattWriteRequest
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IGattWriteRequest_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IGattValueChangedEventArgs : aliased constant Windows.IID := (3441469334, 43554, 21021, (142, 15, 252, 109, 74, 24, 226, 135 ));
   
   type IIterator_IGattValueChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IGattValueChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IGattValueChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IGattValueChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IGattValueChangedEventArgs_Interface
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IGattValueChangedEventArgs : aliased constant Windows.IID := (1382704095, 34855, 20921, (158, 44, 157, 101, 2, 26, 121, 215 ));
   
   type IIterable_IGattValueChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IGattValueChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IIterator_IGattValueChangedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IGattValueChangedEventArgs : aliased constant Windows.IID := (1066854495, 51793, 21251, (189, 27, 172, 236, 119, 115, 186, 246 ));
   
   type IVectorView_IGattValueChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IGattValueChangedEventArgs_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IGattValueChangedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IGattValueChangedEventArgs_Interface
      ; value : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IGattValueChangedEventArgs_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattDeviceServicesResult : aliased constant Windows.IID := (1957365906, 42545, 23916, (177, 180, 189, 46, 26, 116, 26, 155 ));
   
   type AsyncOperationCompletedHandler_IGattDeviceServicesResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattDeviceServicesResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattDeviceServicesResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceServicesResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattSession : aliased constant Windows.IID := (3403684392, 64819, 21550, (165, 173, 61, 135, 143, 115, 219, 144 ));
   
   type AsyncOperationCompletedHandler_IGattSession_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattSession ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattSession'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattSession_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattSession
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattSession_add_MaxPduSizeChanged : aliased constant Windows.IID := (1820246764, 40704, 24224, (154, 8, 96, 229, 7, 11, 207, 3 ));
   
   type TypedEventHandler_IGattSession_add_MaxPduSizeChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattSession_add_MaxPduSizeChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattSession_add_MaxPduSizeChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattSession_add_SessionStatusChanged : aliased constant Windows.IID := (236065010, 31599, 21566, (138, 219, 166, 29, 52, 171, 83, 93 ));
   
   type TypedEventHandler_IGattSession_add_SessionStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattSession_add_SessionStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattSession_add_SessionStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattDeviceService : aliased constant Windows.IID := (767358538, 9771, 22280, (173, 177, 195, 184, 117, 11, 214, 128 ));
   
   type AsyncOperationCompletedHandler_IGattDeviceService_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattDeviceService'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattDeviceService_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_GattOpenStatus : aliased constant Windows.IID := (1418411216, 56552, 23869, (152, 171, 105, 72, 221, 127, 144, 184 ));
   
   type AsyncOperationCompletedHandler_GattOpenStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattOpenStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_GattOpenStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_GattOpenStatus_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattOpenStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattCharacteristicsResult : aliased constant Windows.IID := (3600897141, 7794, 23638, (152, 232, 136, 244, 188, 62, 3, 19 ));
   
   type AsyncOperationCompletedHandler_IGattCharacteristicsResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattCharacteristicsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattCharacteristicsResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattCharacteristicsResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattCharacteristicsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattReadResult : aliased constant Windows.IID := (3633916576, 60098, 21943, (146, 197, 137, 72, 134, 190, 176, 202 ));
   
   type AsyncOperationCompletedHandler_IGattReadResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattReadResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattReadResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_GattCommunicationStatus : aliased constant Windows.IID := (559157626, 38797, 23003, (153, 207, 107, 105, 12, 179, 56, 155 ));
   
   type AsyncOperationCompletedHandler_GattCommunicationStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_GattCommunicationStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_GattCommunicationStatus_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_GattCommunicationStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult : aliased constant Windows.IID := (2566498035, 19753, 21329, (139, 18, 117, 29, 201, 119, 163, 49 ));
   
   type AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattReadClientCharacteristicConfigurationDescriptorResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadClientCharacteristicConfigurationDescriptorResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattCharacteristic_add_ValueChanged : aliased constant Windows.IID := (3254001910, 25234, 22368, (162, 201, 157, 223, 152, 104, 60, 252 ));
   
   type TypedEventHandler_IGattCharacteristic_add_ValueChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattCharacteristic_add_ValueChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattCharacteristic_add_ValueChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattDescriptorsResult : aliased constant Windows.IID := (3741953655, 62982, 21476, (139, 166, 121, 159, 89, 146, 200, 94 ));
   
   type AsyncOperationCompletedHandler_IGattDescriptorsResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDescriptorsResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattDescriptorsResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattDescriptorsResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDescriptorsResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattWriteResult : aliased constant Windows.IID := (1873332675, 65406, 24481, (162, 243, 39, 20, 207, 4, 184, 153 ));
   
   type AsyncOperationCompletedHandler_IGattWriteResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattWriteResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattWriteResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattServiceProviderResult : aliased constant Windows.IID := (4187125914, 59777, 22906, (145, 151, 31, 189, 152, 111, 116, 199 ));
   
   type AsyncOperationCompletedHandler_IGattServiceProviderResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattServiceProviderResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattServiceProviderResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattServiceProviderResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattServiceProviderResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged : aliased constant Windows.IID := (1456357808, 9584, 20691, (161, 177, 126, 65, 103, 225, 253, 231 ));
   
   type TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattServiceProvider_add_AdvertisementStatusChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattLocalCharacteristicResult : aliased constant Windows.IID := (2244415197, 55317, 21124, (140, 132, 88, 168, 247, 105, 227, 136 ));
   
   type AsyncOperationCompletedHandler_IGattLocalCharacteristicResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalCharacteristicResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattLocalCharacteristicResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattLocalCharacteristicResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalCharacteristicResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattLocalDescriptorResult : aliased constant Windows.IID := (4069687020, 18393, 21304, (155, 165, 91, 232, 70, 26, 212, 16 ));
   
   type AsyncOperationCompletedHandler_IGattLocalDescriptorResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalDescriptorResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattLocalDescriptorResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattLocalDescriptorResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattLocalDescriptorResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged : aliased constant Windows.IID := (2156375254, 44759, 21483, (155, 35, 72, 8, 187, 145, 12, 23 ));
   
   type TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalCharacteristic_add_SubscribedClientsChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested : aliased constant Windows.IID := (562708042, 43677, 20494, (188, 167, 4, 119, 81, 187, 16, 163 ));
   
   type TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalCharacteristic_add_ReadRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested : aliased constant Windows.IID := (3982598907, 32042, 23459, (142, 191, 138, 216, 120, 229, 57, 169 ));
   
   type TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalCharacteristic_add_WriteRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattClientNotificationResult : aliased constant Windows.IID := (2542010097, 7010, 21528, (152, 152, 147, 49, 56, 194, 189, 20 ));
   
   type AsyncOperationCompletedHandler_IGattClientNotificationResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattClientNotificationResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattClientNotificationResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattClientNotificationResult_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattClientNotificationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged : aliased constant Windows.IID := (2618794256, 32877, 22859, (179, 61, 237, 40, 11, 191, 39, 229 ));
   
   type TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattSubscribedClient_add_MaxNotificationSizeChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattLocalDescriptor_add_ReadRequested : aliased constant Windows.IID := (623757916, 34535, 23521, (174, 237, 247, 140, 110, 212, 102, 171 ));
   
   type TypedEventHandler_IGattLocalDescriptor_add_ReadRequested_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattLocalDescriptor_add_ReadRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalDescriptor_add_ReadRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattLocalDescriptor_add_WriteRequested : aliased constant Windows.IID := (1828041065, 14129, 22811, (174, 124, 217, 57, 250, 170, 138, 113 ));
   
   type TypedEventHandler_IGattLocalDescriptor_add_WriteRequested_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattLocalDescriptor_add_WriteRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattLocalDescriptor_add_WriteRequested_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattReadRequest_add_StateChanged : aliased constant Windows.IID := (38199705, 20889, 23515, (145, 157, 133, 68, 206, 48, 253, 113 ));
   
   type TypedEventHandler_IGattReadRequest_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattReadRequest_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattReadRequest_add_StateChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IGattWriteRequest_add_StateChanged : aliased constant Windows.IID := (2000996028, 52685, 21123, (158, 79, 46, 33, 180, 154, 46, 242 ));
   
   type TypedEventHandler_IGattWriteRequest_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IGattWriteRequest_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IGattWriteRequest_add_StateChanged_Interface
      ; sender : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest
      ; args : Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattReadRequest : aliased constant Windows.IID := (830617672, 15026, 21626, (131, 3, 150, 77, 204, 55, 124, 156 ));
   
   type AsyncOperationCompletedHandler_IGattReadRequest_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadRequest ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattReadRequest'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattReadRequest_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattReadRequest
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IGattWriteRequest : aliased constant Windows.IID := (632764406, 12543, 21902, (186, 22, 181, 100, 196, 95, 220, 6 ));
   
   type AsyncOperationCompletedHandler_IGattWriteRequest_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteRequest ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IGattWriteRequest'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IGattWriteRequest_Interface
      ; asyncInfo : Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattWriteRequest
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype GattDeviceService is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService;
   subtype GattDeviceServicesResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult;
   subtype GattSession is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession;
   subtype GattSessionStatusChangedEventArgs is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs;
   subtype GattCharacteristic is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic;
   subtype GattCharacteristicsResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult;
   subtype GattDescriptor is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor;
   subtype GattPresentationFormat is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat;
   subtype GattReadResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult;
   subtype GattReadClientCharacteristicConfigurationDescriptorResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult;
   subtype GattValueChangedEventArgs is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs;
   subtype GattDescriptorsResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult;
   subtype GattWriteResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult;
   subtype GattReliableWriteTransaction is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction;
   function CreateGattReliableWriteTransaction return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction;
   
   subtype GattServiceProviderAdvertisingParameters is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters;
   function CreateGattServiceProviderAdvertisingParameters return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters;
   
   subtype GattLocalCharacteristicParameters is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters;
   function CreateGattLocalCharacteristicParameters return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters;
   
   subtype GattLocalDescriptorParameters is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters;
   function CreateGattLocalDescriptorParameters return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters;
   
   subtype GattServiceProviderResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult;
   subtype GattLocalService is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService;
   subtype GattServiceProvider is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider;
   subtype GattServiceProviderAdvertisementStatusChangedEventArgs is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs;
   subtype GattLocalCharacteristicResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult;
   subtype GattLocalCharacteristic is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic;
   subtype GattLocalDescriptorResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult;
   subtype GattLocalDescriptor is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor;
   subtype GattSubscribedClient is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient;
   subtype GattReadRequestedEventArgs is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs;
   subtype GattWriteRequestedEventArgs is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs;
   subtype GattClientNotificationResult is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult;
   subtype GattReadRequest is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest;
   subtype GattRequestStateChangedEventArgs is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs;
   subtype GattWriteRequest is Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService;
   
   function GetDeviceSelectorFromUuid
   (
      serviceUuid : Windows.Guid
   )
   return Windows.String;
   
   function GetDeviceSelectorFromShortId
   (
      serviceShortId : Windows.UInt16
   )
   return Windows.String;
   
   function ConvertShortIdToUuid
   (
      shortId : Windows.UInt16
   )
   return Windows.Guid;
   
   function FromIdWithSharingModeAsync
   (
      deviceId : Windows.String
      ; sharingMode : Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattDeviceService;
   
   function GetDeviceSelectorForBluetoothDeviceId
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.String;
   
   function GetDeviceSelectorForBluetoothDeviceIdWithCacheMode
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String;
   
   function GetDeviceSelectorForBluetoothDeviceIdAndUuid
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; serviceUuid : Windows.Guid
   )
   return Windows.String;
   
   function GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode
   (
      bluetoothDeviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
      ; serviceUuid : Windows.Guid
      ; cacheMode : Windows.Devices.Bluetooth.BluetoothCacheMode
   )
   return Windows.String;
   
   function get_InvalidHandle
   return Windows.UInt8;
   
   function get_ReadNotPermitted
   return Windows.UInt8;
   
   function get_WriteNotPermitted
   return Windows.UInt8;
   
   function get_InvalidPdu
   return Windows.UInt8;
   
   function get_InsufficientAuthentication
   return Windows.UInt8;
   
   function get_RequestNotSupported
   return Windows.UInt8;
   
   function get_InvalidOffset
   return Windows.UInt8;
   
   function get_InsufficientAuthorization
   return Windows.UInt8;
   
   function get_PrepareQueueFull
   return Windows.UInt8;
   
   function get_AttributeNotFound
   return Windows.UInt8;
   
   function get_AttributeNotLong
   return Windows.UInt8;
   
   function get_InsufficientEncryptionKeySize
   return Windows.UInt8;
   
   function get_InvalidAttributeValueLength
   return Windows.UInt8;
   
   function get_UnlikelyError
   return Windows.UInt8;
   
   function get_InsufficientEncryption
   return Windows.UInt8;
   
   function get_UnsupportedGroupType
   return Windows.UInt8;
   
   function get_InsufficientResources
   return Windows.UInt8;
   
   function FromDeviceIdAsync
   (
      deviceId : Windows.Devices.Bluetooth.IBluetoothDeviceId
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattSession;
   
   function ConvertShortIdToUuid_IGattCharacteristic
   (
      shortId : Windows.UInt16
   )
   return Windows.Guid;
   
   function ConvertShortIdToUuid_IGattDescriptor
   (
      shortId : Windows.UInt16
   )
   return Windows.Guid;
   
   function FromParts
   (
      formatType : Windows.UInt8
      ; exponent : Windows.Int32
      ; unit : Windows.UInt16
      ; namespaceId : Windows.UInt8
      ; description : Windows.UInt16
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat;
   
   function get_BluetoothSigAssignedNumbers
   return Windows.UInt8;
   
   function get_Boolean
   return Windows.UInt8;
   
   function get_Bit2
   return Windows.UInt8;
   
   function get_Nibble
   return Windows.UInt8;
   
   function get_UInt8
   return Windows.UInt8;
   
   function get_UInt12
   return Windows.UInt8;
   
   function get_UInt16
   return Windows.UInt8;
   
   function get_UInt24
   return Windows.UInt8;
   
   function get_UInt32
   return Windows.UInt8;
   
   function get_UInt48
   return Windows.UInt8;
   
   function get_UInt64
   return Windows.UInt8;
   
   function get_UInt128
   return Windows.UInt8;
   
   function get_SInt8
   return Windows.UInt8;
   
   function get_SInt12
   return Windows.UInt8;
   
   function get_SInt16
   return Windows.UInt8;
   
   function get_SInt24
   return Windows.UInt8;
   
   function get_SInt32
   return Windows.UInt8;
   
   function get_SInt48
   return Windows.UInt8;
   
   function get_SInt64
   return Windows.UInt8;
   
   function get_SInt128
   return Windows.UInt8;
   
   function get_Float32
   return Windows.UInt8;
   
   function get_Float64
   return Windows.UInt8;
   
   function get_SFloat
   return Windows.UInt8;
   
   function get_Float
   return Windows.UInt8;
   
   function get_DUInt16
   return Windows.UInt8;
   
   function get_Utf8
   return Windows.UInt8;
   
   function get_Utf16
   return Windows.UInt8;
   
   function get_Struct
   return Windows.UInt8;
   
   function get_Battery
   return Windows.Guid;
   
   function get_BloodPressure
   return Windows.Guid;
   
   function get_CyclingSpeedAndCadence
   return Windows.Guid;
   
   function get_GenericAccess
   return Windows.Guid;
   
   function get_GenericAttribute
   return Windows.Guid;
   
   function get_Glucose
   return Windows.Guid;
   
   function get_HealthThermometer
   return Windows.Guid;
   
   function get_HeartRate
   return Windows.Guid;
   
   function get_RunningSpeedAndCadence
   return Windows.Guid;
   
   function get_AlertNotification
   return Windows.Guid;
   
   function get_CurrentTime
   return Windows.Guid;
   
   function get_CyclingPower
   return Windows.Guid;
   
   function get_DeviceInformation
   return Windows.Guid;
   
   function get_HumanInterfaceDevice
   return Windows.Guid;
   
   function get_ImmediateAlert
   return Windows.Guid;
   
   function get_LinkLoss
   return Windows.Guid;
   
   function get_LocationAndNavigation
   return Windows.Guid;
   
   function get_NextDstChange
   return Windows.Guid;
   
   function get_PhoneAlertStatus
   return Windows.Guid;
   
   function get_ReferenceTimeUpdate
   return Windows.Guid;
   
   function get_ScanParameters
   return Windows.Guid;
   
   function get_TxPower
   return Windows.Guid;
   
   function get_BatteryLevel
   return Windows.Guid;
   
   function get_BloodPressureFeature
   return Windows.Guid;
   
   function get_BloodPressureMeasurement
   return Windows.Guid;
   
   function get_BodySensorLocation
   return Windows.Guid;
   
   function get_CscFeature
   return Windows.Guid;
   
   function get_CscMeasurement
   return Windows.Guid;
   
   function get_GlucoseFeature
   return Windows.Guid;
   
   function get_GlucoseMeasurement
   return Windows.Guid;
   
   function get_GlucoseMeasurementContext
   return Windows.Guid;
   
   function get_HeartRateControlPoint
   return Windows.Guid;
   
   function get_HeartRateMeasurement
   return Windows.Guid;
   
   function get_IntermediateCuffPressure
   return Windows.Guid;
   
   function get_IntermediateTemperature
   return Windows.Guid;
   
   function get_MeasurementInterval
   return Windows.Guid;
   
   function get_RecordAccessControlPoint
   return Windows.Guid;
   
   function get_RscFeature
   return Windows.Guid;
   
   function get_RscMeasurement
   return Windows.Guid;
   
   function get_SCControlPoint
   return Windows.Guid;
   
   function get_SensorLocation
   return Windows.Guid;
   
   function get_TemperatureMeasurement
   return Windows.Guid;
   
   function get_TemperatureType
   return Windows.Guid;
   
   function get_AlertCategoryId
   return Windows.Guid;
   
   function get_AlertCategoryIdBitMask
   return Windows.Guid;
   
   function get_AlertLevel
   return Windows.Guid;
   
   function get_AlertNotificationControlPoint
   return Windows.Guid;
   
   function get_AlertStatus
   return Windows.Guid;
   
   function get_GapAppearance
   return Windows.Guid;
   
   function get_BootKeyboardInputReport
   return Windows.Guid;
   
   function get_BootKeyboardOutputReport
   return Windows.Guid;
   
   function get_BootMouseInputReport
   return Windows.Guid;
   
   function get_CurrentTime_GattCharacteristicUuids
   return Windows.Guid;
   
   function get_CyclingPowerControlPoint
   return Windows.Guid;
   
   function get_CyclingPowerFeature
   return Windows.Guid;
   
   function get_CyclingPowerMeasurement
   return Windows.Guid;
   
   function get_CyclingPowerVector
   return Windows.Guid;
   
   function get_DateTime
   return Windows.Guid;
   
   function get_DayDateTime
   return Windows.Guid;
   
   function get_DayOfWeek
   return Windows.Guid;
   
   function get_GapDeviceName
   return Windows.Guid;
   
   function get_DstOffset
   return Windows.Guid;
   
   function get_ExactTime256
   return Windows.Guid;
   
   function get_FirmwareRevisionString
   return Windows.Guid;
   
   function get_HardwareRevisionString
   return Windows.Guid;
   
   function get_HidControlPoint
   return Windows.Guid;
   
   function get_HidInformation
   return Windows.Guid;
   
   function get_Ieee1107320601RegulatoryCertificationDataList
   return Windows.Guid;
   
   function get_LnControlPoint
   return Windows.Guid;
   
   function get_LnFeature
   return Windows.Guid;
   
   function get_LocalTimeInformation
   return Windows.Guid;
   
   function get_LocationAndSpeed
   return Windows.Guid;
   
   function get_ManufacturerNameString
   return Windows.Guid;
   
   function get_ModelNumberString
   return Windows.Guid;
   
   function get_Navigation
   return Windows.Guid;
   
   function get_NewAlert
   return Windows.Guid;
   
   function get_GapPeripheralPreferredConnectionParameters
   return Windows.Guid;
   
   function get_GapPeripheralPrivacyFlag
   return Windows.Guid;
   
   function get_PnpId
   return Windows.Guid;
   
   function get_PositionQuality
   return Windows.Guid;
   
   function get_ProtocolMode
   return Windows.Guid;
   
   function get_GapReconnectionAddress
   return Windows.Guid;
   
   function get_ReferenceTimeInformation
   return Windows.Guid;
   
   function get_Report
   return Windows.Guid;
   
   function get_ReportMap
   return Windows.Guid;
   
   function get_RingerControlPoint
   return Windows.Guid;
   
   function get_RingerSetting
   return Windows.Guid;
   
   function get_ScanIntervalWindow
   return Windows.Guid;
   
   function get_ScanRefresh
   return Windows.Guid;
   
   function get_SerialNumberString
   return Windows.Guid;
   
   function get_GattServiceChanged
   return Windows.Guid;
   
   function get_SoftwareRevisionString
   return Windows.Guid;
   
   function get_SupportedNewAlertCategory
   return Windows.Guid;
   
   function get_SupportUnreadAlertCategory
   return Windows.Guid;
   
   function get_SystemId
   return Windows.Guid;
   
   function get_TimeAccuracy
   return Windows.Guid;
   
   function get_TimeSource
   return Windows.Guid;
   
   function get_TimeUpdateControlPoint
   return Windows.Guid;
   
   function get_TimeUpdateState
   return Windows.Guid;
   
   function get_TimeWithDst
   return Windows.Guid;
   
   function get_TimeZone
   return Windows.Guid;
   
   function get_TxPowerLevel
   return Windows.Guid;
   
   function get_UnreadAlertStatus
   return Windows.Guid;
   
   function get_CharacteristicAggregateFormat
   return Windows.Guid;
   
   function get_CharacteristicExtendedProperties
   return Windows.Guid;
   
   function get_CharacteristicPresentationFormat
   return Windows.Guid;
   
   function get_CharacteristicUserDescription
   return Windows.Guid;
   
   function get_ClientCharacteristicConfiguration
   return Windows.Guid;
   
   function get_ServerCharacteristicConfiguration
   return Windows.Guid;
   
   function CreateAsync
   (
      serviceUuid : Windows.Guid
   )
   return Windows.Devices.Bluetooth.GenericAttributeProfile.IAsyncOperation_IGattServiceProviderResult;
   
end;
