--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.OnlineId is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface
      ; asyncInfo : Windows.Security.Authentication.OnlineId.IAsyncOperation_IOnlineIdSystemTicketResult
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
   
   
   function CreateOnlineIdServiceTicketRequest
   (
      service : Windows.String
      ; policy : Windows.String
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdServiceTicketRequest");
      m_Factory     : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdServiceTicketRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateOnlineIdServiceTicketRequest(service, policy, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateOnlineIdServiceTicketRequestAdvanced
   (
      service : Windows.String
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdServiceTicketRequest");
      m_Factory     : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdServiceTicketRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateOnlineIdServiceTicketRequestAdvanced(service, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateOnlineIdAuthenticator return Windows.Security.Authentication.OnlineId.IOnlineIdAuthenticator is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdAuthenticator");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdAuthenticator := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Authentication.OnlineId.IID_IOnlineIdAuthenticator'Access, RetVal'Address);
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
   
   
   function get_Default
   return Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdSystemAuthenticator");
      m_Factory     : IOnlineIdSystemAuthenticatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdSystemAuthenticatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Default(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdSystemAuthenticator");
      m_Factory     : IOnlineIdSystemAuthenticatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdSystemAuthenticatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;