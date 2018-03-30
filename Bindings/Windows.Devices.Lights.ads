--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.UI;
--------------------------------------------------------------------------------
package Windows.Devices.Lights is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ILamp_Interface;
   type AsyncOperationCompletedHandler_ILamp is access all AsyncOperationCompletedHandler_ILamp_Interface'Class;
   type AsyncOperationCompletedHandler_ILamp_Ptr is access all AsyncOperationCompletedHandler_ILamp;
   type TypedEventHandler_ILamp_add_AvailabilityChanged_Interface;
   type TypedEventHandler_ILamp_add_AvailabilityChanged is access all TypedEventHandler_ILamp_add_AvailabilityChanged_Interface'Class;
   type TypedEventHandler_ILamp_add_AvailabilityChanged_Ptr is access all TypedEventHandler_ILamp_add_AvailabilityChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ILampStatics_Interface;
   type ILampStatics is access all ILampStatics_Interface'Class;
   type ILampStatics_Ptr is access all ILampStatics;
   type ILamp_Interface;
   type ILamp is access all ILamp_Interface'Class;
   type ILamp_Ptr is access all ILamp;
   type ILampAvailabilityChangedEventArgs_Interface;
   type ILampAvailabilityChangedEventArgs is access all ILampAvailabilityChangedEventArgs_Interface'Class;
   type ILampAvailabilityChangedEventArgs_Ptr is access all ILampAvailabilityChangedEventArgs;
   type IAsyncOperation_ILamp_Interface;
   type IAsyncOperation_ILamp is access all IAsyncOperation_ILamp_Interface'Class;
   type IAsyncOperation_ILamp_Ptr is access all IAsyncOperation_ILamp;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type ILampStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access ILampStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access ILampStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Lights.IAsyncOperation_ILamp -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access ILampStatics_Interface
      ; RetVal : access Windows.Devices.Lights.IAsyncOperation_ILamp -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ILampStatics : aliased constant Windows.IID := (2820817260, 34949, 16414, (184, 33, 142, 139, 56, 168, 232, 236 ));
   
   ------------------------------------------------------------------------
   type ILamp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access ILamp_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access ILamp_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access ILamp_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BrightnessLevel
   (
      This       : access ILamp_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_BrightnessLevel
   (
      This       : access ILamp_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_IsColorSettable
   (
      This       : access ILamp_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Color
   (
      This       : access ILamp_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access ILamp_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function add_AvailabilityChanged
   (
      This       : access ILamp_Interface
      ; handler : TypedEventHandler_ILamp_add_AvailabilityChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AvailabilityChanged
   (
      This       : access ILamp_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ILamp : aliased constant Windows.IID := (75324314, 59973, 19243, (177, 162, 20, 223, 240, 11, 222, 123 ));
   
   ------------------------------------------------------------------------
   type ILampAvailabilityChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAvailable
   (
      This       : access ILampAvailabilityChangedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ILampAvailabilityChangedEventArgs : aliased constant Windows.IID := (1332624877, 1954, 18845, (146, 96, 103, 227, 4, 83, 43, 164 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ILamp_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILamp_Interface
      ; handler : Windows.Devices.Lights.AsyncOperationCompletedHandler_ILamp
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILamp_Interface
      ; RetVal : access Windows.Devices.Lights.AsyncOperationCompletedHandler_ILamp
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILamp_Interface
      ; RetVal : access Windows.Devices.Lights.ILamp
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ILamp : aliased constant Windows.IID := (1386651133, 61654, 22833, (184, 225, 243, 128, 102, 215, 27, 242 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ILamp_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Lights.IAsyncOperation_ILamp ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ILamp_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILamp_Interface
      ; asyncInfo : Windows.Devices.Lights.IAsyncOperation_ILamp
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ILamp : aliased constant Windows.IID := (421170286, 24797, 23073, (165, 60, 191, 63, 148, 10, 29, 222 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ILamp_add_AvailabilityChanged_Interface(Callback : access procedure (sender : Windows.Devices.Lights.ILamp ; args : Windows.Devices.Lights.ILampAvailabilityChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ILamp_add_AvailabilityChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ILamp_add_AvailabilityChanged_Interface
      ; sender : Windows.Devices.Lights.ILamp
      ; args : Windows.Devices.Lights.ILampAvailabilityChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ILamp_add_AvailabilityChanged : aliased constant Windows.IID := (1433010905, 30341, 22383, (137, 202, 182, 45, 196, 129, 210, 157 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Lamp is Windows.Devices.Lights.ILamp;
   subtype LampAvailabilityChangedEventArgs is Windows.Devices.Lights.ILampAvailabilityChangedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Lights.IAsyncOperation_ILamp;
   
   function GetDefaultAsync
   return Windows.Devices.Lights.IAsyncOperation_ILamp;

end;