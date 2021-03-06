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
with Windows.Storage;
with Windows.Storage.Streams;
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.EnterpriseData is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ProtectionPolicyEvaluationResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult
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
      This       : access AsyncOperationCompletedHandler_FileProtectionStatus_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_FileProtectionStatus
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
      This       : access AsyncOperationCompletedHandler_IFileProtectionInfo_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo
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
      This       : access AsyncOperationCompletedHandler_IProtectedContainerExportResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult
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
      This       : access AsyncOperationCompletedHandler_IProtectedContainerImportResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult
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
      This       : access AsyncOperationCompletedHandler_IProtectedFileCreateResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IProtectedFileCreateResult
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
      This       : access AsyncOperationCompletedHandler_IBufferProtectUnprotectResult_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult
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
      This       : access AsyncOperationCompletedHandler_IDataProtectionInfo_Interface
      ; asyncInfo : Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo
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
      This       : access EventHandler_IProtectedAccessSuspendingEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.EnterpriseData.IProtectedAccessSuspendingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EventHandler_IProtectedAccessResumedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.EnterpriseData.IProtectedAccessResumedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access EventHandler_IProtectedContentRevokedEventArgs_Interface
      ; sender : Windows.Object
      ; args : Windows.Security.EnterpriseData.IProtectedContentRevokedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      audit : Windows.Boolean
   )
   return Windows.Security.EnterpriseData.IFileUnprotectOptions is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileUnprotectOptions");
      m_Factory     : Windows.Security.EnterpriseData.IFileUnprotectOptionsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IFileUnprotectOptions := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileUnprotectOptionsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audit, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      action : Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
      ; dataDescription : Windows.String
      ; sourceDescription : Windows.String
      ; targetDescription : Windows.String
   )
   return Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo");
      m_Factory     : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyAuditInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(action, dataDescription, sourceDescription, targetDescription, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithActionAndDataDescription
   (
      action : Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
      ; dataDescription : Windows.String
   )
   return Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyAuditInfo");
      m_Factory     : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfoFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyAuditInfoFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithActionAndDataDescription(action, dataDescription, RetVal'Access);
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
   
   function RequestAccessWithAuditingInfoAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessWithAuditingInfoAsync(sourceIdentity, targetIdentity, auditInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessWithMessageAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessWithMessageAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessForAppWithAuditingInfoAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessForAppWithAuditingInfoAsync(sourceIdentity, appPackageFamilyName, auditInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessForAppWithMessageAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessForAppWithMessageAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure LogAuditEvent
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LogAuditEvent(sourceIdentity, targetIdentity, auditInfo);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function IsIdentityManaged
   (
      identity : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsIdentityManaged(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryApplyProcessUIPolicy
   (
      identity : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryApplyProcessUIPolicy(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ClearProcessUIPolicy
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ClearProcessUIPolicy;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CreateCurrentThreadNetworkContext
   (
      identity : Windows.String
   )
   return Windows.Security.EnterpriseData.IThreadNetworkContext is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IThreadNetworkContext;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCurrentThreadNetworkContext(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPrimaryManagedIdentityForNetworkEndpointAsync
   (
      endpointHost : Windows.Networking.IHostName
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPrimaryManagedIdentityForNetworkEndpointAsync(endpointHost, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure RevokeContent
   (
      identity : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RevokeContent(identity);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForCurrentView
   return Windows.Security.EnterpriseData.IProtectionPolicyManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IProtectionPolicyManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_ProtectedAccessSuspending
   (
      handler : Windows.Security.EnterpriseData.EventHandler_IProtectedAccessSuspendingEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ProtectedAccessSuspending(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ProtectedAccessSuspending
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ProtectedAccessSuspending(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_ProtectedAccessResumed
   (
      handler : Windows.Security.EnterpriseData.EventHandler_IProtectedAccessResumedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ProtectedAccessResumed(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ProtectedAccessResumed
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ProtectedAccessResumed(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_ProtectedContentRevoked
   (
      handler : Windows.Security.EnterpriseData.EventHandler_IProtectedContentRevokedEventArgs
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ProtectedContentRevoked(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ProtectedContentRevoked
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ProtectedContentRevoked(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CheckAccess
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
   )
   return Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CheckAccess(sourceIdentity, targetIdentity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessAsync(sourceIdentity, targetIdentity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function HasContentBeenRevokedSince
   (
      identity : Windows.String
      ; since : Windows.Foundation.DateTime
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.HasContentBeenRevokedSince(identity, since, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CheckAccessForApp
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
   )
   return Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CheckAccessForApp(sourceIdentity, appPackageFamilyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessForAppAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessForAppAsync(sourceIdentity, appPackageFamilyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetEnforcementLevel
   (
      identity : Windows.String
   )
   return Windows.Security.EnterpriseData.EnforcementLevel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.EnforcementLevel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetEnforcementLevel(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsUserDecryptionAllowed
   (
      identity : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsUserDecryptionAllowed(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsProtectionUnderLockRequired
   (
      identity : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsProtectionUnderLockRequired(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_PolicyChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_PolicyChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_PolicyChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_PolicyChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsProtectionEnabled
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsProtectionEnabled(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsRoamableProtectionEnabled
   (
      identity : Windows.String
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsRoamableProtectionEnabled(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessWithBehaviorAsync
   (
      sourceIdentity : Windows.String
      ; targetIdentity : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessWithBehaviorAsync(sourceIdentity, targetIdentity, auditInfo, messageFromApp, behavior, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessForAppWithBehaviorAsync
   (
      sourceIdentity : Windows.String
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessForAppWithBehaviorAsync(sourceIdentity, appPackageFamilyName, auditInfo, messageFromApp, behavior, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessToFilesForAppAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessToFilesForAppAsync(sourceItemList, appPackageFamilyName, auditInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessToFilesForAppWithMessageAndBehaviorAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; appPackageFamilyName : Windows.String
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessToFilesForAppWithMessageAndBehaviorAsync(sourceItemList, appPackageFamilyName, auditInfo, messageFromApp, behavior, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessToFilesForProcessAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; processId : Windows.UInt32
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessToFilesForProcessAsync(sourceItemList, processId, auditInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestAccessToFilesForProcessWithMessageAndBehaviorAsync
   (
      sourceItemList : Windows.Storage.IIterable_IStorageItem
      ; processId : Windows.UInt32
      ; auditInfo : Windows.Security.EnterpriseData.IProtectionPolicyAuditInfo
      ; messageFromApp : Windows.String
      ; behavior : Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestAccessToFilesForProcessWithMessageAndBehaviorAsync(sourceItemList, processId, auditInfo, messageFromApp, behavior, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsFileProtectionRequiredAsync
   (
      target : Windows.Storage.IStorageItem
      ; identity : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsFileProtectionRequiredAsync(target, identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsFileProtectionRequiredForNewFileAsync
   (
      parentFolder : Windows.Storage.IStorageFolder
      ; identity : Windows.String
      ; desiredName : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsFileProtectionRequiredForNewFileAsync(parentFolder, identity, desiredName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PrimaryManagedIdentity
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PrimaryManagedIdentity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPrimaryManagedIdentityForIdentity
   (
      identity : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.ProtectionPolicyManager");
      m_Factory     : IProtectionPolicyManagerStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProtectionPolicyManagerStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPrimaryManagedIdentityForIdentity(identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ProtectAsync
   (
      target : Windows.Storage.IStorageItem
      ; identity : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ProtectAsync(target, identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CopyProtectionAsync
   (
      source : Windows.Storage.IStorageItem
      ; target : Windows.Storage.IStorageItem
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CopyProtectionAsync(source, target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetProtectionInfoAsync
   (
      source : Windows.Storage.IStorageItem
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetProtectionInfoAsync(source, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SaveFileAsContainerAsync
   (
      protectedFile : Windows.Storage.IStorageFile
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SaveFileAsContainerAsync(protectedFile, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFileFromContainerAsync
   (
      containerFile : Windows.Storage.IStorageFile
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFileFromContainerAsync(containerFile, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFileFromContainerWithTargetAsync
   (
      containerFile : Windows.Storage.IStorageFile
      ; target : Windows.Storage.IStorageItem
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFileFromContainerWithTargetAsync(containerFile, target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateProtectedAndOpenAsync
   (
      parentFolder : Windows.Storage.IStorageFolder
      ; desiredName : Windows.String
      ; identity : Windows.String
      ; collisionOption : Windows.Storage.CreationCollisionOption
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedFileCreateResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IProtectedFileCreateResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateProtectedAndOpenAsync(parentFolder, desiredName, identity, collisionOption, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnprotectAsync
   (
      target : Windows.Storage.IStorageItem
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnprotectAsync(target, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnprotectWithOptionsAsync
   (
      target : Windows.Storage.IStorageItem
      ; options : Windows.Security.EnterpriseData.IFileUnprotectOptions
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IFileProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnprotectWithOptionsAsync(target, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsContainerAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsContainerAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFileFromContainerWithTargetAndNameCollisionOptionAsync
   (
      containerFile : Windows.Storage.IStorageFile
      ; target : Windows.Storage.IStorageItem
      ; collisionOption : Windows.Storage.NameCollisionOption
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerImportResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFileFromContainerWithTargetAndNameCollisionOptionAsync(containerFile, target, collisionOption, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SaveFileAsContainerWithSharingAsync
   (
      protectedFile : Windows.Storage.IStorageFile
      ; sharedWithIdentities : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.FileProtectionManager");
      m_Factory     : IFileProtectionManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IProtectedContainerExportResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFileProtectionManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SaveFileAsContainerWithSharingAsync(protectedFile, sharedWithIdentities, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ProtectAsync
   (
      data : Windows.Storage.Streams.IBuffer
      ; identity : Windows.String
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.DataProtectionManager");
      m_Factory     : IDataProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ProtectAsync(data, identity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnprotectAsync
   (
      data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.DataProtectionManager");
      m_Factory     : IDataProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IBufferProtectUnprotectResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnprotectAsync(data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ProtectStreamAsync
   (
      unprotectedStream : Windows.Storage.Streams.IInputStream
      ; identity : Windows.String
      ; protectedStream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.DataProtectionManager");
      m_Factory     : IDataProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ProtectStreamAsync(unprotectedStream, identity, protectedStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function UnprotectStreamAsync
   (
      protectedStream : Windows.Storage.Streams.IInputStream
      ; unprotectedStream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.DataProtectionManager");
      m_Factory     : IDataProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.UnprotectStreamAsync(protectedStream, unprotectedStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetProtectionInfoAsync
   (
      protectedData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.DataProtectionManager");
      m_Factory     : IDataProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetProtectionInfoAsync(protectedData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStreamProtectionInfoAsync
   (
      protectedStream : Windows.Storage.Streams.IInputStream
   )
   return Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.EnterpriseData.DataProtectionManager");
      m_Factory     : IDataProtectionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.EnterpriseData.IAsyncOperation_IDataProtectionInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataProtectionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStreamProtectionInfoAsync(protectedStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
