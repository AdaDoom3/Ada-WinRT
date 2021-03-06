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
with Windows.System;
with Windows.Security.Cryptography.Certificates;
with Windows.ApplicationModel.Appointments;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Email is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore
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
      This       : access AsyncOperationCompletedHandler_IEmailMailbox_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailbox
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
      This       : access AsyncOperationCompletedHandler_IEmailConversation_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversation
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
      This       : access AsyncOperationCompletedHandler_IEmailFolder_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailFolder
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
      This       : access AsyncOperationCompletedHandler_IEmailMessage_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessage
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
      This       : access TypedEventHandler_IEmailMailbox_add_MailboxChanged_Interface
      ; sender : Windows.ApplicationModel.Email.IEmailMailbox
      ; args : Windows.ApplicationModel.Email.IEmailMailboxChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.IEmailMailbox(sender), Windows.ApplicationModel.Email.IEmailMailboxChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailMailboxAutoReplySettings_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxAutoReplySettings
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
      This       : access AsyncOperationCompletedHandler_EmailMailboxEmptyFolderStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxEmptyFolderStatus
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
      This       : access AsyncOperationCompletedHandler_IEmailMailboxCreateFolderResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMailboxCreateFolderResult
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
      This       : access AsyncOperationCompletedHandler_EmailMailboxDeleteFolderStatus_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_EmailMailboxDeleteFolderStatus
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
      This       : access TypedEventHandler_IEmailMailboxSyncManager_add_SyncStatusChanged_Interface
      ; sender : Windows.ApplicationModel.Email.IEmailMailboxSyncManager
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Email.IEmailMailboxSyncManager(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IEmailItemCounts_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailItemCounts
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
      This       : access AsyncOperationCompletedHandler_IEmailConversationBatch_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailConversationBatch
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
      This       : access AsyncOperationCompletedHandler_IEmailMessageBatch_Interface
      ; asyncInfo : Windows.ApplicationModel.Email.IAsyncOperation_IEmailMessageBatch
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
   
   function CreateEmailMessage return Windows.ApplicationModel.Email.IEmailMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Email.IEmailMessage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Email.IID_IEmailMessage'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateEmailQueryOptions return Windows.ApplicationModel.Email.IEmailQueryOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailQueryOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Email.IEmailQueryOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Email.IID_IEmailQueryOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      address : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailRecipient is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailRecipient");
      m_Factory     : Windows.ApplicationModel.Email.IEmailRecipientFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Email.IEmailRecipient := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEmailRecipientFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(address, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithName
   (
      address : Windows.String
      ; name : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailRecipient is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailRecipient");
      m_Factory     : Windows.ApplicationModel.Email.IEmailRecipientFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Email.IEmailRecipient := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEmailRecipientFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithName(address, name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEmailIrmTemplate return Windows.ApplicationModel.Email.IEmailIrmTemplate is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailIrmTemplate");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Email.IEmailIrmTemplate) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Email.IID_IEmailIrmTemplate'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      expiration : Windows.Foundation.DateTime
      ; irmTemplate : Windows.ApplicationModel.Email.IEmailIrmTemplate
   )
   return Windows.ApplicationModel.Email.IEmailIrmInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailIrmInfo");
      m_Factory     : Windows.ApplicationModel.Email.IEmailIrmInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Email.IEmailIrmInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEmailIrmInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(expiration, irmTemplate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      fileName : Windows.String
      ; data : Windows.Storage.Streams.IRandomAccessStreamReference
      ; mimeType : Windows.String
   )
   return Windows.ApplicationModel.Email.IEmailAttachment is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailAttachment");
      m_Factory     : Windows.ApplicationModel.Email.IEmailAttachmentFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Email.IEmailAttachment := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEmailAttachmentFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(fileName, data, mimeType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateEmailMeetingInfo return Windows.ApplicationModel.Email.IEmailMeetingInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailMeetingInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Email.IEmailMeetingInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Email.IID_IEmailMeetingInfo'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateEmailMailboxAutoReplySettings return Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailMailboxAutoReplySettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Email.IEmailMailboxAutoReplySettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Email.IID_IEmailMailboxAutoReplySettings'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateEmailRecipientResolutionResult return Windows.ApplicationModel.Email.IEmailRecipientResolutionResult is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailRecipientResolutionResult");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Email.IEmailRecipientResolutionResult) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Email.IID_IEmailRecipientResolutionResult'Access, RetVal'access);
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
   
   function RequestStoreAsync
   (
      accessType : Windows.ApplicationModel.Email.EmailStoreAccessType
   )
   return Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailManager");
      m_Factory     : IEmailManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Email.IAsyncOperation_IEmailStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEmailManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(accessType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Email.IEmailManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailManager");
      m_Factory     : IEmailManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Email.IEmailManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEmailManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowComposeNewEmailAsync
   (
      message : Windows.ApplicationModel.Email.IEmailMessage
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Email.EmailManager");
      m_Factory     : IEmailManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEmailManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowComposeNewEmailAsync(message, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
