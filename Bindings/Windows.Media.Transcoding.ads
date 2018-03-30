--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Media.Core;
limited with Windows.Storage.Streams;
limited with Windows.Media.MediaProperties;
with Windows.Foundation.Collections;
limited with Windows.Storage;
--------------------------------------------------------------------------------
package Windows.Media.Transcoding is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MediaVideoProcessingAlgorithm is (
      Default,
      MrfCrf444
   );
   for MediaVideoProcessingAlgorithm use (
      Default => 0,
      MrfCrf444 => 1
   );
   for MediaVideoProcessingAlgorithm'Size use 32;
   
   type MediaVideoProcessingAlgorithm_Ptr is access MediaVideoProcessingAlgorithm;
   
   type TranscodeFailureReason is (
      None,
      Unknown,
      InvalidProfile,
      CodecNotFound
   );
   for TranscodeFailureReason use (
      None => 0,
      Unknown => 1,
      InvalidProfile => 2,
      CodecNotFound => 3
   );
   for TranscodeFailureReason'Size use 32;
   
   type TranscodeFailureReason_Ptr is access TranscodeFailureReason;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_TranscodeFailureReason_Interface;
   type AsyncOperationCompletedHandler_TranscodeFailureReason is access all AsyncOperationCompletedHandler_TranscodeFailureReason_Interface'Class;
   type AsyncOperationCompletedHandler_TranscodeFailureReason_Ptr is access all AsyncOperationCompletedHandler_TranscodeFailureReason;
   type AsyncOperationCompletedHandler_IPrepareTranscodeResult_Interface;
   type AsyncOperationCompletedHandler_IPrepareTranscodeResult is access all AsyncOperationCompletedHandler_IPrepareTranscodeResult_Interface'Class;
   type AsyncOperationCompletedHandler_IPrepareTranscodeResult_Ptr is access all AsyncOperationCompletedHandler_IPrepareTranscodeResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMediaTranscoder2_Interface;
   type IMediaTranscoder2 is access all IMediaTranscoder2_Interface'Class;
   type IMediaTranscoder2_Ptr is access all IMediaTranscoder2;
   type IMediaTranscoder_Interface;
   type IMediaTranscoder is access all IMediaTranscoder_Interface'Class;
   type IMediaTranscoder_Ptr is access all IMediaTranscoder;
   type IPrepareTranscodeResult_Interface;
   type IPrepareTranscodeResult is access all IPrepareTranscodeResult_Interface'Class;
   type IPrepareTranscodeResult_Ptr is access all IPrepareTranscodeResult;
   type IAsyncOperation_TranscodeFailureReason_Interface;
   type IAsyncOperation_TranscodeFailureReason is access all IAsyncOperation_TranscodeFailureReason_Interface'Class;
   type IAsyncOperation_TranscodeFailureReason_Ptr is access all IAsyncOperation_TranscodeFailureReason;
   type IAsyncOperation_IPrepareTranscodeResult_Interface;
   type IAsyncOperation_IPrepareTranscodeResult is access all IAsyncOperation_IPrepareTranscodeResult_Interface'Class;
   type IAsyncOperation_IPrepareTranscodeResult_Ptr is access all IAsyncOperation_IPrepareTranscodeResult;
   
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
   type IMediaTranscoder2_Interface is interface and Windows.IInspectable_Interface;
   
   function PrepareMediaStreamSourceTranscodeAsync
   (
      This       : access IMediaTranscoder2_Interface
      ; source : Windows.Media.Core.IMediaSource
      ; destination : Windows.Storage.Streams.IRandomAccessStream
      ; profile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; RetVal : access Windows.Media.Transcoding.IAsyncOperation_IPrepareTranscodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_VideoProcessingAlgorithm
   (
      This       : access IMediaTranscoder2_Interface
      ; value : Windows.Media.Transcoding.MediaVideoProcessingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoProcessingAlgorithm
   (
      This       : access IMediaTranscoder2_Interface
      ; RetVal : access Windows.Media.Transcoding.MediaVideoProcessingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaTranscoder2 : aliased constant Windows.IID := (1079188852, 13792, 20228, (133, 116, 202, 139, 196, 229, 160, 130 ));
   
   ------------------------------------------------------------------------
   type IMediaTranscoder_Interface is interface and Windows.IInspectable_Interface;
   
   function put_TrimStartTime
   (
      This       : access IMediaTranscoder_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrimStartTime
   (
      This       : access IMediaTranscoder_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_TrimStopTime
   (
      This       : access IMediaTranscoder_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_TrimStopTime
   (
      This       : access IMediaTranscoder_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_AlwaysReencode
   (
      This       : access IMediaTranscoder_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AlwaysReencode
   (
      This       : access IMediaTranscoder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_HardwareAccelerationEnabled
   (
      This       : access IMediaTranscoder_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HardwareAccelerationEnabled
   (
      This       : access IMediaTranscoder_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function AddAudioEffect
   (
      This       : access IMediaTranscoder_Interface
      ; activatableClassId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddAudioEffectWithSettings
   (
      This       : access IMediaTranscoder_Interface
      ; activatableClassId : Windows.String
      ; effectRequired : Windows.Boolean
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function AddVideoEffect
   (
      This       : access IMediaTranscoder_Interface
      ; activatableClassId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function AddVideoEffectWithSettings
   (
      This       : access IMediaTranscoder_Interface
      ; activatableClassId : Windows.String
      ; effectRequired : Windows.Boolean
      ; configuration : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function ClearEffects
   (
      This       : access IMediaTranscoder_Interface
   )
   return Windows.HRESULT is abstract;
   
   function PrepareFileTranscodeAsync
   (
      This       : access IMediaTranscoder_Interface
      ; source : Windows.Storage.IStorageFile
      ; destination : Windows.Storage.IStorageFile
      ; profile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; RetVal : access Windows.Media.Transcoding.IAsyncOperation_IPrepareTranscodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function PrepareStreamTranscodeAsync
   (
      This       : access IMediaTranscoder_Interface
      ; source : Windows.Storage.Streams.IRandomAccessStream
      ; destination : Windows.Storage.Streams.IRandomAccessStream
      ; profile : Windows.Media.MediaProperties.IMediaEncodingProfile
      ; RetVal : access Windows.Media.Transcoding.IAsyncOperation_IPrepareTranscodeResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IMediaTranscoder : aliased constant Windows.IID := (420256210, 41130, 19764, (134, 188, 238, 209, 177, 44, 47, 91 ));
   
   ------------------------------------------------------------------------
   type IPrepareTranscodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanTranscode
   (
      This       : access IPrepareTranscodeResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FailureReason
   (
      This       : access IPrepareTranscodeResult_Interface
      ; RetVal : access Windows.Media.Transcoding.TranscodeFailureReason
   )
   return Windows.HRESULT is abstract;
   
   function TranscodeAsync
   (
      This       : access IPrepareTranscodeResult_Interface
      ; RetVal : access Windows.Foundation.IAsyncActionWithProgress_Double -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPrepareTranscodeResult : aliased constant Windows.IID := (99769806, 39247, 18996, (157, 104, 151, 204, 206, 23, 48, 214 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_TranscodeFailureReason_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_TranscodeFailureReason_Interface
      ; handler : Windows.Media.Transcoding.AsyncOperationCompletedHandler_TranscodeFailureReason
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_TranscodeFailureReason_Interface
      ; RetVal : access Windows.Media.Transcoding.AsyncOperationCompletedHandler_TranscodeFailureReason
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_TranscodeFailureReason_Interface
      ; RetVal : access Windows.Media.Transcoding.TranscodeFailureReason
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_TranscodeFailureReason : aliased constant Windows.IID := (34809104, 14489, 21079, (190, 217, 164, 62, 81, 73, 210, 140 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPrepareTranscodeResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPrepareTranscodeResult_Interface
      ; handler : Windows.Media.Transcoding.AsyncOperationCompletedHandler_IPrepareTranscodeResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPrepareTranscodeResult_Interface
      ; RetVal : access Windows.Media.Transcoding.AsyncOperationCompletedHandler_IPrepareTranscodeResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPrepareTranscodeResult_Interface
      ; RetVal : access Windows.Media.Transcoding.IPrepareTranscodeResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPrepareTranscodeResult : aliased constant Windows.IID := (4126178323, 12359, 23467, (142, 183, 110, 93, 125, 20, 175, 174 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_TranscodeFailureReason_Interface(Callback : access procedure (asyncInfo : Windows.Media.Transcoding.IAsyncOperation_TranscodeFailureReason ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_TranscodeFailureReason_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_TranscodeFailureReason_Interface
      ; asyncInfo : Windows.Media.Transcoding.IAsyncOperation_TranscodeFailureReason
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_TranscodeFailureReason : aliased constant Windows.IID := (3291144895, 57748, 20857, (184, 173, 3, 181, 28, 4, 225, 218 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPrepareTranscodeResult_Interface(Callback : access procedure (asyncInfo : Windows.Media.Transcoding.IAsyncOperation_IPrepareTranscodeResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPrepareTranscodeResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrepareTranscodeResult_Interface
      ; asyncInfo : Windows.Media.Transcoding.IAsyncOperation_IPrepareTranscodeResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPrepareTranscodeResult : aliased constant Windows.IID := (2756541703, 36724, 21230, (159, 2, 194, 178, 68, 180, 255, 42 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PrepareTranscodeResult is Windows.Media.Transcoding.IPrepareTranscodeResult;
   subtype MediaTranscoder is Windows.Media.Transcoding.IMediaTranscoder;
   
   function CreateMediaTranscoder return Windows.Media.Transcoding.IMediaTranscoder;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;