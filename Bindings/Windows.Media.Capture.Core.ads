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
package Windows.Media.Capture.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture_Interface;
   type AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture is access all AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture_Interface'Class;
   type AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture_Ptr is access all AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture;
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured_Interface;
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured is access all TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured_Interface'Class;
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured_Ptr is access all TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured;
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped_Interface;
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped is access all TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped_Interface'Class;
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped_Ptr is access all TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVariablePhotoCapturedEventArgs_Interface;
   type IVariablePhotoCapturedEventArgs is access all IVariablePhotoCapturedEventArgs_Interface'Class;
   type IVariablePhotoCapturedEventArgs_Ptr is access all IVariablePhotoCapturedEventArgs;
   type IVariablePhotoSequenceCapture_Interface;
   type IVariablePhotoSequenceCapture is access all IVariablePhotoSequenceCapture_Interface'Class;
   type IVariablePhotoSequenceCapture_Ptr is access all IVariablePhotoSequenceCapture;
   type IVariablePhotoSequenceCapture2_Interface;
   type IVariablePhotoSequenceCapture2 is access all IVariablePhotoSequenceCapture2_Interface'Class;
   type IVariablePhotoSequenceCapture2_Ptr is access all IVariablePhotoSequenceCapture2;
   type IAsyncOperation_IVariablePhotoSequenceCapture_Interface;
   type IAsyncOperation_IVariablePhotoSequenceCapture is access all IAsyncOperation_IVariablePhotoSequenceCapture_Interface'Class;
   type IAsyncOperation_IVariablePhotoSequenceCapture_Ptr is access all IAsyncOperation_IVariablePhotoSequenceCapture;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IVariablePhotoCapturedEventArgs : aliased constant Windows.IID := (3521858652, 6995, 20042, (139, 92, 219, 120, 135, 172, 148, 155 ));
   
   type IVariablePhotoCapturedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Frame
   (
      This       : access IVariablePhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_CaptureTimeOffset
   (
      This       : access IVariablePhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_UsedFrameControllerIndex
   (
      This       : access IVariablePhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CapturedFrameControlValues
   (
      This       : access IVariablePhotoCapturedEventArgs_Interface
      ; RetVal : access Windows.Media.Capture.ICapturedFrameControlValues
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVariablePhotoSequenceCapture : aliased constant Windows.IID := (3490786589, 798, 16449, (166, 214, 189, 116, 36, 118, 168, 238 ));
   
   type IVariablePhotoSequenceCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function StartAsync
   (
      This       : access IVariablePhotoSequenceCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function StopAsync
   (
      This       : access IVariablePhotoSequenceCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FinishAsync
   (
      This       : access IVariablePhotoSequenceCapture_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function add_PhotoCaptured
   (
      This       : access IVariablePhotoSequenceCapture_Interface
      ; handler : TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PhotoCaptured
   (
      This       : access IVariablePhotoSequenceCapture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IVariablePhotoSequenceCapture_Interface
      ; handler : TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IVariablePhotoSequenceCapture_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVariablePhotoSequenceCapture2 : aliased constant Windows.IID := (4264321724, 20656, 17379, (145, 124, 227, 185, 39, 152, 148, 47 ));
   
   type IVariablePhotoSequenceCapture2_Interface is interface and Windows.IInspectable_Interface;
   
   function UpdateSettingsAsync
   (
      This       : access IVariablePhotoSequenceCapture2_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IVariablePhotoSequenceCapture : aliased constant Windows.IID := (52938940, 12616, 21491, (138, 61, 205, 177, 46, 73, 225, 50 ));
   
   type IAsyncOperation_IVariablePhotoSequenceCapture_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVariablePhotoSequenceCapture_Interface
      ; handler : Windows.Media.Capture.Core.AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVariablePhotoSequenceCapture_Interface
      ; RetVal : access Windows.Media.Capture.Core.AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVariablePhotoSequenceCapture_Interface
      ; RetVal : access Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture : aliased constant Windows.IID := (413490643, 483, 23269, (155, 94, 200, 74, 212, 12, 246, 183 ));
   
   type AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture_Interface(Callback : access procedure (asyncInfo : Windows.Media.Capture.Core.IAsyncOperation_IVariablePhotoSequenceCapture ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVariablePhotoSequenceCapture_Interface
      ; asyncInfo : Windows.Media.Capture.Core.IAsyncOperation_IVariablePhotoSequenceCapture
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured : aliased constant Windows.IID := (3132293680, 15821, 22754, (170, 197, 164, 95, 62, 111, 128, 151 ));
   
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured_Interface(Callback : access procedure (sender : Windows.Media.Capture.Core.IVariablePhotoSequenceCapture ; args : Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IVariablePhotoSequenceCapture_add_PhotoCaptured_Interface
      ; sender : Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
      ; args : Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped : aliased constant Windows.IID := (571516480, 3707, 24207, (166, 23, 44, 187, 16, 49, 74, 90 ));
   
   type TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped_Interface(Callback : access procedure (sender : Windows.Media.Capture.Core.IVariablePhotoSequenceCapture ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IVariablePhotoSequenceCapture_add_Stopped_Interface
      ; sender : Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype VariablePhotoSequenceCapture is Windows.Media.Capture.Core.IVariablePhotoSequenceCapture;
   subtype VariablePhotoCapturedEventArgs is Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
