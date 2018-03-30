--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage;
with Windows.Media.SpeechRecognition;
with Windows.Globalization;
with Windows.ApplicationModel.AppService;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.VoiceCommands is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IVoiceCommand_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IVoiceCommand or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVoiceCommand_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommand
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVoiceCommandConfirmationResult_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandConfirmationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVoiceCommandDisambiguationResult_Interface
      ; asyncInfo : Windows.ApplicationModel.VoiceCommands.IAsyncOperation_IVoiceCommandDisambiguationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IVoiceCommandServiceConnection_add_VoiceCommandCompleted_Interface
      ; sender : Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection
      ; args : Windows.ApplicationModel.VoiceCommands.IVoiceCommandCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection(sender), Windows.ApplicationModel.VoiceCommands.IVoiceCommandCompletedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateVoiceCommandContentTile return Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandContentTile");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandContentTile := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.VoiceCommands.IID_IVoiceCommandContentTile'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVoiceCommandUserMessage return Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandUserMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.VoiceCommands.IID_IVoiceCommandUserMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function InstallCommandDefinitionsFromStorageFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandDefinitionManager");
      m_Factory     : IVoiceCommandDefinitionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandDefinitionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InstallCommandDefinitionsFromStorageFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InstalledCommandDefinitions
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandDefinitionManager");
      m_Factory     : IVoiceCommandDefinitionManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandDefinitionManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InstalledCommandDefinitions(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxSupportedVoiceCommandContentTiles
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxSupportedVoiceCommandContentTiles(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponse
   (
      userMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponse(userMessage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponseWithTiles
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponseWithTiles(message, contentTiles, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponseForPrompt
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponseForPrompt(message, repeatMessage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateResponseForPromptWithTiles
   (
      message : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; repeatMessage : Windows.ApplicationModel.VoiceCommands.IVoiceCommandUserMessage
      ; contentTiles : Windows.ApplicationModel.VoiceCommands.IIterable_IVoiceCommandContentTile
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse");
      m_Factory     : IVoiceCommandResponseStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandResponse;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandResponseStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateResponseForPromptWithTiles(message, repeatMessage, contentTiles, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromAppServiceTriggerDetails
   (
      triggerDetails : Windows.ApplicationModel.AppService.IAppServiceTriggerDetails
   )
   return Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.VoiceCommands.VoiceCommandServiceConnection");
      m_Factory     : IVoiceCommandServiceConnectionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.VoiceCommands.IVoiceCommandServiceConnection;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandServiceConnectionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromAppServiceTriggerDetails(triggerDetails, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;