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
with Windows.Foundation.Collections;
limited with Windows.Graphics.DirectX.Direct3D11;
limited with Windows.Media.Editing;
limited with Windows.Media.Render;
limited with Windows.Media.Capture;
with Windows.Foundation;
limited with Windows.Storage.Streams;
limited with Windows.Media.MediaProperties;
limited with Windows.UI;
limited with Windows.Media.Transcoding;
--------------------------------------------------------------------------------
package Windows.Media.Effects is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AudioEffectType is (
      Other,
      AcousticEchoCancellation,
      NoiseSuppression,
      AutomaticGainControl,
      BeamForming,
      ConstantToneRemoval,
      Equalizer,
      LoudnessEqualizer,
      BassBoost,
      VirtualSurround,
      VirtualHeadphones,
      SpeakerFill,
      RoomCorrection,
      BassManagement,
      EnvironmentalEffects,
      SpeakerProtection,
      SpeakerCompensation,
      DynamicRangeCompression
   );
   for AudioEffectType use (
      Other => 0,
      AcousticEchoCancellation => 1,
      NoiseSuppression => 2,
      AutomaticGainControl => 3,
      BeamForming => 4,
      ConstantToneRemoval => 5,
      Equalizer => 6,
      LoudnessEqualizer => 7,
      BassBoost => 8,
      VirtualSurround => 9,
      VirtualHeadphones => 10,
      SpeakerFill => 11,
      RoomCorrection => 12,
      BassManagement => 13,
      EnvironmentalEffects => 14,
      SpeakerProtection => 15,
      SpeakerCompensation => 16,
      DynamicRangeCompression => 17
   );
   for AudioEffectType'Size use 32;
   
   type AudioEffectType_Ptr is access AudioEffectType;
   
   type MediaMemoryTypes is (
      Gpu,
      Cpu,
      GpuAndCpu
   );
   for MediaMemoryTypes use (
      Gpu => 0,
      Cpu => 1,
      GpuAndCpu => 2
   );
   for MediaMemoryTypes'Size use 32;
   
   type MediaMemoryTypes_Ptr is access MediaMemoryTypes;
   
   type MediaEffectClosedReason is (
      Done,
      UnknownError,
      UnsupportedEncodingFormat,
      EffectCurrentlyUnloaded
   );
   for MediaEffectClosedReason use (
      Done => 0,
      UnknownError => 1,
      UnsupportedEncodingFormat => 2,
      EffectCurrentlyUnloaded => 3
   );
   for MediaEffectClosedReason'Size use 32;
   
   type MediaEffectClosedReason_Ptr is access MediaEffectClosedReason;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged_Interface;
   type TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged is access all TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged_Interface'Class;
   type TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged_Ptr is access all TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged;
   type TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged_Interface;
   type TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged is access all TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged_Interface'Class;
   type TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged_Ptr is access all TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IVideoCompositorDefinition_Interface;
   type IVideoCompositorDefinition is access all IVideoCompositorDefinition_Interface'Class;
   type IVideoCompositorDefinition_Ptr is access all IVideoCompositorDefinition;
   type IVideoCompositorDefinitionFactory_Interface;
   type IVideoCompositorDefinitionFactory is access all IVideoCompositorDefinitionFactory_Interface'Class;
   type IVideoCompositorDefinitionFactory_Ptr is access all IVideoCompositorDefinitionFactory;
   type ICompositeVideoFrameContext_Interface;
   type ICompositeVideoFrameContext is access all ICompositeVideoFrameContext_Interface'Class;
   type ICompositeVideoFrameContext_Ptr is access all ICompositeVideoFrameContext;
   type IAudioEffect_Interface;
   type IAudioEffect is access all IAudioEffect_Interface'Class;
   type IAudioEffect_Ptr is access all IAudioEffect;
   type IAudioEffectsManagerStatics_Interface;
   type IAudioEffectsManagerStatics is access all IAudioEffectsManagerStatics_Interface'Class;
   type IAudioEffectsManagerStatics_Ptr is access all IAudioEffectsManagerStatics;
   type IAudioRenderEffectsManager_Interface;
   type IAudioRenderEffectsManager is access all IAudioRenderEffectsManager_Interface'Class;
   type IAudioRenderEffectsManager_Ptr is access all IAudioRenderEffectsManager;
   type IAudioRenderEffectsManager2_Interface;
   type IAudioRenderEffectsManager2 is access all IAudioRenderEffectsManager2_Interface'Class;
   type IAudioRenderEffectsManager2_Ptr is access all IAudioRenderEffectsManager2;
   type IAudioCaptureEffectsManager_Interface;
   type IAudioCaptureEffectsManager is access all IAudioCaptureEffectsManager_Interface'Class;
   type IAudioCaptureEffectsManager_Ptr is access all IAudioCaptureEffectsManager;
   type IVideoCompositor_Interface;
   type IVideoCompositor is access all IVideoCompositor_Interface'Class;
   type IVideoCompositor_Ptr is access all IVideoCompositor;
   type IVideoEffectDefinition_Interface;
   type IVideoEffectDefinition is access all IVideoEffectDefinition_Interface'Class;
   type IVideoEffectDefinition_Ptr is access all IVideoEffectDefinition;
   type IVideoEffectDefinitionFactory_Interface;
   type IVideoEffectDefinitionFactory is access all IVideoEffectDefinitionFactory_Interface'Class;
   type IVideoEffectDefinitionFactory_Ptr is access all IVideoEffectDefinitionFactory;
   type IAudioEffectDefinition_Interface;
   type IAudioEffectDefinition is access all IAudioEffectDefinition_Interface'Class;
   type IAudioEffectDefinition_Ptr is access all IAudioEffectDefinition;
   type IAudioEffectDefinitionFactory_Interface;
   type IAudioEffectDefinitionFactory is access all IAudioEffectDefinitionFactory_Interface'Class;
   type IAudioEffectDefinitionFactory_Ptr is access all IAudioEffectDefinitionFactory;
   type IProcessVideoFrameContext_Interface;
   type IProcessVideoFrameContext is access all IProcessVideoFrameContext_Interface'Class;
   type IProcessVideoFrameContext_Ptr is access all IProcessVideoFrameContext;
   type IBasicVideoEffect_Interface;
   type IBasicVideoEffect is access all IBasicVideoEffect_Interface'Class;
   type IBasicVideoEffect_Ptr is access all IBasicVideoEffect;
   type IProcessAudioFrameContext_Interface;
   type IProcessAudioFrameContext is access all IProcessAudioFrameContext_Interface'Class;
   type IProcessAudioFrameContext_Ptr is access all IProcessAudioFrameContext;
   type IBasicAudioEffect_Interface;
   type IBasicAudioEffect is access all IBasicAudioEffect_Interface'Class;
   type IBasicAudioEffect_Ptr is access all IBasicAudioEffect;
   type IVideoTransformEffectDefinition_Interface;
   type IVideoTransformEffectDefinition is access all IVideoTransformEffectDefinition_Interface'Class;
   type IVideoTransformEffectDefinition_Ptr is access all IVideoTransformEffectDefinition;
   type ISlowMotionEffectDefinition_Interface;
   type ISlowMotionEffectDefinition is access all ISlowMotionEffectDefinition_Interface'Class;
   type ISlowMotionEffectDefinition_Ptr is access all ISlowMotionEffectDefinition;
   type IIterator_IAudioEffectDefinition_Interface;
   type IIterator_IAudioEffectDefinition is access all IIterator_IAudioEffectDefinition_Interface'Class;
   type IIterator_IAudioEffectDefinition_Ptr is access all IIterator_IAudioEffectDefinition;
   type IIterable_IAudioEffectDefinition_Interface;
   type IIterable_IAudioEffectDefinition is access all IIterable_IAudioEffectDefinition_Interface'Class;
   type IIterable_IAudioEffectDefinition_Ptr is access all IIterable_IAudioEffectDefinition;
   type IVectorView_IAudioEffectDefinition_Interface;
   type IVectorView_IAudioEffectDefinition is access all IVectorView_IAudioEffectDefinition_Interface'Class;
   type IVectorView_IAudioEffectDefinition_Ptr is access all IVectorView_IAudioEffectDefinition;
   type IVector_IAudioEffectDefinition_Interface;
   type IVector_IAudioEffectDefinition is access all IVector_IAudioEffectDefinition_Interface'Class;
   type IVector_IAudioEffectDefinition_Ptr is access all IVector_IAudioEffectDefinition;
   type IIterator_IVideoEffectDefinition_Interface;
   type IIterator_IVideoEffectDefinition is access all IIterator_IVideoEffectDefinition_Interface'Class;
   type IIterator_IVideoEffectDefinition_Ptr is access all IIterator_IVideoEffectDefinition;
   type IIterable_IVideoEffectDefinition_Interface;
   type IIterable_IVideoEffectDefinition is access all IIterable_IVideoEffectDefinition_Interface'Class;
   type IIterable_IVideoEffectDefinition_Ptr is access all IIterable_IVideoEffectDefinition;
   type IVectorView_IVideoEffectDefinition_Interface;
   type IVectorView_IVideoEffectDefinition is access all IVectorView_IVideoEffectDefinition_Interface'Class;
   type IVectorView_IVideoEffectDefinition_Ptr is access all IVectorView_IVideoEffectDefinition;
   type IVector_IVideoEffectDefinition_Interface;
   type IVector_IVideoEffectDefinition is access all IVector_IVideoEffectDefinition_Interface'Class;
   type IVector_IVideoEffectDefinition_Ptr is access all IVector_IVideoEffectDefinition;
   type IIterator_IAudioEffect_Interface;
   type IIterator_IAudioEffect is access all IIterator_IAudioEffect_Interface'Class;
   type IIterator_IAudioEffect_Ptr is access all IIterator_IAudioEffect;
   type IIterable_IAudioEffect_Interface;
   type IIterable_IAudioEffect is access all IIterable_IAudioEffect_Interface'Class;
   type IIterable_IAudioEffect_Ptr is access all IIterable_IAudioEffect;
   type IVectorView_IAudioEffect_Interface;
   type IVectorView_IAudioEffect is access all IVectorView_IAudioEffect_Interface'Class;
   type IVectorView_IAudioEffect_Ptr is access all IVectorView_IAudioEffect;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IVideoCompositorDefinition : aliased constant Windows.IID := (2034677968, 8208, 19171, (154, 178, 44, 239, 66, 237, 212, 210 ));
   
   type IVideoCompositorDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivatableClassId
   (
      This       : access IVideoCompositorDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IVideoCompositorDefinition_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoCompositorDefinitionFactory : aliased constant Windows.IID := (1130822928, 26808, 19794, (137, 182, 2, 169, 104, 204, 168, 153 ));
   
   type IVideoCompositorDefinitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IVideoCompositorDefinitionFactory_Interface
      ; activatableClassId : Windows.String
      ; RetVal : access Windows.Media.Effects.IVideoCompositorDefinition
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithProperties
   (
      This       : access IVideoCompositorDefinitionFactory_Interface
      ; activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Media.Effects.IVideoCompositorDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositeVideoFrameContext : aliased constant Windows.IID := (1815085643, 62740, 17016, (165, 247, 185, 24, 128, 73, 209, 16 ));
   
   type ICompositeVideoFrameContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SurfacesToOverlay
   (
      This       : access ICompositeVideoFrameContext_Interface
      ; RetVal : access Windows.Graphics.DirectX.Direct3D11.IVectorView_IDirect3DSurface -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundFrame
   (
      This       : access ICompositeVideoFrameContext_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputFrame
   (
      This       : access ICompositeVideoFrameContext_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function GetOverlayForSurface
   (
      This       : access ICompositeVideoFrameContext_Interface
      ; surfaceToOverlay : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; RetVal : access Windows.Media.Editing.IMediaOverlay
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEffect : aliased constant Windows.IID := (883620433, 37383, 16469, (190, 147, 110, 87, 52, 168, 106, 228 ));
   
   type IAudioEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AudioEffectType
   (
      This       : access IAudioEffect_Interface
      ; RetVal : access Windows.Media.Effects.AudioEffectType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEffectsManagerStatics : aliased constant Windows.IID := (1715497988, 34554, 18380, (163, 21, 244, 137, 216, 195, 254, 16 ));
   
   type IAudioEffectsManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAudioRenderEffectsManager
   (
      This       : access IAudioEffectsManagerStatics_Interface
      ; deviceId : Windows.String
      ; category : Windows.Media.Render.AudioRenderCategory
      ; RetVal : access Windows.Media.Effects.IAudioRenderEffectsManager
   )
   return Windows.HRESULT is abstract;
   
   function CreateAudioRenderEffectsManagerWithMode
   (
      This       : access IAudioEffectsManagerStatics_Interface
      ; deviceId : Windows.String
      ; category : Windows.Media.Render.AudioRenderCategory
      ; mode : Windows.Media.AudioProcessing
      ; RetVal : access Windows.Media.Effects.IAudioRenderEffectsManager
   )
   return Windows.HRESULT is abstract;
   
   function CreateAudioCaptureEffectsManager
   (
      This       : access IAudioEffectsManagerStatics_Interface
      ; deviceId : Windows.String
      ; category : Windows.Media.Capture.MediaCategory
      ; RetVal : access Windows.Media.Effects.IAudioCaptureEffectsManager
   )
   return Windows.HRESULT is abstract;
   
   function CreateAudioCaptureEffectsManagerWithMode
   (
      This       : access IAudioEffectsManagerStatics_Interface
      ; deviceId : Windows.String
      ; category : Windows.Media.Capture.MediaCategory
      ; mode : Windows.Media.AudioProcessing
      ; RetVal : access Windows.Media.Effects.IAudioCaptureEffectsManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioRenderEffectsManager : aliased constant Windows.IID := (1305053542, 34641, 17074, (191, 203, 57, 202, 120, 100, 189, 71 ));
   
   type IAudioRenderEffectsManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AudioRenderEffectsChanged
   (
      This       : access IAudioRenderEffectsManager_Interface
      ; handler : TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AudioRenderEffectsChanged
   (
      This       : access IAudioRenderEffectsManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetAudioRenderEffects
   (
      This       : access IAudioRenderEffectsManager_Interface
      ; RetVal : access Windows.Media.Effects.IVectorView_IAudioEffect -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioRenderEffectsManager2 : aliased constant Windows.IID := (2823081225, 24268, 17587, (187, 78, 29, 176, 114, 135, 19, 156 ));
   
   type IAudioRenderEffectsManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EffectsProviderThumbnail
   (
      This       : access IAudioRenderEffectsManager2_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamWithContentType
   )
   return Windows.HRESULT is abstract;
   
   function get_EffectsProviderSettingsLabel
   (
      This       : access IAudioRenderEffectsManager2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function ShowSettingsUI
   (
      This       : access IAudioRenderEffectsManager2_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioCaptureEffectsManager : aliased constant Windows.IID := (2407907953, 909, 17299, (130, 152, 84, 1, 16, 96, 142, 239 ));
   
   type IAudioCaptureEffectsManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_AudioCaptureEffectsChanged
   (
      This       : access IAudioCaptureEffectsManager_Interface
      ; handler : TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AudioCaptureEffectsChanged
   (
      This       : access IAudioCaptureEffectsManager_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetAudioCaptureEffects
   (
      This       : access IAudioCaptureEffectsManager_Interface
      ; RetVal : access Windows.Media.Effects.IVectorView_IAudioEffect -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoCompositor : aliased constant Windows.IID := (2232464446, 16908, 16911, (150, 199, 124, 152, 187, 161, 252, 85 ));
   
   type IVideoCompositor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TimeIndependent
   (
      This       : access IVideoCompositor_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetEncodingProperties
   (
      This       : access IVideoCompositor_Interface
      ; backgroundProperties : Windows.Media.MediaProperties.IVideoEncodingProperties
      ; device : Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
   )
   return Windows.HRESULT is abstract;
   
   function CompositeFrame
   (
      This       : access IVideoCompositor_Interface
      ; context : Windows.Media.Effects.ICompositeVideoFrameContext
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IVideoCompositor_Interface
      ; reason : Windows.Media.Effects.MediaEffectClosedReason
   )
   return Windows.HRESULT is abstract;
   
   function DiscardQueuedFrames
   (
      This       : access IVideoCompositor_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEffectDefinition : aliased constant Windows.IID := (972262640, 36111, 20286, (132, 252, 45, 70, 165, 41, 121, 67 ));
   
   type IVideoEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivatableClassId
   (
      This       : access IVideoEffectDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IVideoEffectDefinition_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoEffectDefinitionFactory : aliased constant Windows.IID := (2168691534, 28211, 17039, (157, 33, 181, 170, 254, 247, 97, 124 ));
   
   type IVideoEffectDefinitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IVideoEffectDefinitionFactory_Interface
      ; activatableClassId : Windows.String
      ; RetVal : access Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithProperties
   (
      This       : access IVideoEffectDefinitionFactory_Interface
      ; activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEffectDefinition : aliased constant Windows.IID := (3839359348, 32128, 20339, (144, 137, 227, 28, 157, 185, 194, 148 ));
   
   type IAudioEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivatableClassId
   (
      This       : access IAudioEffectDefinition_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IAudioEffectDefinition_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAudioEffectDefinitionFactory : aliased constant Windows.IID := (2384307782, 59141, 17901, (138, 43, 252, 78, 79, 64, 90, 151 ));
   
   type IAudioEffectDefinitionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IAudioEffectDefinitionFactory_Interface
      ; activatableClassId : Windows.String
      ; RetVal : access Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithProperties
   (
      This       : access IAudioEffectDefinitionFactory_Interface
      ; activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
      ; RetVal : access Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProcessVideoFrameContext : aliased constant Windows.IID := (661589547, 25697, 16414, (186, 120, 15, 218, 214, 17, 78, 236 ));
   
   type IProcessVideoFrameContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputFrame
   (
      This       : access IProcessVideoFrameContext_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputFrame
   (
      This       : access IProcessVideoFrameContext_Interface
      ; RetVal : access Windows.Media.IVideoFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBasicVideoEffect : aliased constant Windows.IID := (2187511791, 45920, 16574, (148, 155, 47, 244, 47, 243, 86, 147 ));
   
   type IBasicVideoEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReadOnly
   (
      This       : access IBasicVideoEffect_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedMemoryTypes
   (
      This       : access IBasicVideoEffect_Interface
      ; RetVal : access Windows.Media.Effects.MediaMemoryTypes
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeIndependent
   (
      This       : access IBasicVideoEffect_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedEncodingProperties
   (
      This       : access IBasicVideoEffect_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVectorView_IVideoEncodingProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetEncodingProperties
   (
      This       : access IBasicVideoEffect_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IVideoEncodingProperties
      ; device : Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
   )
   return Windows.HRESULT is abstract;
   
   function ProcessFrame
   (
      This       : access IBasicVideoEffect_Interface
      ; context : Windows.Media.Effects.IProcessVideoFrameContext
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IBasicVideoEffect_Interface
      ; reason : Windows.Media.Effects.MediaEffectClosedReason
   )
   return Windows.HRESULT is abstract;
   
   function DiscardQueuedFrames
   (
      This       : access IBasicVideoEffect_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProcessAudioFrameContext : aliased constant Windows.IID := (1289300294, 4642, 18983, (165, 134, 251, 62, 32, 39, 50, 85 ));
   
   type IProcessAudioFrameContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InputFrame
   (
      This       : access IProcessAudioFrameContext_Interface
      ; RetVal : access Windows.Media.IAudioFrame
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputFrame
   (
      This       : access IProcessAudioFrameContext_Interface
      ; RetVal : access Windows.Media.IAudioFrame
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IBasicAudioEffect : aliased constant Windows.IID := (2349214803, 27584, 18616, (169, 154, 75, 65, 85, 15, 19, 89 ));
   
   type IBasicAudioEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_UseInputFrameForOutput
   (
      This       : access IBasicAudioEffect_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedEncodingProperties
   (
      This       : access IBasicAudioEffect_Interface
      ; RetVal : access Windows.Media.MediaProperties.IVectorView_IAudioEncodingProperties -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetEncodingProperties
   (
      This       : access IBasicAudioEffect_Interface
      ; encodingProperties : Windows.Media.MediaProperties.IAudioEncodingProperties
   )
   return Windows.HRESULT is abstract;
   
   function ProcessFrame
   (
      This       : access IBasicAudioEffect_Interface
      ; context : Windows.Media.Effects.IProcessAudioFrameContext
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IBasicAudioEffect_Interface
      ; reason : Windows.Media.Effects.MediaEffectClosedReason
   )
   return Windows.HRESULT is abstract;
   
   function DiscardQueuedFrames
   (
      This       : access IBasicAudioEffect_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVideoTransformEffectDefinition : aliased constant Windows.IID := (2523183978, 7846, 19110, (128, 116, 171, 232, 133, 30, 202, 226 ));
   
   type IVideoTransformEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PaddingColor
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_PaddingColor
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_OutputSize
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function put_OutputSize
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; value : Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_CropRectangle
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_CropRectangle
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_Rotation
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; RetVal : access Windows.Media.MediaProperties.MediaRotation
   )
   return Windows.HRESULT is abstract;
   
   function put_Rotation
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; value : Windows.Media.MediaProperties.MediaRotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Mirror
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; RetVal : access Windows.Media.MediaProperties.MediaMirroringOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_Mirror
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; value : Windows.Media.MediaProperties.MediaMirroringOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_ProcessingAlgorithm
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; value : Windows.Media.Transcoding.MediaVideoProcessingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function get_ProcessingAlgorithm
   (
      This       : access IVideoTransformEffectDefinition_Interface
      ; RetVal : access Windows.Media.Transcoding.MediaVideoProcessingAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISlowMotionEffectDefinition : aliased constant Windows.IID := (889535696, 5996, 18275, (130, 196, 27, 2, 219, 227, 23, 55 ));
   
   type ISlowMotionEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TimeStretchRate
   (
      This       : access ISlowMotionEffectDefinition_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_TimeStretchRate
   (
      This       : access ISlowMotionEffectDefinition_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAudioEffectDefinition : aliased constant Windows.IID := (3960420860, 26969, 21539, (158, 26, 247, 203, 142, 132, 92, 161 ));
   
   type IIterator_IAudioEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAudioEffectDefinition_Interface
      ; RetVal : access Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAudioEffectDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAudioEffectDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAudioEffectDefinition_Interface
      ; items : Windows.Media.Effects.IAudioEffectDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAudioEffectDefinition : aliased constant Windows.IID := (1618616511, 12980, 23438, (167, 147, 48, 36, 248, 211, 88, 42 ));
   
   type IIterable_IAudioEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAudioEffectDefinition_Interface
      ; RetVal : access Windows.Media.Effects.IIterator_IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAudioEffectDefinition : aliased constant Windows.IID := (3734923903, 53902, 24305, (145, 106, 239, 168, 128, 180, 137, 209 ));
   
   type IVectorView_IAudioEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAudioEffectDefinition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAudioEffectDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAudioEffectDefinition_Interface
      ; value : Windows.Media.Effects.IAudioEffectDefinition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAudioEffectDefinition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Effects.IAudioEffectDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IAudioEffectDefinition : aliased constant Windows.IID := (673753474, 55369, 24521, (132, 206, 249, 164, 179, 180, 211, 65 ));
   
   type IVector_IAudioEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; RetVal : access Windows.Media.Effects.IVectorView_IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; value : Windows.Media.Effects.IAudioEffectDefinition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; value : Windows.Media.Effects.IAudioEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAudioEffectDefinition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAudioEffectDefinition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Effects.IAudioEffectDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAudioEffectDefinition_Interface
      ; items : Windows.Media.Effects.IAudioEffectDefinition_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IVideoEffectDefinition : aliased constant Windows.IID := (2642556829, 18776, 21902, (161, 85, 58, 128, 155, 177, 108, 4 ));
   
   type IIterator_IVideoEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IVideoEffectDefinition_Interface
      ; RetVal : access Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IVideoEffectDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IVideoEffectDefinition_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IVideoEffectDefinition_Interface
      ; items : Windows.Media.Effects.IVideoEffectDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IVideoEffectDefinition : aliased constant Windows.IID := (3948314479, 45076, 20797, (153, 205, 241, 108, 34, 108, 60, 65 ));
   
   type IIterable_IVideoEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IVideoEffectDefinition_Interface
      ; RetVal : access Windows.Media.Effects.IIterator_IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IVideoEffectDefinition : aliased constant Windows.IID := (2756398990, 31907, 21425, (182, 139, 9, 139, 175, 69, 199, 62 ));
   
   type IVectorView_IVideoEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IVideoEffectDefinition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IVideoEffectDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IVideoEffectDefinition_Interface
      ; value : Windows.Media.Effects.IVideoEffectDefinition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IVideoEffectDefinition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Effects.IVideoEffectDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IVideoEffectDefinition : aliased constant Windows.IID := (2090951149, 57857, 22037, (170, 204, 37, 52, 133, 100, 240, 179 ));
   
   type IVector_IVideoEffectDefinition_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; RetVal : access Windows.Media.Effects.IVectorView_IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; value : Windows.Media.Effects.IVideoEffectDefinition
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; index : Windows.UInt32
      ; value : Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; value : Windows.Media.Effects.IVideoEffectDefinition
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IVideoEffectDefinition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IVideoEffectDefinition_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Effects.IVideoEffectDefinition_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IVideoEffectDefinition_Interface
      ; items : Windows.Media.Effects.IVideoEffectDefinition_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAudioEffect : aliased constant Windows.IID := (1732044567, 41935, 23912, (168, 11, 94, 211, 231, 185, 63, 237 ));
   
   type IIterator_IAudioEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAudioEffect_Interface
      ; RetVal : access Windows.Media.Effects.IAudioEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAudioEffect_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAudioEffect_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAudioEffect_Interface
      ; items : Windows.Media.Effects.IAudioEffect_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAudioEffect : aliased constant Windows.IID := (128948989, 9656, 22429, (190, 126, 138, 204, 3, 65, 141, 11 ));
   
   type IIterable_IAudioEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAudioEffect_Interface
      ; RetVal : access Windows.Media.Effects.IIterator_IAudioEffect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAudioEffect : aliased constant Windows.IID := (3452684775, 21464, 24166, (158, 69, 49, 213, 162, 63, 208, 29 ));
   
   type IVectorView_IAudioEffect_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAudioEffect_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Media.Effects.IAudioEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAudioEffect_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAudioEffect_Interface
      ; value : Windows.Media.Effects.IAudioEffect
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAudioEffect_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Media.Effects.IAudioEffect_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged : aliased constant Windows.IID := (1273142398, 17564, 22382, (167, 184, 58, 64, 242, 240, 29, 200 ));
   
   type TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged_Interface(Callback : access procedure (sender : Windows.Media.Effects.IAudioRenderEffectsManager ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioRenderEffectsManager_add_AudioRenderEffectsChanged_Interface
      ; sender : Windows.Media.Effects.IAudioRenderEffectsManager
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged : aliased constant Windows.IID := (2714101763, 41589, 23473, (157, 68, 42, 200, 174, 159, 251, 137 ));
   
   type TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged_Interface(Callback : access procedure (sender : Windows.Media.Effects.IAudioCaptureEffectsManager ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IAudioCaptureEffectsManager_add_AudioCaptureEffectsChanged_Interface
      ; sender : Windows.Media.Effects.IAudioCaptureEffectsManager
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype VideoCompositorDefinition is Windows.Media.Effects.IVideoCompositorDefinition;
   function Create
   (
      activatableClassId : Windows.String
   )
   return Windows.Media.Effects.IVideoCompositorDefinition;
   
   function CreateWithProperties
   (
      activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Effects.IVideoCompositorDefinition;
   
   subtype CompositeVideoFrameContext is Windows.Media.Effects.ICompositeVideoFrameContext;
   subtype AudioEffect is Windows.Media.Effects.IAudioEffect;
   subtype AudioRenderEffectsManager is Windows.Media.Effects.IAudioRenderEffectsManager;
   subtype AudioCaptureEffectsManager is Windows.Media.Effects.IAudioCaptureEffectsManager;
   subtype VideoEffectDefinition is Windows.Media.Effects.IVideoEffectDefinition;
   function Create
   (
      activatableClassId : Windows.String
   )
   return Windows.Media.Effects.IVideoEffectDefinition;
   
   function CreateWithProperties
   (
      activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Effects.IVideoEffectDefinition;
   
   subtype AudioEffectDefinition is Windows.Media.Effects.IAudioEffectDefinition;
   function Create
   (
      activatableClassId : Windows.String
   )
   return Windows.Media.Effects.IAudioEffectDefinition;
   
   function CreateWithProperties
   (
      activatableClassId : Windows.String
      ; props : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Media.Effects.IAudioEffectDefinition;
   
   subtype ProcessVideoFrameContext is Windows.Media.Effects.IProcessVideoFrameContext;
   subtype ProcessAudioFrameContext is Windows.Media.Effects.IProcessAudioFrameContext;
   subtype VideoTransformEffectDefinition is Windows.Media.Effects.IVideoEffectDefinition;
   function CreateVideoTransformEffectDefinition return Windows.Media.Effects.IVideoEffectDefinition;
   
   subtype SlowMotionEffectDefinition is Windows.Media.Effects.ISlowMotionEffectDefinition;
   function CreateSlowMotionEffectDefinition return Windows.Media.Effects.ISlowMotionEffectDefinition;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateAudioRenderEffectsManager
   (
      deviceId : Windows.String
      ; category : Windows.Media.Render.AudioRenderCategory
   )
   return Windows.Media.Effects.IAudioRenderEffectsManager;
   
   function CreateAudioRenderEffectsManagerWithMode
   (
      deviceId : Windows.String
      ; category : Windows.Media.Render.AudioRenderCategory
      ; mode : Windows.Media.AudioProcessing
   )
   return Windows.Media.Effects.IAudioRenderEffectsManager;
   
   function CreateAudioCaptureEffectsManager
   (
      deviceId : Windows.String
      ; category : Windows.Media.Capture.MediaCategory
   )
   return Windows.Media.Effects.IAudioCaptureEffectsManager;
   
   function CreateAudioCaptureEffectsManagerWithMode
   (
      deviceId : Windows.String
      ; category : Windows.Media.Capture.MediaCategory
      ; mode : Windows.Media.AudioProcessing
   )
   return Windows.Media.Effects.IAudioCaptureEffectsManager;
   
end;
