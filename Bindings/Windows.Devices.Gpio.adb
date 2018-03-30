--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Devices.Gpio.Provider;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Gpio is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IGpioController_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IGpioController or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IGpioController_Interface
      ; asyncInfo : Windows.Devices.Gpio.IAsyncOperation_IGpioController
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IGpioPin_add_ValueChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IGpioPin_add_ValueChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IGpioPin_add_ValueChanged_Interface
      ; sender : Windows.Devices.Gpio.IGpioPin
      ; args : Windows.Devices.Gpio.IGpioPinValueChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Gpio.IGpioPin(sender), Windows.Devices.Gpio.IGpioPinValueChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      pin : Windows.Devices.Gpio.IGpioPin
   )
   return Windows.Devices.Gpio.IGpioChangeReader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioChangeReader");
      m_Factory     : Windows.Devices.Gpio.IGpioChangeReaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioChangeReader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioChangeReaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(pin, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithCapacity
   (
      pin : Windows.Devices.Gpio.IGpioPin
      ; minCapacity : Windows.Int32
   )
   return Windows.Devices.Gpio.IGpioChangeReader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioChangeReader");
      m_Factory     : Windows.Devices.Gpio.IGpioChangeReaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioChangeReader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioChangeReaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithCapacity(pin, minCapacity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      pin : Windows.Devices.Gpio.IGpioPin
   )
   return Windows.Devices.Gpio.IGpioChangeCounter is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioChangeCounter");
      m_Factory     : Windows.Devices.Gpio.IGpioChangeCounterFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioChangeCounter := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioChangeCounterFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(pin, RetVal'Access);
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
   
   
   function GetControllersAsync
   (
      provider : Windows.Devices.Gpio.Provider.IGpioProvider
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioController");
      m_Factory     : IGpioControllerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioControllerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetControllersAsync(provider, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAsync
   return Windows.Devices.Gpio.IAsyncOperation_IGpioController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioController");
      m_Factory     : IGpioControllerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IAsyncOperation_IGpioController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioControllerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Devices.Gpio.IGpioController is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Gpio.GpioController");
      m_Factory     : IGpioControllerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Gpio.IGpioController;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGpioControllerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;