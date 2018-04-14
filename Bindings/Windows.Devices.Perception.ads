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
limited with Windows.Devices.Enumeration;
with Windows.Foundation.Collections;
limited with Windows.Media.Devices.Core;
with Windows.Foundation.Numerics;
limited with Windows.Graphics.Imaging;
limited with Windows.Media;
--------------------------------------------------------------------------------
package Windows.Devices.Perception is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PerceptionFrameSourceAccessStatus is (
      Unspecified,
      Allowed,
      DeniedByUser,
      DeniedBySystem
   );
   for PerceptionFrameSourceAccessStatus use (
      Unspecified => 0,
      Allowed => 1,
      DeniedByUser => 2,
      DeniedBySystem => 3
   );
   for PerceptionFrameSourceAccessStatus'Size use 32;
   
   type PerceptionFrameSourceAccessStatus_Ptr is access PerceptionFrameSourceAccessStatus;
   
   type PerceptionFrameSourcePropertyChangeStatus is (
      Unknown,
      Accepted,
      LostControl,
      PropertyNotSupported,
      PropertyReadOnly,
      ValueOutOfRange
   );
   for PerceptionFrameSourcePropertyChangeStatus use (
      Unknown => 0,
      Accepted => 1,
      LostControl => 2,
      PropertyNotSupported => 3,
      PropertyReadOnly => 4,
      ValueOutOfRange => 5
   );
   for PerceptionFrameSourcePropertyChangeStatus'Size use 32;
   
   type PerceptionFrameSourcePropertyChangeStatus_Ptr is access PerceptionFrameSourcePropertyChangeStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded_Interface;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded_Ptr is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved_Interface;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved_Ptr is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped_Interface;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped_Ptr is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted;
   type TypedEventHandler_IPerceptionControlSession_add_ControlLost_Interface;
   type TypedEventHandler_IPerceptionControlSession_add_ControlLost is access all TypedEventHandler_IPerceptionControlSession_add_ControlLost_Interface'Class;
   type TypedEventHandler_IPerceptionControlSession_add_ControlLost_Ptr is access all TypedEventHandler_IPerceptionControlSession_add_ControlLost;
   type AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult_Interface;
   type AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult is access all AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult_Ptr is access all AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult;
   type AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource_Interface;
   type AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource is access all AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource_Interface'Class;
   type AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource_Ptr is access all AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource;
   type AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus_Interface;
   type AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus is access all AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus_Interface'Class;
   type AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus_Ptr is access all AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus;
   type AsyncOperationCompletedHandler_IPerceptionDepthFrameSource_Interface;
   type AsyncOperationCompletedHandler_IPerceptionDepthFrameSource is access all AsyncOperationCompletedHandler_IPerceptionDepthFrameSource_Interface'Class;
   type AsyncOperationCompletedHandler_IPerceptionDepthFrameSource_Ptr is access all AsyncOperationCompletedHandler_IPerceptionDepthFrameSource;
   type AsyncOperationCompletedHandler_IPerceptionColorFrameSource_Interface;
   type AsyncOperationCompletedHandler_IPerceptionColorFrameSource is access all AsyncOperationCompletedHandler_IPerceptionColorFrameSource_Interface'Class;
   type AsyncOperationCompletedHandler_IPerceptionColorFrameSource_Ptr is access all AsyncOperationCompletedHandler_IPerceptionColorFrameSource;
   type TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged_Interface;
   type TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged is access all TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged_Ptr is access all TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged;
   type TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged_Interface;
   type TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged is access all TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged_Ptr is access all TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged;
   type TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged_Interface;
   type TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged is access all TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged_Ptr is access all TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged;
   type TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged_Interface;
   type TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged is access all TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged_Ptr is access all TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged;
   type TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged_Interface;
   type TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged is access all TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged_Ptr is access all TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged;
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics_Interface;
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics is access all AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics_Interface'Class;
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics_Ptr is access all AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics;
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper_Interface;
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper is access all AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper_Interface'Class;
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper_Ptr is access all AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged is access all TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged is access all TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged is access all TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged is access all TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged_Interface;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged is access all TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged_Ptr is access all TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged;
   type TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived_Interface;
   type TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived is access all TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived_Interface'Class;
   type TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived_Ptr is access all TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived;
   type TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived_Interface;
   type TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived is access all TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived_Interface'Class;
   type TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived_Ptr is access all TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived;
   type TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived_Interface;
   type TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived is access all TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived_Interface'Class;
   type TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived_Ptr is access all TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPerceptionColorFrameSourceWatcher_Interface;
   type IPerceptionColorFrameSourceWatcher is access all IPerceptionColorFrameSourceWatcher_Interface'Class;
   type IPerceptionColorFrameSourceWatcher_Ptr is access all IPerceptionColorFrameSourceWatcher;
   type IPerceptionDepthFrameSourceWatcher_Interface;
   type IPerceptionDepthFrameSourceWatcher is access all IPerceptionDepthFrameSourceWatcher_Interface'Class;
   type IPerceptionDepthFrameSourceWatcher_Ptr is access all IPerceptionDepthFrameSourceWatcher;
   type IPerceptionInfraredFrameSourceWatcher_Interface;
   type IPerceptionInfraredFrameSourceWatcher is access all IPerceptionInfraredFrameSourceWatcher_Interface'Class;
   type IPerceptionInfraredFrameSourceWatcher_Ptr is access all IPerceptionInfraredFrameSourceWatcher;
   type IPerceptionColorFrameSourceAddedEventArgs_Interface;
   type IPerceptionColorFrameSourceAddedEventArgs is access all IPerceptionColorFrameSourceAddedEventArgs_Interface'Class;
   type IPerceptionColorFrameSourceAddedEventArgs_Ptr is access all IPerceptionColorFrameSourceAddedEventArgs;
   type IPerceptionColorFrameSourceRemovedEventArgs_Interface;
   type IPerceptionColorFrameSourceRemovedEventArgs is access all IPerceptionColorFrameSourceRemovedEventArgs_Interface'Class;
   type IPerceptionColorFrameSourceRemovedEventArgs_Ptr is access all IPerceptionColorFrameSourceRemovedEventArgs;
   type IPerceptionDepthFrameSourceAddedEventArgs_Interface;
   type IPerceptionDepthFrameSourceAddedEventArgs is access all IPerceptionDepthFrameSourceAddedEventArgs_Interface'Class;
   type IPerceptionDepthFrameSourceAddedEventArgs_Ptr is access all IPerceptionDepthFrameSourceAddedEventArgs;
   type IPerceptionDepthFrameSourceRemovedEventArgs_Interface;
   type IPerceptionDepthFrameSourceRemovedEventArgs is access all IPerceptionDepthFrameSourceRemovedEventArgs_Interface'Class;
   type IPerceptionDepthFrameSourceRemovedEventArgs_Ptr is access all IPerceptionDepthFrameSourceRemovedEventArgs;
   type IPerceptionInfraredFrameSourceAddedEventArgs_Interface;
   type IPerceptionInfraredFrameSourceAddedEventArgs is access all IPerceptionInfraredFrameSourceAddedEventArgs_Interface'Class;
   type IPerceptionInfraredFrameSourceAddedEventArgs_Ptr is access all IPerceptionInfraredFrameSourceAddedEventArgs;
   type IPerceptionInfraredFrameSourceRemovedEventArgs_Interface;
   type IPerceptionInfraredFrameSourceRemovedEventArgs is access all IPerceptionInfraredFrameSourceRemovedEventArgs_Interface'Class;
   type IPerceptionInfraredFrameSourceRemovedEventArgs_Ptr is access all IPerceptionInfraredFrameSourceRemovedEventArgs;
   type IKnownPerceptionFrameSourcePropertiesStatics_Interface;
   type IKnownPerceptionFrameSourcePropertiesStatics is access all IKnownPerceptionFrameSourcePropertiesStatics_Interface'Class;
   type IKnownPerceptionFrameSourcePropertiesStatics_Ptr is access all IKnownPerceptionFrameSourcePropertiesStatics;
   type IKnownPerceptionFrameSourcePropertiesStatics2_Interface;
   type IKnownPerceptionFrameSourcePropertiesStatics2 is access all IKnownPerceptionFrameSourcePropertiesStatics2_Interface'Class;
   type IKnownPerceptionFrameSourcePropertiesStatics2_Ptr is access all IKnownPerceptionFrameSourcePropertiesStatics2;
   type IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface;
   type IKnownPerceptionVideoFrameSourcePropertiesStatics is access all IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface'Class;
   type IKnownPerceptionVideoFrameSourcePropertiesStatics_Ptr is access all IKnownPerceptionVideoFrameSourcePropertiesStatics;
   type IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface;
   type IKnownPerceptionInfraredFrameSourcePropertiesStatics is access all IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface'Class;
   type IKnownPerceptionInfraredFrameSourcePropertiesStatics_Ptr is access all IKnownPerceptionInfraredFrameSourcePropertiesStatics;
   type IKnownPerceptionDepthFrameSourcePropertiesStatics_Interface;
   type IKnownPerceptionDepthFrameSourcePropertiesStatics is access all IKnownPerceptionDepthFrameSourcePropertiesStatics_Interface'Class;
   type IKnownPerceptionDepthFrameSourcePropertiesStatics_Ptr is access all IKnownPerceptionDepthFrameSourcePropertiesStatics;
   type IKnownPerceptionColorFrameSourcePropertiesStatics_Interface;
   type IKnownPerceptionColorFrameSourcePropertiesStatics is access all IKnownPerceptionColorFrameSourcePropertiesStatics_Interface'Class;
   type IKnownPerceptionColorFrameSourcePropertiesStatics_Ptr is access all IKnownPerceptionColorFrameSourcePropertiesStatics;
   type IKnownPerceptionVideoProfilePropertiesStatics_Interface;
   type IKnownPerceptionVideoProfilePropertiesStatics is access all IKnownPerceptionVideoProfilePropertiesStatics_Interface'Class;
   type IKnownPerceptionVideoProfilePropertiesStatics_Ptr is access all IKnownPerceptionVideoProfilePropertiesStatics;
   type IKnownCameraIntrinsicsPropertiesStatics_Interface;
   type IKnownCameraIntrinsicsPropertiesStatics is access all IKnownCameraIntrinsicsPropertiesStatics_Interface'Class;
   type IKnownCameraIntrinsicsPropertiesStatics_Ptr is access all IKnownCameraIntrinsicsPropertiesStatics;
   type IPerceptionFrameSourcePropertyChangeResult_Interface;
   type IPerceptionFrameSourcePropertyChangeResult is access all IPerceptionFrameSourcePropertyChangeResult_Interface'Class;
   type IPerceptionFrameSourcePropertyChangeResult_Ptr is access all IPerceptionFrameSourcePropertyChangeResult;
   type IPerceptionControlSession_Interface;
   type IPerceptionControlSession is access all IPerceptionControlSession_Interface'Class;
   type IPerceptionControlSession_Ptr is access all IPerceptionControlSession;
   type IPerceptionFrameSourcePropertiesChangedEventArgs_Interface;
   type IPerceptionFrameSourcePropertiesChangedEventArgs is access all IPerceptionFrameSourcePropertiesChangedEventArgs_Interface'Class;
   type IPerceptionFrameSourcePropertiesChangedEventArgs_Ptr is access all IPerceptionFrameSourcePropertiesChangedEventArgs;
   type IPerceptionInfraredFrameSourceStatics_Interface;
   type IPerceptionInfraredFrameSourceStatics is access all IPerceptionInfraredFrameSourceStatics_Interface'Class;
   type IPerceptionInfraredFrameSourceStatics_Ptr is access all IPerceptionInfraredFrameSourceStatics;
   type IPerceptionDepthFrameSourceStatics_Interface;
   type IPerceptionDepthFrameSourceStatics is access all IPerceptionDepthFrameSourceStatics_Interface'Class;
   type IPerceptionDepthFrameSourceStatics_Ptr is access all IPerceptionDepthFrameSourceStatics;
   type IPerceptionColorFrameSourceStatics_Interface;
   type IPerceptionColorFrameSourceStatics is access all IPerceptionColorFrameSourceStatics_Interface'Class;
   type IPerceptionColorFrameSourceStatics_Ptr is access all IPerceptionColorFrameSourceStatics;
   type IPerceptionColorFrameSource_Interface;
   type IPerceptionColorFrameSource is access all IPerceptionColorFrameSource_Interface'Class;
   type IPerceptionColorFrameSource_Ptr is access all IPerceptionColorFrameSource;
   type IPerceptionColorFrameSource2_Interface;
   type IPerceptionColorFrameSource2 is access all IPerceptionColorFrameSource2_Interface'Class;
   type IPerceptionColorFrameSource2_Ptr is access all IPerceptionColorFrameSource2;
   type IPerceptionDepthFrameSource_Interface;
   type IPerceptionDepthFrameSource is access all IPerceptionDepthFrameSource_Interface'Class;
   type IPerceptionDepthFrameSource_Ptr is access all IPerceptionDepthFrameSource;
   type IPerceptionDepthFrameSource2_Interface;
   type IPerceptionDepthFrameSource2 is access all IPerceptionDepthFrameSource2_Interface'Class;
   type IPerceptionDepthFrameSource2_Ptr is access all IPerceptionDepthFrameSource2;
   type IPerceptionInfraredFrameSource_Interface;
   type IPerceptionInfraredFrameSource is access all IPerceptionInfraredFrameSource_Interface'Class;
   type IPerceptionInfraredFrameSource_Ptr is access all IPerceptionInfraredFrameSource;
   type IPerceptionInfraredFrameSource2_Interface;
   type IPerceptionInfraredFrameSource2 is access all IPerceptionInfraredFrameSource2_Interface'Class;
   type IPerceptionInfraredFrameSource2_Ptr is access all IPerceptionInfraredFrameSource2;
   type IPerceptionVideoProfile_Interface;
   type IPerceptionVideoProfile is access all IPerceptionVideoProfile_Interface'Class;
   type IPerceptionVideoProfile_Ptr is access all IPerceptionVideoProfile;
   type IPerceptionColorFrameReader_Interface;
   type IPerceptionColorFrameReader is access all IPerceptionColorFrameReader_Interface'Class;
   type IPerceptionColorFrameReader_Ptr is access all IPerceptionColorFrameReader;
   type IPerceptionDepthFrameReader_Interface;
   type IPerceptionDepthFrameReader is access all IPerceptionDepthFrameReader_Interface'Class;
   type IPerceptionDepthFrameReader_Ptr is access all IPerceptionDepthFrameReader;
   type IPerceptionInfraredFrameReader_Interface;
   type IPerceptionInfraredFrameReader is access all IPerceptionInfraredFrameReader_Interface'Class;
   type IPerceptionInfraredFrameReader_Ptr is access all IPerceptionInfraredFrameReader;
   type IPerceptionColorFrame_Interface;
   type IPerceptionColorFrame is access all IPerceptionColorFrame_Interface'Class;
   type IPerceptionColorFrame_Ptr is access all IPerceptionColorFrame;
   type IPerceptionDepthFrame_Interface;
   type IPerceptionDepthFrame is access all IPerceptionDepthFrame_Interface'Class;
   type IPerceptionDepthFrame_Ptr is access all IPerceptionDepthFrame;
   type IPerceptionInfraredFrame_Interface;
   type IPerceptionInfraredFrame is access all IPerceptionInfraredFrame_Interface'Class;
   type IPerceptionInfraredFrame_Ptr is access all IPerceptionInfraredFrame;
   type IPerceptionColorFrameArrivedEventArgs_Interface;
   type IPerceptionColorFrameArrivedEventArgs is access all IPerceptionColorFrameArrivedEventArgs_Interface'Class;
   type IPerceptionColorFrameArrivedEventArgs_Ptr is access all IPerceptionColorFrameArrivedEventArgs;
   type IPerceptionDepthFrameArrivedEventArgs_Interface;
   type IPerceptionDepthFrameArrivedEventArgs is access all IPerceptionDepthFrameArrivedEventArgs_Interface'Class;
   type IPerceptionDepthFrameArrivedEventArgs_Ptr is access all IPerceptionDepthFrameArrivedEventArgs;
   type IPerceptionInfraredFrameArrivedEventArgs_Interface;
   type IPerceptionInfraredFrameArrivedEventArgs is access all IPerceptionInfraredFrameArrivedEventArgs_Interface'Class;
   type IPerceptionInfraredFrameArrivedEventArgs_Ptr is access all IPerceptionInfraredFrameArrivedEventArgs;
   type IPerceptionDepthCorrelatedCameraIntrinsics_Interface;
   type IPerceptionDepthCorrelatedCameraIntrinsics is access all IPerceptionDepthCorrelatedCameraIntrinsics_Interface'Class;
   type IPerceptionDepthCorrelatedCameraIntrinsics_Ptr is access all IPerceptionDepthCorrelatedCameraIntrinsics;
   type IPerceptionDepthCorrelatedCoordinateMapper_Interface;
   type IPerceptionDepthCorrelatedCoordinateMapper is access all IPerceptionDepthCorrelatedCoordinateMapper_Interface'Class;
   type IPerceptionDepthCorrelatedCoordinateMapper_Ptr is access all IPerceptionDepthCorrelatedCoordinateMapper;
   type IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult_Interface;
   type IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult is access all IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult_Interface'Class;
   type IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult_Ptr is access all IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult;
   type IAsyncOperation_IPerceptionInfraredFrameSource_Interface;
   type IAsyncOperation_IPerceptionInfraredFrameSource is access all IAsyncOperation_IPerceptionInfraredFrameSource_Interface'Class;
   type IAsyncOperation_IPerceptionInfraredFrameSource_Ptr is access all IAsyncOperation_IPerceptionInfraredFrameSource;
   type IAsyncOperation_PerceptionFrameSourceAccessStatus_Interface;
   type IAsyncOperation_PerceptionFrameSourceAccessStatus is access all IAsyncOperation_PerceptionFrameSourceAccessStatus_Interface'Class;
   type IAsyncOperation_PerceptionFrameSourceAccessStatus_Ptr is access all IAsyncOperation_PerceptionFrameSourceAccessStatus;
   type IAsyncOperation_IPerceptionDepthFrameSource_Interface;
   type IAsyncOperation_IPerceptionDepthFrameSource is access all IAsyncOperation_IPerceptionDepthFrameSource_Interface'Class;
   type IAsyncOperation_IPerceptionDepthFrameSource_Ptr is access all IAsyncOperation_IPerceptionDepthFrameSource;
   type IAsyncOperation_IPerceptionColorFrameSource_Interface;
   type IAsyncOperation_IPerceptionColorFrameSource is access all IAsyncOperation_IPerceptionColorFrameSource_Interface'Class;
   type IAsyncOperation_IPerceptionColorFrameSource_Ptr is access all IAsyncOperation_IPerceptionColorFrameSource;
   type IIterator_IPerceptionVideoProfile_Interface;
   type IIterator_IPerceptionVideoProfile is access all IIterator_IPerceptionVideoProfile_Interface'Class;
   type IIterator_IPerceptionVideoProfile_Ptr is access all IIterator_IPerceptionVideoProfile;
   type IIterable_IPerceptionVideoProfile_Interface;
   type IIterable_IPerceptionVideoProfile is access all IIterable_IPerceptionVideoProfile_Interface'Class;
   type IIterable_IPerceptionVideoProfile_Ptr is access all IIterable_IPerceptionVideoProfile;
   type IVectorView_IPerceptionVideoProfile_Interface;
   type IVectorView_IPerceptionVideoProfile is access all IVectorView_IPerceptionVideoProfile_Interface'Class;
   type IVectorView_IPerceptionVideoProfile_Ptr is access all IVectorView_IPerceptionVideoProfile;
   type IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics_Interface;
   type IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics is access all IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics_Interface'Class;
   type IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics_Ptr is access all IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics;
   type IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper_Interface;
   type IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper is access all IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper_Interface'Class;
   type IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper_Ptr is access all IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameSourceWatcher : aliased constant Windows.IID := (2528973714, 58983, 16580, (137, 249, 20, 98, 222, 166, 169, 204 ));
   
   type IPerceptionColorFrameSourceWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SourceAdded
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceAdded
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceRemoved
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceRemoved
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPerceptionColorFrameSourceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameSourceWatcher : aliased constant Windows.IID := (2014222033, 36098, 19755, (173, 164, 91, 166, 36, 160, 235, 16 ));
   
   type IPerceptionDepthFrameSourceWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SourceAdded
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceAdded
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceRemoved
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceRemoved
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPerceptionDepthFrameSourceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameSourceWatcher : aliased constant Windows.IID := (943521689, 55052, 17485, (168, 176, 114, 12, 46, 102, 254, 59 ));
   
   type IPerceptionInfraredFrameSourceWatcher_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SourceAdded
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceAdded
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SourceRemoved
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SourceRemoved
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Stopped
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Stopped
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_EnumerationCompleted
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_EnumerationCompleted
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Status
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
      ; RetVal : access Windows.Devices.Enumeration.DeviceWatcherStatus
   )
   return Windows.HRESULT is abstract;
   
   function Start
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IPerceptionInfraredFrameSourceWatcher_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameSourceAddedEventArgs : aliased constant Windows.IID := (3513513190, 55844, 17452, (187, 213, 85, 84, 155, 91, 148, 243 ));
   
   type IPerceptionColorFrameSourceAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameSource
   (
      This       : access IPerceptionColorFrameSourceAddedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameSourceRemovedEventArgs : aliased constant Windows.IID := (3531078249, 60236, 17135, (186, 79, 40, 143, 97, 92, 147, 193 ));
   
   type IPerceptionColorFrameSourceRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameSource
   (
      This       : access IPerceptionColorFrameSourceRemovedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameSourceAddedEventArgs : aliased constant Windows.IID := (2477031784, 35832, 17874, (162, 248, 74, 192, 147, 28, 199, 166 ));
   
   type IPerceptionDepthFrameSourceAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameSource
   (
      This       : access IPerceptionDepthFrameSourceAddedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameSourceRemovedEventArgs : aliased constant Windows.IID := (2696989773, 59756, 19841, (134, 221, 56, 185, 94, 73, 198, 223 ));
   
   type IPerceptionDepthFrameSourceRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameSource
   (
      This       : access IPerceptionDepthFrameSourceRemovedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameSourceAddedEventArgs : aliased constant Windows.IID := (1832075552, 38350, 18016, (144, 122, 217, 128, 53, 170, 43, 124 ));
   
   type IPerceptionInfraredFrameSourceAddedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameSource
   (
      This       : access IPerceptionInfraredFrameSourceAddedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameSourceRemovedEventArgs : aliased constant Windows.IID := (3927605361, 31344, 19041, (175, 148, 7, 48, 56, 83, 246, 149 ));
   
   type IPerceptionInfraredFrameSourceRemovedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FrameSource
   (
      This       : access IPerceptionInfraredFrameSourceRemovedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownPerceptionFrameSourcePropertiesStatics : aliased constant Windows.IID := (1576127650, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 71 ));
   
   type IKnownPerceptionFrameSourcePropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IKnownPerceptionFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalDeviceIds
   (
      This       : access IKnownPerceptionFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameKind
   (
      This       : access IKnownPerceptionFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceModelVersion
   (
      This       : access IKnownPerceptionFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EnclosureLocation
   (
      This       : access IKnownPerceptionFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownPerceptionFrameSourcePropertiesStatics2 : aliased constant Windows.IID := (2848483441, 1500, 19021, (138, 92, 164, 236, 242, 107, 188, 70 ));
   
   type IKnownPerceptionFrameSourcePropertiesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IKnownPerceptionFrameSourcePropertiesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownPerceptionVideoFrameSourcePropertiesStatics : aliased constant Windows.IID := (1576127650, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 72 ));
   
   type IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoProfile
   (
      This       : access IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedVideoProfiles
   (
      This       : access IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableVideoProfiles
   (
      This       : access IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsMirrored
   (
      This       : access IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraIntrinsics
   (
      This       : access IKnownPerceptionVideoFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownPerceptionInfraredFrameSourcePropertiesStatics : aliased constant Windows.IID := (1576127650, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 73 ));
   
   type IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exposure
   (
      This       : access IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoExposureEnabled
   (
      This       : access IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExposureCompensation
   (
      This       : access IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ActiveIlluminationEnabled
   (
      This       : access IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AmbientSubtractionEnabled
   (
      This       : access IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StructureLightPatternEnabled
   (
      This       : access IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InterleavedIlluminationEnabled
   (
      This       : access IKnownPerceptionInfraredFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownPerceptionDepthFrameSourcePropertiesStatics : aliased constant Windows.IID := (1576127650, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 74 ));
   
   type IKnownPerceptionDepthFrameSourcePropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MinDepth
   (
      This       : access IKnownPerceptionDepthFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxDepth
   (
      This       : access IKnownPerceptionDepthFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownPerceptionColorFrameSourcePropertiesStatics : aliased constant Windows.IID := (1576127650, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 75 ));
   
   type IKnownPerceptionColorFrameSourcePropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Exposure
   (
      This       : access IKnownPerceptionColorFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AutoExposureEnabled
   (
      This       : access IKnownPerceptionColorFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExposureCompensation
   (
      This       : access IKnownPerceptionColorFrameSourcePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownPerceptionVideoProfilePropertiesStatics : aliased constant Windows.IID := (2399724263, 23158, 17379, (161, 58, 218, 61, 145, 169, 239, 152 ));
   
   type IKnownPerceptionVideoProfilePropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BitmapPixelFormat
   (
      This       : access IKnownPerceptionVideoProfilePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapAlphaMode
   (
      This       : access IKnownPerceptionVideoProfilePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IKnownPerceptionVideoProfilePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IKnownPerceptionVideoProfilePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameDuration
   (
      This       : access IKnownPerceptionVideoProfilePropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKnownCameraIntrinsicsPropertiesStatics : aliased constant Windows.IID := (146815352, 17274, 19863, (166, 99, 253, 49, 149, 96, 2, 73 ));
   
   type IKnownCameraIntrinsicsPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FocalLength
   (
      This       : access IKnownCameraIntrinsicsPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PrincipalPoint
   (
      This       : access IKnownCameraIntrinsicsPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RadialDistortion
   (
      This       : access IKnownCameraIntrinsicsPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TangentialDistortion
   (
      This       : access IKnownCameraIntrinsicsPropertiesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionFrameSourcePropertyChangeResult : aliased constant Windows.IID := (506673418, 15504, 19746, (184, 152, 244, 43, 186, 100, 24, 255 ));
   
   type IPerceptionFrameSourcePropertyChangeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IPerceptionFrameSourcePropertyChangeResult_Interface
      ; RetVal : access Windows.Devices.Perception.PerceptionFrameSourcePropertyChangeStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_NewValue
   (
      This       : access IPerceptionFrameSourcePropertyChangeResult_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionControlSession : aliased constant Windows.IID := (2576975443, 23101, 16767, (146, 57, 241, 136, 158, 84, 139, 72 ));
   
   type IPerceptionControlSession_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ControlLost
   (
      This       : access IPerceptionControlSession_Interface
      ; handler : TypedEventHandler_IPerceptionControlSession_add_ControlLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ControlLost
   (
      This       : access IPerceptionControlSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function TrySetPropertyAsync
   (
      This       : access IPerceptionControlSession_Interface
      ; name : Windows.String
      ; value : Windows.Object
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionFrameSourcePropertiesChangedEventArgs : aliased constant Windows.IID := (1818812520, 48369, 20172, (184, 145, 118, 37, 209, 36, 75, 107 ));
   
   type IPerceptionFrameSourcePropertiesChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CollectionChange
   (
      This       : access IPerceptionFrameSourcePropertiesChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Collections.CollectionChange
   )
   return Windows.HRESULT is abstract;
   
   function get_Key
   (
      This       : access IPerceptionFrameSourcePropertiesChangedEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameSourceStatics : aliased constant Windows.IID := (1576258722, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 71 ));
   
   type IPerceptionInfraredFrameSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWatcher
   (
      This       : access IPerceptionInfraredFrameSourceStatics_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access IPerceptionInfraredFrameSourceStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IPerceptionInfraredFrameSourceStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionInfraredFrameSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IPerceptionInfraredFrameSourceStatics_Interface
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameSourceStatics : aliased constant Windows.IID := (1576258722, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 72 ));
   
   type IPerceptionDepthFrameSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWatcher
   (
      This       : access IPerceptionDepthFrameSourceStatics_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access IPerceptionDepthFrameSourceStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IPerceptionDepthFrameSourceStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthFrameSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IPerceptionDepthFrameSourceStatics_Interface
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameSourceStatics : aliased constant Windows.IID := (1576258722, 504, 19079, (184, 89, 213, 229, 183, 225, 222, 73 ));
   
   type IPerceptionColorFrameSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWatcher
   (
      This       : access IPerceptionColorFrameSourceStatics_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access IPerceptionColorFrameSourceStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IPerceptionColorFrameSourceStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionColorFrameSource -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessAsync
   (
      This       : access IPerceptionColorFrameSourceStatics_Interface
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameSource : aliased constant Windows.IID := (3698178684, 2904, 18061, (156, 161, 109, 176, 76, 192, 71, 124 ));
   
   type IPerceptionColorFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AvailableChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AvailableChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ActiveChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActiveChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PropertiesChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PropertiesChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoProfileChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoProfileChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CameraIntrinsicsChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CameraIntrinsicsChanged
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceKind
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Available
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Active
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsControlled
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedVideoProfiles
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IVectorView_IPerceptionVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableVideoProfiles
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IVectorView_IPerceptionVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProfile
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraIntrinsics
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Media.Devices.Core.ICameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   function AcquireControlSession
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionControlSession
   )
   return Windows.HRESULT is abstract;
   
   function CanControlIndependentlyFrom
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; targetId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCorrelatedWith
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; targetId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetTransformTo
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; targetId : Windows.String
      ; result : access Windows.Foundation.Numerics.Matrix4x4
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetDepthCorrelatedCameraIntrinsicsAsync
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; correlatedDepthFrameSource : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryGetDepthCorrelatedCoordinateMapperAsync
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; targetSourceId : Windows.String
      ; correlatedDepthFrameSource : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetVideoProfileAsync
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; controlSession : Windows.Devices.Perception.IPerceptionControlSession
      ; profile : Windows.Devices.Perception.IPerceptionVideoProfile
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenReader
   (
      This       : access IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrameReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameSource2 : aliased constant Windows.IID := (4169140453, 22065, 17901, (173, 152, 140, 106, 160, 76, 251, 145 ));
   
   type IPerceptionColorFrameSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IPerceptionColorFrameSource2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameSource : aliased constant Windows.IID := (2043950038, 18427, 19953, (191, 201, 240, 29, 64, 189, 153, 66 ));
   
   type IPerceptionDepthFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AvailableChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AvailableChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ActiveChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActiveChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PropertiesChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PropertiesChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoProfileChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoProfileChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CameraIntrinsicsChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CameraIntrinsicsChanged
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceKind
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Available
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Active
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsControlled
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedVideoProfiles
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IVectorView_IPerceptionVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableVideoProfiles
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IVectorView_IPerceptionVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProfile
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraIntrinsics
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Media.Devices.Core.ICameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   function AcquireControlSession
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionControlSession
   )
   return Windows.HRESULT is abstract;
   
   function CanControlIndependentlyFrom
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; targetId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCorrelatedWith
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; targetId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetTransformTo
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; targetId : Windows.String
      ; result : access Windows.Foundation.Numerics.Matrix4x4
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetDepthCorrelatedCameraIntrinsicsAsync
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; target : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryGetDepthCorrelatedCoordinateMapperAsync
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; targetId : Windows.String
      ; depthFrameSourceToMapWith : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetVideoProfileAsync
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; controlSession : Windows.Devices.Perception.IPerceptionControlSession
      ; profile : Windows.Devices.Perception.IPerceptionVideoProfile
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenReader
   (
      This       : access IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrameReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameSource2 : aliased constant Windows.IID := (3822206254, 28204, 20077, (145, 217, 112, 76, 216, 223, 247, 157 ));
   
   type IPerceptionDepthFrameSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IPerceptionDepthFrameSource2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameSource : aliased constant Windows.IID := (1437632322, 6152, 18766, (158, 48, 157, 42, 123, 232, 247, 0 ));
   
   type IPerceptionInfraredFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AvailableChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AvailableChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ActiveChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ActiveChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PropertiesChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PropertiesChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_VideoProfileChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VideoProfileChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_CameraIntrinsicsChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_CameraIntrinsicsChanged
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Id
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceKind
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Available
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Active
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsControlled
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedVideoProfiles
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IVectorView_IPerceptionVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableVideoProfiles
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IVectorView_IPerceptionVideoProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProfile
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_CameraIntrinsics
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Media.Devices.Core.ICameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   function AcquireControlSession
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionControlSession
   )
   return Windows.HRESULT is abstract;
   
   function CanControlIndependentlyFrom
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; targetId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCorrelatedWith
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; targetId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetTransformTo
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; targetId : Windows.String
      ; result : access Windows.Foundation.Numerics.Matrix4x4
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetDepthCorrelatedCameraIntrinsicsAsync
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; target : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryGetDepthCorrelatedCoordinateMapperAsync
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; targetId : Windows.String
      ; depthFrameSourceToMapWith : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TrySetVideoProfileAsync
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; controlSession : Windows.Devices.Perception.IPerceptionControlSession
      ; profile : Windows.Devices.Perception.IPerceptionVideoProfile
      ; RetVal : access Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenReader
   (
      This       : access IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrameReader
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameSource2 : aliased constant Windows.IID := (3704936344, 19211, 17152, (141, 133, 65, 8, 23, 250, 160, 50 ));
   
   type IPerceptionInfraredFrameSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IPerceptionInfraredFrameSource2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionVideoProfile : aliased constant Windows.IID := (1970683555, 282, 18190, (130, 37, 111, 5, 173, 226, 86, 72 ));
   
   type IPerceptionVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BitmapPixelFormat
   (
      This       : access IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_BitmapAlphaMode
   (
      This       : access IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_FrameDuration
   (
      This       : access IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function IsEqual
   (
      This       : access IPerceptionVideoProfile_Interface
      ; other : Windows.Devices.Perception.IPerceptionVideoProfile
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameReader : aliased constant Windows.IID := (1985017198, 47605, 17947, (131, 173, 242, 34, 175, 42, 170, 220 ));
   
   type IPerceptionColorFrameReader_Interface is interface and Windows.IInspectable_Interface;
   
   function add_FrameArrived
   (
      This       : access IPerceptionColorFrameReader_Interface
      ; handler : TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameArrived
   (
      This       : access IPerceptionColorFrameReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IPerceptionColorFrameReader_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPaused
   (
      This       : access IPerceptionColorFrameReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPaused
   (
      This       : access IPerceptionColorFrameReader_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryReadLatestFrame
   (
      This       : access IPerceptionColorFrameReader_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameReader : aliased constant Windows.IID := (2980298911, 10651, 17938, (164, 247, 39, 15, 37, 160, 150, 236 ));
   
   type IPerceptionDepthFrameReader_Interface is interface and Windows.IInspectable_Interface;
   
   function add_FrameArrived
   (
      This       : access IPerceptionDepthFrameReader_Interface
      ; handler : TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameArrived
   (
      This       : access IPerceptionDepthFrameReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IPerceptionDepthFrameReader_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPaused
   (
      This       : access IPerceptionDepthFrameReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPaused
   (
      This       : access IPerceptionDepthFrameReader_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryReadLatestFrame
   (
      This       : access IPerceptionDepthFrameReader_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameReader : aliased constant Windows.IID := (2036387352, 54171, 20424, (160, 74, 146, 151, 52, 198, 117, 108 ));
   
   type IPerceptionInfraredFrameReader_Interface is interface and Windows.IInspectable_Interface;
   
   function add_FrameArrived
   (
      This       : access IPerceptionInfraredFrameReader_Interface
      ; handler : TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FrameArrived
   (
      This       : access IPerceptionInfraredFrameReader_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IPerceptionInfraredFrameReader_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPaused
   (
      This       : access IPerceptionInfraredFrameReader_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPaused
   (
      This       : access IPerceptionInfraredFrameReader_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryReadLatestFrame
   (
      This       : access IPerceptionInfraredFrameReader_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrame : aliased constant Windows.IID := (4267840841, 11455, 20372, (152, 97, 248, 23, 234, 49, 119, 71 ));
   
   type IPerceptionColorFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoFrame
   (
      This       : access IPerceptionColorFrame_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrame : aliased constant Windows.IID := (2742780412, 39174, 20477, (145, 97, 0, 36, 179, 96, 182, 87 ));
   
   type IPerceptionDepthFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoFrame
   (
      This       : access IPerceptionDepthFrame_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrame : aliased constant Windows.IID := (2961728118, 33950, 19578, (138, 230, 181, 96, 100, 83, 33, 83 ));
   
   type IPerceptionInfraredFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoFrame
   (
      This       : access IPerceptionInfraredFrame_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionColorFrameArrivedEventArgs : aliased constant Windows.IID := (2410480341, 34551, 19853, (185, 102, 90, 55, 97, 186, 159, 89 ));
   
   type IPerceptionColorFrameArrivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RelativeTime
   (
      This       : access IPerceptionColorFrameArrivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function TryOpenFrame
   (
      This       : access IPerceptionColorFrameArrivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthFrameArrivedEventArgs : aliased constant Windows.IID := (1144858034, 45698, 17975, (145, 115, 172, 151, 132, 53, 201, 133 ));
   
   type IPerceptionDepthFrameArrivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RelativeTime
   (
      This       : access IPerceptionDepthFrameArrivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function TryOpenFrame
   (
      This       : access IPerceptionDepthFrameArrivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionInfraredFrameArrivedEventArgs : aliased constant Windows.IID := (2675440327, 46269, 18519, (157, 80, 190, 142, 240, 117, 218, 239 ));
   
   type IPerceptionInfraredFrameArrivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RelativeTime
   (
      This       : access IPerceptionInfraredFrameArrivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function TryOpenFrame
   (
      This       : access IPerceptionInfraredFrameArrivedEventArgs_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthCorrelatedCameraIntrinsics : aliased constant Windows.IID := (1699269121, 34526, 23521, (101, 130, 128, 127, 207, 76, 149, 207 ));
   
   type IPerceptionDepthCorrelatedCameraIntrinsics_Interface is interface and Windows.IInspectable_Interface;
   
   function UnprojectPixelAtCorrelatedDepth
   (
      This       : access IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; pixelCoordinate : Windows.Foundation.Point
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function UnprojectPixelsAtCorrelatedDepth
   (
      This       : access IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; sourceCoordinates : Windows.Foundation.Point_Ptr
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; results : Windows.Foundation.Numerics.Vector3_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function UnprojectRegionPixelsAtCorrelatedDepthAsync
   (
      This       : access IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; region : Windows.Foundation.Rect
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; results : Windows.Foundation.Numerics.Vector3_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function UnprojectAllPixelsAtCorrelatedDepthAsync
   (
      This       : access IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; results : Windows.Foundation.Numerics.Vector3_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPerceptionDepthCorrelatedCoordinateMapper : aliased constant Windows.IID := (1531813149, 46582, 18076, (184, 194, 185, 122, 69, 230, 134, 59 ));
   
   type IPerceptionDepthCorrelatedCoordinateMapper_Interface is interface and Windows.IInspectable_Interface;
   
   function MapPixelToTarget
   (
      This       : access IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; sourcePixelCoordinate : Windows.Foundation.Point
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function MapPixelsToTarget
   (
      This       : access IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; sourceCoordinates : Windows.Foundation.Point_Ptr
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; results : Windows.Foundation.Point_Ptr
   )
   return Windows.HRESULT is abstract;
   
   function MapRegionOfPixelsToTargetAsync
   (
      This       : access IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; region : Windows.Foundation.Rect
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; targetCoordinates : Windows.Foundation.Point_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function MapAllPixelsToTargetAsync
   (
      This       : access IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; depthFrame : Windows.Devices.Perception.IPerceptionDepthFrame
      ; targetCoordinates : Windows.Foundation.Point_Ptr
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult : aliased constant Windows.IID := (1249626985, 11017, 21969, (175, 104, 181, 170, 92, 44, 100, 113 ));
   
   type IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult_Interface
      ; handler : Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult_Interface
      ; RetVal : access Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPerceptionInfraredFrameSource : aliased constant Windows.IID := (1427254850, 52325, 23757, (143, 108, 132, 206, 208, 157, 178, 78 ));
   
   type IAsyncOperation_IPerceptionInfraredFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPerceptionInfraredFrameSource_Interface
      ; handler : Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPerceptionInfraredFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionInfraredFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_PerceptionFrameSourceAccessStatus : aliased constant Windows.IID := (741286568, 62339, 22530, (186, 44, 12, 187, 205, 152, 156, 154 ));
   
   type IAsyncOperation_PerceptionFrameSourceAccessStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_PerceptionFrameSourceAccessStatus_Interface
      ; handler : Windows.Devices.Perception.AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_PerceptionFrameSourceAccessStatus_Interface
      ; RetVal : access Windows.Devices.Perception.AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_PerceptionFrameSourceAccessStatus_Interface
      ; RetVal : access Windows.Devices.Perception.PerceptionFrameSourceAccessStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPerceptionDepthFrameSource : aliased constant Windows.IID := (1132638264, 54449, 21515, (133, 154, 112, 22, 98, 107, 185, 157 ));
   
   type IAsyncOperation_IPerceptionDepthFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPerceptionDepthFrameSource_Interface
      ; handler : Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionDepthFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionDepthFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPerceptionDepthFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPerceptionColorFrameSource : aliased constant Windows.IID := (2521300680, 11350, 21320, (134, 200, 169, 195, 169, 127, 185, 68 ));
   
   type IAsyncOperation_IPerceptionColorFrameSource_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPerceptionColorFrameSource_Interface
      ; handler : Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionColorFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionColorFrameSource
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPerceptionColorFrameSource_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionColorFrameSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPerceptionVideoProfile : aliased constant Windows.IID := (953057378, 28793, 23931, (132, 31, 154, 164, 88, 15, 213, 241 ));
   
   type IIterator_IPerceptionVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPerceptionVideoProfile_Interface
      ; items : Windows.Devices.Perception.IPerceptionVideoProfile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPerceptionVideoProfile : aliased constant Windows.IID := (4138640209, 60315, 22093, (177, 10, 6, 103, 48, 148, 172, 200 ));
   
   type IIterable_IPerceptionVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.Devices.Perception.IIterator_IPerceptionVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPerceptionVideoProfile : aliased constant Windows.IID := (2378903784, 20161, 20919, (153, 151, 16, 243, 37, 240, 61, 71 ));
   
   type IVectorView_IPerceptionVideoProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPerceptionVideoProfile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Perception.IPerceptionVideoProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPerceptionVideoProfile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPerceptionVideoProfile_Interface
      ; value : Windows.Devices.Perception.IPerceptionVideoProfile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPerceptionVideoProfile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Perception.IPerceptionVideoProfile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics : aliased constant Windows.IID := (1881870153, 42818, 23610, (171, 214, 119, 249, 153, 155, 138, 9 ));
   
   type IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; handler : Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; RetVal : access Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper : aliased constant Windows.IID := (4031487385, 49365, 23368, (154, 229, 152, 2, 9, 60, 180, 94 ));
   
   type IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; handler : Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; RetVal : access Windows.Devices.Perception.AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; RetVal : access Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded : aliased constant Windows.IID := (1912793111, 8888, 24187, (134, 181, 196, 169, 12, 204, 35, 170 ));
   
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved : aliased constant Windows.IID := (3339918813, 65314, 24503, (173, 160, 150, 30, 59, 40, 145, 123 ));
   
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped : aliased constant Windows.IID := (3019226980, 32704, 23948, (151, 140, 163, 141, 91, 24, 165, 29 ));
   
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (3019226980, 32704, 23948, (151, 140, 163, 141, 91, 24, 165, 29 ));
   
   type TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded : aliased constant Windows.IID := (2747392607, 13684, 23079, (167, 145, 22, 225, 188, 196, 36, 244 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved : aliased constant Windows.IID := (1559624439, 1925, 21897, (166, 33, 8, 157, 144, 4, 18, 200 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped : aliased constant Windows.IID := (3320818038, 55624, 20679, (133, 85, 102, 65, 144, 249, 169, 104 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (3320818038, 55624, 20679, (133, 85, 102, 65, 144, 249, 169, 104 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded : aliased constant Windows.IID := (2820148433, 49755, 23679, (148, 221, 25, 132, 35, 187, 86, 213 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceAdded_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved : aliased constant Windows.IID := (748923319, 13128, 22867, (141, 13, 239, 141, 120, 100, 11, 35 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_SourceRemoved_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped : aliased constant Windows.IID := (357934632, 15871, 24528, (177, 10, 202, 106, 219, 36, 64, 198 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_Stopped_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted : aliased constant Windows.IID := (357934632, 15871, 24528, (177, 10, 202, 106, 219, 36, 64, 198 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSourceWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionControlSession_add_ControlLost : aliased constant Windows.IID := (2881622354, 9365, 24204, (174, 211, 125, 197, 83, 9, 172, 8 ));
   
   type TypedEventHandler_IPerceptionControlSession_add_ControlLost_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionControlSession ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionControlSession_add_ControlLost'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionControlSession_add_ControlLost_Interface
      ; sender : Windows.Devices.Perception.IPerceptionControlSession
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult : aliased constant Windows.IID := (973474204, 56230, 22693, (132, 100, 226, 50, 104, 150, 132, 26 ));
   
   type AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionFrameSourcePropertyChangeResult_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionFrameSourcePropertyChangeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource : aliased constant Windows.IID := (2832518542, 45584, 21751, (174, 43, 119, 112, 225, 155, 62, 54 ));
   
   type AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionInfraredFrameSource ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionInfraredFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionInfraredFrameSource
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus : aliased constant Windows.IID := (1651789476, 13383, 22306, (171, 94, 2, 86, 123, 79, 206, 235 ));
   
   type AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_PerceptionFrameSourceAccessStatus_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_PerceptionFrameSourceAccessStatus
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPerceptionDepthFrameSource : aliased constant Windows.IID := (3029121158, 13430, 22745, (183, 109, 253, 166, 179, 232, 31, 84 ));
   
   type AsyncOperationCompletedHandler_IPerceptionDepthFrameSource_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthFrameSource ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPerceptionDepthFrameSource'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthFrameSource
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPerceptionColorFrameSource : aliased constant Windows.IID := (995536066, 57973, 21755, (190, 8, 159, 220, 143, 26, 30, 16 ));
   
   type AsyncOperationCompletedHandler_IPerceptionColorFrameSource_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionColorFrameSource ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPerceptionColorFrameSource'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionColorFrameSource_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionColorFrameSource
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged : aliased constant Windows.IID := (36979929, 31559, 21655, (149, 105, 67, 153, 250, 249, 103, 23 ));
   
   type TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged : aliased constant Windows.IID := (36979929, 31559, 21655, (149, 105, 67, 153, 250, 249, 103, 23 ));
   
   type TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged : aliased constant Windows.IID := (2999166088, 32473, 20752, (128, 74, 151, 146, 239, 127, 38, 190 ));
   
   type TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSource ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged : aliased constant Windows.IID := (36979929, 31559, 21655, (149, 105, 67, 153, 250, 249, 103, 23 ));
   
   type TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged : aliased constant Windows.IID := (36979929, 31559, 21655, (149, 105, 67, 153, 250, 249, 103, 23 ));
   
   type TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics : aliased constant Windows.IID := (4086718506, 15757, 24533, (153, 227, 29, 54, 48, 190, 89, 56 ));
   
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCameraIntrinsics_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCameraIntrinsics
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper : aliased constant Windows.IID := (1222569376, 26701, 20966, (176, 124, 210, 52, 209, 0, 107, 252 ));
   
   type AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPerceptionDepthCorrelatedCoordinateMapper_Interface
      ; asyncInfo : Windows.Devices.Perception.IAsyncOperation_IPerceptionDepthCorrelatedCoordinateMapper
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged : aliased constant Windows.IID := (324773738, 43844, 24425, (178, 8, 231, 50, 204, 233, 64, 59 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged : aliased constant Windows.IID := (324773738, 43844, 24425, (178, 8, 231, 50, 204, 233, 64, 59 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged : aliased constant Windows.IID := (412081906, 55337, 21643, (168, 157, 56, 163, 76, 92, 182, 65 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSource ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged : aliased constant Windows.IID := (324773738, 43844, 24425, (178, 8, 231, 50, 204, 233, 64, 59 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged : aliased constant Windows.IID := (324773738, 43844, 24425, (178, 8, 231, 50, 204, 233, 64, 59 ));
   
   type TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged : aliased constant Windows.IID := (837659581, 53539, 24200, (137, 216, 200, 14, 232, 240, 242, 202 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_AvailableChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged : aliased constant Windows.IID := (837659581, 53539, 24200, (137, 216, 200, 14, 232, 240, 242, 202 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_ActiveChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged : aliased constant Windows.IID := (3066148904, 41303, 21741, (156, 24, 105, 25, 185, 249, 27, 233 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_PropertiesChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged : aliased constant Windows.IID := (837659581, 53539, 24200, (137, 216, 200, 14, 232, 240, 242, 202 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_VideoProfileChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged : aliased constant Windows.IID := (837659581, 53539, 24200, (137, 216, 200, 14, 232, 240, 242, 202 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameSource_add_CameraIntrinsicsChanged_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameSource
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived : aliased constant Windows.IID := (2762280613, 30605, 20566, (161, 207, 84, 106, 27, 226, 192, 16 ));
   
   type TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionColorFrameReader ; args : Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionColorFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionColorFrameReader
      ; args : Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived : aliased constant Windows.IID := (1297259390, 61088, 20763, (130, 133, 71, 232, 200, 93, 2, 149 ));
   
   type TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionDepthFrameReader ; args : Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionDepthFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionDepthFrameReader
      ; args : Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived : aliased constant Windows.IID := (1753214823, 34929, 22270, (142, 126, 29, 41, 41, 204, 111, 66 ));
   
   type TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived_Interface(Callback : access procedure (sender : Windows.Devices.Perception.IPerceptionInfraredFrameReader ; args : Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IPerceptionInfraredFrameReader_add_FrameArrived_Interface
      ; sender : Windows.Devices.Perception.IPerceptionInfraredFrameReader
      ; args : Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PerceptionColorFrameSourceWatcher is Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher;
   subtype PerceptionColorFrameSourceAddedEventArgs is Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs;
   subtype PerceptionColorFrameSourceRemovedEventArgs is Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs;
   subtype PerceptionDepthFrameSourceWatcher is Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher;
   subtype PerceptionDepthFrameSourceAddedEventArgs is Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs;
   subtype PerceptionDepthFrameSourceRemovedEventArgs is Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs;
   subtype PerceptionInfraredFrameSourceWatcher is Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher;
   subtype PerceptionInfraredFrameSourceAddedEventArgs is Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs;
   subtype PerceptionInfraredFrameSourceRemovedEventArgs is Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs;
   subtype PerceptionColorFrameSource is Windows.Devices.Perception.IPerceptionColorFrameSource;
   subtype PerceptionDepthFrameSource is Windows.Devices.Perception.IPerceptionDepthFrameSource;
   subtype PerceptionInfraredFrameSource is Windows.Devices.Perception.IPerceptionInfraredFrameSource;
   subtype PerceptionControlSession is Windows.Devices.Perception.IPerceptionControlSession;
   subtype PerceptionFrameSourcePropertyChangeResult is Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult;
   subtype PerceptionFrameSourcePropertiesChangedEventArgs is Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs;
   subtype PerceptionVideoProfile is Windows.Devices.Perception.IPerceptionVideoProfile;
   subtype PerceptionDepthCorrelatedCameraIntrinsics is Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics;
   subtype PerceptionDepthCorrelatedCoordinateMapper is Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper;
   subtype PerceptionColorFrameReader is Windows.Devices.Perception.IPerceptionColorFrameReader;
   subtype PerceptionDepthFrameReader is Windows.Devices.Perception.IPerceptionDepthFrameReader;
   subtype PerceptionInfraredFrameReader is Windows.Devices.Perception.IPerceptionInfraredFrameReader;
   subtype PerceptionColorFrameArrivedEventArgs is Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs;
   subtype PerceptionColorFrame is Windows.Devices.Perception.IPerceptionColorFrame;
   subtype PerceptionDepthFrameArrivedEventArgs is Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs;
   subtype PerceptionDepthFrame is Windows.Devices.Perception.IPerceptionDepthFrame;
   subtype PerceptionInfraredFrameArrivedEventArgs is Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs;
   subtype PerceptionInfraredFrame is Windows.Devices.Perception.IPerceptionInfraredFrame;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
