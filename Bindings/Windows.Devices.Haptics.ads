--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Devices.Haptics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type VibrationAccessStatus is (
      Allowed,
      DeniedByUser,
      DeniedBySystem,
      DeniedByEnergySaver
   );
   for VibrationAccessStatus use (
      Allowed => 0,
      DeniedByUser => 1,
      DeniedBySystem => 2,
      DeniedByEnergySaver => 3
   );
   for VibrationAccessStatus'Size use 32;
   
   type VibrationAccessStatus_Ptr is access VibrationAccessStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_VibrationAccessStatus_Interface;
   type AsyncOperationCompletedHandler_VibrationAccessStatus is access all AsyncOperationCompletedHandler_VibrationAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_VibrationAccessStatus_Ptr is access all AsyncOperationCompletedHandler_VibrationAccessStatus;
   type AsyncOperationCompletedHandler_IVibrationDevice_Interface;
   type AsyncOperationCompletedHandler_IVibrationDevice is access all AsyncOperationCompletedHandler_IVibrationDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IVibrationDevice_Ptr is access all AsyncOperationCompletedHandler_IVibrationDevice;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IKnownSimpleHapticsControllerWaveformsStatics_Interface;
   type IKnownSimpleHapticsControllerWaveformsStatics is access all IKnownSimpleHapticsControllerWaveformsStatics_Interface'Class;
   type IKnownSimpleHapticsControllerWaveformsStatics_Ptr is access all IKnownSimpleHapticsControllerWaveformsStatics;
   type ISimpleHapticsControllerFeedback_Interface;
   type ISimpleHapticsControllerFeedback is access all ISimpleHapticsControllerFeedback_Interface'Class;
   type ISimpleHapticsControllerFeedback_Ptr is access all ISimpleHapticsControllerFeedback;
   type ISimpleHapticsController_Interface;
   type ISimpleHapticsController is access all ISimpleHapticsController_Interface'Class;
   type ISimpleHapticsController_Ptr is access all ISimpleHapticsController;
   type IVibrationDeviceStatics_Interface;
   type IVibrationDeviceStatics is access all IVibrationDeviceStatics_Interface'Class;
   type IVibrationDeviceStatics_Ptr is access all IVibrationDeviceStatics;
   type IVibrationDevice_Interface;
   type IVibrationDevice is access all IVibrationDevice_Interface'Class;
   type IVibrationDevice_Ptr is access all IVibrationDevice;
   type IIterator_ISimpleHapticsControllerFeedback_Interface;
   type IIterator_ISimpleHapticsControllerFeedback is access all IIterator_ISimpleHapticsControllerFeedback_Interface'Class;
   type IIterator_ISimpleHapticsControllerFeedback_Ptr is access all IIterator_ISimpleHapticsControllerFeedback;
   type IIterable_ISimpleHapticsControllerFeedback_Interface;
   type IIterable_ISimpleHapticsControllerFeedback is access all IIterable_ISimpleHapticsControllerFeedback_Interface'Class;
   type IIterable_ISimpleHapticsControllerFeedback_Ptr is access all IIterable_ISimpleHapticsControllerFeedback;
   type IVectorView_ISimpleHapticsControllerFeedback_Interface;
   type IVectorView_ISimpleHapticsControllerFeedback is access all IVectorView_ISimpleHapticsControllerFeedback_Interface'Class;
   type IVectorView_ISimpleHapticsControllerFeedback_Ptr is access all IVectorView_ISimpleHapticsControllerFeedback;
   type IAsyncOperation_VibrationAccessStatus_Interface;
   type IAsyncOperation_VibrationAccessStatus is access all IAsyncOperation_VibrationAccessStatus_Interface'Class;
   type IAsyncOperation_VibrationAccessStatus_Ptr is access all IAsyncOperation_VibrationAccessStatus;
   type IAsyncOperation_IVibrationDevice_Interface;
   type IAsyncOperation_IVibrationDevice is access all IAsyncOperation_IVibrationDevice_Interface'Class;
   type IAsyncOperation_IVibrationDevice_Ptr is access all IAsyncOperation_IVibrationDevice;
   type IIterator_ISimpleHapticsController_Interface;
   type IIterator_ISimpleHapticsController is access all IIterator_ISimpleHapticsController_Interface'Class;
   type IIterator_ISimpleHapticsController_Ptr is access all IIterator_ISimpleHapticsController;
   type IIterable_ISimpleHapticsController_Interface;
   type IIterable_ISimpleHapticsController is access all IIterable_ISimpleHapticsController_Interface'Class;
   type IIterable_ISimpleHapticsController_Ptr is access all IIterable_ISimpleHapticsController;
   type IVectorView_ISimpleHapticsController_Interface;
   type IVectorView_ISimpleHapticsController is access all IVectorView_ISimpleHapticsController_Interface'Class;
   type IVectorView_ISimpleHapticsController_Ptr is access all IVectorView_ISimpleHapticsController;
   
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
   type IKnownSimpleHapticsControllerWaveformsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Click
   (
      This       : access IKnownSimpleHapticsControllerWaveformsStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_BuzzContinuous
   (
      This       : access IKnownSimpleHapticsControllerWaveformsStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_RumbleContinuous
   (
      This       : access IKnownSimpleHapticsControllerWaveformsStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Press
   (
      This       : access IKnownSimpleHapticsControllerWaveformsStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Release
   (
      This       : access IKnownSimpleHapticsControllerWaveformsStatics_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   IID_IKnownSimpleHapticsControllerWaveformsStatics : aliased constant Windows.IID := (1029144311, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type ISimpleHapticsControllerFeedback_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Waveform
   (
      This       : access ISimpleHapticsControllerFeedback_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access ISimpleHapticsControllerFeedback_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_ISimpleHapticsControllerFeedback : aliased constant Windows.IID := (1029144312, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type ISimpleHapticsController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISimpleHapticsController_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedFeedback
   (
      This       : access ISimpleHapticsController_Interface
      ; RetVal : access Windows.Devices.Haptics.IVectorView_ISimpleHapticsControllerFeedback -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIntensitySupported
   (
      This       : access ISimpleHapticsController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPlayCountSupported
   (
      This       : access ISimpleHapticsController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPlayDurationSupported
   (
      This       : access ISimpleHapticsController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReplayPauseIntervalSupported
   (
      This       : access ISimpleHapticsController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function StopFeedback
   (
      This       : access ISimpleHapticsController_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SendHapticFeedback
   (
      This       : access ISimpleHapticsController_Interface
      ; feedback : Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
   )
   return Windows.HRESULT is abstract;
   
   function SendHapticFeedbackWithIntensity
   (
      This       : access ISimpleHapticsController_Interface
      ; feedback : Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
      ; intensity : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function SendHapticFeedbackForDuration
   (
      This       : access ISimpleHapticsController_Interface
      ; feedback : Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
      ; intensity : Windows.Double
      ; playDuration : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function SendHapticFeedbackForPlayCount
   (
      This       : access ISimpleHapticsController_Interface
      ; feedback : Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
      ; intensity : Windows.Double
      ; playCount : Windows.Int32
      ; replayPauseInterval : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_ISimpleHapticsController : aliased constant Windows.IID := (1029144313, 19694, 4582, (181, 53, 0, 27, 220, 6, 171, 59 ));
   
   ------------------------------------------------------------------------
   type IVibrationDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessAsync
   (
      This       : access IVibrationDeviceStatics_Interface
      ; RetVal : access Windows.Devices.Haptics.IAsyncOperation_VibrationAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IVibrationDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IVibrationDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Haptics.IAsyncOperation_IVibrationDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultAsync
   (
      This       : access IVibrationDeviceStatics_Interface
      ; RetVal : access Windows.Devices.Haptics.IAsyncOperation_IVibrationDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access IVibrationDeviceStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IVibrationDeviceStatics : aliased constant Windows.IID := (1407380973, 8848, 19145, (142, 179, 26, 132, 18, 46, 183, 28 ));
   
   ------------------------------------------------------------------------
   type IVibrationDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IVibrationDevice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SimpleHapticsController
   (
      This       : access IVibrationDevice_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IVibrationDevice : aliased constant Windows.IID := (1089608254, 34884, 18431, (179, 18, 6, 24, 90, 56, 68, 218 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISimpleHapticsControllerFeedback_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISimpleHapticsControllerFeedback_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISimpleHapticsControllerFeedback_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISimpleHapticsControllerFeedback_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISimpleHapticsControllerFeedback_Interface
      ; items : Windows.Devices.Haptics.ISimpleHapticsControllerFeedback_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISimpleHapticsControllerFeedback : aliased constant Windows.IID := (3084031958, 38502, 23710, (157, 204, 92, 56, 46, 174, 103, 80 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISimpleHapticsControllerFeedback_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISimpleHapticsControllerFeedback_Interface
      ; RetVal : access Windows.Devices.Haptics.IIterator_ISimpleHapticsControllerFeedback
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISimpleHapticsControllerFeedback : aliased constant Windows.IID := (2291441887, 13232, 22448, (170, 26, 146, 85, 238, 231, 45, 213 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISimpleHapticsControllerFeedback_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISimpleHapticsControllerFeedback_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISimpleHapticsControllerFeedback_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISimpleHapticsControllerFeedback_Interface
      ; value : Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISimpleHapticsControllerFeedback_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Haptics.ISimpleHapticsControllerFeedback_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISimpleHapticsControllerFeedback : aliased constant Windows.IID := (1375030020, 48029, 23675, (143, 95, 103, 248, 202, 244, 176, 3 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_VibrationAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_VibrationAccessStatus_Interface
      ; handler : Windows.Devices.Haptics.AsyncOperationCompletedHandler_VibrationAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_VibrationAccessStatus_Interface
      ; RetVal : access Windows.Devices.Haptics.AsyncOperationCompletedHandler_VibrationAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_VibrationAccessStatus_Interface
      ; RetVal : access Windows.Devices.Haptics.VibrationAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_VibrationAccessStatus : aliased constant Windows.IID := (124462609, 22036, 21925, (156, 88, 249, 209, 122, 143, 11, 121 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IVibrationDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVibrationDevice_Interface
      ; handler : Windows.Devices.Haptics.AsyncOperationCompletedHandler_IVibrationDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVibrationDevice_Interface
      ; RetVal : access Windows.Devices.Haptics.AsyncOperationCompletedHandler_IVibrationDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVibrationDevice_Interface
      ; RetVal : access Windows.Devices.Haptics.IVibrationDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IVibrationDevice : aliased constant Windows.IID := (1142502548, 58161, 20682, (187, 97, 106, 113, 189, 155, 1, 196 ));
   
   ------------------------------------------------------------------------
   type IIterator_ISimpleHapticsController_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISimpleHapticsController_Interface
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISimpleHapticsController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISimpleHapticsController_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISimpleHapticsController_Interface
      ; items : Windows.Devices.Haptics.ISimpleHapticsController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_ISimpleHapticsController : aliased constant Windows.IID := (1011882916, 60836, 21048, (189, 183, 209, 11, 163, 80, 205, 131 ));
   
   ------------------------------------------------------------------------
   type IIterable_ISimpleHapticsController_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISimpleHapticsController_Interface
      ; RetVal : access Windows.Devices.Haptics.IIterator_ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_ISimpleHapticsController : aliased constant Windows.IID := (3037570706, 18987, 23690, (142, 20, 4, 57, 192, 177, 219, 164 ));
   
   ------------------------------------------------------------------------
   type IVectorView_ISimpleHapticsController_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISimpleHapticsController_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Haptics.ISimpleHapticsController
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISimpleHapticsController_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISimpleHapticsController_Interface
      ; value : Windows.Devices.Haptics.ISimpleHapticsController
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISimpleHapticsController_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Haptics.ISimpleHapticsController_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_ISimpleHapticsController : aliased constant Windows.IID := (1402007582, 50945, 21378, (151, 204, 148, 234, 172, 75, 108, 191 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_VibrationAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Haptics.IAsyncOperation_VibrationAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_VibrationAccessStatus_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_VibrationAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Haptics.IAsyncOperation_VibrationAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_VibrationAccessStatus : aliased constant Windows.IID := (2743818715, 20209, 23506, (137, 239, 241, 217, 241, 250, 202, 150 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IVibrationDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Haptics.IAsyncOperation_IVibrationDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IVibrationDevice_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVibrationDevice_Interface
      ; asyncInfo : Windows.Devices.Haptics.IAsyncOperation_IVibrationDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IVibrationDevice : aliased constant Windows.IID := (1310892341, 62874, 21613, (159, 207, 130, 222, 184, 51, 217, 104 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SimpleHapticsControllerFeedback is Windows.Devices.Haptics.ISimpleHapticsControllerFeedback;
   subtype SimpleHapticsController is Windows.Devices.Haptics.ISimpleHapticsController;
   subtype VibrationDevice is Windows.Devices.Haptics.IVibrationDevice;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_Click
   return Windows.UInt16;
   
   function get_BuzzContinuous
   return Windows.UInt16;
   
   function get_RumbleContinuous
   return Windows.UInt16;
   
   function get_Press
   return Windows.UInt16;
   
   function get_Release
   return Windows.UInt16;
   
   function RequestAccessAsync
   return Windows.Devices.Haptics.IAsyncOperation_VibrationAccessStatus;
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Haptics.IAsyncOperation_IVibrationDevice;
   
   function GetDefaultAsync
   return Windows.Devices.Haptics.IAsyncOperation_IVibrationDevice;
   
   function FindAllAsync
   return Windows.Address;

end;