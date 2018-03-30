--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Credentials.UI is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ICredentialPickerResults_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ICredentialPickerResults or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ICredentialPickerResults_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_UserConsentVerifierAvailability or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_UserConsentVerifierAvailability_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_UserConsentVerificationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_UserConsentVerificationResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_UserConsentVerificationResult_Interface
      ; asyncInfo : Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult
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
   
   
   function CreateCredentialPickerOptions return Windows.Security.Credentials.UI.ICredentialPickerOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPickerOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.ICredentialPickerOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Credentials.UI.IID_ICredentialPickerOptions'Access, RetVal'Address);
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
   
   
   function PickWithOptionsAsync
   (
      options : Windows.Security.Credentials.UI.ICredentialPickerOptions
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPicker");
      m_Factory     : ICredentialPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PickWithOptionsAsync(options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function PickWithMessageAsync
   (
      targetName : Windows.String
      ; message : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPicker");
      m_Factory     : ICredentialPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PickWithMessageAsync(targetName, message, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function PickWithCaptionAsync
   (
      targetName : Windows.String
      ; message : Windows.String
      ; caption : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.CredentialPicker");
      m_Factory     : ICredentialPickerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_ICredentialPickerResults;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICredentialPickerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PickWithCaptionAsync(targetName, message, caption, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CheckAvailabilityAsync
   return Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.UserConsentVerifier");
      m_Factory     : IUserConsentVerifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerifierAvailability;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserConsentVerifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CheckAvailabilityAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestVerificationAsync
   (
      message : Windows.String
   )
   return Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Credentials.UI.UserConsentVerifier");
      m_Factory     : IUserConsentVerifierStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Credentials.UI.IAsyncOperation_UserConsentVerificationResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUserConsentVerifierStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestVerificationAsync(message, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;