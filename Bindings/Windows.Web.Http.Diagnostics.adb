--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Web.Http;
with Windows.System.Diagnostics;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.Http.Diagnostics is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestSentEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider(sender), Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestSentEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderResponseReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider(sender), Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderResponseReceivedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider(sender), Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseCompletedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function CreateFromProcessDiagnosticInfo
   (
      processDiagnosticInfo : Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Diagnostics.HttpDiagnosticProvider");
      m_Factory     : IHttpDiagnosticProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpDiagnosticProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromProcessDiagnosticInfo(processDiagnosticInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;