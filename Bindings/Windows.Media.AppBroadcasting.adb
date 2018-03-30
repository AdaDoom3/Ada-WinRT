--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.AppBroadcasting is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppBroadcastingMonitor_add_IsCurrentAppBroadcastingChanged_Interface
      ; sender : Windows.Media.AppBroadcasting.IAppBroadcastingMonitor
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.AppBroadcasting.IAppBroadcastingMonitor(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateAppBroadcastingMonitor return Windows.Media.AppBroadcasting.IAppBroadcastingMonitor is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.AppBroadcasting.AppBroadcastingMonitor");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.AppBroadcasting.IAppBroadcastingMonitor := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.AppBroadcasting.IID_IAppBroadcastingMonitor'Access, RetVal'Address);
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
   
   
   function GetDefault
   return Windows.Media.AppBroadcasting.IAppBroadcastingUI is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.AppBroadcasting.AppBroadcastingUI");
      m_Factory     : IAppBroadcastingUIStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.AppBroadcasting.IAppBroadcastingUI;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastingUIStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Media.AppBroadcasting.IAppBroadcastingUI is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.AppBroadcasting.AppBroadcastingUI");
      m_Factory     : IAppBroadcastingUIStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.AppBroadcasting.IAppBroadcastingUI;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppBroadcastingUIStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;