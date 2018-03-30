--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.System;
with Windows.Devices.Power;
with Windows.Gaming.Input.ForceFeedback;
with Windows.Devices.Haptics;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Gaming.Input is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IGameController_add_HeadsetConnected_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGameController_add_HeadsetConnected or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IGameController_add_HeadsetConnected_Interface
      ; sender : Windows.Gaming.Input.IGameController
      ; args : Windows.Gaming.Input.IHeadset
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Gaming.Input.IHeadset(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IGameController_add_HeadsetDisconnected_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGameController_add_HeadsetDisconnected or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IGameController_add_HeadsetDisconnected_Interface
      ; sender : Windows.Gaming.Input.IGameController
      ; args : Windows.Gaming.Input.IHeadset
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Gaming.Input.IHeadset(args));
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IGameController_add_UserChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGameController_add_UserChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IGameController_add_UserChanged_Interface
      ; sender : Windows.Gaming.Input.IGameController
      ; args : Windows.System.IUserChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.System.IUserChangedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IArcadeStick_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IArcadeStick or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IArcadeStick_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IArcadeStick
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IFlightStick_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IFlightStick or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IFlightStick_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IFlightStick
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IGamepad_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IGamepad or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IGamepad_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IGamepad
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IRacingWheel_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IRacingWheel or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IRacingWheel_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IRacingWheel
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IRawGameController_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IRawGameController or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IRawGameController_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IRawGameController
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function QueryInterface(This : access EventHandler_IUINavigationController_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_EventHandler_IUINavigationController or riid.all = IID_IUnknown then
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
      This       : access EventHandler_IUINavigationController_Interface
      ; sender : Windows.Object
      ; args : Windows.Gaming.Input.IUINavigationController
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
   
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function add_ArcadeStickAdded
   (
      value : Windows.Gaming.Input.EventHandler_IArcadeStick
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ArcadeStick");
      m_Factory     : IArcadeStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IArcadeStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ArcadeStickAdded(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ArcadeStickAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ArcadeStick");
      m_Factory     : IArcadeStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IArcadeStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ArcadeStickAdded(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_ArcadeStickRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IArcadeStick
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ArcadeStick");
      m_Factory     : IArcadeStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IArcadeStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ArcadeStickRemoved(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ArcadeStickRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ArcadeStick");
      m_Factory     : IArcadeStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IArcadeStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ArcadeStickRemoved(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ArcadeSticks
   return Windows.Gaming.Input.IVectorView_IArcadeStick is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ArcadeStick");
      m_Factory     : IArcadeStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IVectorView_IArcadeStick;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IArcadeStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ArcadeSticks(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IArcadeStick is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.ArcadeStick");
      m_Factory     : IArcadeStickStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IArcadeStick;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IArcadeStickStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromGameController(gameController, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_FlightStickAdded
   (
      value : Windows.Gaming.Input.EventHandler_IFlightStick
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.FlightStick");
      m_Factory     : IFlightStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlightStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_FlightStickAdded(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_FlightStickAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.FlightStick");
      m_Factory     : IFlightStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlightStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_FlightStickAdded(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_FlightStickRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IFlightStick
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.FlightStick");
      m_Factory     : IFlightStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlightStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_FlightStickRemoved(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_FlightStickRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.FlightStick");
      m_Factory     : IFlightStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlightStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_FlightStickRemoved(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_FlightSticks
   return Windows.Gaming.Input.IVectorView_IFlightStick is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.FlightStick");
      m_Factory     : IFlightStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IVectorView_IFlightStick;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlightStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FlightSticks(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IFlightStick is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.FlightStick");
      m_Factory     : IFlightStickStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IFlightStick;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IFlightStickStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromGameController(gameController, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_GamepadAdded
   (
      value : Windows.Gaming.Input.EventHandler_IGamepad
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Gamepad");
      m_Factory     : IGamepadStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGamepadStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_GamepadAdded(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_GamepadAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Gamepad");
      m_Factory     : IGamepadStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGamepadStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_GamepadAdded(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_GamepadRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IGamepad
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Gamepad");
      m_Factory     : IGamepadStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGamepadStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_GamepadRemoved(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_GamepadRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Gamepad");
      m_Factory     : IGamepadStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGamepadStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_GamepadRemoved(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_Gamepads
   return Windows.Gaming.Input.IVectorView_IGamepad is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Gamepad");
      m_Factory     : IGamepadStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IVectorView_IGamepad;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGamepadStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gamepads(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IGamepad is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.Gamepad");
      m_Factory     : IGamepadStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IGamepad;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGamepadStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromGameController(gameController, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IRacingWheel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RacingWheel");
      m_Factory     : IRacingWheelStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IRacingWheel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRacingWheelStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromGameController(gameController, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_RacingWheelAdded
   (
      value : Windows.Gaming.Input.EventHandler_IRacingWheel
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RacingWheel");
      m_Factory     : IRacingWheelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRacingWheelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_RacingWheelAdded(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_RacingWheelAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RacingWheel");
      m_Factory     : IRacingWheelStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRacingWheelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_RacingWheelAdded(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_RacingWheelRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IRacingWheel
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RacingWheel");
      m_Factory     : IRacingWheelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRacingWheelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_RacingWheelRemoved(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_RacingWheelRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RacingWheel");
      m_Factory     : IRacingWheelStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRacingWheelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_RacingWheelRemoved(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_RacingWheels
   return Windows.Gaming.Input.IVectorView_IRacingWheel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RacingWheel");
      m_Factory     : IRacingWheelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IVectorView_IRacingWheel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRacingWheelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RacingWheels(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_RawGameControllerAdded
   (
      value : Windows.Gaming.Input.EventHandler_IRawGameController
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RawGameController");
      m_Factory     : IRawGameControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRawGameControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_RawGameControllerAdded(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_RawGameControllerAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RawGameController");
      m_Factory     : IRawGameControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRawGameControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_RawGameControllerAdded(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_RawGameControllerRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IRawGameController
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RawGameController");
      m_Factory     : IRawGameControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRawGameControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_RawGameControllerRemoved(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_RawGameControllerRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RawGameController");
      m_Factory     : IRawGameControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRawGameControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_RawGameControllerRemoved(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_RawGameControllers
   return Windows.Gaming.Input.IVectorView_IRawGameController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RawGameController");
      m_Factory     : IRawGameControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IVectorView_IRawGameController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRawGameControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RawGameControllers(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IRawGameController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.RawGameController");
      m_Factory     : IRawGameControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IRawGameController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRawGameControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromGameController(gameController, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromGameController
   (
      gameController : Windows.Gaming.Input.IGameController
   )
   return Windows.Gaming.Input.IUINavigationController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.UINavigationController");
      m_Factory     : IUINavigationControllerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IUINavigationController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUINavigationControllerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromGameController(gameController, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_UINavigationControllerAdded
   (
      value : Windows.Gaming.Input.EventHandler_IUINavigationController
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.UINavigationController");
      m_Factory     : IUINavigationControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUINavigationControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_UINavigationControllerAdded(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_UINavigationControllerAdded
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.UINavigationController");
      m_Factory     : IUINavigationControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUINavigationControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_UINavigationControllerAdded(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_UINavigationControllerRemoved
   (
      value : Windows.Gaming.Input.EventHandler_IUINavigationController
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.UINavigationController");
      m_Factory     : IUINavigationControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUINavigationControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_UINavigationControllerRemoved(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_UINavigationControllerRemoved
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.UINavigationController");
      m_Factory     : IUINavigationControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUINavigationControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_UINavigationControllerRemoved(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_UINavigationControllers
   return Windows.Gaming.Input.IVectorView_IUINavigationController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Gaming.Input.UINavigationController");
      m_Factory     : IUINavigationControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Gaming.Input.IVectorView_IUINavigationController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IUINavigationControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UINavigationControllers(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;