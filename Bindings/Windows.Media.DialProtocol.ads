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
with Windows.Foundation;
limited with Windows.Storage.Streams;
limited with Windows.Devices.Enumeration;
with Windows.Foundation.Collections;
limited with Windows.UI.Popups;
--------------------------------------------------------------------------------
package Windows.Media.DialProtocol is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DialAppState is (
      Unknown,
      Stopped,
      Running,
      NetworkFailure
   );
   for DialAppState use (
      Unknown => 0,
      Stopped => 1,
      Running => 2,
      NetworkFailure => 3
   );
   for DialAppState'Size use 32;
   
   type DialAppState_Ptr is access DialAppState;
   
   type DialAppLaunchResult is (
      Launched,
      FailedToLaunch,
      NotFound,
      NetworkFailure
   );
   for DialAppLaunchResult use (
      Launched => 0,
      FailedToLaunch => 1,
      NotFound => 2,
      NetworkFailure => 3
   );
   for DialAppLaunchResult'Size use 32;
   
   type DialAppLaunchResult_Ptr is access DialAppLaunchResult;
   
   type DialAppStopResult is (
      Stopped,
      StopFailed,
      OperationNotSupported,
      NetworkFailure
   );
   for DialAppStopResult use (
      Stopped => 0,
      StopFailed => 1,
      OperationNotSupported => 2,
      NetworkFailure => 3
   );
   for DialAppStopResult'Size use 32;
   
   type DialAppStopResult_Ptr is access DialAppStopResult;
   
   type DialDeviceDisplayStatus is (
      None,
      Connecting,
      Connected,
      Disconnecting,
      Disconnected,
      Error
   );
   for DialDeviceDisplayStatus use (
      None => 0,
      Connecting => 1,
      Connected => 2,
      Disconnecting => 3,
      Disconnected => 4,
      Error => 5
   );
   for DialDeviceDisplayStatus'Size use 32;
   
   type DialDeviceDisplayStatus_Ptr is access DialDeviceDisplayStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_DialAppLaunchResult_Interface;
   type AsyncOperationCompletedHandler_DialAppLaunchResult is access all AsyncOperationCompletedHandler_DialAppLaunchResult_Interface'Class;
   type AsyncOperationCompletedHandler_DialAppLaunchResult_Ptr is access all AsyncOperationCompletedHandler_DialAppLaunchResult;
   type AsyncOperationCompletedHandler_DialAppStopResult_Interface;
   type AsyncOperationCompletedHandler_DialAppStopResult is access all AsyncOperationCompletedHandler_DialAppStopResult_Interface'Class;
   type AsyncOperationCompletedHandler_DialAppStopResult_Ptr is access all AsyncOperationCompletedHandler_DialAppStopResult;
   type AsyncOperationCompletedHandler_IDialAppStateDetails_Interface;
   type AsyncOperationCompletedHandler_IDialAppStateDetails is access all AsyncOperationCompletedHandler_IDialAppStateDetails_Interface'Class;
   type AsyncOperationCompletedHandler_IDialAppStateDetails_Ptr is access all AsyncOperationCompletedHandler_IDialAppStateDetails;
   type AsyncOperationCompletedHandler_IDialDevice_Interface;
   type AsyncOperationCompletedHandler_IDialDevice is access all AsyncOperationCompletedHandler_IDialDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IDialDevice_Ptr is access all AsyncOperationCompletedHandler_IDialDevice;
   type TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected_Interface;
   type TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected is access all TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected_Interface'Class;
   type TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected_Ptr is access all TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected;
   type TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked_Interface;
   type TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked is access all TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked_Interface'Class;
   type TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked_Ptr is access all TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked;
   type TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed_Interface;
   type TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed is access all TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed_Interface'Class;
   type TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed_Ptr is access all TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDialAppStateDetails_Interface;
   type IDialAppStateDetails is access all IDialAppStateDetails_Interface'Class;
   type IDialAppStateDetails_Ptr is access all IDialAppStateDetails;
   type IDialApp_Interface;
   type IDialApp is access all IDialApp_Interface'Class;
   type IDialApp_Ptr is access all IDialApp;
   type IDialDevice_Interface;
   type IDialDevice is access all IDialDevice_Interface'Class;
   type IDialDevice_Ptr is access all IDialDevice;
   type IDialDevice2_Interface;
   type IDialDevice2 is access all IDialDevice2_Interface'Class;
   type IDialDevice2_Ptr is access all IDialDevice2;
   type IDialDeviceStatics_Interface;
   type IDialDeviceStatics is access all IDialDeviceStatics_Interface'Class;
   type IDialDeviceStatics_Ptr is access all IDialDeviceStatics;
   type IDialDeviceSelectedEventArgs_Interface;
   type IDialDeviceSelectedEventArgs is access all IDialDeviceSelectedEventArgs_Interface'Class;
   type IDialDeviceSelectedEventArgs_Ptr is access all IDialDeviceSelectedEventArgs;
   type IDialDisconnectButtonClickedEventArgs_Interface;
   type IDialDisconnectButtonClickedEventArgs is access all IDialDisconnectButtonClickedEventArgs_Interface'Class;
   type IDialDisconnectButtonClickedEventArgs_Ptr is access all IDialDisconnectButtonClickedEventArgs;
   type IDialDevicePickerFilter_Interface;
   type IDialDevicePickerFilter is access all IDialDevicePickerFilter_Interface'Class;
   type IDialDevicePickerFilter_Ptr is access all IDialDevicePickerFilter;
   type IDialDevicePicker_Interface;
   type IDialDevicePicker is access all IDialDevicePicker_Interface'Class;
   type IDialDevicePicker_Ptr is access all IDialDevicePicker;
   type IDialReceiverAppStatics_Interface;
   type IDialReceiverAppStatics is access all IDialReceiverAppStatics_Interface'Class;
   type IDialReceiverAppStatics_Ptr is access all IDialReceiverAppStatics;
   type IDialReceiverApp_Interface;
   type IDialReceiverApp is access all IDialReceiverApp_Interface'Class;
   type IDialReceiverApp_Ptr is access all IDialReceiverApp;
   type IAsyncOperation_DialAppLaunchResult_Interface;
   type IAsyncOperation_DialAppLaunchResult is access all IAsyncOperation_DialAppLaunchResult_Interface'Class;
   type IAsyncOperation_DialAppLaunchResult_Ptr is access all IAsyncOperation_DialAppLaunchResult;
   type IAsyncOperation_DialAppStopResult_Interface;
   type IAsyncOperation_DialAppStopResult is access all IAsyncOperation_DialAppStopResult_Interface'Class;
   type IAsyncOperation_DialAppStopResult_Ptr is access all IAsyncOperation_DialAppStopResult;
   type IAsyncOperation_IDialAppStateDetails_Interface;
   type IAsyncOperation_IDialAppStateDetails is access all IAsyncOperation_IDialAppStateDetails_Interface'Class;
   type IAsyncOperation_IDialAppStateDetails_Ptr is access all IAsyncOperation_IDialAppStateDetails;
   type IAsyncOperation_IDialDevice_Interface;
   type IAsyncOperation_IDialDevice is access all IAsyncOperation_IDialDevice_Interface'Class;
   type IAsyncOperation_IDialDevice_Ptr is access all IAsyncOperation_IDialDevice;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDialAppStateDetails : aliased constant Windows.IID := (3720651937, 62942, 16397, (190, 164, 140, 132, 102, 187, 41, 97 ));
   
   type IDialAppStateDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_State
   (
      This       : access IDialAppStateDetails_Interface
      ; RetVal : access Windows.Media.DialProtocol.DialAppState
   )
   return Windows.HRESULT is abstract;
   
   function get_FullXml
   (
      This       : access IDialAppStateDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialApp : aliased constant Windows.IID := (1432353747, 17847, 18931, (187, 215, 48, 45, 182, 8, 70, 70 ));
   
   type IDialApp_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppName
   (
      This       : access IDialApp_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RequestLaunchAsync
   (
      This       : access IDialApp_Interface
      ; appArgument : Windows.String
      ; RetVal : access Windows.Media.DialProtocol.IAsyncOperation_DialAppLaunchResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access IDialApp_Interface
      ; RetVal : access Windows.Media.DialProtocol.IAsyncOperation_DialAppStopResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppStateAsync
   (
      This       : access IDialApp_Interface
      ; RetVal : access Windows.Media.DialProtocol.IAsyncOperation_IDialAppStateDetails -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialDevice : aliased constant Windows.IID := (4293979567, 30111, 16850, (162, 10, 127, 41, 206, 11, 55, 132 ));
   
   type IDialDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IDialDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDialApp
   (
      This       : access IDialDevice_Interface
      ; appName : Windows.String
      ; RetVal : access Windows.Media.DialProtocol.IDialApp
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialDevice2 : aliased constant Windows.IID := (3132617685, 23547, 20154, (139, 50, 181, 124, 92, 94, 229, 201 ));
   
   type IDialDevice2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FriendlyName
   (
      This       : access IDialDevice2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IDialDevice2_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialDeviceStatics : aliased constant Windows.IID := (2859060373, 504, 18264, (132, 97, 43, 189, 28, 220, 60, 243 ));
   
   type IDialDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IDialDeviceStatics_Interface
      ; appName : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IDialDeviceStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.Media.DialProtocol.IAsyncOperation_IDialDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeviceInfoSupportsDialAsync
   (
      This       : access IDialDeviceStatics_Interface
      ; device : Windows.Devices.Enumeration.IDeviceInformation
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialDeviceSelectedEventArgs : aliased constant Windows.IID := (1208717997, 44150, 18411, (156, 6, 161, 147, 4, 218, 2, 71 ));
   
   type IDialDeviceSelectedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SelectedDialDevice
   (
      This       : access IDialDeviceSelectedEventArgs_Interface
      ; RetVal : access Windows.Media.DialProtocol.IDialDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialDisconnectButtonClickedEventArgs : aliased constant Windows.IID := (1383485778, 40065, 20053, (173, 194, 14, 190, 153, 205, 227, 182 ));
   
   type IDialDisconnectButtonClickedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Device
   (
      This       : access IDialDisconnectButtonClickedEventArgs_Interface
      ; RetVal : access Windows.Media.DialProtocol.IDialDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialDevicePickerFilter : aliased constant Windows.IID := (3246166970, 34496, 18525, (184, 214, 15, 154, 143, 100, 21, 144 ));
   
   type IDialDevicePickerFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedAppNames
   (
      This       : access IDialDevicePickerFilter_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialDevicePicker : aliased constant Windows.IID := (3128840714, 65369, 20299, (189, 172, 216, 159, 73, 90, 214, 225 ));
   
   type IDialDevicePicker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Filter
   (
      This       : access IDialDevicePicker_Interface
      ; RetVal : access Windows.Media.DialProtocol.IDialDevicePickerFilter
   )
   return Windows.HRESULT is abstract;
   
   function get_Appearance
   (
      This       : access IDialDevicePicker_Interface
      ; RetVal : access Windows.Devices.Enumeration.IDevicePickerAppearance
   )
   return Windows.HRESULT is abstract;
   
   function add_DialDeviceSelected
   (
      This       : access IDialDevicePicker_Interface
      ; handler : TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DialDeviceSelected
   (
      This       : access IDialDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DisconnectButtonClicked
   (
      This       : access IDialDevicePicker_Interface
      ; handler : TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DisconnectButtonClicked
   (
      This       : access IDialDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_DialDevicePickerDismissed
   (
      This       : access IDialDevicePicker_Interface
      ; handler : TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DialDevicePickerDismissed
   (
      This       : access IDialDevicePicker_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function Show
   (
      This       : access IDialDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function ShowWithPlacement
   (
      This       : access IDialDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleDialDeviceAsync
   (
      This       : access IDialDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Media.DialProtocol.IAsyncOperation_IDialDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PickSingleDialDeviceAsyncWithPlacement
   (
      This       : access IDialDevicePicker_Interface
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Media.DialProtocol.IAsyncOperation_IDialDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Hide
   (
      This       : access IDialDevicePicker_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetDisplayStatus
   (
      This       : access IDialDevicePicker_Interface
      ; device : Windows.Media.DialProtocol.IDialDevice
      ; status : Windows.Media.DialProtocol.DialDeviceDisplayStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialReceiverAppStatics : aliased constant Windows.IID := (1394096700, 19510, 19714, (178, 138, 242, 169, 218, 56, 236, 82 ));
   
   type IDialReceiverAppStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IDialReceiverAppStatics_Interface
      ; RetVal : access Windows.Media.DialProtocol.IDialReceiverApp
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDialReceiverApp : aliased constant Windows.IID := (4248730711, 20549, 18190, (179, 4, 77, 217, 177, 62, 125, 17 ));
   
   type IDialReceiverApp_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAdditionalDataAsync
   (
      This       : access IDialReceiverApp_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetAdditionalDataAsync
   (
      This       : access IDialReceiverApp_Interface
      ; additionalData : Windows.Address
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_DialAppLaunchResult : aliased constant Windows.IID := (1158857054, 8132, 22088, (189, 73, 81, 83, 58, 63, 230, 180 ));
   
   type IAsyncOperation_DialAppLaunchResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_DialAppLaunchResult_Interface
      ; handler : Windows.Media.DialProtocol.AsyncOperationCompletedHandler_DialAppLaunchResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_DialAppLaunchResult_Interface
      ; RetVal : access Windows.Media.DialProtocol.AsyncOperationCompletedHandler_DialAppLaunchResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_DialAppLaunchResult_Interface
      ; RetVal : access Windows.Media.DialProtocol.DialAppLaunchResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_DialAppStopResult : aliased constant Windows.IID := (2241393230, 3426, 20858, (150, 28, 49, 252, 167, 58, 206, 221 ));
   
   type IAsyncOperation_DialAppStopResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_DialAppStopResult_Interface
      ; handler : Windows.Media.DialProtocol.AsyncOperationCompletedHandler_DialAppStopResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_DialAppStopResult_Interface
      ; RetVal : access Windows.Media.DialProtocol.AsyncOperationCompletedHandler_DialAppStopResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_DialAppStopResult_Interface
      ; RetVal : access Windows.Media.DialProtocol.DialAppStopResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDialAppStateDetails : aliased constant Windows.IID := (3842639778, 11503, 24519, (177, 76, 214, 221, 133, 23, 197, 142 ));
   
   type IAsyncOperation_IDialAppStateDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDialAppStateDetails_Interface
      ; handler : Windows.Media.DialProtocol.AsyncOperationCompletedHandler_IDialAppStateDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDialAppStateDetails_Interface
      ; RetVal : access Windows.Media.DialProtocol.AsyncOperationCompletedHandler_IDialAppStateDetails
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDialAppStateDetails_Interface
      ; RetVal : access Windows.Media.DialProtocol.IDialAppStateDetails
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDialDevice : aliased constant Windows.IID := (1193061797, 7908, 20928, (182, 181, 191, 114, 245, 245, 4, 34 ));
   
   type IAsyncOperation_IDialDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDialDevice_Interface
      ; handler : Windows.Media.DialProtocol.AsyncOperationCompletedHandler_IDialDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDialDevice_Interface
      ; RetVal : access Windows.Media.DialProtocol.AsyncOperationCompletedHandler_IDialDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDialDevice_Interface
      ; RetVal : access Windows.Media.DialProtocol.IDialDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_DialAppLaunchResult : aliased constant Windows.IID := (374082216, 15659, 22427, (148, 163, 204, 73, 37, 198, 149, 236 ));
   
   type AsyncOperationCompletedHandler_DialAppLaunchResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_DialAppLaunchResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_DialAppLaunchResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DialAppLaunchResult_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_DialAppLaunchResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_DialAppStopResult : aliased constant Windows.IID := (3344299338, 61307, 22074, (155, 20, 70, 46, 114, 217, 102, 90 ));
   
   type AsyncOperationCompletedHandler_DialAppStopResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_DialAppStopResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_DialAppStopResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DialAppStopResult_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_DialAppStopResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDialAppStateDetails : aliased constant Windows.IID := (952511957, 7958, 21952, (142, 199, 202, 15, 200, 65, 214, 20 ));
   
   type AsyncOperationCompletedHandler_IDialAppStateDetails_Interface(Callback : access procedure (asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_IDialAppStateDetails ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDialAppStateDetails'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDialAppStateDetails_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_IDialAppStateDetails
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDialDevice : aliased constant Windows.IID := (2176613659, 32006, 21855, (129, 27, 66, 236, 15, 167, 27, 85 ));
   
   type AsyncOperationCompletedHandler_IDialDevice_Interface(Callback : access procedure (asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_IDialDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDialDevice'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDialDevice_Interface
      ; asyncInfo : Windows.Media.DialProtocol.IAsyncOperation_IDialDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected : aliased constant Windows.IID := (2205532375, 59331, 22204, (152, 128, 70, 182, 156, 161, 13, 69 ));
   
   type TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected_Interface(Callback : access procedure (sender : Windows.Media.DialProtocol.IDialDevicePicker ; args : Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDialDevicePicker_add_DialDeviceSelected_Interface
      ; sender : Windows.Media.DialProtocol.IDialDevicePicker
      ; args : Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked : aliased constant Windows.IID := (323562224, 7295, 22504, (181, 126, 165, 174, 143, 44, 70, 46 ));
   
   type TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked_Interface(Callback : access procedure (sender : Windows.Media.DialProtocol.IDialDevicePicker ; args : Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDialDevicePicker_add_DisconnectButtonClicked_Interface
      ; sender : Windows.Media.DialProtocol.IDialDevicePicker
      ; args : Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed : aliased constant Windows.IID := (3670622248, 6980, 24389, (185, 227, 171, 207, 74, 176, 68, 191 ));
   
   type TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed_Interface(Callback : access procedure (sender : Windows.Media.DialProtocol.IDialDevicePicker ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDialDevicePicker_add_DialDevicePickerDismissed_Interface
      ; sender : Windows.Media.DialProtocol.IDialDevicePicker
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DialAppStateDetails is Windows.Media.DialProtocol.IDialAppStateDetails;
   subtype DialApp is Windows.Media.DialProtocol.IDialApp;
   subtype DialDevice is Windows.Media.DialProtocol.IDialDevice;
   subtype DialDeviceSelectedEventArgs is Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs;
   subtype DialDisconnectButtonClickedEventArgs is Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs;
   subtype DialDevicePickerFilter is Windows.Media.DialProtocol.IDialDevicePickerFilter;
   subtype DialDevicePicker is Windows.Media.DialProtocol.IDialDevicePicker;
   function CreateDialDevicePicker return Windows.Media.DialProtocol.IDialDevicePicker;
   
   subtype DialReceiverApp is Windows.Media.DialProtocol.IDialReceiverApp;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   (
      appName : Windows.String
   )
   return Windows.String;
   
   function FromIdAsync
   (
      value : Windows.String
   )
   return Windows.Media.DialProtocol.IAsyncOperation_IDialDevice;
   
   function DeviceInfoSupportsDialAsync
   (
      device : Windows.Devices.Enumeration.IDeviceInformation
   )
   return Windows.Foundation.IAsyncOperation_Boolean;
   
   function get_Current
   return Windows.Media.DialProtocol.IDialReceiverApp;
   
end;
