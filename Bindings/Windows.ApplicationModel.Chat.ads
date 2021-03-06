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
with Windows.Foundation;
limited with Windows.Media.MediaProperties;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Chat is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ChatMessageStatus is (
      Draft,
      Sending,
      Sent,
      SendRetryNeeded,
      SendFailed,
      Received,
      ReceiveDownloadNeeded,
      ReceiveDownloadFailed,
      ReceiveDownloading,
      Deleted,
      Declined,
      Cancelled,
      Recalled,
      ReceiveRetryNeeded
   );
   for ChatMessageStatus use (
      Draft => 0,
      Sending => 1,
      Sent => 2,
      SendRetryNeeded => 3,
      SendFailed => 4,
      Received => 5,
      ReceiveDownloadNeeded => 6,
      ReceiveDownloadFailed => 7,
      ReceiveDownloading => 8,
      Deleted => 9,
      Declined => 10,
      Cancelled => 11,
      Recalled => 12,
      ReceiveRetryNeeded => 13
   );
   for ChatMessageStatus'Size use 32;
   
   type ChatMessageStatus_Ptr is access ChatMessageStatus;
   
   type ChatMessageKind is (
      Standard_x,
      FileTransferRequest,
      TransportCustom,
      JoinedConversation,
      LeftConversation,
      OtherParticipantJoinedConversation,
      OtherParticipantLeftConversation
   );
   for ChatMessageKind use (
      Standard_x => 0,
      FileTransferRequest => 1,
      TransportCustom => 2,
      JoinedConversation => 3,
      LeftConversation => 4,
      OtherParticipantJoinedConversation => 5,
      OtherParticipantLeftConversation => 6
   );
   for ChatMessageKind'Size use 32;
   
   type ChatMessageKind_Ptr is access ChatMessageKind;
   
   type ChatMessageOperatorKind is (
      Unspecified,
      Sms,
      Mms,
      Rcs
   );
   for ChatMessageOperatorKind use (
      Unspecified => 0,
      Sms => 1,
      Mms => 2,
      Rcs => 3
   );
   for ChatMessageOperatorKind'Size use 32;
   
   type ChatMessageOperatorKind_Ptr is access ChatMessageOperatorKind;
   
   type ChatMessageChangeType is (
      MessageCreated,
      MessageModified,
      MessageDeleted,
      ChangeTrackingLost
   );
   for ChatMessageChangeType use (
      MessageCreated => 0,
      MessageModified => 1,
      MessageDeleted => 2,
      ChangeTrackingLost => 3
   );
   for ChatMessageChangeType'Size use 32;
   
   type ChatMessageChangeType_Ptr is access ChatMessageChangeType;
   
   type ChatMessageValidationStatus is (
      Valid,
      NoRecipients,
      InvalidData,
      MessageTooLarge,
      TooManyRecipients,
      TransportInactive,
      TransportNotFound,
      TooManyAttachments,
      InvalidRecipients,
      InvalidBody,
      InvalidOther,
      ValidWithLargeMessage,
      VoiceRoamingRestriction,
      DataRoamingRestriction
   );
   for ChatMessageValidationStatus use (
      Valid => 0,
      NoRecipients => 1,
      InvalidData => 2,
      MessageTooLarge => 3,
      TooManyRecipients => 4,
      TransportInactive => 5,
      TransportNotFound => 6,
      TooManyAttachments => 7,
      InvalidRecipients => 8,
      InvalidBody => 9,
      InvalidOther => 10,
      ValidWithLargeMessage => 11,
      VoiceRoamingRestriction => 12,
      DataRoamingRestriction => 13
   );
   for ChatMessageValidationStatus'Size use 32;
   
   type ChatMessageValidationStatus_Ptr is access ChatMessageValidationStatus;
   
   type ChatConversationThreadingKind is (
      Participants,
      ContactId,
      ConversationId,
      Custom
   );
   for ChatConversationThreadingKind use (
      Participants => 0,
      ContactId => 1,
      ConversationId => 2,
      Custom => 3
   );
   for ChatConversationThreadingKind'Size use 32;
   
   type ChatConversationThreadingKind_Ptr is access ChatConversationThreadingKind;
   
   type ChatStoreChangedEventKind is (
      NotificationsMissed,
      StoreModified,
      MessageCreated,
      MessageModified,
      MessageDeleted,
      ConversationModified,
      ConversationDeleted,
      ConversationTransportDeleted
   );
   for ChatStoreChangedEventKind use (
      NotificationsMissed => 0,
      StoreModified => 1,
      MessageCreated => 2,
      MessageModified => 3,
      MessageDeleted => 4,
      ConversationModified => 5,
      ConversationDeleted => 6,
      ConversationTransportDeleted => 7
   );
   for ChatStoreChangedEventKind'Size use 32;
   
   type ChatStoreChangedEventKind_Ptr is access ChatStoreChangedEventKind;
   
   type ChatTransportErrorCodeCategory is (
      None,
      Http,
      Network,
      MmsServer
   );
   for ChatTransportErrorCodeCategory use (
      None => 0,
      Http => 1,
      Network => 2,
      MmsServer => 3
   );
   for ChatTransportErrorCodeCategory'Size use 32;
   
   type ChatTransportErrorCodeCategory_Ptr is access ChatTransportErrorCodeCategory;
   
   type ChatTransportInterpretedErrorCode is (
      None,
      Unknown,
      InvalidRecipientAddress,
      NetworkConnectivity,
      ServiceDenied,
      Timeout
   );
   for ChatTransportInterpretedErrorCode use (
      None => 0,
      Unknown => 1,
      InvalidRecipientAddress => 2,
      NetworkConnectivity => 3,
      ServiceDenied => 4,
      Timeout => 5
   );
   for ChatTransportInterpretedErrorCode'Size use 32;
   
   type ChatTransportInterpretedErrorCode_Ptr is access ChatTransportInterpretedErrorCode;
   
   type ChatMessageTransportKind is (
      Text,
      Untriaged,
      Blocked,
      Custom
   );
   for ChatMessageTransportKind use (
      Text => 0,
      Untriaged => 1,
      Blocked => 2,
      Custom => 3
   );
   for ChatMessageTransportKind'Size use 32;
   
   type ChatMessageTransportKind_Ptr is access ChatMessageTransportKind;
   
   type RcsServiceKind is (
      Chat,
      GroupChat,
      FileTransfer,
      Capability
   );
   for RcsServiceKind use (
      Chat => 0,
      GroupChat => 1,
      FileTransfer => 2,
      Capability => 3
   );
   for RcsServiceKind'Size use 32;
   
   type RcsServiceKind_Ptr is access RcsServiceKind;
   
   type ChatItemKind is (
      Message,
      Conversation
   );
   for ChatItemKind use (
      Message => 0,
      Conversation => 1
   );
   for ChatItemKind'Size use 32;
   
   type ChatItemKind_Ptr is access ChatItemKind;
   
   type ChatRestoreHistorySpan is (
      LastMonth,
      LastYear,
      AnyTime
   );
   for ChatRestoreHistorySpan use (
      LastMonth => 0,
      LastYear => 1,
      AnyTime => 2
   );
   for ChatRestoreHistorySpan'Size use 32;
   
   type ChatRestoreHistorySpan_Ptr is access ChatRestoreHistorySpan;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IChatMessage_Interface;
   type AsyncOperationCompletedHandler_IChatMessage is access all AsyncOperationCompletedHandler_IChatMessage_Interface'Class;
   type AsyncOperationCompletedHandler_IChatMessage_Ptr is access all AsyncOperationCompletedHandler_IChatMessage;
   type TypedEventHandler_IChatMessageStore_add_MessageChanged_Interface;
   type TypedEventHandler_IChatMessageStore_add_MessageChanged is access all TypedEventHandler_IChatMessageStore_add_MessageChanged_Interface'Class;
   type TypedEventHandler_IChatMessageStore_add_MessageChanged_Ptr is access all TypedEventHandler_IChatMessageStore_add_MessageChanged;
   type AsyncOperationCompletedHandler_IChatConversation_Interface;
   type AsyncOperationCompletedHandler_IChatConversation is access all AsyncOperationCompletedHandler_IChatConversation_Interface'Class;
   type AsyncOperationCompletedHandler_IChatConversation_Ptr is access all AsyncOperationCompletedHandler_IChatConversation;
   type TypedEventHandler_IChatMessageStore2_add_StoreChanged_Interface;
   type TypedEventHandler_IChatMessageStore2_add_StoreChanged is access all TypedEventHandler_IChatMessageStore2_add_StoreChanged_Interface'Class;
   type TypedEventHandler_IChatMessageStore2_add_StoreChanged_Ptr is access all TypedEventHandler_IChatMessageStore2_add_StoreChanged;
   type AsyncOperationCompletedHandler_IChatMessageStore_Interface;
   type AsyncOperationCompletedHandler_IChatMessageStore is access all AsyncOperationCompletedHandler_IChatMessageStore_Interface'Class;
   type AsyncOperationCompletedHandler_IChatMessageStore_Ptr is access all AsyncOperationCompletedHandler_IChatMessageStore;
   type AsyncOperationCompletedHandler_IChatMessageTransport_Interface;
   type AsyncOperationCompletedHandler_IChatMessageTransport is access all AsyncOperationCompletedHandler_IChatMessageTransport_Interface'Class;
   type AsyncOperationCompletedHandler_IChatMessageTransport_Ptr is access all AsyncOperationCompletedHandler_IChatMessageTransport;
   type AsyncOperationCompletedHandler_IChatSyncManager_Interface;
   type AsyncOperationCompletedHandler_IChatSyncManager is access all AsyncOperationCompletedHandler_IChatSyncManager_Interface'Class;
   type AsyncOperationCompletedHandler_IChatSyncManager_Ptr is access all AsyncOperationCompletedHandler_IChatSyncManager;
   type AsyncOperationCompletedHandler_IChatCapabilities_Interface;
   type AsyncOperationCompletedHandler_IChatCapabilities is access all AsyncOperationCompletedHandler_IChatCapabilities_Interface'Class;
   type AsyncOperationCompletedHandler_IChatCapabilities_Ptr is access all AsyncOperationCompletedHandler_IChatCapabilities;
   type TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged_Interface;
   type TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged is access all TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged_Interface'Class;
   type TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged_Ptr is access all TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged;
   type AsyncOperationCompletedHandler_IRcsTransport_Interface;
   type AsyncOperationCompletedHandler_IRcsTransport is access all AsyncOperationCompletedHandler_IRcsTransport_Interface'Class;
   type AsyncOperationCompletedHandler_IRcsTransport_Ptr is access all AsyncOperationCompletedHandler_IRcsTransport;
   type TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged_Interface;
   type TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged is access all TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged_Interface'Class;
   type TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged_Ptr is access all TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged;
   type TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged_Interface;
   type TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged is access all TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged_Interface'Class;
   type TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged_Ptr is access all TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IChatMessageTransport_Interface;
   type IChatMessageTransport is access all IChatMessageTransport_Interface'Class;
   type IChatMessageTransport_Ptr is access all IChatMessageTransport;
   type IChatMessageTransport2_Interface;
   type IChatMessageTransport2 is access all IChatMessageTransport2_Interface'Class;
   type IChatMessageTransport2_Ptr is access all IChatMessageTransport2;
   type IChatMessageTransportConfiguration_Interface;
   type IChatMessageTransportConfiguration is access all IChatMessageTransportConfiguration_Interface'Class;
   type IChatMessageTransportConfiguration_Ptr is access all IChatMessageTransportConfiguration;
   type IChatMessageChange_Interface;
   type IChatMessageChange is access all IChatMessageChange_Interface'Class;
   type IChatMessageChange_Ptr is access all IChatMessageChange;
   type IChatMessageChangeReader_Interface;
   type IChatMessageChangeReader is access all IChatMessageChangeReader_Interface'Class;
   type IChatMessageChangeReader_Ptr is access all IChatMessageChangeReader;
   type IChatMessageChangeTracker_Interface;
   type IChatMessageChangeTracker is access all IChatMessageChangeTracker_Interface'Class;
   type IChatMessageChangeTracker_Ptr is access all IChatMessageChangeTracker;
   type IChatMessageValidationResult_Interface;
   type IChatMessageValidationResult is access all IChatMessageValidationResult_Interface'Class;
   type IChatMessageValidationResult_Ptr is access all IChatMessageValidationResult;
   type IChatMessage_Interface;
   type IChatMessage is access all IChatMessage_Interface'Class;
   type IChatMessage_Ptr is access all IChatMessage;
   type IChatMessage3_Interface;
   type IChatMessage3 is access all IChatMessage3_Interface'Class;
   type IChatMessage3_Ptr is access all IChatMessage3;
   type IChatMessage2_Interface;
   type IChatMessage2 is access all IChatMessage2_Interface'Class;
   type IChatMessage2_Ptr is access all IChatMessage2;
   type IChatMessage4_Interface;
   type IChatMessage4 is access all IChatMessage4_Interface'Class;
   type IChatMessage4_Ptr is access all IChatMessage4;
   type IChatQueryOptions_Interface;
   type IChatQueryOptions is access all IChatQueryOptions_Interface'Class;
   type IChatQueryOptions_Ptr is access all IChatQueryOptions;
   type IChatMessageStore_Interface;
   type IChatMessageStore is access all IChatMessageStore_Interface'Class;
   type IChatMessageStore_Ptr is access all IChatMessageStore;
   type IChatMessageStore2_Interface;
   type IChatMessageStore2 is access all IChatMessageStore2_Interface'Class;
   type IChatMessageStore2_Ptr is access all IChatMessageStore2;
   type IChatMessageStore3_Interface;
   type IChatMessageStore3 is access all IChatMessageStore3_Interface'Class;
   type IChatMessageStore3_Ptr is access all IChatMessageStore3;
   type IChatMessageStoreChangedEventArgs_Interface;
   type IChatMessageStoreChangedEventArgs is access all IChatMessageStoreChangedEventArgs_Interface'Class;
   type IChatMessageStoreChangedEventArgs_Ptr is access all IChatMessageStoreChangedEventArgs;
   type IChatMessageChangedEventArgs_Interface;
   type IChatMessageChangedEventArgs is access all IChatMessageChangedEventArgs_Interface'Class;
   type IChatMessageChangedEventArgs_Ptr is access all IChatMessageChangedEventArgs;
   type IChatMessageChangedDeferral_Interface;
   type IChatMessageChangedDeferral is access all IChatMessageChangedDeferral_Interface'Class;
   type IChatMessageChangedDeferral_Ptr is access all IChatMessageChangedDeferral;
   type IChatMessageBlockingStatic_Interface;
   type IChatMessageBlockingStatic is access all IChatMessageBlockingStatic_Interface'Class;
   type IChatMessageBlockingStatic_Ptr is access all IChatMessageBlockingStatic;
   type IChatMessageManagerStatic_Interface;
   type IChatMessageManagerStatic is access all IChatMessageManagerStatic_Interface'Class;
   type IChatMessageManagerStatic_Ptr is access all IChatMessageManagerStatic;
   type IChatMessageManager2Statics_Interface;
   type IChatMessageManager2Statics is access all IChatMessageManager2Statics_Interface'Class;
   type IChatMessageManager2Statics_Ptr is access all IChatMessageManager2Statics;
   type IChatMessageManagerStatics3_Interface;
   type IChatMessageManagerStatics3 is access all IChatMessageManagerStatics3_Interface'Class;
   type IChatMessageManagerStatics3_Ptr is access all IChatMessageManagerStatics3;
   type IChatMessageReader_Interface;
   type IChatMessageReader is access all IChatMessageReader_Interface'Class;
   type IChatMessageReader_Ptr is access all IChatMessageReader;
   type IChatMessageReader2_Interface;
   type IChatMessageReader2 is access all IChatMessageReader2_Interface'Class;
   type IChatMessageReader2_Ptr is access all IChatMessageReader2;
   type IChatSearchReader_Interface;
   type IChatSearchReader is access all IChatSearchReader_Interface'Class;
   type IChatSearchReader_Ptr is access all IChatSearchReader;
   type IChatItem_Interface;
   type IChatItem is access all IChatItem_Interface'Class;
   type IChatItem_Ptr is access all IChatItem;
   type IChatMessageAttachment_Interface;
   type IChatMessageAttachment is access all IChatMessageAttachment_Interface'Class;
   type IChatMessageAttachment_Ptr is access all IChatMessageAttachment;
   type IChatMessageAttachment2_Interface;
   type IChatMessageAttachment2 is access all IChatMessageAttachment2_Interface'Class;
   type IChatMessageAttachment2_Ptr is access all IChatMessageAttachment2;
   type IChatMessageAttachmentFactory_Interface;
   type IChatMessageAttachmentFactory is access all IChatMessageAttachmentFactory_Interface'Class;
   type IChatMessageAttachmentFactory_Ptr is access all IChatMessageAttachmentFactory;
   type IChatMessageNotificationTriggerDetails_Interface;
   type IChatMessageNotificationTriggerDetails is access all IChatMessageNotificationTriggerDetails_Interface'Class;
   type IChatMessageNotificationTriggerDetails_Ptr is access all IChatMessageNotificationTriggerDetails;
   type IChatMessageNotificationTriggerDetails2_Interface;
   type IChatMessageNotificationTriggerDetails2 is access all IChatMessageNotificationTriggerDetails2_Interface'Class;
   type IChatMessageNotificationTriggerDetails2_Ptr is access all IChatMessageNotificationTriggerDetails2;
   type IChatCapabilities_Interface;
   type IChatCapabilities is access all IChatCapabilities_Interface'Class;
   type IChatCapabilities_Ptr is access all IChatCapabilities;
   type IChatCapabilitiesManagerStatics_Interface;
   type IChatCapabilitiesManagerStatics is access all IChatCapabilitiesManagerStatics_Interface'Class;
   type IChatCapabilitiesManagerStatics_Ptr is access all IChatCapabilitiesManagerStatics;
   type IChatRecipientDeliveryInfo_Interface;
   type IChatRecipientDeliveryInfo is access all IChatRecipientDeliveryInfo_Interface'Class;
   type IChatRecipientDeliveryInfo_Ptr is access all IChatRecipientDeliveryInfo;
   type IChatConversationThreadingInfo_Interface;
   type IChatConversationThreadingInfo is access all IChatConversationThreadingInfo_Interface'Class;
   type IChatConversationThreadingInfo_Ptr is access all IChatConversationThreadingInfo;
   type IChatConversationReader_Interface;
   type IChatConversationReader is access all IChatConversationReader_Interface'Class;
   type IChatConversationReader_Ptr is access all IChatConversationReader;
   type IChatConversation_Interface;
   type IChatConversation is access all IChatConversation_Interface'Class;
   type IChatConversation_Ptr is access all IChatConversation;
   type IChatConversation2_Interface;
   type IChatConversation2 is access all IChatConversation2_Interface'Class;
   type IChatConversation2_Ptr is access all IChatConversation2;
   type IRemoteParticipantComposingChangedEventArgs_Interface;
   type IRemoteParticipantComposingChangedEventArgs is access all IRemoteParticipantComposingChangedEventArgs_Interface'Class;
   type IRemoteParticipantComposingChangedEventArgs_Ptr is access all IRemoteParticipantComposingChangedEventArgs;
   type IChatSyncManager_Interface;
   type IChatSyncManager is access all IChatSyncManager_Interface'Class;
   type IChatSyncManager_Ptr is access all IChatSyncManager;
   type IChatSyncConfiguration_Interface;
   type IChatSyncConfiguration is access all IChatSyncConfiguration_Interface'Class;
   type IChatSyncConfiguration_Ptr is access all IChatSyncConfiguration;
   type IRcsServiceKindSupportedChangedEventArgs_Interface;
   type IRcsServiceKindSupportedChangedEventArgs is access all IRcsServiceKindSupportedChangedEventArgs_Interface'Class;
   type IRcsServiceKindSupportedChangedEventArgs_Ptr is access all IRcsServiceKindSupportedChangedEventArgs;
   type IRcsManagerStatics_Interface;
   type IRcsManagerStatics is access all IRcsManagerStatics_Interface'Class;
   type IRcsManagerStatics_Ptr is access all IRcsManagerStatics;
   type IRcsTransport_Interface;
   type IRcsTransport is access all IRcsTransport_Interface'Class;
   type IRcsTransport_Ptr is access all IRcsTransport;
   type IRcsTransportConfiguration_Interface;
   type IRcsTransportConfiguration is access all IRcsTransportConfiguration_Interface'Class;
   type IRcsTransportConfiguration_Ptr is access all IRcsTransportConfiguration;
   type IRcsEndUserMessageManager_Interface;
   type IRcsEndUserMessageManager is access all IRcsEndUserMessageManager_Interface'Class;
   type IRcsEndUserMessageManager_Ptr is access all IRcsEndUserMessageManager;
   type IRcsEndUserMessageAction_Interface;
   type IRcsEndUserMessageAction is access all IRcsEndUserMessageAction_Interface'Class;
   type IRcsEndUserMessageAction_Ptr is access all IRcsEndUserMessageAction;
   type IRcsEndUserMessage_Interface;
   type IRcsEndUserMessage is access all IRcsEndUserMessage_Interface'Class;
   type IRcsEndUserMessage_Ptr is access all IRcsEndUserMessage;
   type IRcsEndUserMessageAvailableEventArgs_Interface;
   type IRcsEndUserMessageAvailableEventArgs is access all IRcsEndUserMessageAvailableEventArgs_Interface'Class;
   type IRcsEndUserMessageAvailableEventArgs_Ptr is access all IRcsEndUserMessageAvailableEventArgs;
   type IRcsEndUserMessageAvailableTriggerDetails_Interface;
   type IRcsEndUserMessageAvailableTriggerDetails is access all IRcsEndUserMessageAvailableTriggerDetails_Interface'Class;
   type IRcsEndUserMessageAvailableTriggerDetails_Ptr is access all IRcsEndUserMessageAvailableTriggerDetails;
   type IIterator_IChatMessageAttachment_Interface;
   type IIterator_IChatMessageAttachment is access all IIterator_IChatMessageAttachment_Interface'Class;
   type IIterator_IChatMessageAttachment_Ptr is access all IIterator_IChatMessageAttachment;
   type IIterable_IChatMessageAttachment_Interface;
   type IIterable_IChatMessageAttachment is access all IIterable_IChatMessageAttachment_Interface'Class;
   type IIterable_IChatMessageAttachment_Ptr is access all IIterable_IChatMessageAttachment;
   type IVectorView_IChatMessageAttachment_Interface;
   type IVectorView_IChatMessageAttachment is access all IVectorView_IChatMessageAttachment_Interface'Class;
   type IVectorView_IChatMessageAttachment_Ptr is access all IVectorView_IChatMessageAttachment;
   type IVector_IChatMessageAttachment_Interface;
   type IVector_IChatMessageAttachment is access all IVector_IChatMessageAttachment_Interface'Class;
   type IVector_IChatMessageAttachment_Ptr is access all IVector_IChatMessageAttachment;
   type IIterator_IChatRecipientDeliveryInfo_Interface;
   type IIterator_IChatRecipientDeliveryInfo is access all IIterator_IChatRecipientDeliveryInfo_Interface'Class;
   type IIterator_IChatRecipientDeliveryInfo_Ptr is access all IIterator_IChatRecipientDeliveryInfo;
   type IIterable_IChatRecipientDeliveryInfo_Interface;
   type IIterable_IChatRecipientDeliveryInfo is access all IIterable_IChatRecipientDeliveryInfo_Interface'Class;
   type IIterable_IChatRecipientDeliveryInfo_Ptr is access all IIterable_IChatRecipientDeliveryInfo;
   type IVectorView_IChatRecipientDeliveryInfo_Interface;
   type IVectorView_IChatRecipientDeliveryInfo is access all IVectorView_IChatRecipientDeliveryInfo_Interface'Class;
   type IVectorView_IChatRecipientDeliveryInfo_Ptr is access all IVectorView_IChatRecipientDeliveryInfo;
   type IVector_IChatRecipientDeliveryInfo_Interface;
   type IVector_IChatRecipientDeliveryInfo is access all IVector_IChatRecipientDeliveryInfo_Interface'Class;
   type IVector_IChatRecipientDeliveryInfo_Ptr is access all IVector_IChatRecipientDeliveryInfo;
   type IAsyncOperation_IChatMessage_Interface;
   type IAsyncOperation_IChatMessage is access all IAsyncOperation_IChatMessage_Interface'Class;
   type IAsyncOperation_IChatMessage_Ptr is access all IAsyncOperation_IChatMessage;
   type IAsyncOperation_IChatConversation_Interface;
   type IAsyncOperation_IChatConversation is access all IAsyncOperation_IChatConversation_Interface'Class;
   type IAsyncOperation_IChatConversation_Ptr is access all IAsyncOperation_IChatConversation;
   type IAsyncOperation_IChatMessageStore_Interface;
   type IAsyncOperation_IChatMessageStore is access all IAsyncOperation_IChatMessageStore_Interface'Class;
   type IAsyncOperation_IChatMessageStore_Ptr is access all IAsyncOperation_IChatMessageStore;
   type IAsyncOperation_IChatMessageTransport_Interface;
   type IAsyncOperation_IChatMessageTransport is access all IAsyncOperation_IChatMessageTransport_Interface'Class;
   type IAsyncOperation_IChatMessageTransport_Ptr is access all IAsyncOperation_IChatMessageTransport;
   type IAsyncOperation_IChatSyncManager_Interface;
   type IAsyncOperation_IChatSyncManager is access all IAsyncOperation_IChatSyncManager_Interface'Class;
   type IAsyncOperation_IChatSyncManager_Ptr is access all IAsyncOperation_IChatSyncManager;
   type IAsyncOperation_IChatCapabilities_Interface;
   type IAsyncOperation_IChatCapabilities is access all IAsyncOperation_IChatCapabilities_Interface'Class;
   type IAsyncOperation_IChatCapabilities_Ptr is access all IAsyncOperation_IChatCapabilities;
   type IAsyncOperation_IRcsTransport_Interface;
   type IAsyncOperation_IRcsTransport is access all IAsyncOperation_IRcsTransport_Interface'Class;
   type IAsyncOperation_IRcsTransport_Ptr is access all IAsyncOperation_IRcsTransport;
   type IIterator_IRcsEndUserMessageAction_Interface;
   type IIterator_IRcsEndUserMessageAction is access all IIterator_IRcsEndUserMessageAction_Interface'Class;
   type IIterator_IRcsEndUserMessageAction_Ptr is access all IIterator_IRcsEndUserMessageAction;
   type IIterable_IRcsEndUserMessageAction_Interface;
   type IIterable_IRcsEndUserMessageAction is access all IIterable_IRcsEndUserMessageAction_Interface'Class;
   type IIterable_IRcsEndUserMessageAction_Ptr is access all IIterable_IRcsEndUserMessageAction;
   type IVectorView_IRcsEndUserMessageAction_Interface;
   type IVectorView_IRcsEndUserMessageAction is access all IVectorView_IRcsEndUserMessageAction_Interface'Class;
   type IVectorView_IRcsEndUserMessageAction_Ptr is access all IVectorView_IRcsEndUserMessageAction;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageTransport : aliased constant Windows.IID := (1672076280, 59059, 23706, (95, 133, 212, 121, 37, 185, 189, 24 ));
   
   type IChatMessageTransport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAppSetAsNotificationProvider
   (
      This       : access IChatMessageTransport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access IChatMessageTransport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportFriendlyName
   (
      This       : access IChatMessageTransport_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportId
   (
      This       : access IChatMessageTransport_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RequestSetAsNotificationProviderAsync
   (
      This       : access IChatMessageTransport_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageTransport2 : aliased constant Windows.IID := (2426885666, 55370, 19490, (169, 77, 84, 68, 68, 237, 200, 161 ));
   
   type IChatMessageTransport2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Configuration
   (
      This       : access IChatMessageTransport2_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageTransportConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportKind
   (
      This       : access IChatMessageTransport2_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatMessageTransportKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageTransportConfiguration : aliased constant Windows.IID := (2275407653, 6664, 19146, (160, 117, 51, 85, 18, 99, 18, 230 ));
   
   type IChatMessageTransportConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxAttachmentCount
   (
      This       : access IChatMessageTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxMessageSizeInKilobytes
   (
      This       : access IChatMessageTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxRecipientCount
   (
      This       : access IChatMessageTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedVideoFormat
   (
      This       : access IChatMessageTransportConfiguration_Interface
      ; RetVal : access Windows.Media.MediaProperties.IMediaEncodingProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedProperties
   (
      This       : access IChatMessageTransportConfiguration_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageChange : aliased constant Windows.IID := (471384917, 16926, 21688, (109, 56, 107, 58, 108, 130, 252, 204 ));
   
   type IChatMessageChange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeType
   (
      This       : access IChatMessageChange_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatMessageChangeType
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IChatMessageChange_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageChangeReader : aliased constant Windows.IID := (338063392, 10446, 24358, (123, 5, 154, 92, 124, 206, 135, 202 ));
   
   type IChatMessageChangeReader_Interface is interface and Windows.IInspectable_Interface;
   
   function AcceptChanges
   (
      This       : access IChatMessageChangeReader_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AcceptChangesThrough
   (
      This       : access IChatMessageChangeReader_Interface
      ; lastChangeToAcknowledge : Windows.ApplicationModel.Chat.IChatMessageChange
   )
   return Windows.HRESULT is abstract;
   
   function ReadBatchAsync
   (
      This       : access IChatMessageChangeReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageChangeTracker : aliased constant Windows.IID := (1622667366, 28832, 21028, (80, 140, 36, 46, 247, 193, 208, 111 ));
   
   type IChatMessageChangeTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function Enable
   (
      This       : access IChatMessageChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetChangeReader
   (
      This       : access IChatMessageChangeTracker_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageChangeReader
   )
   return Windows.HRESULT is abstract;
   
   function Reset
   (
      This       : access IChatMessageChangeTracker_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageValidationResult : aliased constant Windows.IID := (636041731, 10476, 22665, (86, 155, 126, 72, 107, 18, 111, 24 ));
   
   type IChatMessageValidationResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPartCount
   (
      This       : access IChatMessageValidationResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PartCount
   (
      This       : access IChatMessageValidationResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RemainingCharacterCountInPart
   (
      This       : access IChatMessageValidationResult_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IChatMessageValidationResult_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatMessageValidationStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessage : aliased constant Windows.IID := (1262028074, 4418, 20617, (118, 218, 242, 219, 61, 23, 205, 5 ));
   
   type IChatMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Attachments
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IVector_IChatMessageAttachment -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Body
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Body
   (
      This       : access IChatMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_From
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsForwardingDisabled
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIncoming
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRead
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalTimestamp
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkTimestamp
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Recipients
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RecipientSendStatuses
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatMessageStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportFriendlyName
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportId
   (
      This       : access IChatMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TransportId
   (
      This       : access IChatMessage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessage3 : aliased constant Windows.IID := (1961570224, 15271, 17823, (142, 11, 232, 175, 15, 235, 217, 173 ));
   
   type IChatMessage3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RemoteId
   (
      This       : access IChatMessage3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessage2 : aliased constant Windows.IID := (2254865202, 21567, 18933, (172, 113, 108, 42, 252, 101, 101, 253 ));
   
   type IChatMessage2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EstimatedDownloadSize
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_EstimatedDownloadSize
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function put_From
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAutoReply
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsAutoReply
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsForwardingDisabled
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReplyDisabled
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsIncoming
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRead
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSeen
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSeen
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSimMessage
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_LocalTimestamp
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageKind
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatMessageKind
   )
   return Windows.HRESULT is abstract;
   
   function put_MessageKind
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.ApplicationModel.Chat.ChatMessageKind
   )
   return Windows.HRESULT is abstract;
   
   function get_MessageOperatorKind
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatMessageOperatorKind
   )
   return Windows.HRESULT is abstract;
   
   function put_MessageOperatorKind
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.ApplicationModel.Chat.ChatMessageOperatorKind
   )
   return Windows.HRESULT is abstract;
   
   function put_NetworkTimestamp
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReceivedDuringQuietHours
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsReceivedDuringQuietHours
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RemoteId
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Status
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.ApplicationModel.Chat.ChatMessageStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_Subject
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldSuppressNotification
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShouldSuppressNotification
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ThreadingInfo
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatConversationThreadingInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_ThreadingInfo
   (
      This       : access IChatMessage2_Interface
      ; value : Windows.ApplicationModel.Chat.IChatConversationThreadingInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_RecipientsDeliveryInfos
   (
      This       : access IChatMessage2_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IVector_IChatRecipientDeliveryInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessage4 : aliased constant Windows.IID := (756304655, 53951, 17932, (170, 104, 109, 63, 132, 131, 201, 191 ));
   
   type IChatMessage4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SyncId
   (
      This       : access IChatMessage4_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SyncId
   (
      This       : access IChatMessage4_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatQueryOptions : aliased constant Windows.IID := (802383014, 48950, 17143, (183, 231, 146, 60, 10, 171, 254, 22 ));
   
   type IChatQueryOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SearchString
   (
      This       : access IChatQueryOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SearchString
   (
      This       : access IChatQueryOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageStore : aliased constant Windows.IID := (838008065, 52470, 22539, (73, 118, 10, 7, 221, 93, 59, 71 ));
   
   type IChatMessageStore_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChangeTracker
   (
      This       : access IChatMessageStore_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageChangeTracker
   )
   return Windows.HRESULT is abstract;
   
   function DeleteMessageAsync
   (
      This       : access IChatMessageStore_Interface
      ; localMessageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DownloadMessageAsync
   (
      This       : access IChatMessageStore_Interface
      ; localChatMessageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageAsync
   (
      This       : access IChatMessageStore_Interface
      ; localChatMessageId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReader1
   (
      This       : access IChatMessageStore_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReader2
   (
      This       : access IChatMessageStore_Interface
      ; recentTimeLimit : Windows.Foundation.TimeSpan
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function MarkMessageReadAsync
   (
      This       : access IChatMessageStore_Interface
      ; localChatMessageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function RetrySendMessageAsync
   (
      This       : access IChatMessageStore_Interface
      ; localChatMessageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SendMessageAsync
   (
      This       : access IChatMessageStore_Interface
      ; chatMessage : Windows.ApplicationModel.Chat.IChatMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ValidateMessage
   (
      This       : access IChatMessageStore_Interface
      ; chatMessage : Windows.ApplicationModel.Chat.IChatMessage
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageValidationResult
   )
   return Windows.HRESULT is abstract;
   
   function add_MessageChanged
   (
      This       : access IChatMessageStore_Interface
      ; value : TypedEventHandler_IChatMessageStore_add_MessageChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageChanged
   (
      This       : access IChatMessageStore_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageStore2 : aliased constant Windows.IID := (2907555054, 15060, 18715, (179, 17, 171, 223, 155, 178, 39, 104 ));
   
   type IChatMessageStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function ForwardMessageAsync
   (
      This       : access IChatMessageStore2_Interface
      ; localChatMessageId : Windows.String
      ; addresses : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationAsync
   (
      This       : access IChatMessageStore2_Interface
      ; conversationId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatConversation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationForTransportsAsync
   (
      This       : access IChatMessageStore2_Interface
      ; conversationId : Windows.String
      ; transportIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatConversation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationFromThreadingInfoAsync
   (
      This       : access IChatMessageStore2_Interface
      ; threadingInfo : Windows.ApplicationModel.Chat.IChatConversationThreadingInfo
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatConversation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationReader
   (
      This       : access IChatMessageStore2_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetConversationForTransportsReader
   (
      This       : access IChatMessageStore2_Interface
      ; transportIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Chat.IChatConversationReader
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageByRemoteIdAsync
   (
      This       : access IChatMessageStore2_Interface
      ; transportId : Windows.String
      ; remoteId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetUnseenCountAsync
   (
      This       : access IChatMessageStore2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetUnseenCountForTransportsReaderAsync
   (
      This       : access IChatMessageStore2_Interface
      ; transportIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function MarkAsSeenAsync
   (
      This       : access IChatMessageStore2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkAsSeenForTransportsAsync
   (
      This       : access IChatMessageStore2_Interface
      ; transportIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetSearchReader
   (
      This       : access IChatMessageStore2_Interface
      ; value : Windows.ApplicationModel.Chat.IChatQueryOptions
      ; RetVal : access Windows.ApplicationModel.Chat.IChatSearchReader
   )
   return Windows.HRESULT is abstract;
   
   function SaveMessageAsync
   (
      This       : access IChatMessageStore2_Interface
      ; chatMessage : Windows.ApplicationModel.Chat.IChatMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function TryCancelDownloadMessageAsync
   (
      This       : access IChatMessageStore2_Interface
      ; localChatMessageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryCancelSendMessageAsync
   (
      This       : access IChatMessageStore2_Interface
      ; localChatMessageId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StoreChanged
   (
      This       : access IChatMessageStore2_Interface
      ; handler : TypedEventHandler_IChatMessageStore2_add_StoreChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StoreChanged
   (
      This       : access IChatMessageStore2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageStore3 : aliased constant Windows.IID := (2598091529, 17221, 20161, (139, 116, 183, 51, 130, 67, 113, 156 ));
   
   type IChatMessageStore3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetMessageBySyncIdAsync
   (
      This       : access IChatMessageStore3_Interface
      ; syncId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageStoreChangedEventArgs : aliased constant Windows.IID := (1707503532, 65164, 18132, (145, 25, 87, 184, 65, 3, 17, 213 ));
   
   type IChatMessageStoreChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IChatMessageStoreChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IChatMessageStoreChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatStoreChangedEventKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageChangedEventArgs : aliased constant Windows.IID := (3065462317, 26908, 20191, (134, 96, 110, 185, 137, 104, 146, 227 ));
   
   type IChatMessageChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IChatMessageChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageChangedDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageChangedDeferral : aliased constant Windows.IID := (4224103180, 30860, 19916, (172, 231, 98, 130, 56, 41, 104, 207 ));
   
   type IChatMessageChangedDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IChatMessageChangedDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageBlockingStatic : aliased constant Windows.IID := (4139361152, 52714, 4580, (136, 48, 8, 0, 32, 12, 154, 102 ));
   
   type IChatMessageBlockingStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function MarkMessageAsBlockedAsync
   (
      This       : access IChatMessageBlockingStatic_Interface
      ; localChatMessageId : Windows.String
      ; blocked : Windows.Boolean
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageManagerStatic : aliased constant Windows.IID := (4049363191, 54760, 24210, (85, 109, 224, 59, 96, 37, 49, 4 ));
   
   type IChatMessageManagerStatic_Interface is interface and Windows.IInspectable_Interface;
   
   function GetTransportsAsync
   (
      This       : access IChatMessageManagerStatic_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestStoreAsync
   (
      This       : access IChatMessageManagerStatic_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowComposeSmsMessageAsync
   (
      This       : access IChatMessageManagerStatic_Interface
      ; message : Windows.ApplicationModel.Chat.IChatMessage
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowSmsSettings
   (
      This       : access IChatMessageManagerStatic_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageManager2Statics : aliased constant Windows.IID := (491075855, 40783, 20021, (150, 78, 27, 156, 166, 26, 192, 68 ));
   
   type IChatMessageManager2Statics_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterTransportAsync
   (
      This       : access IChatMessageManager2Statics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetTransportAsync
   (
      This       : access IChatMessageManager2Statics_Interface
      ; transportId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageTransport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageManagerStatics3 : aliased constant Windows.IID := (546013965, 26453, 18636, (154, 179, 253, 3, 196, 99, 252, 146 ));
   
   type IChatMessageManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestSyncManagerAsync
   (
      This       : access IChatMessageManagerStatics3_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatSyncManager -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageReader : aliased constant Windows.IID := (3068819662, 17545, 22265, (118, 170, 226, 4, 104, 37, 20, 207 ));
   
   type IChatMessageReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IChatMessageReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageReader2 : aliased constant Windows.IID := (2305046147, 25787, 18189, (157, 244, 13, 232, 190, 26, 5, 191 ));
   
   type IChatMessageReader2_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchWithCountAsync
   (
      This       : access IChatMessageReader2_Interface
      ; count : Windows.Int32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatSearchReader : aliased constant Windows.IID := (1181089353, 36896, 18258, (152, 13, 57, 97, 35, 37, 245, 137 ));
   
   type IChatSearchReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IChatSearchReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadBatchWithCountAsync
   (
      This       : access IChatSearchReader_Interface
      ; count : Windows.Int32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatItem : aliased constant Windows.IID := (2270285824, 52913, 16963, (184, 3, 21, 212, 90, 29, 212, 40 ));
   
   type IChatItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ItemKind
   (
      This       : access IChatItem_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatItemKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageAttachment : aliased constant Windows.IID := (3351575924, 48995, 22763, (80, 140, 139, 134, 63, 241, 107, 103 ));
   
   type IChatMessageAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataStreamReference
   (
      This       : access IChatMessageAttachment_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_DataStreamReference
   (
      This       : access IChatMessageAttachment_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_GroupId
   (
      This       : access IChatMessageAttachment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_GroupId
   (
      This       : access IChatMessageAttachment_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_MimeType
   (
      This       : access IChatMessageAttachment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_MimeType
   (
      This       : access IChatMessageAttachment_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IChatMessageAttachment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access IChatMessageAttachment_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageAttachment2 : aliased constant Windows.IID := (1591317104, 32209, 19079, (168, 206, 172, 221, 135, 216, 13, 200 ));
   
   type IChatMessageAttachment2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Thumbnail
   (
      This       : access IChatMessageAttachment2_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IChatMessageAttachment2_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_TransferProgress
   (
      This       : access IChatMessageAttachment2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TransferProgress
   (
      This       : access IChatMessageAttachment2_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_OriginalFileName
   (
      This       : access IChatMessageAttachment2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_OriginalFileName
   (
      This       : access IChatMessageAttachment2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageAttachmentFactory : aliased constant Windows.IID := (542659234, 41814, 23409, (108, 169, 102, 201, 133, 183, 208, 213 ));
   
   type IChatMessageAttachmentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateChatMessageAttachment
   (
      This       : access IChatMessageAttachmentFactory_Interface
      ; mimeType : Windows.String
      ; dataStreamReference : Windows.Storage.Streams.IRandomAccessStreamReference
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageNotificationTriggerDetails : aliased constant Windows.IID := (4248063483, 12387, 19991, (133, 134, 198, 192, 130, 98, 230, 192 ));
   
   type IChatMessageNotificationTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ChatMessage
   (
      This       : access IChatMessageNotificationTriggerDetails_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatMessageNotificationTriggerDetails2 : aliased constant Windows.IID := (1807033056, 43527, 20433, (148, 113, 119, 147, 79, 183, 94, 230 ));
   
   type IChatMessageNotificationTriggerDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShouldDisplayToast
   (
      This       : access IChatMessageNotificationTriggerDetails2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldUpdateDetailText
   (
      This       : access IChatMessageNotificationTriggerDetails2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldUpdateBadge
   (
      This       : access IChatMessageNotificationTriggerDetails2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShouldUpdateActionCenter
   (
      This       : access IChatMessageNotificationTriggerDetails2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatCapabilities : aliased constant Windows.IID := (989820860, 14793, 19921, (173, 45, 57, 100, 221, 157, 64, 63 ));
   
   type IChatCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsOnline
   (
      This       : access IChatCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsChatCapable
   (
      This       : access IChatCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFileTransferCapable
   (
      This       : access IChatCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGeoLocationPushCapable
   (
      This       : access IChatCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIntegratedMessagingCapable
   (
      This       : access IChatCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatCapabilitiesManagerStatics : aliased constant Windows.IID := (3044683568, 28737, 17806, (176, 207, 124, 13, 159, 234, 51, 58 ));
   
   type IChatCapabilitiesManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetCachedCapabilitiesAsync
   (
      This       : access IChatCapabilitiesManagerStatics_Interface
      ; address : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCapabilitiesFromNetworkAsync
   (
      This       : access IChatCapabilitiesManagerStatics_Interface
      ; address : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatRecipientDeliveryInfo : aliased constant Windows.IID := (4291277474, 10300, 19466, (138, 14, 140, 51, 189, 191, 5, 69 ));
   
   type IChatRecipientDeliveryInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TransportAddress
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_TransportAddress
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeliveryTime
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DeliveryTime
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ReadTime
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ReadTime
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportErrorCodeCategory
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatTransportErrorCodeCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportInterpretedErrorCode
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatTransportInterpretedErrorCode
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportErrorCode
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsErrorPermanent
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatMessageStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatConversationThreadingInfo : aliased constant Windows.IID := (857481692, 31239, 17442, (163, 44, 36, 190, 124, 109, 171, 36 ));
   
   type IChatConversationThreadingInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContactId
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ContactId
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Custom
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Custom
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConversationId
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ConversationId
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Participants
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatConversationThreadingKind
   )
   return Windows.HRESULT is abstract;
   
   function put_Kind
   (
      This       : access IChatConversationThreadingInfo_Interface
      ; value : Windows.ApplicationModel.Chat.ChatConversationThreadingKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatConversationReader : aliased constant Windows.IID := (89208530, 56882, 19015, (169, 58, 179, 220, 8, 51, 133, 43 ));
   
   type IChatConversationReader_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadBatchAsync
   (
      This       : access IChatConversationReader_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReadBatchWithCountAsync
   (
      This       : access IChatConversationReader_Interface
      ; count : Windows.Int32
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatConversation : aliased constant Windows.IID := (2777417741, 6767, 18140, (143, 61, 245, 2, 134, 96, 182, 238 ));
   
   type IChatConversation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasUnreadMessages
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subject
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subject
   (
      This       : access IChatConversation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsConversationMuted
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsConversationMuted
   (
      This       : access IChatConversation_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MostRecentMessageId
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Participants
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ThreadingInfo
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatConversationThreadingInfo
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetMessageReader
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageReader
   )
   return Windows.HRESULT is abstract;
   
   function MarkAllMessagesAsReadAsync
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MarkMessagesAsReadAsync
   (
      This       : access IChatConversation_Interface
      ; value : Windows.Foundation.DateTime
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IChatConversation_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function NotifyLocalParticipantComposing
   (
      This       : access IChatConversation_Interface
      ; transportId : Windows.String
      ; participantAddress : Windows.String
      ; isComposing : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function NotifyRemoteParticipantComposing
   (
      This       : access IChatConversation_Interface
      ; transportId : Windows.String
      ; participantAddress : Windows.String
      ; isComposing : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_RemoteParticipantComposingChanged
   (
      This       : access IChatConversation_Interface
      ; handler : TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RemoteParticipantComposingChanged
   (
      This       : access IChatConversation_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatConversation2 : aliased constant Windows.IID := (167972049, 38970, 18346, (154, 144, 238, 72, 238, 153, 123, 89 ));
   
   type IChatConversation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanModifyParticipants
   (
      This       : access IChatConversation2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanModifyParticipants
   (
      This       : access IChatConversation2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRemoteParticipantComposingChangedEventArgs : aliased constant Windows.IID := (515917223, 53193, 17865, (152, 118, 68, 159, 43, 193, 128, 245 ));
   
   type IRemoteParticipantComposingChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TransportId
   (
      This       : access IRemoteParticipantComposingChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ParticipantAddress
   (
      This       : access IRemoteParticipantComposingChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsComposing
   (
      This       : access IRemoteParticipantComposingChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatSyncManager : aliased constant Windows.IID := (2074422371, 9808, 18543, (180, 180, 107, 217, 211, 214, 60, 132 ));
   
   type IChatSyncManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Configuration
   (
      This       : access IChatSyncManager_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatSyncConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function AssociateAccountAsync
   (
      This       : access IChatSyncManager_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UnassociateAccountAsync
   (
      This       : access IChatSyncManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function IsAccountAssociated
   (
      This       : access IChatSyncManager_Interface
      ; webAccount : Windows.Security.Credentials.IWebAccount
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function StartSync
   (
      This       : access IChatSyncManager_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetConfigurationAsync
   (
      This       : access IChatSyncManager_Interface
      ; configuration : Windows.ApplicationModel.Chat.IChatSyncConfiguration
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IChatSyncConfiguration : aliased constant Windows.IID := (167274930, 27124, 19199, (130, 182, 6, 153, 47, 244, 2, 210 ));
   
   type IChatSyncConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSyncEnabled
   (
      This       : access IChatSyncConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsSyncEnabled
   (
      This       : access IChatSyncConfiguration_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RestoreHistorySpan
   (
      This       : access IChatSyncConfiguration_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.ChatRestoreHistorySpan
   )
   return Windows.HRESULT is abstract;
   
   function put_RestoreHistorySpan
   (
      This       : access IChatSyncConfiguration_Interface
      ; value : Windows.ApplicationModel.Chat.ChatRestoreHistorySpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsServiceKindSupportedChangedEventArgs : aliased constant Windows.IID := (4101939780, 59267, 18534, (179, 167, 78, 92, 207, 2, 48, 112 ));
   
   type IRcsServiceKindSupportedChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ServiceKind
   (
      This       : access IRcsServiceKindSupportedChangedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.RcsServiceKind
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsManagerStatics : aliased constant Windows.IID := (2099710661, 2749, 20273, (155, 153, 165, 158, 113, 167, 183, 49 ));
   
   type IRcsManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetEndUserMessageManager
   (
      This       : access IRcsManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IRcsEndUserMessageManager
   )
   return Windows.HRESULT is abstract;
   
   function GetTransportsAsync
   (
      This       : access IRcsManagerStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetTransportAsync
   (
      This       : access IRcsManagerStatics_Interface
      ; transportId : Windows.String
      ; RetVal : access Windows.ApplicationModel.Chat.IAsyncOperation_IRcsTransport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function LeaveConversationAsync
   (
      This       : access IRcsManagerStatics_Interface
      ; conversation : Windows.ApplicationModel.Chat.IChatConversation
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsTransport : aliased constant Windows.IID := (4272113497, 62332, 17177, (133, 70, 236, 132, 210, 29, 48, 255 ));
   
   type IRcsTransport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedProperties
   (
      This       : access IRcsTransport_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access IRcsTransport_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportFriendlyName
   (
      This       : access IRcsTransport_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TransportId
   (
      This       : access IRcsTransport_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Configuration
   (
      This       : access IRcsTransport_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IRcsTransportConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function IsStoreAndForwardEnabled
   (
      This       : access IRcsTransport_Interface
      ; serviceKind : Windows.ApplicationModel.Chat.RcsServiceKind
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsServiceKindSupported
   (
      This       : access IRcsTransport_Interface
      ; serviceKind : Windows.ApplicationModel.Chat.RcsServiceKind
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_ServiceKindSupportedChanged
   (
      This       : access IRcsTransport_Interface
      ; handler : TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ServiceKindSupportedChanged
   (
      This       : access IRcsTransport_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsTransportConfiguration : aliased constant Windows.IID := (533508354, 9330, 19385, (153, 136, 193, 33, 28, 131, 232, 169 ));
   
   type IRcsTransportConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxAttachmentCount
   (
      This       : access IRcsTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxMessageSizeInKilobytes
   (
      This       : access IRcsTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxGroupMessageSizeInKilobytes
   (
      This       : access IRcsTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxRecipientCount
   (
      This       : access IRcsTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxFileSizeInKilobytes
   (
      This       : access IRcsTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_WarningFileSizeInKilobytes
   (
      This       : access IRcsTransportConfiguration_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsEndUserMessageManager : aliased constant Windows.IID := (810856026, 19743, 19289, (148, 51, 18, 108, 115, 78, 134, 166 ));
   
   type IRcsEndUserMessageManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MessageAvailableChanged
   (
      This       : access IRcsEndUserMessageManager_Interface
      ; handler : TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MessageAvailableChanged
   (
      This       : access IRcsEndUserMessageManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsEndUserMessageAction : aliased constant Windows.IID := (2453112631, 39746, 18131, (157, 94, 60, 27, 45, 174, 124, 184 ));
   
   type IRcsEndUserMessageAction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Label
   (
      This       : access IRcsEndUserMessageAction_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsEndUserMessage : aliased constant Windows.IID := (3620578795, 52183, 20283, (133, 38, 181, 6, 222, 195, 92, 83 ));
   
   type IRcsEndUserMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TransportId
   (
      This       : access IRcsEndUserMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IRcsEndUserMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IRcsEndUserMessage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPinRequired
   (
      This       : access IRcsEndUserMessage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Actions
   (
      This       : access IRcsEndUserMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IVectorView_IRcsEndUserMessageAction -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendResponseAsync
   (
      This       : access IRcsEndUserMessage_Interface
      ; action : Windows.ApplicationModel.Chat.IRcsEndUserMessageAction
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function SendResponseWithPinAsync
   (
      This       : access IRcsEndUserMessage_Interface
      ; action : Windows.ApplicationModel.Chat.IRcsEndUserMessageAction
      ; pin : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsEndUserMessageAvailableEventArgs : aliased constant Windows.IID := (759541249, 16265, 16874, (151, 2, 158, 158, 212, 17, 170, 152 ));
   
   type IRcsEndUserMessageAvailableEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsMessageAvailable
   (
      This       : access IRcsEndUserMessageAvailableEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IRcsEndUserMessageAvailableEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IRcsEndUserMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRcsEndUserMessageAvailableTriggerDetails : aliased constant Windows.IID := (1536652333, 13599, 18066, (180, 30, 27, 3, 93, 193, 137, 134 ));
   
   type IRcsEndUserMessageAvailableTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IRcsEndUserMessageAvailableTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IRcsEndUserMessageAvailableTriggerDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IChatMessageAttachment : aliased constant Windows.IID := (3157784741, 52577, 20564, (168, 151, 109, 64, 43, 86, 181, 139 ));
   
   type IIterator_IChatMessageAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IChatMessageAttachment_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IChatMessageAttachment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IChatMessageAttachment_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IChatMessageAttachment_Interface
      ; items : Windows.ApplicationModel.Chat.IChatMessageAttachment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IChatMessageAttachment : aliased constant Windows.IID := (2317235884, 5046, 22396, (155, 67, 61, 36, 164, 83, 248, 102 ));
   
   type IIterable_IChatMessageAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IChatMessageAttachment_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IIterator_IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IChatMessageAttachment : aliased constant Windows.IID := (1358283659, 29855, 23542, (149, 96, 17, 169, 135, 111, 32, 209 ));
   
   type IVectorView_IChatMessageAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IChatMessageAttachment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IChatMessageAttachment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IChatMessageAttachment_Interface
      ; value : Windows.ApplicationModel.Chat.IChatMessageAttachment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IChatMessageAttachment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Chat.IChatMessageAttachment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IChatMessageAttachment : aliased constant Windows.IID := (2904631281, 12822, 22779, (129, 84, 178, 65, 166, 11, 66, 82 ));
   
   type IVector_IChatMessageAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IVectorView_IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; value : Windows.ApplicationModel.Chat.IChatMessageAttachment
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Chat.IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Chat.IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; value : Windows.ApplicationModel.Chat.IChatMessageAttachment
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IChatMessageAttachment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IChatMessageAttachment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Chat.IChatMessageAttachment_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IChatMessageAttachment_Interface
      ; items : Windows.ApplicationModel.Chat.IChatMessageAttachment_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IChatRecipientDeliveryInfo : aliased constant Windows.IID := (981143352, 60631, 22008, (165, 197, 224, 61, 67, 163, 151, 142 ));
   
   type IIterator_IChatRecipientDeliveryInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IChatRecipientDeliveryInfo_Interface
      ; items : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IChatRecipientDeliveryInfo : aliased constant Windows.IID := (3822564428, 18473, 22043, (161, 94, 167, 69, 229, 173, 246, 209 ));
   
   type IIterable_IChatRecipientDeliveryInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IIterator_IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IChatRecipientDeliveryInfo : aliased constant Windows.IID := (2023227347, 32134, 23689, (187, 226, 202, 112, 141, 26, 51, 152 ));
   
   type IVectorView_IChatRecipientDeliveryInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IChatRecipientDeliveryInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IChatRecipientDeliveryInfo_Interface
      ; value : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IChatRecipientDeliveryInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IChatRecipientDeliveryInfo : aliased constant Windows.IID := (342098785, 16269, 22022, (143, 203, 151, 50, 8, 183, 109, 114 ));
   
   type IVector_IChatRecipientDeliveryInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IVectorView_IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; value : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; value : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IChatRecipientDeliveryInfo_Interface
      ; items : Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IChatMessage : aliased constant Windows.IID := (3994197026, 55951, 23637, (144, 182, 167, 59, 172, 201, 215, 53 ));
   
   type IAsyncOperation_IChatMessage_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IChatMessage_Interface
      ; handler : Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IChatMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatMessage
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IChatMessage_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IChatConversation : aliased constant Windows.IID := (3302548500, 3668, 23263, (136, 195, 229, 109, 78, 136, 181, 212 ));
   
   type IAsyncOperation_IChatConversation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IChatConversation_Interface
      ; handler : Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatConversation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IChatConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatConversation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IChatConversation_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatConversation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IChatMessageStore : aliased constant Windows.IID := (425993221, 3590, 20761, (154, 197, 22, 207, 209, 6, 179, 55 ));
   
   type IAsyncOperation_IChatMessageStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IChatMessageStore_Interface
      ; handler : Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatMessageStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IChatMessageStore_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatMessageStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IChatMessageStore_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageStore
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IChatMessageTransport : aliased constant Windows.IID := (660502677, 14990, 20853, (183, 111, 33, 210, 224, 69, 189, 47 ));
   
   type IAsyncOperation_IChatMessageTransport_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IChatMessageTransport_Interface
      ; handler : Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatMessageTransport
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IChatMessageTransport_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatMessageTransport
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IChatMessageTransport_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatMessageTransport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IChatSyncManager : aliased constant Windows.IID := (2758179434, 7268, 20982, (151, 46, 161, 5, 7, 25, 248, 234 ));
   
   type IAsyncOperation_IChatSyncManager_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IChatSyncManager_Interface
      ; handler : Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatSyncManager
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IChatSyncManager_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatSyncManager
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IChatSyncManager_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatSyncManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IChatCapabilities : aliased constant Windows.IID := (814256181, 50823, 22331, (134, 228, 2, 78, 56, 242, 170, 109 ));
   
   type IAsyncOperation_IChatCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IChatCapabilities_Interface
      ; handler : Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IChatCapabilities_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IChatCapabilities
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IChatCapabilities_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IChatCapabilities
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IRcsTransport : aliased constant Windows.IID := (4169626856, 38500, 24053, (171, 189, 198, 69, 86, 210, 80, 98 ));
   
   type IAsyncOperation_IRcsTransport_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IRcsTransport_Interface
      ; handler : Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IRcsTransport
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IRcsTransport_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.AsyncOperationCompletedHandler_IRcsTransport
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IRcsTransport_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IRcsTransport
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IRcsEndUserMessageAction : aliased constant Windows.IID := (1973649204, 55421, 21852, (142, 100, 161, 234, 72, 163, 221, 32 ));
   
   type IIterator_IRcsEndUserMessageAction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IRcsEndUserMessageAction_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IRcsEndUserMessageAction
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IRcsEndUserMessageAction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IRcsEndUserMessageAction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IRcsEndUserMessageAction_Interface
      ; items : Windows.ApplicationModel.Chat.IRcsEndUserMessageAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IRcsEndUserMessageAction : aliased constant Windows.IID := (3067222613, 18206, 23077, (172, 221, 119, 132, 247, 180, 215, 186 ));
   
   type IIterable_IRcsEndUserMessageAction_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IRcsEndUserMessageAction_Interface
      ; RetVal : access Windows.ApplicationModel.Chat.IIterator_IRcsEndUserMessageAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IRcsEndUserMessageAction : aliased constant Windows.IID := (2517099383, 59507, 20625, (158, 50, 134, 149, 232, 245, 14, 122 ));
   
   type IVectorView_IRcsEndUserMessageAction_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IRcsEndUserMessageAction_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.Chat.IRcsEndUserMessageAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IRcsEndUserMessageAction_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IRcsEndUserMessageAction_Interface
      ; value : Windows.ApplicationModel.Chat.IRcsEndUserMessageAction
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IRcsEndUserMessageAction_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.Chat.IRcsEndUserMessageAction_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IChatMessage : aliased constant Windows.IID := (654634476, 157, 23227, (167, 24, 118, 119, 24, 21, 141, 136 ));
   
   type AsyncOperationCompletedHandler_IChatMessage_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessage ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IChatMessage'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatMessage_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessage
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IChatMessageStore_add_MessageChanged : aliased constant Windows.IID := (709809105, 3329, 20787, (185, 228, 221, 246, 143, 9, 148, 133 ));
   
   type TypedEventHandler_IChatMessageStore_add_MessageChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Chat.IChatMessageStore ; args : Windows.ApplicationModel.Chat.IChatMessageChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IChatMessageStore_add_MessageChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IChatMessageStore_add_MessageChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IChatMessageStore
      ; args : Windows.ApplicationModel.Chat.IChatMessageChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IChatConversation : aliased constant Windows.IID := (194778609, 6257, 20677, (134, 222, 110, 97, 77, 89, 60, 87 ));
   
   type AsyncOperationCompletedHandler_IChatConversation_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatConversation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IChatConversation'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatConversation_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatConversation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IChatMessageStore2_add_StoreChanged : aliased constant Windows.IID := (995689431, 41015, 23676, (131, 54, 136, 66, 61, 129, 228, 8 ));
   
   type TypedEventHandler_IChatMessageStore2_add_StoreChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Chat.IChatMessageStore ; args : Windows.ApplicationModel.Chat.IChatMessageStoreChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IChatMessageStore2_add_StoreChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IChatMessageStore2_add_StoreChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IChatMessageStore
      ; args : Windows.ApplicationModel.Chat.IChatMessageStoreChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IChatMessageStore : aliased constant Windows.IID := (2836877190, 8135, 20724, (141, 126, 16, 61, 63, 214, 229, 163 ));
   
   type AsyncOperationCompletedHandler_IChatMessageStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IChatMessageStore'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatMessageStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IChatMessageTransport : aliased constant Windows.IID := (1776059825, 47627, 22483, (183, 195, 97, 142, 1, 86, 248, 203 ));
   
   type AsyncOperationCompletedHandler_IChatMessageTransport_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageTransport ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IChatMessageTransport'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatMessageTransport_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageTransport
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IChatSyncManager : aliased constant Windows.IID := (1530204876, 34088, 24199, (176, 97, 27, 152, 42, 100, 127, 196 ));
   
   type AsyncOperationCompletedHandler_IChatSyncManager_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatSyncManager ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IChatSyncManager'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatSyncManager_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatSyncManager
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IChatCapabilities : aliased constant Windows.IID := (3459056476, 30342, 22205, (162, 202, 25, 71, 53, 253, 134, 23 ));
   
   type AsyncOperationCompletedHandler_IChatCapabilities_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IChatCapabilities'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IChatCapabilities_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged : aliased constant Windows.IID := (165952434, 26925, 21296, (185, 231, 173, 246, 154, 213, 193, 169 ));
   
   type TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Chat.IChatConversation ; args : Windows.ApplicationModel.Chat.IRemoteParticipantComposingChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IChatConversation_add_RemoteParticipantComposingChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IChatConversation
      ; args : Windows.ApplicationModel.Chat.IRemoteParticipantComposingChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IRcsTransport : aliased constant Windows.IID := (2018617797, 5223, 23677, (175, 116, 87, 236, 107, 211, 52, 23 ));
   
   type AsyncOperationCompletedHandler_IRcsTransport_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IRcsTransport ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IRcsTransport'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IRcsTransport_Interface
      ; asyncInfo : Windows.ApplicationModel.Chat.IAsyncOperation_IRcsTransport
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged : aliased constant Windows.IID := (3857826724, 58520, 20656, (145, 254, 148, 235, 176, 29, 224, 171 ));
   
   type TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Chat.IRcsTransport ; args : Windows.ApplicationModel.Chat.IRcsServiceKindSupportedChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IRcsTransport_add_ServiceKindSupportedChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IRcsTransport
      ; args : Windows.ApplicationModel.Chat.IRcsServiceKindSupportedChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged : aliased constant Windows.IID := (2372660022, 63182, 22377, (150, 194, 37, 50, 110, 180, 99, 246 ));
   
   type TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.Chat.IRcsEndUserMessageManager ; args : Windows.ApplicationModel.Chat.IRcsEndUserMessageAvailableEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IRcsEndUserMessageManager_add_MessageAvailableChanged_Interface
      ; sender : Windows.ApplicationModel.Chat.IRcsEndUserMessageManager
      ; args : Windows.ApplicationModel.Chat.IRcsEndUserMessageAvailableEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ChatMessageTransportConfiguration is Windows.ApplicationModel.Chat.IChatMessageTransportConfiguration;
   subtype ChatMessage is Windows.ApplicationModel.Chat.IChatMessage;
   function CreateChatMessage return Windows.ApplicationModel.Chat.IChatMessage;
   
   subtype ChatMessageChange is Windows.ApplicationModel.Chat.IChatMessageChange;
   subtype ChatMessageChangeReader is Windows.ApplicationModel.Chat.IChatMessageChangeReader;
   subtype ChatMessageAttachment is Windows.ApplicationModel.Chat.IChatMessageAttachment;
   function CreateChatMessageAttachment
   (
      mimeType : Windows.String
      ; dataStreamReference : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.ApplicationModel.Chat.IChatMessageAttachment;
   
   subtype ChatConversationThreadingInfo is Windows.ApplicationModel.Chat.IChatConversationThreadingInfo;
   function CreateChatConversationThreadingInfo return Windows.ApplicationModel.Chat.IChatConversationThreadingInfo;
   
   subtype ChatRecipientDeliveryInfo is Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo;
   function CreateChatRecipientDeliveryInfo return Windows.ApplicationModel.Chat.IChatRecipientDeliveryInfo;
   
   subtype ChatMessageChangeTracker is Windows.ApplicationModel.Chat.IChatMessageChangeTracker;
   subtype ChatMessageReader is Windows.ApplicationModel.Chat.IChatMessageReader;
   subtype ChatMessageValidationResult is Windows.ApplicationModel.Chat.IChatMessageValidationResult;
   subtype ChatMessageStore is Windows.ApplicationModel.Chat.IChatMessageStore;
   subtype ChatMessageChangedEventArgs is Windows.ApplicationModel.Chat.IChatMessageChangedEventArgs;
   subtype ChatConversation is Windows.ApplicationModel.Chat.IChatConversation;
   subtype ChatConversationReader is Windows.ApplicationModel.Chat.IChatConversationReader;
   subtype ChatQueryOptions is Windows.ApplicationModel.Chat.IChatQueryOptions;
   function CreateChatQueryOptions return Windows.ApplicationModel.Chat.IChatQueryOptions;
   
   subtype ChatSearchReader is Windows.ApplicationModel.Chat.IChatSearchReader;
   subtype ChatMessageStoreChangedEventArgs is Windows.ApplicationModel.Chat.IChatMessageStoreChangedEventArgs;
   subtype ChatMessageChangedDeferral is Windows.ApplicationModel.Chat.IChatMessageChangedDeferral;
   subtype ChatMessageTransport is Windows.ApplicationModel.Chat.IChatMessageTransport;
   subtype ChatSyncManager is Windows.ApplicationModel.Chat.IChatSyncManager;
   subtype ChatCapabilities is Windows.ApplicationModel.Chat.IChatCapabilities;
   subtype RemoteParticipantComposingChangedEventArgs is Windows.ApplicationModel.Chat.IRemoteParticipantComposingChangedEventArgs;
   subtype ChatSyncConfiguration is Windows.ApplicationModel.Chat.IChatSyncConfiguration;
   subtype RcsEndUserMessageManager is Windows.ApplicationModel.Chat.IRcsEndUserMessageManager;
   subtype RcsTransport is Windows.ApplicationModel.Chat.IRcsTransport;
   subtype RcsTransportConfiguration is Windows.ApplicationModel.Chat.IRcsTransportConfiguration;
   subtype RcsServiceKindSupportedChangedEventArgs is Windows.ApplicationModel.Chat.IRcsServiceKindSupportedChangedEventArgs;
   subtype RcsEndUserMessageAvailableEventArgs is Windows.ApplicationModel.Chat.IRcsEndUserMessageAvailableEventArgs;
   subtype RcsEndUserMessageAction is Windows.ApplicationModel.Chat.IRcsEndUserMessageAction;
   subtype RcsEndUserMessage is Windows.ApplicationModel.Chat.IRcsEndUserMessage;
   subtype ChatMessageNotificationTriggerDetails is Windows.ApplicationModel.Chat.IChatMessageNotificationTriggerDetails;
   subtype RcsEndUserMessageAvailableTriggerDetails is Windows.ApplicationModel.Chat.IRcsEndUserMessageAvailableTriggerDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetTransportsAsync
   return Windows.Address;
   
   function RequestStoreAsync
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageStore;
   
   function ShowComposeSmsMessageAsync
   (
      message : Windows.ApplicationModel.Chat.IChatMessage
   )
   return Windows.Foundation.IAsyncAction;
   
   procedure ShowSmsSettings
   ;
   
   function RegisterTransportAsync
   return Windows.Foundation.IAsyncOperation_String;
   
   function GetTransportAsync
   (
      transportId : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatMessageTransport;
   
   function RequestSyncManagerAsync
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatSyncManager;
   
   function MarkMessageAsBlockedAsync
   (
      localChatMessageId : Windows.String
      ; blocked : Windows.Boolean
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetCachedCapabilitiesAsync
   (
      address : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities;
   
   function GetCapabilitiesFromNetworkAsync
   (
      address : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IChatCapabilities;
   
   function GetEndUserMessageManager
   return Windows.ApplicationModel.Chat.IRcsEndUserMessageManager;
   
   function GetTransportsAsync_RcsManager
   return Windows.Address;
   
   function GetTransportAsync
   (
      transportId : Windows.String
   )
   return Windows.ApplicationModel.Chat.IAsyncOperation_IRcsTransport;
   
   function LeaveConversationAsync
   (
      conversation : Windows.ApplicationModel.Chat.IChatConversation
   )
   return Windows.Foundation.IAsyncAction;
   
end;
