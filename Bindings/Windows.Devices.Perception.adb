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
with Windows.Devices.Enumeration;
with Windows.Media.Devices.Core;
with Windows.Graphics.Imaging;
with Windows.Media;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Perception is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionControlSession_add_ControlLost_Interface
      ; sender : Windows.Devices.Perception.IPerceptionControlSession
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionControlSession(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionInfraredFrameSource
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthFrameSource
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionColorFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionColorFrameSource
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameSource(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameReader
      ; args : Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionColorFrameReader(sender), Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameReader
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionDepthFrameReader(sender), Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameReader
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Perception.IPerceptionInfraredFrameReader(sender), Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs(args));
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
   
end;
