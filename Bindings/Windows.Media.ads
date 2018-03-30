--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Graphics.Imaging;
limited with Windows.Graphics.DirectX.Direct3D11;
limited with Windows.Storage.Streams;
limited with Windows.Storage;
with Windows; use Windows;
limited with Windows.ApplicationModel.AppService;
--------------------------------------------------------------------------------
package Windows.Media is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AudioBufferAccessMode is (
      Read,
      ReadWrite,
      Write
   );
   for AudioBufferAccessMode use (
      Read => 0,
      ReadWrite => 1,
      Write => 2
   );
   for AudioBufferAccessMode'Size use 32;
   
   type AudioBufferAccessMode_Ptr is access AudioBufferAccessMode;
   
   type SoundLevel is (
      Muted,
      Low,
      Full
   );
   for SoundLevel use (
      Muted => 0,
      Low => 1,
      Full => 2
   );
   for SoundLevel'Size use 32;
   
   type SoundLevel_Ptr is access SoundLevel;
   
   type MediaPlaybackType is (
      Unknown,
      Music,
      Video,
      Image
   );
   for MediaPlaybackType use (
      Unknown => 0,
      Music => 1,
      Video => 2,
      Image => 3
   );
   for MediaPlaybackType'Size use 32;
   
   type MediaPlaybackType_Ptr is access MediaPlaybackType;
   
   type MediaPlaybackAutoRepeatMode is (
      None,
      Track,
      List
   );
   for MediaPlaybackAutoRepeatMode use (
      None => 0,
      Track => 1,
      List => 2
   );
   for MediaPlaybackAutoRepeatMode'Size use 32;
   
   type MediaPlaybackAutoRepeatMode_Ptr is access MediaPlaybackAutoRepeatMode;
   
   type MediaPlaybackStatus is (
      Closed,
      Changing,
      Stopped,
      Playing,
      Paused
   );
   for MediaPlaybackStatus use (
      Closed => 0,
      Changing => 1,
      Stopped => 2,
      Playing => 3,
      Paused => 4
   );
   for MediaPlaybackStatus'Size use 32;
   
   type MediaPlaybackStatus_Ptr is access MediaPlaybackStatus;
   
   type SystemMediaTransportControlsButton is (
      Play,
      Pause,
      Stop,
      Record_x,
      FastForward,
      Rewind,
      Next,
      Previous,
      ChannelUp,
      ChannelDown
   );
   for SystemMediaTransportControlsButton use (
      Play => 0,
      Pause => 1,
      Stop => 2,
      Record_x => 3,
      FastForward => 4,
      Rewind => 5,
      Next => 6,
      Previous => 7,
      ChannelUp => 8,
      ChannelDown => 9
   );
   for SystemMediaTransportControlsButton'Size use 32;
   
   type SystemMediaTransportControlsButton_Ptr is access SystemMediaTransportControlsButton;
   
   type SystemMediaTransportControlsProperty is (
      SoundLevel_x
   );
   for SystemMediaTransportControlsProperty use (
      SoundLevel_x => 0
   );
   for SystemMediaTransportControlsProperty'Size use 32;
   
   type SystemMediaTransportControlsProperty_Ptr is access SystemMediaTransportControlsProperty;
   
   type MediaTimelineControllerState is (
      Paused,
      Running,
      Stalled,
      Error
   );
   for MediaTimelineControllerState use (
      Paused => 0,
      Running => 1,
      Stalled => 2,
      Error => 3
   );
   for MediaTimelineControllerState'Size use 32;
   
   type MediaTimelineControllerState_Ptr is access MediaTimelineControllerState;
   
   type AudioProcessing is (
      Default,
      Raw
   );
   for AudioProcessing use (
      Default => 0,
      Raw => 1
   );
   for AudioProcessing'Size use 32;
   
   type AudioProcessing_Ptr is access AudioProcessing;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type MediaTimeRange is record
      Start : Windows.Foundation.TimeSpan;
      End_x : Windows.Foundation.TimeSpan;
   end record;
   pragma Convention (C_Pass_By_Copy , MediaTimeRange);
   
   type MediaTimeRange_Ptr is access MediaTimeRange;
   
   type MediaControlContract is null record;
   pragma Convention (C_Pass_By_Copy , MediaControlContract);
   
   type MediaControlContract_Ptr is access MediaControlContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IMediaExtension_Interface;
   type AsyncOperationCompletedHandler_IMediaExtension is access all AsyncOperationCompletedHandler_IMediaExtension_Interface'Class;
   type AsyncOperationCompletedHandler_IMediaExtension_Ptr is access all AsyncOperationCompletedHandler_IMediaExtension;
   type AsyncOperationCompletedHandler_IVideoFrame_Interface;
   type AsyncOperationCompletedHandler_IVideoFrame is access all AsyncOperationCompletedHandler_IVideoFrame_Interface'Class;
   type AsyncOperationCompletedHandler_IVideoFrame_Ptr is access all AsyncOperationCompletedHandler_IVideoFrame;
   type TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed_Interface;
   type TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed is access all TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed_Interface'Class;
   type TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed_Ptr is access all TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed;
   type TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged_Interface;
   type TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged is access all TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged_Interface'Class;
   type TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged_Ptr is access all TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged;
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested_Interface;
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested is access all TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested_Interface'Class;
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested_Ptr is access all TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested;
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested_Interface;
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested is access all TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested_Interface'Class;
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested_Ptr is access all TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested;
   type TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested_Interface;
   type TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested is access all TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested_Interface'Class;
   type TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested_Ptr is access all TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested;
   type TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested_Interface;
   type TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested is access all TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested_Interface'Class;
   type TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested_Ptr is access all TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested;
   type TypedEventHandler_IMediaTimelineController_add_PositionChanged_Interface;
   type TypedEventHandler_IMediaTimelineController_add_PositionChanged is access all TypedEventHandler_IMediaTimelineController_add_PositionChanged_Interface'Class;
   type TypedEventHandler_IMediaTimelineController_add_PositionChanged_Ptr is access all TypedEventHandler_IMediaTimelineController_add_PositionChanged;
   type TypedEventHandler_IMediaTimelineController_add_StateChanged_Interface;
   type TypedEventHandler_IMediaTimelineController_add_StateChanged is access all TypedEventHandler_IMediaTimelineController_add_StateChanged_Interface'Class;
   type TypedEventHandler_IMediaTimelineController_add_StateChanged_Ptr is access all TypedEventHandler_IMediaTimelineController_add_StateChanged;
   type TypedEventHandler_IMediaTimelineController2_add_Failed_Interface;
   type TypedEventHandler_IMediaTimelineController2_add_Failed is access all TypedEventHandler_IMediaTimelineController2_add_Failed_Interface'Class;
   type TypedEventHandler_IMediaTimelineController2_add_Failed_Ptr is access all TypedEventHandler_IMediaTimelineController2_add_Failed;
   type TypedEventHandler_IMediaTimelineController2_add_Ended_Interface;
   type TypedEventHandler_IMediaTimelineController2_add_Ended is access all TypedEventHandler_IMediaTimelineController2_add_Ended_Interface'Class;
   type TypedEventHandler_IMediaTimelineController2_add_Ended_Ptr is access all TypedEventHandler_IMediaTimelineController2_add_Ended;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMediaProcessingTriggerDetails_Interface;
   type IMediaProcessingTriggerDetails is access all IMediaProcessingTriggerDetails_Interface'Class;
   type IMediaProcessingTriggerDetails_Ptr is access all IMediaProcessingTriggerDetails;
   type IMediaFrame_Interface;
   type IMediaFrame is access all IMediaFrame_Interface'Class;
   type IMediaFrame_Ptr is access all IMediaFrame;
   type IVideoFrame_Interface;
   type IVideoFrame is access all IVideoFrame_Interface'Class;
   type IVideoFrame_Ptr is access all IVideoFrame;
   type IVideoFrameFactory_Interface;
   type IVideoFrameFactory is access all IVideoFrameFactory_Interface'Class;
   type IVideoFrameFactory_Ptr is access all IVideoFrameFactory;
   type IAudioFrame_Interface;
   type IAudioFrame is access all IAudioFrame_Interface'Class;
   type IAudioFrame_Ptr is access all IAudioFrame;
   type IAudioFrameFactory_Interface;
   type IAudioFrameFactory is access all IAudioFrameFactory_Interface'Class;
   type IAudioFrameFactory_Ptr is access all IAudioFrameFactory;
   type IAudioBuffer_Interface;
   type IAudioBuffer is access all IAudioBuffer_Interface'Class;
   type IAudioBuffer_Ptr is access all IAudioBuffer;
   type IMediaMarker_Interface;
   type IMediaMarker is access all IMediaMarker_Interface'Class;
   type IMediaMarker_Ptr is access all IMediaMarker;
   type IMediaMarkers_Interface;
   type IMediaMarkers is access all IMediaMarkers_Interface'Class;
   type IMediaMarkers_Ptr is access all IMediaMarkers;
   type IMediaMarkerTypesStatics_Interface;
   type IMediaMarkerTypesStatics is access all IMediaMarkerTypesStatics_Interface'Class;
   type IMediaMarkerTypesStatics_Ptr is access all IMediaMarkerTypesStatics;
   type ISystemMediaTransportControlsTimelineProperties_Interface;
   type ISystemMediaTransportControlsTimelineProperties is access all ISystemMediaTransportControlsTimelineProperties_Interface'Class;
   type ISystemMediaTransportControlsTimelineProperties_Ptr is access all ISystemMediaTransportControlsTimelineProperties;
   type IMusicDisplayProperties_Interface;
   type IMusicDisplayProperties is access all IMusicDisplayProperties_Interface'Class;
   type IMusicDisplayProperties_Ptr is access all IMusicDisplayProperties;
   type IMusicDisplayProperties2_Interface;
   type IMusicDisplayProperties2 is access all IMusicDisplayProperties2_Interface'Class;
   type IMusicDisplayProperties2_Ptr is access all IMusicDisplayProperties2;
   type IMusicDisplayProperties3_Interface;
   type IMusicDisplayProperties3 is access all IMusicDisplayProperties3_Interface'Class;
   type IMusicDisplayProperties3_Ptr is access all IMusicDisplayProperties3;
   type IVideoDisplayProperties_Interface;
   type IVideoDisplayProperties is access all IVideoDisplayProperties_Interface'Class;
   type IVideoDisplayProperties_Ptr is access all IVideoDisplayProperties;
   type IVideoDisplayProperties2_Interface;
   type IVideoDisplayProperties2 is access all IVideoDisplayProperties2_Interface'Class;
   type IVideoDisplayProperties2_Ptr is access all IVideoDisplayProperties2;
   type IImageDisplayProperties_Interface;
   type IImageDisplayProperties is access all IImageDisplayProperties_Interface'Class;
   type IImageDisplayProperties_Ptr is access all IImageDisplayProperties;
   type ISystemMediaTransportControlsDisplayUpdater_Interface;
   type ISystemMediaTransportControlsDisplayUpdater is access all ISystemMediaTransportControlsDisplayUpdater_Interface'Class;
   type ISystemMediaTransportControlsDisplayUpdater_Ptr is access all ISystemMediaTransportControlsDisplayUpdater;
   type ISystemMediaTransportControlsButtonPressedEventArgs_Interface;
   type ISystemMediaTransportControlsButtonPressedEventArgs is access all ISystemMediaTransportControlsButtonPressedEventArgs_Interface'Class;
   type ISystemMediaTransportControlsButtonPressedEventArgs_Ptr is access all ISystemMediaTransportControlsButtonPressedEventArgs;
   type ISystemMediaTransportControlsPropertyChangedEventArgs_Interface;
   type ISystemMediaTransportControlsPropertyChangedEventArgs is access all ISystemMediaTransportControlsPropertyChangedEventArgs_Interface'Class;
   type ISystemMediaTransportControlsPropertyChangedEventArgs_Ptr is access all ISystemMediaTransportControlsPropertyChangedEventArgs;
   type IPlaybackPositionChangeRequestedEventArgs_Interface;
   type IPlaybackPositionChangeRequestedEventArgs is access all IPlaybackPositionChangeRequestedEventArgs_Interface'Class;
   type IPlaybackPositionChangeRequestedEventArgs_Ptr is access all IPlaybackPositionChangeRequestedEventArgs;
   type IPlaybackRateChangeRequestedEventArgs_Interface;
   type IPlaybackRateChangeRequestedEventArgs is access all IPlaybackRateChangeRequestedEventArgs_Interface'Class;
   type IPlaybackRateChangeRequestedEventArgs_Ptr is access all IPlaybackRateChangeRequestedEventArgs;
   type IShuffleEnabledChangeRequestedEventArgs_Interface;
   type IShuffleEnabledChangeRequestedEventArgs is access all IShuffleEnabledChangeRequestedEventArgs_Interface'Class;
   type IShuffleEnabledChangeRequestedEventArgs_Ptr is access all IShuffleEnabledChangeRequestedEventArgs;
   type IAutoRepeatModeChangeRequestedEventArgs_Interface;
   type IAutoRepeatModeChangeRequestedEventArgs is access all IAutoRepeatModeChangeRequestedEventArgs_Interface'Class;
   type IAutoRepeatModeChangeRequestedEventArgs_Ptr is access all IAutoRepeatModeChangeRequestedEventArgs;
   type ISystemMediaTransportControls_Interface;
   type ISystemMediaTransportControls is access all ISystemMediaTransportControls_Interface'Class;
   type ISystemMediaTransportControls_Ptr is access all ISystemMediaTransportControls;
   type ISystemMediaTransportControls2_Interface;
   type ISystemMediaTransportControls2 is access all ISystemMediaTransportControls2_Interface'Class;
   type ISystemMediaTransportControls2_Ptr is access all ISystemMediaTransportControls2;
   type ISystemMediaTransportControlsStatics_Interface;
   type ISystemMediaTransportControlsStatics is access all ISystemMediaTransportControlsStatics_Interface'Class;
   type ISystemMediaTransportControlsStatics_Ptr is access all ISystemMediaTransportControlsStatics;
   type IMediaTimelineController_Interface;
   type IMediaTimelineController is access all IMediaTimelineController_Interface'Class;
   type IMediaTimelineController_Ptr is access all IMediaTimelineController;
   type IMediaTimelineController2_Interface;
   type IMediaTimelineController2 is access all IMediaTimelineController2_Interface'Class;
   type IMediaTimelineController2_Ptr is access all IMediaTimelineController2;
   type IMediaTimelineControllerFailedEventArgs_Interface;
   type IMediaTimelineControllerFailedEventArgs is access all IMediaTimelineControllerFailedEventArgs_Interface'Class;
   type IMediaTimelineControllerFailedEventArgs_Ptr is access all IMediaTimelineControllerFailedEventArgs;
   type IMediaExtension_Interface;
   type IMediaExtension is access all IMediaExtension_Interface'Class;
   type IMediaExtension_Ptr is access all IMediaExtension;
   type IMediaExtensionManager_Interface;
   type IMediaExtensionManager is access all IMediaExtensionManager_Interface'Class;
   type IMediaExtensionManager_Ptr is access all IMediaExtensionManager;
   type IMediaExtensionManager2_Interface;
   type IMediaExtensionManager2 is access all IMediaExtensionManager2_Interface'Class;
   type IMediaExtensionManager2_Ptr is access all IMediaExtensionManager2;
   type IVideoEffectsStatics_Interface;
   type IVideoEffectsStatics is access all IVideoEffectsStatics_Interface'Class;
   type IVideoEffectsStatics_Ptr is access all IVideoEffectsStatics;
   type IMediaControl_Interface;
   type IMediaControl is access all IMediaControl_Interface'Class;
   type IMediaControl_Ptr is access all IMediaControl;
   type IAsyncOperation_IMediaExtension_Interface;
   type IAsyncOperation_IMediaExtension is access all IAsyncOperation_IMediaExtension_Interface'Class;
   type IAsyncOperation_IMediaExtension_Ptr is access all IAsyncOperation_IMediaExtension;
   type IAsyncOperation_IVideoFrame_Interface;
   type IAsyncOperation_IVideoFrame is access all IAsyncOperation_IVideoFrame_Interface'Class;
   type IAsyncOperation_IVideoFrame_Ptr is access all IAsyncOperation_IVideoFrame;
   type IIterator_MediaTimeRange_Interface;
   type IIterator_MediaTimeRange is access all IIterator_MediaTimeRange_Interface'Class;
   type IIterator_MediaTimeRange_Ptr is access all IIterator_MediaTimeRange;
   type IIterable_MediaTimeRange_Interface;
   type IIterable_MediaTimeRange is access all IIterable_MediaTimeRange_Interface'Class;
   type IIterable_MediaTimeRange_Ptr is access all IIterable_MediaTimeRange;
   type IVectorView_MediaTimeRange_Interface;
   type IVectorView_MediaTimeRange is access all IVectorView_MediaTimeRange_Interface'Class;
   type IVectorView_MediaTimeRange_Ptr is access all IVectorView_MediaTimeRange;
   type IIterator_IMediaMarker_Interface;
   type IIterator_IMediaMarker is access all IIterator_IMediaMarker_Interface'Class;
   type IIterator_IMediaMarker_Ptr is access all IIterator_IMediaMarker;
   type IIterable_IMediaMarker_Interface;
   type IIterable_IMediaMarker is access all IIterable_IMediaMarker_Interface'Class;
   type IIterable_IMediaMarker_Ptr is access all IIterable_IMediaMarker;
   type IVectorView_IMediaMarker_Interface;
   type IVectorView_IMediaMarker is access all IVectorView_IMediaMarker_Interface'Class;
   type IVectorView_IMediaMarker_Ptr is access all IVectorView_IMediaMarker;
   
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
   type IMediaProcessingTriggerDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Arguments
   (
      This       : access IMediaProcessingTriggerDetails_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaProcessingTriggerDetails : aliased constant Windows.IID := (3951387820, 41809, 20302, (180, 240, 155, 242, 64, 137, 147, 219 ));
   
   ------------------------------------------------------------------------
   type IMediaFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IMediaFrame_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsReadOnly
   (
      This       : access IMediaFrame_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativeTime
   (
      This       : access IMediaFrame_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeTime
   (
      This       : access IMediaFrame_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemRelativeTime
   (
      This       : access IMediaFrame_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemRelativeTime
   (
      This       : access IMediaFrame_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IMediaFrame_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IMediaFrame_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IsDiscontinuous
   (
      This       : access IMediaFrame_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDiscontinuous
   (
      This       : access IMediaFrame_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedProperties
   (
      This       : access IMediaFrame_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaFrame : aliased constant Windows.IID := (3216322444, 22851, 18392, (142, 16, 5, 48, 138, 165, 251, 208 ));
   
   ------------------------------------------------------------------------
   type IVideoFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SoftwareBitmap
   (
      This       : access IVideoFrame_Interface
      ; RetVal : access Windows.Graphics.Imaging.ISoftwareBitmap
   )
   return Windows.HRESULT is abstract;
   
   function CopyToAsync
   (
      This       : access IVideoFrame_Interface
      ; frame : Windows.Media.IVideoFrame
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_Direct3DSurface
   (
      This       : access IVideoFrame_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoFrame : aliased constant Windows.IID := (213935653, 37116, 19602, (189, 149, 125, 237, 33, 129, 157, 28 ));
   
   ------------------------------------------------------------------------
   type IVideoFrameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IVideoFrameFactory_Interface
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithAlpha
   (
      This       : access IVideoFrameFactory_Interface
      ; format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoFrameFactory : aliased constant Windows.IID := (21720425, 8744, 19602, (146, 255, 80, 195, 128, 211, 231, 118 ));
   
   ------------------------------------------------------------------------
   type IAudioFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function LockBuffer
   (
      This       : access IAudioFrame_Interface
      ; mode : Windows.Media.AudioBufferAccessMode
      ; RetVal : access Windows.Media.IAudioBuffer
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioFrame : aliased constant Windows.IID := (3815424772, 43698, 17015, (158, 208, 67, 206, 223, 142, 41, 198 ));
   
   ------------------------------------------------------------------------
   type IAudioFrameFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAudioFrameFactory_Interface
      ; capacity : Windows.UInt32
      ; RetVal : access Windows.Media.IAudioFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioFrameFactory : aliased constant Windows.IID := (2443774686, 9250, 16550, (185, 173, 48, 208, 36, 4, 49, 125 ));
   
   ------------------------------------------------------------------------
   type IAudioBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capacity
   (
      This       : access IAudioBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access IAudioBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_Length
   (
      This       : access IAudioBuffer_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IAudioBuffer : aliased constant Windows.IID := (890722343, 29259, 19562, (177, 48, 246, 83, 127, 154, 224, 208 ));
   
   ------------------------------------------------------------------------
   type IMediaMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Time
   (
      This       : access IMediaMarker_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MediaMarkerType
   (
      This       : access IMediaMarker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access IMediaMarker_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaMarker : aliased constant Windows.IID := (402906872, 56485, 19311, (156, 32, 227, 211, 192, 100, 54, 37 ));
   
   ------------------------------------------------------------------------
   type IMediaMarkers_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Markers
   (
      This       : access IMediaMarkers_Interface
      ; RetVal : access Windows.Media.IVectorView_IMediaMarker -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaMarkers : aliased constant Windows.IID := (2951393673, 63709, 18030, (170, 16, 146, 11, 82, 53, 63, 223 ));
   
   ------------------------------------------------------------------------
   type IMediaMarkerTypesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Bookmark
   (
      This       : access IMediaMarkerTypesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaMarkerTypesStatics : aliased constant Windows.IID := (3139010624, 18479, 18243, (136, 50, 69, 133, 56, 33, 236, 224 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaTransportControlsTimelineProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_StartTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_EndTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_EndTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MinSeekTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_MinSeekTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxSeekTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxSeekTime
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access ISystemMediaTransportControlsTimelineProperties_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaTransportControlsTimelineProperties : aliased constant Windows.IID := (1361391978, 50082, 18267, (133, 7, 147, 83, 77, 200, 143, 21 ));
   
   ------------------------------------------------------------------------
   type IMusicDisplayProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IMusicDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IMusicDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AlbumArtist
   (
      This       : access IMusicDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AlbumArtist
   (
      This       : access IMusicDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Artist
   (
      This       : access IMusicDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Artist
   (
      This       : access IMusicDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IMusicDisplayProperties : aliased constant Windows.IID := (1807682649, 53408, 19750, (146, 160, 249, 120, 225, 209, 142, 123 ));
   
   ------------------------------------------------------------------------
   type IMusicDisplayProperties2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlbumTitle
   (
      This       : access IMusicDisplayProperties2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AlbumTitle
   (
      This       : access IMusicDisplayProperties2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TrackNumber
   (
      This       : access IMusicDisplayProperties2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_TrackNumber
   (
      This       : access IMusicDisplayProperties2_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Genres
   (
      This       : access IMusicDisplayProperties2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMusicDisplayProperties2 : aliased constant Windows.IID := (3572834, 38867, 17593, (176, 15, 0, 138, 252, 239, 175, 24 ));
   
   ------------------------------------------------------------------------
   type IMusicDisplayProperties3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlbumTrackCount
   (
      This       : access IMusicDisplayProperties3_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_AlbumTrackCount
   (
      This       : access IMusicDisplayProperties3_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IMusicDisplayProperties3 : aliased constant Windows.IID := (1303714497, 1665, 20108, (148, 1, 184, 21, 157, 158, 239, 199 ));
   
   ------------------------------------------------------------------------
   type IVideoDisplayProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IVideoDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IVideoDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtitle
   (
      This       : access IVideoDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subtitle
   (
      This       : access IVideoDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoDisplayProperties : aliased constant Windows.IID := (1443495345, 23853, 18546, (129, 112, 69, 222, 229, 188, 47, 92 ));
   
   ------------------------------------------------------------------------
   type IVideoDisplayProperties2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Genres
   (
      This       : access IVideoDisplayProperties2_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoDisplayProperties2 : aliased constant Windows.IID := (3021005262, 43858, 16811, (164, 134, 204, 16, 250, 177, 82, 249 ));
   
   ------------------------------------------------------------------------
   type IImageDisplayProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IImageDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IImageDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Subtitle
   (
      This       : access IImageDisplayProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Subtitle
   (
      This       : access IImageDisplayProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IImageDisplayProperties : aliased constant Windows.IID := (3440101359, 21735, 16671, (153, 51, 240, 233, 139, 10, 150, 210 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaTransportControlsDisplayUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; RetVal : access Windows.Media.MediaPlaybackType
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; value : Windows.Media.MediaPlaybackType
   )
   return Windows.HRESULT is abstract;
   
   function get_AppMediaId
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AppMediaId
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_MusicProperties
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; RetVal : access Windows.Media.IMusicDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProperties
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; RetVal : access Windows.Media.IVideoDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   function get_ImageProperties
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; RetVal : access Windows.Media.IImageDisplayProperties
   )
   return Windows.HRESULT is abstract;
   
   function CopyFromFileAsync
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
      ; type_x : Windows.Media.MediaPlaybackType
      ; source : Windows.Storage.IStorageFile
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ClearAll
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Update
   (
      This       : access ISystemMediaTransportControlsDisplayUpdater_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaTransportControlsDisplayUpdater : aliased constant Windows.IID := (2327561534, 64085, 20175, (173, 142, 201, 132, 229, 221, 21, 80 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaTransportControlsButtonPressedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Button
   (
      This       : access ISystemMediaTransportControlsButtonPressedEventArgs_Interface
      ; RetVal : access Windows.Media.SystemMediaTransportControlsButton
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaTransportControlsButtonPressedEventArgs : aliased constant Windows.IID := (3086250262, 42351, 19912, (158, 17, 146, 3, 31, 74, 135, 194 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaTransportControlsPropertyChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Property
   (
      This       : access ISystemMediaTransportControlsPropertyChangedEventArgs_Interface
      ; RetVal : access Windows.Media.SystemMediaTransportControlsProperty
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaTransportControlsPropertyChangedEventArgs : aliased constant Windows.IID := (3502901558, 13211, 19635, (142, 235, 115, 118, 7, 245, 110, 8 ));
   
   ------------------------------------------------------------------------
   type IPlaybackPositionChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestedPlaybackPosition
   (
      This       : access IPlaybackPositionChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaybackPositionChangeRequestedEventArgs : aliased constant Windows.IID := (3024699272, 60200, 18785, (156, 20, 51, 94, 68, 243, 225, 37 ));
   
   ------------------------------------------------------------------------
   type IPlaybackRateChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestedPlaybackRate
   (
      This       : access IPlaybackRateChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   IID_IPlaybackRateChangeRequestedEventArgs : aliased constant Windows.IID := (753058847, 15574, 20343, (155, 167, 235, 39, 194, 106, 33, 64 ));
   
   ------------------------------------------------------------------------
   type IShuffleEnabledChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestedShuffleEnabled
   (
      This       : access IShuffleEnabledChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IShuffleEnabledChangeRequestedEventArgs : aliased constant Windows.IID := (1236636670, 20432, 18022, (163, 20, 192, 224, 25, 64, 211, 2 ));
   
   ------------------------------------------------------------------------
   type IAutoRepeatModeChangeRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestedAutoRepeatMode
   (
      This       : access IAutoRepeatModeChangeRequestedEventArgs_Interface
      ; RetVal : access Windows.Media.MediaPlaybackAutoRepeatMode
   )
   return Windows.HRESULT is abstract;
   
   IID_IAutoRepeatModeChangeRequestedEventArgs : aliased constant Windows.IID := (3927146234, 55378, 17294, (136, 43, 201, 144, 16, 154, 120, 244 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaTransportControls_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PlaybackStatus
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Media.MediaPlaybackStatus
   )
   return Windows.HRESULT is abstract;
   
   function put_PlaybackStatus
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Media.MediaPlaybackStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayUpdater
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Media.ISystemMediaTransportControlsDisplayUpdater
   )
   return Windows.HRESULT is abstract;
   
   function get_SoundLevel
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Media.SoundLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPlayEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPlayEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsStopEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsStopEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPauseEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPauseEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRecordEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRecordEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFastForwardEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsFastForwardEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRewindEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsRewindEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPreviousEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPreviousEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsNextEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsNextEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsChannelUpEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsChannelUpEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsChannelDownEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsChannelDownEnabled
   (
      This       : access ISystemMediaTransportControls_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_ButtonPressed
   (
      This       : access ISystemMediaTransportControls_Interface
      ; handler : TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ButtonPressed
   (
      This       : access ISystemMediaTransportControls_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PropertyChanged
   (
      This       : access ISystemMediaTransportControls_Interface
      ; handler : TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PropertyChanged
   (
      This       : access ISystemMediaTransportControls_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaTransportControls : aliased constant Windows.IID := (2583314420, 5954, 17062, (144, 46, 8, 125, 65, 249, 101, 236 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaTransportControls2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutoRepeatMode
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; RetVal : access Windows.Media.MediaPlaybackAutoRepeatMode
   )
   return Windows.HRESULT is abstract;
   
   function put_AutoRepeatMode
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; value : Windows.Media.MediaPlaybackAutoRepeatMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ShuffleEnabled
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShuffleEnabled
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_PlaybackRate
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_PlaybackRate
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function UpdateTimelineProperties
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; timelineProperties : Windows.Media.ISystemMediaTransportControlsTimelineProperties
   )
   return Windows.HRESULT is abstract;
   
   function add_PlaybackPositionChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; handler : TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlaybackPositionChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlaybackRateChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; handler : TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlaybackRateChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ShuffleEnabledChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; handler : TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ShuffleEnabledChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AutoRepeatModeChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; handler : TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AutoRepeatModeChangeRequested
   (
      This       : access ISystemMediaTransportControls2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaTransportControls2 : aliased constant Windows.IID := (3935884022, 32572, 19186, (165, 134, 114, 136, 152, 8, 239, 177 ));
   
   ------------------------------------------------------------------------
   type ISystemMediaTransportControlsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ISystemMediaTransportControlsStatics_Interface
      ; RetVal : access Windows.Media.ISystemMediaTransportControls
   )
   return Windows.HRESULT is abstract;
   
   IID_ISystemMediaTransportControlsStatics : aliased constant Windows.IID := (1136277514, 60580, 18482, (145, 171, 212, 21, 250, 228, 132, 198 ));
   
   ------------------------------------------------------------------------
   type IMediaTimelineController_Interface is interface and Windows.IInspectable_Interface;
   
   function Start
   (
      This       : access IMediaTimelineController_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Resume
   (
      This       : access IMediaTimelineController_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Pause
   (
      This       : access IMediaTimelineController_Interface
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IMediaTimelineController_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access IMediaTimelineController_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ClockRate
   (
      This       : access IMediaTimelineController_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_ClockRate
   (
      This       : access IMediaTimelineController_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_State
   (
      This       : access IMediaTimelineController_Interface
      ; RetVal : access Windows.Media.MediaTimelineControllerState
   )
   return Windows.HRESULT is abstract;
   
   function add_PositionChanged
   (
      This       : access IMediaTimelineController_Interface
      ; positionChangedEventHandler : TypedEventHandler_IMediaTimelineController_add_PositionChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PositionChanged
   (
      This       : access IMediaTimelineController_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StateChanged
   (
      This       : access IMediaTimelineController_Interface
      ; stateChangedEventHandler : TypedEventHandler_IMediaTimelineController_add_StateChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StateChanged
   (
      This       : access IMediaTimelineController_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaTimelineController : aliased constant Windows.IID := (2396217843, 2936, 17248, (191, 113, 12, 132, 25, 153, 234, 27 ));
   
   ------------------------------------------------------------------------
   type IMediaTimelineController2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Duration
   (
      This       : access IMediaTimelineController2_Interface
      ; RetVal : access Windows.Foundation.IReference_TimeSpan -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IMediaTimelineController2_Interface
      ; value : Windows.Foundation.IReference_TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsLoopingEnabled
   (
      This       : access IMediaTimelineController2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsLoopingEnabled
   (
      This       : access IMediaTimelineController2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_Failed
   (
      This       : access IMediaTimelineController2_Interface
      ; eventHandler : TypedEventHandler_IMediaTimelineController2_add_Failed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Failed
   (
      This       : access IMediaTimelineController2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Ended
   (
      This       : access IMediaTimelineController2_Interface
      ; eventHandler : TypedEventHandler_IMediaTimelineController2_add_Ended
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Ended
   (
      This       : access IMediaTimelineController2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaTimelineController2 : aliased constant Windows.IID := (4017416760, 40562, 19961, (131, 85, 110, 144, 200, 27, 186, 221 ));
   
   ------------------------------------------------------------------------
   type IMediaTimelineControllerFailedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedError
   (
      This       : access IMediaTimelineControllerFailedEventArgs_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaTimelineControllerFailedEventArgs : aliased constant Windows.IID := (2283927581, 15991, 17403, (190, 38, 79, 200, 122, 4, 72, 52 ));
   
   ------------------------------------------------------------------------
   type IMediaExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function SetProperties
   (
      This       : access IMediaExtension_Interface
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaExtension : aliased constant Windows.IID := (126963992, 17887, 17451, (138, 63, 247, 130, 106, 99, 112, 171 ));
   
   ------------------------------------------------------------------------
   type IMediaExtensionManager_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterSchemeHandler
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; scheme : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RegisterSchemeHandlerWithSettings
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; scheme : Windows.String
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function RegisterByteStreamHandler
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; fileExtension : Windows.String
      ; mimeType : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RegisterByteStreamHandlerWithSettings
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; fileExtension : Windows.String
      ; mimeType : Windows.String
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function RegisterAudioDecoder
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RegisterAudioDecoderWithSettings
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function RegisterAudioEncoder
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RegisterAudioEncoderWithSettings
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function RegisterVideoDecoder
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RegisterVideoDecoderWithSettings
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function RegisterVideoEncoder
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function RegisterVideoEncoderWithSettings
   (
      This       : access IMediaExtensionManager_Interface
      ; activatableClassId : Windows.String
      ; inputSubtype : Windows.Guid
      ; outputSubtype : Windows.Guid
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaExtensionManager : aliased constant Windows.IID := (1243998965, 9261, 19963, (151, 244, 105, 183, 196, 37, 118, 255 ));
   
   ------------------------------------------------------------------------
   type IMediaExtensionManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function RegisterMediaExtensionForAppService
   (
      This       : access IMediaExtensionManager2_Interface
      ; extension : Windows.Media.IMediaExtension
      ; connection : Windows.ApplicationModel.AppService.IAppServiceConnection
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaExtensionManager2 : aliased constant Windows.IID := (1540276039, 16451, 20461, (172, 175, 84, 236, 41, 223, 177, 247 ));
   
   ------------------------------------------------------------------------
   type IVideoEffectsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VideoStabilization
   (
      This       : access IVideoEffectsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IVideoEffectsStatics : aliased constant Windows.IID := (533571048, 47857, 17697, (152, 12, 59, 206, 187, 68, 207, 56 ));
   
   ------------------------------------------------------------------------
   type IMediaControl_Interface is interface and Windows.IInspectable_Interface;
   
   function add_SoundLevelChanged
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SoundLevelChanged
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlayPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlayPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PausePressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PausePressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StopPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StopPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PlayPauseTogglePressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PlayPauseTogglePressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RecordPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RecordPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_NextTrackPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NextTrackPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_PreviousTrackPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_PreviousTrackPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_FastForwardPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_FastForwardPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RewindPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RewindPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ChannelUpPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ChannelUpPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ChannelDownPressed
   (
      This       : access IMediaControl_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ChannelDownPressed
   (
      This       : access IMediaControl_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_SoundLevel
   (
      This       : access IMediaControl_Interface
      ; RetVal : access Windows.Media.SoundLevel
   )
   return Windows.HRESULT is abstract;
   
   function put_TrackName
   (
      This       : access IMediaControl_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TrackName
   (
      This       : access IMediaControl_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ArtistName
   (
      This       : access IMediaControl_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ArtistName
   (
      This       : access IMediaControl_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPlaying
   (
      This       : access IMediaControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPlaying
   (
      This       : access IMediaControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AlbumArt
   (
      This       : access IMediaControl_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_AlbumArt
   (
      This       : access IMediaControl_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaControl : aliased constant Windows.IID := (2565995489, 31373, 17099, (182, 254, 143, 230, 152, 38, 79, 19 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IMediaExtension_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IMediaExtension_Interface
      ; handler : Windows.Media.AsyncOperationCompletedHandler_IMediaExtension
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IMediaExtension_Interface
      ; RetVal : access Windows.Media.AsyncOperationCompletedHandler_IMediaExtension
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IMediaExtension_Interface
      ; RetVal : access Windows.Media.IMediaExtension
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IMediaExtension : aliased constant Windows.IID := (4123734787, 7199, 23856, (180, 2, 239, 161, 146, 232, 12, 73 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IVideoFrame_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IVideoFrame_Interface
      ; handler : Windows.Media.AsyncOperationCompletedHandler_IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IVideoFrame_Interface
      ; RetVal : access Windows.Media.AsyncOperationCompletedHandler_IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IVideoFrame_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IVideoFrame : aliased constant Windows.IID := (4046344541, 44101, 20819, (150, 178, 206, 83, 171, 89, 74, 87 ));
   
   ------------------------------------------------------------------------
   type IIterator_MediaTimeRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_MediaTimeRange_Interface
      ; RetVal : access Windows.Media.MediaTimeRange
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_MediaTimeRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_MediaTimeRange_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_MediaTimeRange_Interface
      ; items : Windows.Media.MediaTimeRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_MediaTimeRange : aliased constant Windows.IID := (699978128, 24134, 22643, (175, 192, 143, 47, 64, 251, 232, 253 ));
   
   ------------------------------------------------------------------------
   type IIterable_MediaTimeRange_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_MediaTimeRange_Interface
      ; RetVal : access Windows.Media.IIterator_MediaTimeRange
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_MediaTimeRange : aliased constant Windows.IID := (646055138, 40274, 24187, (165, 75, 134, 156, 99, 222, 252, 142 ));
   
   ------------------------------------------------------------------------
   type IVectorView_MediaTimeRange_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_MediaTimeRange_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.MediaTimeRange
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_MediaTimeRange_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_MediaTimeRange_Interface
      ; value : Windows.Media.MediaTimeRange
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_MediaTimeRange_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.MediaTimeRange_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_MediaTimeRange : aliased constant Windows.IID := (640163931, 42362, 20857, (146, 230, 155, 110, 19, 203, 141, 13 ));
   
   ------------------------------------------------------------------------
   type IIterator_IMediaMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IMediaMarker_Interface
      ; RetVal : access Windows.Media.IMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IMediaMarker_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IMediaMarker_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IMediaMarker_Interface
      ; items : Windows.Media.IMediaMarker_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IMediaMarker : aliased constant Windows.IID := (4100220446, 35004, 23786, (147, 205, 12, 18, 63, 23, 210, 88 ));
   
   ------------------------------------------------------------------------
   type IIterable_IMediaMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IMediaMarker_Interface
      ; RetVal : access Windows.Media.IIterator_IMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IMediaMarker : aliased constant Windows.IID := (2713756567, 868, 24140, (157, 202, 124, 215, 1, 27, 209, 20 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IMediaMarker_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IMediaMarker_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.IMediaMarker
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IMediaMarker_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IMediaMarker_Interface
      ; value : Windows.Media.IMediaMarker
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IMediaMarker_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.IMediaMarker_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IMediaMarker : aliased constant Windows.IID := (3041089068, 689, 22564, (128, 168, 152, 84, 19, 12, 218, 221 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IMediaExtension_Interface(Callback : access procedure (asyncInfo : Windows.Media.IAsyncOperation_IMediaExtension ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IMediaExtension_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaExtension_Interface
      ; asyncInfo : Windows.Media.IAsyncOperation_IMediaExtension
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IMediaExtension : aliased constant Windows.IID := (2619037582, 64381, 23467, (186, 57, 134, 56, 127, 229, 51, 182 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IVideoFrame_Interface(Callback : access procedure (asyncInfo : Windows.Media.IAsyncOperation_IVideoFrame ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IVideoFrame_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IVideoFrame_Interface
      ; asyncInfo : Windows.Media.IAsyncOperation_IVideoFrame
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IVideoFrame : aliased constant Windows.IID := (1619456763, 18985, 21706, (182, 163, 242, 57, 26, 3, 188, 59 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed_Interface(Callback : access procedure (sender : Windows.Media.ISystemMediaTransportControls ; args : Windows.Media.ISystemMediaTransportControlsButtonPressedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.ISystemMediaTransportControlsButtonPressedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISystemMediaTransportControls_add_ButtonPressed : aliased constant Windows.IID := (89647510, 31523, 23470, (170, 129, 234, 13, 103, 17, 67, 164 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged_Interface(Callback : access procedure (sender : Windows.Media.ISystemMediaTransportControls ; args : Windows.Media.ISystemMediaTransportControlsPropertyChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.ISystemMediaTransportControlsPropertyChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISystemMediaTransportControls_add_PropertyChanged : aliased constant Windows.IID := (2681609645, 5958, 24481, (169, 8, 239, 124, 180, 96, 60, 133 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.ISystemMediaTransportControls ; args : Windows.Media.IPlaybackPositionChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IPlaybackPositionChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackPositionChangeRequested : aliased constant Windows.IID := (1155747605, 48576, 20647, (172, 228, 57, 233, 31, 183, 83, 241 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.ISystemMediaTransportControls ; args : Windows.Media.IPlaybackRateChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IPlaybackRateChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISystemMediaTransportControls2_add_PlaybackRateChangeRequested : aliased constant Windows.IID := (367722882, 25446, 23455, (189, 140, 138, 180, 250, 157, 124, 217 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.ISystemMediaTransportControls ; args : Windows.Media.IShuffleEnabledChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IShuffleEnabledChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISystemMediaTransportControls2_add_ShuffleEnabledChangeRequested : aliased constant Windows.IID := (401402496, 10212, 23982, (171, 180, 200, 88, 173, 28, 83, 7 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested_Interface(Callback : access procedure (sender : Windows.Media.ISystemMediaTransportControls ; args : Windows.Media.IAutoRepeatModeChangeRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested_Interface
      ; sender : Windows.Media.ISystemMediaTransportControls
      ; args : Windows.Media.IAutoRepeatModeChangeRequestedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_ISystemMediaTransportControls2_add_AutoRepeatModeChangeRequested : aliased constant Windows.IID := (2787199966, 725, 21939, (171, 13, 198, 3, 27, 231, 13, 161 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaTimelineController_add_PositionChanged_Interface(Callback : access procedure (sender : Windows.Media.IMediaTimelineController ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaTimelineController_add_PositionChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController_add_PositionChanged_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaTimelineController_add_PositionChanged : aliased constant Windows.IID := (1547952533, 32057, 23821, (163, 9, 25, 145, 230, 138, 205, 183 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaTimelineController_add_StateChanged_Interface(Callback : access procedure (sender : Windows.Media.IMediaTimelineController ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaTimelineController_add_StateChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController_add_StateChanged_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaTimelineController_add_StateChanged : aliased constant Windows.IID := (1547952533, 32057, 23821, (163, 9, 25, 145, 230, 138, 205, 183 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaTimelineController2_add_Failed_Interface(Callback : access procedure (sender : Windows.Media.IMediaTimelineController ; args : Windows.Media.IMediaTimelineControllerFailedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaTimelineController2_add_Failed_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController2_add_Failed_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Media.IMediaTimelineControllerFailedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaTimelineController2_add_Failed : aliased constant Windows.IID := (130900731, 22413, 22182, (168, 239, 230, 83, 235, 0, 93, 27 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IMediaTimelineController2_add_Ended_Interface(Callback : access procedure (sender : Windows.Media.IMediaTimelineController ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IMediaTimelineController2_add_Ended_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaTimelineController2_add_Ended_Interface
      ; sender : Windows.Media.IMediaTimelineController
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IMediaTimelineController2_add_Ended : aliased constant Windows.IID := (1547952533, 32057, 23821, (163, 9, 25, 145, 230, 138, 205, 183 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype MediaProcessingTriggerDetails is Windows.Media.IMediaProcessingTriggerDetails;
   subtype VideoFrame is Windows.Media.IVideoFrame;
   
   function Create
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
   )
   return Windows.Media.IVideoFrame;
   
   function CreateWithAlpha
   (
      format : Windows.Graphics.Imaging.BitmapPixelFormat
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; alpha : Windows.Graphics.Imaging.BitmapAlphaMode
   )
   return Windows.Media.IVideoFrame;
   
   subtype AudioBuffer is Windows.Media.IAudioBuffer;
   subtype AudioFrame is Windows.Media.IAudioFrame;
   
   function Create
   (
      capacity : Windows.UInt32
   )
   return Windows.Media.IAudioFrame;
   
   subtype SystemMediaTransportControlsTimelineProperties is Windows.Media.ISystemMediaTransportControlsTimelineProperties;
   
   function CreateSystemMediaTransportControlsTimelineProperties return Windows.Media.ISystemMediaTransportControlsTimelineProperties;
   
   subtype MusicDisplayProperties is Windows.Media.IMusicDisplayProperties;
   subtype VideoDisplayProperties is Windows.Media.IVideoDisplayProperties;
   subtype ImageDisplayProperties is Windows.Media.IImageDisplayProperties;
   subtype SystemMediaTransportControlsDisplayUpdater is Windows.Media.ISystemMediaTransportControlsDisplayUpdater;
   subtype SystemMediaTransportControlsButtonPressedEventArgs is Windows.Media.ISystemMediaTransportControlsButtonPressedEventArgs;
   subtype SystemMediaTransportControlsPropertyChangedEventArgs is Windows.Media.ISystemMediaTransportControlsPropertyChangedEventArgs;
   subtype PlaybackPositionChangeRequestedEventArgs is Windows.Media.IPlaybackPositionChangeRequestedEventArgs;
   subtype PlaybackRateChangeRequestedEventArgs is Windows.Media.IPlaybackRateChangeRequestedEventArgs;
   subtype ShuffleEnabledChangeRequestedEventArgs is Windows.Media.IShuffleEnabledChangeRequestedEventArgs;
   subtype AutoRepeatModeChangeRequestedEventArgs is Windows.Media.IAutoRepeatModeChangeRequestedEventArgs;
   subtype SystemMediaTransportControls is Windows.Media.ISystemMediaTransportControls;
   subtype MediaTimelineController is Windows.Media.IMediaTimelineController;
   
   function CreateMediaTimelineController return Windows.Media.IMediaTimelineController;
   
   subtype MediaTimelineControllerFailedEventArgs is Windows.Media.IMediaTimelineControllerFailedEventArgs;
   subtype MediaExtensionManager is Windows.Media.IMediaExtensionManager;
   
   function CreateMediaExtensionManager return Windows.Media.IMediaExtensionManager;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_Bookmark
   return Windows.String;
   
   function GetForCurrentView
   return Windows.Media.ISystemMediaTransportControls;
   
   function get_VideoStabilization
   return Windows.String;

end;