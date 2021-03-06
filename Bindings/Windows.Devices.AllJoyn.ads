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
with Windows.Foundation.Collections;
with Windows; use Windows;
limited with Windows.Globalization;
limited with Windows.Security.Cryptography.Certificates;
limited with Windows.Networking.Sockets;
limited with Windows.Devices.Enumeration;
limited with Windows.Security.Credentials;
--------------------------------------------------------------------------------
package Windows.Devices.AllJoyn is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AllJoynAuthenticationMechanism is (
      None,
      EcdheNull,
      EcdheEcdsa,
      EcdheSpeke
   );
   for AllJoynAuthenticationMechanism use (
      None => 0,
      EcdheNull => 3,
      EcdheEcdsa => 5,
      EcdheSpeke => 6
   );
   for AllJoynAuthenticationMechanism'Size use 32;
   
   type AllJoynAuthenticationMechanism_Ptr is access AllJoynAuthenticationMechanism;
   
   type AllJoynBusAttachmentState is (
      Disconnected,
      Connecting,
      Connected,
      Disconnecting
   );
   for AllJoynBusAttachmentState use (
      Disconnected => 0,
      Connecting => 1,
      Connected => 2,
      Disconnecting => 3
   );
   for AllJoynBusAttachmentState'Size use 32;
   
   type AllJoynBusAttachmentState_Ptr is access AllJoynBusAttachmentState;
   
   type AllJoynTrafficType is (
      Unknown,
      Messages,
      RawUnreliable,
      RawReliable
   );
   for AllJoynTrafficType use (
      Unknown => 0,
      Messages => 1,
      RawUnreliable => 2,
      RawReliable => 4
   );
   for AllJoynTrafficType'Size use 32;
   
   type AllJoynTrafficType_Ptr is access AllJoynTrafficType;
   
   type AllJoynSessionLostReason is (
      None,
      ProducerLeftSession,
      ProducerClosedAbruptly,
      RemovedByProducer,
      LinkTimeout,
      Other
   );
   for AllJoynSessionLostReason use (
      None => 0,
      ProducerLeftSession => 1,
      ProducerClosedAbruptly => 2,
      RemovedByProducer => 3,
      LinkTimeout => 4,
      Other => 5
   );
   for AllJoynSessionLostReason'Size use 32;
   
   type AllJoynSessionLostReason_Ptr is access AllJoynSessionLostReason;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IAllJoynBusAttachment_add_StateChanged_Interface;
   type TypedEventHandler_IAllJoynBusAttachment_add_StateChanged is access all TypedEventHandler_IAllJoynBusAttachment_add_StateChanged_Interface'Class;
   type TypedEventHandler_IAllJoynBusAttachment_add_StateChanged_Ptr is access all TypedEventHandler_IAllJoynBusAttachment_add_StateChanged;
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested_Interface;
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested is access all TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested_Interface'Class;
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested_Ptr is access all TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested;
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested_Interface;
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested is access all TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested_Interface'Class;
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested_Ptr is access all TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested;
   type TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete_Interface;
   type TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete is access all TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete_Interface'Class;
   type TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete_Ptr is access all TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete;
   type AsyncOperationCompletedHandler_IAllJoynAboutDataView_Interface;
   type AsyncOperationCompletedHandler_IAllJoynAboutDataView is access all AsyncOperationCompletedHandler_IAllJoynAboutDataView_Interface'Class;
   type AsyncOperationCompletedHandler_IAllJoynAboutDataView_Ptr is access all AsyncOperationCompletedHandler_IAllJoynAboutDataView;
   type TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested_Interface;
   type TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested is access all TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested_Interface'Class;
   type TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested_Ptr is access all TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested;
   type TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined_Interface;
   type TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined is access all TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined_Interface'Class;
   type TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined_Ptr is access all TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined;
   type TypedEventHandler_IAllJoynSession_add_MemberAdded_Interface;
   type TypedEventHandler_IAllJoynSession_add_MemberAdded is access all TypedEventHandler_IAllJoynSession_add_MemberAdded_Interface'Class;
   type TypedEventHandler_IAllJoynSession_add_MemberAdded_Ptr is access all TypedEventHandler_IAllJoynSession_add_MemberAdded;
   type TypedEventHandler_IAllJoynSession_add_MemberRemoved_Interface;
   type TypedEventHandler_IAllJoynSession_add_MemberRemoved is access all TypedEventHandler_IAllJoynSession_add_MemberRemoved_Interface'Class;
   type TypedEventHandler_IAllJoynSession_add_MemberRemoved_Ptr is access all TypedEventHandler_IAllJoynSession_add_MemberRemoved;
   type TypedEventHandler_IAllJoynSession_add_Lost_Interface;
   type TypedEventHandler_IAllJoynSession_add_Lost is access all TypedEventHandler_IAllJoynSession_add_Lost_Interface'Class;
   type TypedEventHandler_IAllJoynSession_add_Lost_Ptr is access all TypedEventHandler_IAllJoynSession_add_Lost;
   type AsyncOperationCompletedHandler_IAllJoynSession_Interface;
   type AsyncOperationCompletedHandler_IAllJoynSession is access all AsyncOperationCompletedHandler_IAllJoynSession_Interface'Class;
   type AsyncOperationCompletedHandler_IAllJoynSession_Ptr is access all AsyncOperationCompletedHandler_IAllJoynSession;
   type TypedEventHandler_IAllJoynBusObject_add_Stopped_Interface;
   type TypedEventHandler_IAllJoynBusObject_add_Stopped is access all TypedEventHandler_IAllJoynBusObject_add_Stopped_Interface'Class;
   type TypedEventHandler_IAllJoynBusObject_add_Stopped_Ptr is access all TypedEventHandler_IAllJoynBusObject_add_Stopped;
   type AsyncOperationCompletedHandler_IAllJoynServiceInfo_Interface;
   type AsyncOperationCompletedHandler_IAllJoynServiceInfo is access all AsyncOperationCompletedHandler_IAllJoynServiceInfo_Interface'Class;
   type AsyncOperationCompletedHandler_IAllJoynServiceInfo_Ptr is access all AsyncOperationCompletedHandler_IAllJoynServiceInfo;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAllJoynStatusStatics_Interface;
   type IAllJoynStatusStatics is access all IAllJoynStatusStatics_Interface'Class;
   type IAllJoynStatusStatics_Ptr is access all IAllJoynStatusStatics;
   type IAllJoynBusAttachment_Interface;
   type IAllJoynBusAttachment is access all IAllJoynBusAttachment_Interface'Class;
   type IAllJoynBusAttachment_Ptr is access all IAllJoynBusAttachment;
   type IAllJoynBusAttachment2_Interface;
   type IAllJoynBusAttachment2 is access all IAllJoynBusAttachment2_Interface'Class;
   type IAllJoynBusAttachment2_Ptr is access all IAllJoynBusAttachment2;
   type IAllJoynBusAttachmentStatics_Interface;
   type IAllJoynBusAttachmentStatics is access all IAllJoynBusAttachmentStatics_Interface'Class;
   type IAllJoynBusAttachmentStatics_Ptr is access all IAllJoynBusAttachmentStatics;
   type IAllJoynBusAttachmentStateChangedEventArgs_Interface;
   type IAllJoynBusAttachmentStateChangedEventArgs is access all IAllJoynBusAttachmentStateChangedEventArgs_Interface'Class;
   type IAllJoynBusAttachmentStateChangedEventArgs_Ptr is access all IAllJoynBusAttachmentStateChangedEventArgs;
   type IAllJoynCredentials_Interface;
   type IAllJoynCredentials is access all IAllJoynCredentials_Interface'Class;
   type IAllJoynCredentials_Ptr is access all IAllJoynCredentials;
   type IAllJoynCredentialsRequestedEventArgs_Interface;
   type IAllJoynCredentialsRequestedEventArgs is access all IAllJoynCredentialsRequestedEventArgs_Interface'Class;
   type IAllJoynCredentialsRequestedEventArgs_Ptr is access all IAllJoynCredentialsRequestedEventArgs;
   type IAllJoynCredentialsVerificationRequestedEventArgs_Interface;
   type IAllJoynCredentialsVerificationRequestedEventArgs is access all IAllJoynCredentialsVerificationRequestedEventArgs_Interface'Class;
   type IAllJoynCredentialsVerificationRequestedEventArgs_Ptr is access all IAllJoynCredentialsVerificationRequestedEventArgs;
   type IAllJoynAuthenticationCompleteEventArgs_Interface;
   type IAllJoynAuthenticationCompleteEventArgs is access all IAllJoynAuthenticationCompleteEventArgs_Interface'Class;
   type IAllJoynAuthenticationCompleteEventArgs_Ptr is access all IAllJoynAuthenticationCompleteEventArgs;
   type IAllJoynBusAttachmentFactory_Interface;
   type IAllJoynBusAttachmentFactory is access all IAllJoynBusAttachmentFactory_Interface'Class;
   type IAllJoynBusAttachmentFactory_Ptr is access all IAllJoynBusAttachmentFactory;
   type IAllJoynSession_Interface;
   type IAllJoynSession is access all IAllJoynSession_Interface'Class;
   type IAllJoynSession_Ptr is access all IAllJoynSession;
   type IAllJoynSessionStatics_Interface;
   type IAllJoynSessionStatics is access all IAllJoynSessionStatics_Interface'Class;
   type IAllJoynSessionStatics_Ptr is access all IAllJoynSessionStatics;
   type IAllJoynProducer_Interface;
   type IAllJoynProducer is access all IAllJoynProducer_Interface'Class;
   type IAllJoynProducer_Ptr is access all IAllJoynProducer;
   type IAllJoynBusObject_Interface;
   type IAllJoynBusObject is access all IAllJoynBusObject_Interface'Class;
   type IAllJoynBusObject_Ptr is access all IAllJoynBusObject;
   type IAllJoynBusObjectFactory_Interface;
   type IAllJoynBusObjectFactory is access all IAllJoynBusObjectFactory_Interface'Class;
   type IAllJoynBusObjectFactory_Ptr is access all IAllJoynBusObjectFactory;
   type IAllJoynServiceInfo_Interface;
   type IAllJoynServiceInfo is access all IAllJoynServiceInfo_Interface'Class;
   type IAllJoynServiceInfo_Ptr is access all IAllJoynServiceInfo;
   type IAllJoynServiceInfoStatics_Interface;
   type IAllJoynServiceInfoStatics is access all IAllJoynServiceInfoStatics_Interface'Class;
   type IAllJoynServiceInfoStatics_Ptr is access all IAllJoynServiceInfoStatics;
   type IAllJoynServiceInfoFactory_Interface;
   type IAllJoynServiceInfoFactory is access all IAllJoynServiceInfoFactory_Interface'Class;
   type IAllJoynServiceInfoFactory_Ptr is access all IAllJoynServiceInfoFactory;
   type IAllJoynAboutDataViewStatics_Interface;
   type IAllJoynAboutDataViewStatics is access all IAllJoynAboutDataViewStatics_Interface'Class;
   type IAllJoynAboutDataViewStatics_Ptr is access all IAllJoynAboutDataViewStatics;
   type IAllJoynAboutDataView_Interface;
   type IAllJoynAboutDataView is access all IAllJoynAboutDataView_Interface'Class;
   type IAllJoynAboutDataView_Ptr is access all IAllJoynAboutDataView;
   type IAllJoynAboutData_Interface;
   type IAllJoynAboutData is access all IAllJoynAboutData_Interface'Class;
   type IAllJoynAboutData_Ptr is access all IAllJoynAboutData;
   type IAllJoynAcceptSessionJoinerEventArgs_Interface;
   type IAllJoynAcceptSessionJoinerEventArgs is access all IAllJoynAcceptSessionJoinerEventArgs_Interface'Class;
   type IAllJoynAcceptSessionJoinerEventArgs_Ptr is access all IAllJoynAcceptSessionJoinerEventArgs;
   type IAllJoynAcceptSessionJoiner_Interface;
   type IAllJoynAcceptSessionJoiner is access all IAllJoynAcceptSessionJoiner_Interface'Class;
   type IAllJoynAcceptSessionJoiner_Ptr is access all IAllJoynAcceptSessionJoiner;
   type IAllJoynAcceptSessionJoinerEventArgsFactory_Interface;
   type IAllJoynAcceptSessionJoinerEventArgsFactory is access all IAllJoynAcceptSessionJoinerEventArgsFactory_Interface'Class;
   type IAllJoynAcceptSessionJoinerEventArgsFactory_Ptr is access all IAllJoynAcceptSessionJoinerEventArgsFactory;
   type IAllJoynSessionMemberAddedEventArgs_Interface;
   type IAllJoynSessionMemberAddedEventArgs is access all IAllJoynSessionMemberAddedEventArgs_Interface'Class;
   type IAllJoynSessionMemberAddedEventArgs_Ptr is access all IAllJoynSessionMemberAddedEventArgs;
   type IAllJoynSessionMemberAddedEventArgsFactory_Interface;
   type IAllJoynSessionMemberAddedEventArgsFactory is access all IAllJoynSessionMemberAddedEventArgsFactory_Interface'Class;
   type IAllJoynSessionMemberAddedEventArgsFactory_Ptr is access all IAllJoynSessionMemberAddedEventArgsFactory;
   type IAllJoynSessionMemberRemovedEventArgs_Interface;
   type IAllJoynSessionMemberRemovedEventArgs is access all IAllJoynSessionMemberRemovedEventArgs_Interface'Class;
   type IAllJoynSessionMemberRemovedEventArgs_Ptr is access all IAllJoynSessionMemberRemovedEventArgs;
   type IAllJoynSessionMemberRemovedEventArgsFactory_Interface;
   type IAllJoynSessionMemberRemovedEventArgsFactory is access all IAllJoynSessionMemberRemovedEventArgsFactory_Interface'Class;
   type IAllJoynSessionMemberRemovedEventArgsFactory_Ptr is access all IAllJoynSessionMemberRemovedEventArgsFactory;
   type IAllJoynSessionJoinedEventArgs_Interface;
   type IAllJoynSessionJoinedEventArgs is access all IAllJoynSessionJoinedEventArgs_Interface'Class;
   type IAllJoynSessionJoinedEventArgs_Ptr is access all IAllJoynSessionJoinedEventArgs;
   type IAllJoynSessionJoinedEventArgsFactory_Interface;
   type IAllJoynSessionJoinedEventArgsFactory is access all IAllJoynSessionJoinedEventArgsFactory_Interface'Class;
   type IAllJoynSessionJoinedEventArgsFactory_Ptr is access all IAllJoynSessionJoinedEventArgsFactory;
   type IAllJoynSessionLostEventArgs_Interface;
   type IAllJoynSessionLostEventArgs is access all IAllJoynSessionLostEventArgs_Interface'Class;
   type IAllJoynSessionLostEventArgs_Ptr is access all IAllJoynSessionLostEventArgs;
   type IAllJoynSessionLostEventArgsFactory_Interface;
   type IAllJoynSessionLostEventArgsFactory is access all IAllJoynSessionLostEventArgsFactory_Interface'Class;
   type IAllJoynSessionLostEventArgsFactory_Ptr is access all IAllJoynSessionLostEventArgsFactory;
   type IAllJoynProducerStoppedEventArgs_Interface;
   type IAllJoynProducerStoppedEventArgs is access all IAllJoynProducerStoppedEventArgs_Interface'Class;
   type IAllJoynProducerStoppedEventArgs_Ptr is access all IAllJoynProducerStoppedEventArgs;
   type IAllJoynProducerStoppedEventArgsFactory_Interface;
   type IAllJoynProducerStoppedEventArgsFactory is access all IAllJoynProducerStoppedEventArgsFactory_Interface'Class;
   type IAllJoynProducerStoppedEventArgsFactory_Ptr is access all IAllJoynProducerStoppedEventArgsFactory;
   type IAllJoynBusObjectStoppedEventArgs_Interface;
   type IAllJoynBusObjectStoppedEventArgs is access all IAllJoynBusObjectStoppedEventArgs_Interface'Class;
   type IAllJoynBusObjectStoppedEventArgs_Ptr is access all IAllJoynBusObjectStoppedEventArgs;
   type IAllJoynBusObjectStoppedEventArgsFactory_Interface;
   type IAllJoynBusObjectStoppedEventArgsFactory is access all IAllJoynBusObjectStoppedEventArgsFactory_Interface'Class;
   type IAllJoynBusObjectStoppedEventArgsFactory_Ptr is access all IAllJoynBusObjectStoppedEventArgsFactory;
   type IAllJoynWatcherStoppedEventArgs_Interface;
   type IAllJoynWatcherStoppedEventArgs is access all IAllJoynWatcherStoppedEventArgs_Interface'Class;
   type IAllJoynWatcherStoppedEventArgs_Ptr is access all IAllJoynWatcherStoppedEventArgs;
   type IAllJoynWatcherStoppedEventArgsFactory_Interface;
   type IAllJoynWatcherStoppedEventArgsFactory is access all IAllJoynWatcherStoppedEventArgsFactory_Interface'Class;
   type IAllJoynWatcherStoppedEventArgsFactory_Ptr is access all IAllJoynWatcherStoppedEventArgsFactory;
   type IAllJoynServiceInfoRemovedEventArgs_Interface;
   type IAllJoynServiceInfoRemovedEventArgs is access all IAllJoynServiceInfoRemovedEventArgs_Interface'Class;
   type IAllJoynServiceInfoRemovedEventArgs_Ptr is access all IAllJoynServiceInfoRemovedEventArgs;
   type IAllJoynServiceInfoRemovedEventArgsFactory_Interface;
   type IAllJoynServiceInfoRemovedEventArgsFactory is access all IAllJoynServiceInfoRemovedEventArgsFactory_Interface'Class;
   type IAllJoynServiceInfoRemovedEventArgsFactory_Ptr is access all IAllJoynServiceInfoRemovedEventArgsFactory;
   type IAllJoynMessageInfo_Interface;
   type IAllJoynMessageInfo is access all IAllJoynMessageInfo_Interface'Class;
   type IAllJoynMessageInfo_Ptr is access all IAllJoynMessageInfo;
   type IAllJoynMessageInfoFactory_Interface;
   type IAllJoynMessageInfoFactory is access all IAllJoynMessageInfoFactory_Interface'Class;
   type IAllJoynMessageInfoFactory_Ptr is access all IAllJoynMessageInfoFactory;
   type IIterator_AllJoynAuthenticationMechanism_Interface;
   type IIterator_AllJoynAuthenticationMechanism is access all IIterator_AllJoynAuthenticationMechanism_Interface'Class;
   type IIterator_AllJoynAuthenticationMechanism_Ptr is access all IIterator_AllJoynAuthenticationMechanism;
   type IIterable_AllJoynAuthenticationMechanism_Interface;
   type IIterable_AllJoynAuthenticationMechanism is access all IIterable_AllJoynAuthenticationMechanism_Interface'Class;
   type IIterable_AllJoynAuthenticationMechanism_Ptr is access all IIterable_AllJoynAuthenticationMechanism;
   type IVectorView_AllJoynAuthenticationMechanism_Interface;
   type IVectorView_AllJoynAuthenticationMechanism is access all IVectorView_AllJoynAuthenticationMechanism_Interface'Class;
   type IVectorView_AllJoynAuthenticationMechanism_Ptr is access all IVectorView_AllJoynAuthenticationMechanism;
   type IVector_AllJoynAuthenticationMechanism_Interface;
   type IVector_AllJoynAuthenticationMechanism is access all IVector_AllJoynAuthenticationMechanism_Interface'Class;
   type IVector_AllJoynAuthenticationMechanism_Ptr is access all IVector_AllJoynAuthenticationMechanism;
   type IAsyncOperation_IAllJoynAboutDataView_Interface;
   type IAsyncOperation_IAllJoynAboutDataView is access all IAsyncOperation_IAllJoynAboutDataView_Interface'Class;
   type IAsyncOperation_IAllJoynAboutDataView_Ptr is access all IAsyncOperation_IAllJoynAboutDataView;
   type IAsyncOperation_IAllJoynSession_Interface;
   type IAsyncOperation_IAllJoynSession is access all IAsyncOperation_IAllJoynSession_Interface'Class;
   type IAsyncOperation_IAllJoynSession_Ptr is access all IAsyncOperation_IAllJoynSession;
   type IAsyncOperation_IAllJoynServiceInfo_Interface;
   type IAsyncOperation_IAllJoynServiceInfo is access all IAsyncOperation_IAllJoynServiceInfo_Interface'Class;
   type IAsyncOperation_IAllJoynServiceInfo_Ptr is access all IAsyncOperation_IAllJoynServiceInfo;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynStatusStatics : aliased constant Windows.IID := (3501695358, 3369, 19881, (138, 198, 84, 197, 84, 190, 219, 197 ));
   
   type IAllJoynStatusStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Ok
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Fail
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_OperationTimedOut
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherEndClosed
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionRefused
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationFailed
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationRejectedByUser
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SslConnectFailed
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SslIdentityVerificationFailed
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InsufficientSecurity
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument1
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument2
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument3
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument4
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument5
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument6
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument7
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InvalidArgument8
   (
      This       : access IAllJoynStatusStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusAttachment : aliased constant Windows.IID := (4077515091, 7917, 17091, (162, 14, 67, 109, 65, 254, 98, 246 ));
   
   type IAllJoynBusAttachment_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AboutData
   (
      This       : access IAllJoynBusAttachment_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynAboutData
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionSpecification
   (
      This       : access IAllJoynBusAttachment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IAllJoynBusAttachment_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynBusAttachmentState
   )
   return Windows.HRESULT is abstract;
   
   function get_UniqueName
   (
      This       : access IAllJoynBusAttachment_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function PingAsync
   (
      This       : access IAllJoynBusAttachment_Interface
      ; uniqueName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Connect
   (
      This       : access IAllJoynBusAttachment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Disconnect
   (
      This       : access IAllJoynBusAttachment_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access IAllJoynBusAttachment_Interface
      ; handler : TypedEventHandler_IAllJoynBusAttachment_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IAllJoynBusAttachment_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationMechanisms
   (
      This       : access IAllJoynBusAttachment_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IVector_AllJoynAuthenticationMechanism -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_CredentialsRequested
   (
      This       : access IAllJoynBusAttachment_Interface
      ; handler : TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CredentialsRequested
   (
      This       : access IAllJoynBusAttachment_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CredentialsVerificationRequested
   (
      This       : access IAllJoynBusAttachment_Interface
      ; handler : TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CredentialsVerificationRequested
   (
      This       : access IAllJoynBusAttachment_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AuthenticationComplete
   (
      This       : access IAllJoynBusAttachment_Interface
      ; handler : TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AuthenticationComplete
   (
      This       : access IAllJoynBusAttachment_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusAttachment2 : aliased constant Windows.IID := (880069406, 9064, 17330, (180, 62, 106, 58, 193, 39, 141, 152 ));
   
   type IAllJoynBusAttachment2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAboutDataAsync
   (
      This       : access IAllJoynBusAttachment2_Interface
      ; serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
      ; RetVal : access Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAboutDataWithLanguageAsync
   (
      This       : access IAllJoynBusAttachment2_Interface
      ; serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
      ; language : Windows.Globalization.ILanguage
      ; RetVal : access Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_AcceptSessionJoinerRequested
   (
      This       : access IAllJoynBusAttachment2_Interface
      ; handler : TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AcceptSessionJoinerRequested
   (
      This       : access IAllJoynBusAttachment2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SessionJoined
   (
      This       : access IAllJoynBusAttachment2_Interface
      ; handler : TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SessionJoined
   (
      This       : access IAllJoynBusAttachment2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusAttachmentStatics : aliased constant Windows.IID := (2208124221, 4177, 16599, (135, 42, 141, 1, 65, 17, 91, 31 ));
   
   type IAllJoynBusAttachmentStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IAllJoynBusAttachmentStatics_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynBusAttachment
   )
   return Windows.HRESULT is abstract;
   
   function GetWatcher
   (
      This       : access IAllJoynBusAttachmentStatics_Interface
      ; requiredInterfaces : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Devices.Enumeration.IDeviceWatcher
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusAttachmentStateChangedEventArgs : aliased constant Windows.IID := (3626923508, 49194, 16876, (168, 213, 234, 177, 85, 137, 83, 170 ));
   
   type IAllJoynBusAttachmentStateChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IAllJoynBusAttachmentStateChangedEventArgs_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynBusAttachmentState
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IAllJoynBusAttachmentStateChangedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynCredentials : aliased constant Windows.IID := (2185646322, 41360, 16561, (171, 171, 52, 158, 194, 68, 223, 170 ));
   
   type IAllJoynCredentials_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AuthenticationMechanism
   (
      This       : access IAllJoynCredentials_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function get_Certificate
   (
      This       : access IAllJoynCredentials_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function put_Certificate
   (
      This       : access IAllJoynCredentials_Interface
      ; value : Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_PasswordCredential
   (
      This       : access IAllJoynCredentials_Interface
      ; RetVal : access Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function put_PasswordCredential
   (
      This       : access IAllJoynCredentials_Interface
      ; value : Windows.Security.Credentials.IPasswordCredential
   )
   return Windows.HRESULT is abstract;
   
   function get_Timeout
   (
      This       : access IAllJoynCredentials_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Timeout
   (
      This       : access IAllJoynCredentials_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynCredentialsRequestedEventArgs : aliased constant Windows.IID := (1787290446, 45161, 19328, (158, 26, 65, 188, 131, 124, 101, 210 ));
   
   type IAllJoynCredentialsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AttemptCount
   (
      This       : access IAllJoynCredentialsRequestedEventArgs_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Credentials
   (
      This       : access IAllJoynCredentialsRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynCredentials
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerUniqueName
   (
      This       : access IAllJoynCredentialsRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedUserName
   (
      This       : access IAllJoynCredentialsRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAllJoynCredentialsRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynCredentialsVerificationRequestedEventArgs : aliased constant Windows.IID := (2148169234, 47109, 17583, (162, 225, 121, 42, 182, 85, 162, 208 ));
   
   type IAllJoynCredentialsVerificationRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AuthenticationMechanism
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerUniqueName
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerCertificate
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.ICertificate
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerCertificateErrorSeverity
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Networking.Sockets.SocketSslErrorSeverity
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerCertificateErrors
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ChainValidationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerIntermediateCertificates
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Security.Cryptography.Certificates.IVectorView_ICertificate -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Accept_x
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IAllJoynCredentialsVerificationRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynAuthenticationCompleteEventArgs : aliased constant Windows.IID := (2545184796, 5596, 19283, (182, 164, 125, 19, 67, 0, 215, 191 ));
   
   type IAllJoynAuthenticationCompleteEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AuthenticationMechanism
   (
      This       : access IAllJoynAuthenticationCompleteEventArgs_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function get_PeerUniqueName
   (
      This       : access IAllJoynAuthenticationCompleteEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Succeeded
   (
      This       : access IAllJoynAuthenticationCompleteEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusAttachmentFactory : aliased constant Windows.IID := (1680798116, 44421, 19935, (144, 174, 96, 68, 82, 178, 34, 136 ));
   
   type IAllJoynBusAttachmentFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynBusAttachmentFactory_Interface
      ; connectionSpecification : Windows.String
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynBusAttachment
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSession : aliased constant Windows.IID := (3906018060, 49364, 16492, (136, 169, 169, 62, 250, 133, 212, 177 ));
   
   type IAllJoynSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IAllJoynSession_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IAllJoynSession_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function RemoveMemberAsync
   (
      This       : access IAllJoynSession_Interface
      ; uniqueName : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Int32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_MemberAdded
   (
      This       : access IAllJoynSession_Interface
      ; handler : TypedEventHandler_IAllJoynSession_add_MemberAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MemberAdded
   (
      This       : access IAllJoynSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MemberRemoved
   (
      This       : access IAllJoynSession_Interface
      ; handler : TypedEventHandler_IAllJoynSession_add_MemberRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MemberRemoved
   (
      This       : access IAllJoynSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Lost
   (
      This       : access IAllJoynSession_Interface
      ; handler : TypedEventHandler_IAllJoynSession_add_Lost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Lost
   (
      This       : access IAllJoynSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionStatics : aliased constant Windows.IID := (2651182596, 41068, 18132, (180, 108, 11, 11, 84, 16, 91, 68 ));
   
   type IAllJoynSessionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetFromServiceInfoAsync
   (
      This       : access IAllJoynSessionStatics_Interface
      ; serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
      ; RetVal : access Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFromServiceInfoAndBusAttachmentAsync
   (
      This       : access IAllJoynSessionStatics_Interface
      ; serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; RetVal : access Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynProducer : aliased constant Windows.IID := (2634565241, 18075, 18778, (167, 16, 172, 80, 241, 35, 6, 159 ));
   
   type IAllJoynProducer_Interface is interface and Windows.IInspectable_Interface;
   
   function SetBusObject
   (
      This       : access IAllJoynProducer_Interface
      ; busObject : Windows.Devices.AllJoyn.IAllJoynBusObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusObject : aliased constant Windows.IID := (3908928094, 63290, 18700, (136, 4, 4, 224, 38, 100, 48, 71 ));
   
   type IAllJoynBusObject_Interface is interface and Windows.IInspectable_Interface;
   
   function Start
   (
      This       : access IAllJoynBusObject_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IAllJoynBusObject_Interface
   )
   return Windows.HRESULT is abstract;
   
   function AddProducer
   (
      This       : access IAllJoynBusObject_Interface
      ; producer : Windows.Devices.AllJoyn.IAllJoynProducer
   )
   return Windows.HRESULT is abstract;
   
   function get_BusAttachment
   (
      This       : access IAllJoynBusObject_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynBusAttachment
   )
   return Windows.HRESULT is abstract;
   
   function get_Session
   (
      This       : access IAllJoynBusObject_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynSession
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IAllJoynBusObject_Interface
      ; handler : TypedEventHandler_IAllJoynBusObject_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IAllJoynBusObject_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusObjectFactory : aliased constant Windows.IID := (741318411, 36354, 20380, (172, 39, 234, 109, 173, 93, 59, 80 ));
   
   type IAllJoynBusObjectFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynBusObjectFactory_Interface
      ; objectPath : Windows.String
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynBusObject
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithBusAttachment
   (
      This       : access IAllJoynBusObjectFactory_Interface
      ; objectPath : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynBusObject
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynServiceInfo : aliased constant Windows.IID := (1287553545, 47422, 16770, (153, 155, 221, 208, 0, 249, 197, 117 ));
   
   type IAllJoynServiceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UniqueName
   (
      This       : access IAllJoynServiceInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ObjectPath
   (
      This       : access IAllJoynServiceInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionPort
   (
      This       : access IAllJoynServiceInfo_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynServiceInfoStatics : aliased constant Windows.IID := (1450727178, 24634, 18940, (183, 80, 14, 241, 54, 9, 33, 60 ));
   
   type IAllJoynServiceInfoStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IAllJoynServiceInfoStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynServiceInfo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynServiceInfoFactory : aliased constant Windows.IID := (1971444413, 65027, 20299, (148, 164, 240, 47, 220, 189, 17, 184 ));
   
   type IAllJoynServiceInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynServiceInfoFactory_Interface
      ; uniqueName : Windows.String
      ; objectPath : Windows.String
      ; sessionPort : Windows.UInt16
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynServiceInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynAboutDataViewStatics : aliased constant Windows.IID := (1475196552, 3166, 16750, (136, 181, 57, 179, 45, 37, 196, 125 ));
   
   type IAllJoynAboutDataViewStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDataBySessionPortAsync
   (
      This       : access IAllJoynAboutDataViewStatics_Interface
      ; uniqueName : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; sessionPort : Windows.UInt16
      ; RetVal : access Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDataBySessionPortWithLanguageAsync
   (
      This       : access IAllJoynAboutDataViewStatics_Interface
      ; uniqueName : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; sessionPort : Windows.UInt16
      ; language : Windows.Globalization.ILanguage
      ; RetVal : access Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynAboutDataView : aliased constant Windows.IID := (1747128607, 25106, 18740, (156, 72, 225, 156, 164, 152, 66, 136 ));
   
   type IAllJoynAboutDataView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AJSoftwareVersion
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppId
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_DateOfManufacture
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultLanguage
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Globalization.ILanguage
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceId
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareVersion
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelNumber
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SoftwareVersion
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedLanguages
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Globalization.IVectorView_ILanguage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportUrl
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AppName
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceName
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Manufacturer
   (
      This       : access IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynAboutData : aliased constant Windows.IID := (3853106944, 8098, 18489, (147, 239, 249, 223, 64, 72, 144, 247 ));
   
   type IAllJoynAboutData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsEnabled
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultAppName
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultAppName
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AppNames
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DateOfManufacture
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_DateOfManufacture
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.Foundation.IReference_DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultDescription
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultDescription
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Descriptions
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultManufacturer
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultManufacturer
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Manufacturers
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ModelNumber
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ModelNumber
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SoftwareVersion
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_SoftwareVersion
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportUrl
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_SupportUrl
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AppId
   (
      This       : access IAllJoynAboutData_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function put_AppId
   (
      This       : access IAllJoynAboutData_Interface
      ; value : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynAcceptSessionJoinerEventArgs : aliased constant Windows.IID := (1325093733, 16010, 16983, (143, 16, 83, 156, 224, 213, 108, 15 ));
   
   type IAllJoynAcceptSessionJoinerEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UniqueName
   (
      This       : access IAllJoynAcceptSessionJoinerEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SessionPort
   (
      This       : access IAllJoynAcceptSessionJoinerEventArgs_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_TrafficType
   (
      This       : access IAllJoynAcceptSessionJoinerEventArgs_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynTrafficType
   )
   return Windows.HRESULT is abstract;
   
   function get_SamePhysicalNode
   (
      This       : access IAllJoynAcceptSessionJoinerEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SameNetwork
   (
      This       : access IAllJoynAcceptSessionJoinerEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Accept_x
   (
      This       : access IAllJoynAcceptSessionJoinerEventArgs_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynAcceptSessionJoiner : aliased constant Windows.IID := (1302861778, 52509, 16419, (167, 196, 22, 222, 248, 156, 40, 223 ));
   
   type IAllJoynAcceptSessionJoiner_Interface is interface and Windows.IInspectable_Interface;
   
   function Accept_x
   (
      This       : access IAllJoynAcceptSessionJoiner_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynAcceptSessionJoinerEventArgsFactory : aliased constant Windows.IID := (3024313280, 24901, 17054, (132, 219, 213, 191, 231, 114, 177, 79 ));
   
   type IAllJoynAcceptSessionJoinerEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynAcceptSessionJoinerEventArgsFactory_Interface
      ; uniqueName : Windows.String
      ; sessionPort : Windows.UInt16
      ; trafficType : Windows.Devices.AllJoyn.AllJoynTrafficType
      ; proximity : Windows.UInt8
      ; acceptSessionJoiner : Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoiner
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionMemberAddedEventArgs : aliased constant Windows.IID := (1235384714, 3537, 18113, (156, 214, 39, 25, 14, 80, 58, 94 ));
   
   type IAllJoynSessionMemberAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UniqueName
   (
      This       : access IAllJoynSessionMemberAddedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionMemberAddedEventArgsFactory : aliased constant Windows.IID := (874373970, 7475, 16545, (161, 211, 229, 119, 112, 32, 225, 241 ));
   
   type IAllJoynSessionMemberAddedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynSessionMemberAddedEventArgsFactory_Interface
      ; uniqueName : Windows.String
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionMemberRemovedEventArgs : aliased constant Windows.IID := (1083842975, 43594, 18579, (180, 48, 186, 161, 182, 60, 98, 25 ));
   
   type IAllJoynSessionMemberRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UniqueName
   (
      This       : access IAllJoynSessionMemberRemovedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionMemberRemovedEventArgsFactory : aliased constant Windows.IID := (3302184424, 17080, 19303, (183, 87, 208, 207, 202, 213, 146, 128 ));
   
   type IAllJoynSessionMemberRemovedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynSessionMemberRemovedEventArgsFactory_Interface
      ; uniqueName : Windows.String
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionJoinedEventArgs : aliased constant Windows.IID := (2661243856, 46551, 18373, (141, 171, 176, 64, 204, 25, 40, 113 ));
   
   type IAllJoynSessionJoinedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Session
   (
      This       : access IAllJoynSessionJoinedEventArgs_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionJoinedEventArgsFactory : aliased constant Windows.IID := (1747244681, 54987, 19870, (160, 158, 53, 128, 104, 112, 177, 127 ));
   
   type IAllJoynSessionJoinedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynSessionJoinedEventArgsFactory_Interface
      ; session : Windows.Devices.AllJoyn.IAllJoynSession
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionLostEventArgs : aliased constant Windows.IID := (3882263690, 35768, 18772, (174, 103, 210, 250, 67, 209, 249, 107 ));
   
   type IAllJoynSessionLostEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IAllJoynSessionLostEventArgs_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynSessionLostReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynSessionLostEventArgsFactory : aliased constant Windows.IID := (331087154, 54004, 18889, (152, 14, 40, 5, 225, 53, 134, 177 ));
   
   type IAllJoynSessionLostEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynSessionLostEventArgsFactory_Interface
      ; reason : Windows.Devices.AllJoyn.AllJoynSessionLostReason
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynProducerStoppedEventArgs : aliased constant Windows.IID := (1362138992, 18743, 18733, (128, 128, 35, 100, 57, 152, 124, 235 ));
   
   type IAllJoynProducerStoppedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IAllJoynProducerStoppedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynProducerStoppedEventArgsFactory : aliased constant Windows.IID := (1448253793, 45593, 19822, (159, 120, 250, 63, 153, 250, 143, 229 ));
   
   type IAllJoynProducerStoppedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynProducerStoppedEventArgsFactory_Interface
      ; status : Windows.Int32
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusObjectStoppedEventArgs : aliased constant Windows.IID := (3725598997, 61326, 19778, (185, 59, 162, 174, 116, 81, 151, 102 ));
   
   type IAllJoynBusObjectStoppedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IAllJoynBusObjectStoppedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynBusObjectStoppedEventArgsFactory : aliased constant Windows.IID := (1797455176, 53411, 16981, (149, 58, 71, 114, 180, 2, 128, 115 ));
   
   type IAllJoynBusObjectStoppedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynBusObjectStoppedEventArgsFactory_Interface
      ; status : Windows.Int32
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynWatcherStoppedEventArgs : aliased constant Windows.IID := (3388776507, 28701, 19112, (151, 221, 162, 187, 10, 143, 95, 163 ));
   
   type IAllJoynWatcherStoppedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IAllJoynWatcherStoppedEventArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynWatcherStoppedEventArgsFactory : aliased constant Windows.IID := (2274338216, 11600, 18401, (144, 74, 32, 191, 13, 72, 199, 130 ));
   
   type IAllJoynWatcherStoppedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynWatcherStoppedEventArgsFactory_Interface
      ; status : Windows.Int32
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynServiceInfoRemovedEventArgs : aliased constant Windows.IID := (811051359, 7487, 16883, (137, 105, 227, 39, 146, 98, 115, 150 ));
   
   type IAllJoynServiceInfoRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UniqueName
   (
      This       : access IAllJoynServiceInfoRemovedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynServiceInfoRemovedEventArgsFactory : aliased constant Windows.IID := (230655527, 39679, 18773, (146, 39, 105, 83, 186, 244, 21, 105 ));
   
   type IAllJoynServiceInfoRemovedEventArgsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynServiceInfoRemovedEventArgsFactory_Interface
      ; uniqueName : Windows.String
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynMessageInfo : aliased constant Windows.IID := (4281008423, 11282, 18521, (170, 58, 199, 68, 97, 238, 129, 76 ));
   
   type IAllJoynMessageInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SenderUniqueName
   (
      This       : access IAllJoynMessageInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAllJoynMessageInfoFactory : aliased constant Windows.IID := (879119402, 33417, 17364, (180, 168, 63, 77, 227, 89, 240, 67 ));
   
   type IAllJoynMessageInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAllJoynMessageInfoFactory_Interface
      ; senderUniqueName : Windows.String
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynMessageInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_AllJoynAuthenticationMechanism : aliased constant Windows.IID := (263993042, 62574, 23117, (170, 16, 76, 128, 107, 73, 69, 214 ));
   
   type IIterator_AllJoynAuthenticationMechanism_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_AllJoynAuthenticationMechanism_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_AllJoynAuthenticationMechanism_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_AllJoynAuthenticationMechanism_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_AllJoynAuthenticationMechanism_Interface
      ; items : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_AllJoynAuthenticationMechanism : aliased constant Windows.IID := (3540502447, 16646, 23836, (176, 108, 94, 181, 147, 217, 190, 52 ));
   
   type IIterable_AllJoynAuthenticationMechanism_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_AllJoynAuthenticationMechanism_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IIterator_AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_AllJoynAuthenticationMechanism : aliased constant Windows.IID := (3941957510, 45145, 23234, (156, 31, 211, 198, 94, 172, 103, 163 ));
   
   type IVectorView_AllJoynAuthenticationMechanism_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_AllJoynAuthenticationMechanism_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_AllJoynAuthenticationMechanism_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_AllJoynAuthenticationMechanism_Interface
      ; value : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_AllJoynAuthenticationMechanism_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_AllJoynAuthenticationMechanism : aliased constant Windows.IID := (432106387, 63946, 23557, (191, 115, 231, 76, 208, 84, 197, 135 ));
   
   type IVector_AllJoynAuthenticationMechanism_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IVectorView_AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; value : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; index : Windows.UInt32
      ; value : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; value : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_AllJoynAuthenticationMechanism_Interface
      ; items : Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAllJoynAboutDataView : aliased constant Windows.IID := (928465230, 62795, 20932, (143, 47, 224, 71, 117, 89, 178, 173 ));
   
   type IAsyncOperation_IAllJoynAboutDataView_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAllJoynAboutDataView_Interface
      ; handler : Windows.Devices.AllJoyn.AsyncOperationCompletedHandler_IAllJoynAboutDataView
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AsyncOperationCompletedHandler_IAllJoynAboutDataView
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAllJoynAboutDataView_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynAboutDataView
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAllJoynSession : aliased constant Windows.IID := (1957582328, 15715, 21618, (145, 61, 116, 233, 161, 18, 93, 211 ));
   
   type IAsyncOperation_IAllJoynSession_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAllJoynSession_Interface
      ; handler : Windows.Devices.AllJoyn.AsyncOperationCompletedHandler_IAllJoynSession
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAllJoynSession_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AsyncOperationCompletedHandler_IAllJoynSession
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAllJoynSession_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IAllJoynServiceInfo : aliased constant Windows.IID := (3117304001, 5836, 24134, (145, 213, 229, 205, 6, 248, 2, 110 ));
   
   type IAsyncOperation_IAllJoynServiceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IAllJoynServiceInfo_Interface
      ; handler : Windows.Devices.AllJoyn.AsyncOperationCompletedHandler_IAllJoynServiceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IAllJoynServiceInfo_Interface
      ; RetVal : access Windows.Devices.AllJoyn.AsyncOperationCompletedHandler_IAllJoynServiceInfo
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IAllJoynServiceInfo_Interface
      ; RetVal : access Windows.Devices.AllJoyn.IAllJoynServiceInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynBusAttachment_add_StateChanged : aliased constant Windows.IID := (2192070173, 13971, 23696, (140, 242, 88, 222, 131, 216, 2, 67 ));
   
   type TypedEventHandler_IAllJoynBusAttachment_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment ; args : Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynBusAttachment_add_StateChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_StateChanged_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested : aliased constant Windows.IID := (2871105255, 19265, 21437, (149, 177, 184, 12, 173, 130, 71, 149 ));
   
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment ; args : Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_CredentialsRequested_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested : aliased constant Windows.IID := (2130287766, 20913, 22128, (164, 31, 174, 64, 79, 47, 245, 63 ));
   
   type TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment ; args : Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_CredentialsVerificationRequested_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete : aliased constant Windows.IID := (3841792180, 19678, 20622, (128, 132, 99, 231, 40, 50, 98, 197 ));
   
   type TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment ; args : Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment_add_AuthenticationComplete_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAllJoynAboutDataView : aliased constant Windows.IID := (3123553013, 63920, 23654, (143, 201, 125, 67, 122, 103, 242, 138 ));
   
   type AsyncOperationCompletedHandler_IAllJoynAboutDataView_Interface(Callback : access procedure (asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAllJoynAboutDataView'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAllJoynAboutDataView_Interface
      ; asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested : aliased constant Windows.IID := (3710012822, 62556, 24125, (136, 96, 133, 150, 208, 228, 116, 240 ));
   
   type TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment ; args : Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment2_add_AcceptSessionJoinerRequested_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined : aliased constant Windows.IID := (1455131942, 14774, 21498, (128, 19, 55, 129, 170, 39, 160, 188 ));
   
   type TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment ; args : Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusAttachment2_add_SessionJoined_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynSession_add_MemberAdded : aliased constant Windows.IID := (856402529, 7204, 24490, (175, 60, 77, 105, 173, 47, 30, 49 ));
   
   type TypedEventHandler_IAllJoynSession_add_MemberAdded_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynSession ; args : Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynSession_add_MemberAdded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynSession_add_MemberAdded_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynSession
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynSession_add_MemberRemoved : aliased constant Windows.IID := (694807932, 56172, 22698, (159, 109, 137, 231, 254, 8, 159, 193 ));
   
   type TypedEventHandler_IAllJoynSession_add_MemberRemoved_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynSession ; args : Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynSession_add_MemberRemoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynSession_add_MemberRemoved_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynSession
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynSession_add_Lost : aliased constant Windows.IID := (3757845285, 23266, 21233, (187, 196, 54, 60, 239, 237, 160, 63 ));
   
   type TypedEventHandler_IAllJoynSession_add_Lost_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynSession ; args : Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynSession_add_Lost'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynSession_add_Lost_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynSession
      ; args : Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAllJoynSession : aliased constant Windows.IID := (1380519780, 51599, 20505, (131, 97, 178, 163, 225, 103, 159, 39 ));
   
   type AsyncOperationCompletedHandler_IAllJoynSession_Interface(Callback : access procedure (asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAllJoynSession'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAllJoynSession_Interface
      ; asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAllJoynBusObject_add_Stopped : aliased constant Windows.IID := (2557565231, 33341, 22064, (190, 114, 202, 143, 23, 132, 107, 113 ));
   
   type TypedEventHandler_IAllJoynBusObject_add_Stopped_Interface(Callback : access procedure (sender : Windows.Devices.AllJoyn.IAllJoynBusObject ; args : Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAllJoynBusObject_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAllJoynBusObject_add_Stopped_Interface
      ; sender : Windows.Devices.AllJoyn.IAllJoynBusObject
      ; args : Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IAllJoynServiceInfo : aliased constant Windows.IID := (4289864345, 43465, 23594, (172, 227, 12, 208, 166, 221, 16, 57 ));
   
   type AsyncOperationCompletedHandler_IAllJoynServiceInfo_Interface(Callback : access procedure (asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynServiceInfo ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IAllJoynServiceInfo'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IAllJoynServiceInfo_Interface
      ; asyncInfo : Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynServiceInfo
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AllJoynAboutData is Windows.Devices.AllJoyn.IAllJoynAboutData;
   subtype AllJoynBusAttachment is Windows.Devices.AllJoyn.IAllJoynBusAttachment;
   function CreateAllJoynBusAttachment return Windows.Devices.AllJoyn.IAllJoynBusAttachment;
   
   subtype AllJoynBusAttachmentStateChangedEventArgs is Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs;
   subtype AllJoynCredentialsRequestedEventArgs is Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs;
   subtype AllJoynCredentialsVerificationRequestedEventArgs is Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs;
   subtype AllJoynAuthenticationCompleteEventArgs is Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs;
   subtype AllJoynServiceInfo is Windows.Devices.AllJoyn.IAllJoynServiceInfo;
   function Create
   (
      uniqueName : Windows.String
      ; objectPath : Windows.String
      ; sessionPort : Windows.UInt16
   )
   return Windows.Devices.AllJoyn.IAllJoynServiceInfo;
   
   subtype AllJoynAboutDataView is Windows.Devices.AllJoyn.IAllJoynAboutDataView;
   subtype AllJoynAcceptSessionJoinerEventArgs is Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs;
   function Create
   (
      uniqueName : Windows.String
      ; sessionPort : Windows.UInt16
      ; trafficType : Windows.Devices.AllJoyn.AllJoynTrafficType
      ; proximity : Windows.UInt8
      ; acceptSessionJoiner : Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoiner
   )
   return Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs;
   
   subtype AllJoynSessionJoinedEventArgs is Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs;
   function Create
   (
      session : Windows.Devices.AllJoyn.IAllJoynSession
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs;
   
   subtype AllJoynCredentials is Windows.Devices.AllJoyn.IAllJoynCredentials;
   subtype AllJoynSession is Windows.Devices.AllJoyn.IAllJoynSession;
   subtype AllJoynSessionMemberAddedEventArgs is Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs;
   function Create
   (
      uniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs;
   
   subtype AllJoynSessionMemberRemovedEventArgs is Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs;
   function Create
   (
      uniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs;
   
   subtype AllJoynSessionLostEventArgs is Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs;
   function Create
   (
      reason : Windows.Devices.AllJoyn.AllJoynSessionLostReason
   )
   return Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs;
   
   subtype AllJoynBusObject is Windows.Devices.AllJoyn.IAllJoynBusObject;
   function Create
   (
      objectPath : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynBusObject;
   
   function CreateWithBusAttachment
   (
      objectPath : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
   )
   return Windows.Devices.AllJoyn.IAllJoynBusObject;
   
   subtype AllJoynBusObjectStoppedEventArgs is Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs;
   function Create
   (
      status : Windows.Int32
   )
   return Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs;
   
   subtype AllJoynProducerStoppedEventArgs is Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs;
   function Create
   (
      status : Windows.Int32
   )
   return Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs;
   
   subtype AllJoynWatcherStoppedEventArgs is Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs;
   function Create
   (
      status : Windows.Int32
   )
   return Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs;
   
   subtype AllJoynServiceInfoRemovedEventArgs is Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs;
   function Create
   (
      uniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs;
   
   subtype AllJoynMessageInfo is Windows.Devices.AllJoyn.IAllJoynMessageInfo;
   function Create
   (
      senderUniqueName : Windows.String
   )
   return Windows.Devices.AllJoyn.IAllJoynMessageInfo;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Ok
   return Windows.Int32;
   
   function get_Fail
   return Windows.Int32;
   
   function get_OperationTimedOut
   return Windows.Int32;
   
   function get_OtherEndClosed
   return Windows.Int32;
   
   function get_ConnectionRefused
   return Windows.Int32;
   
   function get_AuthenticationFailed
   return Windows.Int32;
   
   function get_AuthenticationRejectedByUser
   return Windows.Int32;
   
   function get_SslConnectFailed
   return Windows.Int32;
   
   function get_SslIdentityVerificationFailed
   return Windows.Int32;
   
   function get_InsufficientSecurity
   return Windows.Int32;
   
   function get_InvalidArgument1
   return Windows.Int32;
   
   function get_InvalidArgument2
   return Windows.Int32;
   
   function get_InvalidArgument3
   return Windows.Int32;
   
   function get_InvalidArgument4
   return Windows.Int32;
   
   function get_InvalidArgument5
   return Windows.Int32;
   
   function get_InvalidArgument6
   return Windows.Int32;
   
   function get_InvalidArgument7
   return Windows.Int32;
   
   function get_InvalidArgument8
   return Windows.Int32;
   
   function GetDefault
   return Windows.Devices.AllJoyn.IAllJoynBusAttachment;
   
   function GetWatcher
   (
      requiredInterfaces : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Devices.Enumeration.IDeviceWatcher;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynServiceInfo;
   
   function GetDataBySessionPortAsync
   (
      uniqueName : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; sessionPort : Windows.UInt16
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView;
   
   function GetDataBySessionPortWithLanguageAsync
   (
      uniqueName : Windows.String
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
      ; sessionPort : Windows.UInt16
      ; language : Windows.Globalization.ILanguage
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynAboutDataView;
   
   function GetFromServiceInfoAsync
   (
      serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession;
   
   function GetFromServiceInfoAndBusAttachmentAsync
   (
      serviceInfo : Windows.Devices.AllJoyn.IAllJoynServiceInfo
      ; busAttachment : Windows.Devices.AllJoyn.IAllJoynBusAttachment
   )
   return Windows.Devices.AllJoyn.IAsyncOperation_IAllJoynSession;
   
end;
