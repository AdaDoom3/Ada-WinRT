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
with Windows.Foundation.Numerics;
limited with Windows.UI.Core;
limited with Windows.System;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Graphics.DirectX;
limited with Windows.Graphics;
limited with Windows.Graphics.Effects;
--------------------------------------------------------------------------------
package Windows.UI.Composition is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AnimationDirection is (
      Normal,
      Reverse_x,
      Alternate,
      AlternateReverse
   );
   for AnimationDirection use (
      Normal => 0,
      Reverse_x => 1,
      Alternate => 2,
      AlternateReverse => 3
   );
   for AnimationDirection'Size use 32;
   
   type AnimationDirection_Ptr is access AnimationDirection;
   
   type AnimationIterationBehavior is (
      Count,
      Forever
   );
   for AnimationIterationBehavior use (
      Count => 0,
      Forever => 1
   );
   for AnimationIterationBehavior'Size use 32;
   
   type AnimationIterationBehavior_Ptr is access AnimationIterationBehavior;
   
   type AnimationDelayBehavior is (
      SetInitialValueAfterDelay,
      SetInitialValueBeforeDelay
   );
   for AnimationDelayBehavior use (
      SetInitialValueAfterDelay => 0,
      SetInitialValueBeforeDelay => 1
   );
   for AnimationDelayBehavior'Size use 32;
   
   type AnimationDelayBehavior_Ptr is access AnimationDelayBehavior;
   
   type AnimationStopBehavior is (
      LeaveCurrentValue,
      SetToInitialValue,
      SetToFinalValue
   );
   for AnimationStopBehavior use (
      LeaveCurrentValue => 0,
      SetToInitialValue => 1,
      SetToFinalValue => 2
   );
   for AnimationStopBehavior'Size use 32;
   
   type AnimationStopBehavior_Ptr is access AnimationStopBehavior;
   
   type CompositionBatchTypes is (
      None,
      Animation,
      Effect
   );
   for CompositionBatchTypes use (
      None => 0,
      Animation => 1,
      Effect => 2
   );
   for CompositionBatchTypes'Size use 32;
   
   type CompositionBatchTypes_Ptr is access CompositionBatchTypes;
   
   type CompositionBackfaceVisibility is (
      Inherit,
      Visible,
      Hidden
   );
   for CompositionBackfaceVisibility use (
      Inherit => 0,
      Visible => 1,
      Hidden => 2
   );
   for CompositionBackfaceVisibility'Size use 32;
   
   type CompositionBackfaceVisibility_Ptr is access CompositionBackfaceVisibility;
   
   type CompositionBitmapInterpolationMode is (
      NearestNeighbor,
      Linear
   );
   for CompositionBitmapInterpolationMode use (
      NearestNeighbor => 0,
      Linear => 1
   );
   for CompositionBitmapInterpolationMode'Size use 32;
   
   type CompositionBitmapInterpolationMode_Ptr is access CompositionBitmapInterpolationMode;
   
   type CompositionBorderMode is (
      Inherit,
      Soft,
      Hard
   );
   for CompositionBorderMode use (
      Inherit => 0,
      Soft => 1,
      Hard => 2
   );
   for CompositionBorderMode'Size use 32;
   
   type CompositionBorderMode_Ptr is access CompositionBorderMode;
   
   type CompositionColorSpace is (
      Auto,
      Hsl,
      Rgb,
      HslLinear,
      RgbLinear
   );
   for CompositionColorSpace use (
      Auto => 0,
      Hsl => 1,
      Rgb => 2,
      HslLinear => 3,
      RgbLinear => 4
   );
   for CompositionColorSpace'Size use 32;
   
   type CompositionColorSpace_Ptr is access CompositionColorSpace;
   
   type CompositionCompositeMode is (
      Inherit,
      SourceOver,
      DestinationInvert,
      MinBlend
   );
   for CompositionCompositeMode use (
      Inherit => 0,
      SourceOver => 1,
      DestinationInvert => 2,
      MinBlend => 3
   );
   for CompositionCompositeMode'Size use 32;
   
   type CompositionCompositeMode_Ptr is access CompositionCompositeMode;
   
   type CompositionDropShadowSourcePolicy is (
      Default,
      InheritFromVisualContent
   );
   for CompositionDropShadowSourcePolicy use (
      Default => 0,
      InheritFromVisualContent => 1
   );
   for CompositionDropShadowSourcePolicy'Size use 32;
   
   type CompositionDropShadowSourcePolicy_Ptr is access CompositionDropShadowSourcePolicy;
   
   type CompositionEffectFactoryLoadStatus is (
      Other,
      Success,
      EffectTooComplex,
      Pending
   );
   for CompositionEffectFactoryLoadStatus use (
      Other => -1,
      Success => 0,
      EffectTooComplex => 1,
      Pending => 2
   );
   for CompositionEffectFactoryLoadStatus'Size use 32;
   
   type CompositionEffectFactoryLoadStatus_Ptr is access CompositionEffectFactoryLoadStatus;
   
   type CompositionGetValueStatus is (
      Succeeded,
      TypeMismatch,
      NotFound
   );
   for CompositionGetValueStatus use (
      Succeeded => 0,
      TypeMismatch => 1,
      NotFound => 2
   );
   for CompositionGetValueStatus'Size use 32;
   
   type CompositionGetValueStatus_Ptr is access CompositionGetValueStatus;
   
   type CompositionGradientExtendMode is (
      Clamp,
      Wrap,
      Mirror
   );
   for CompositionGradientExtendMode use (
      Clamp => 0,
      Wrap => 1,
      Mirror => 2
   );
   for CompositionGradientExtendMode'Size use 32;
   
   type CompositionGradientExtendMode_Ptr is access CompositionGradientExtendMode;
   
   type CompositionStretch is (
      None,
      Fill,
      Uniform,
      UniformToFill
   );
   for CompositionStretch use (
      None => 0,
      Fill => 1,
      Uniform => 2,
      UniformToFill => 3
   );
   for CompositionStretch'Size use 32;
   
   type CompositionStretch_Ptr is access CompositionStretch;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ICompositionCapabilities_add_Changed_Interface;
   type TypedEventHandler_ICompositionCapabilities_add_Changed is access all TypedEventHandler_ICompositionCapabilities_add_Changed_Interface'Class;
   type TypedEventHandler_ICompositionCapabilities_add_Changed_Ptr is access all TypedEventHandler_ICompositionCapabilities_add_Changed;
   type TypedEventHandler_ICompositionCommitBatch_add_Completed_Interface;
   type TypedEventHandler_ICompositionCommitBatch_add_Completed is access all TypedEventHandler_ICompositionCommitBatch_add_Completed_Interface'Class;
   type TypedEventHandler_ICompositionCommitBatch_add_Completed_Ptr is access all TypedEventHandler_ICompositionCommitBatch_add_Completed;
   type TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced_Interface;
   type TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced is access all TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced_Interface'Class;
   type TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced_Ptr is access all TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced;
   type TypedEventHandler_ICompositionScopedBatch_add_Completed_Interface;
   type TypedEventHandler_ICompositionScopedBatch_add_Completed is access all TypedEventHandler_ICompositionScopedBatch_add_Completed_Interface'Class;
   type TypedEventHandler_ICompositionScopedBatch_add_Completed_Ptr is access all TypedEventHandler_ICompositionScopedBatch_add_Completed;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAmbientLight_Interface;
   type IAmbientLight is access all IAmbientLight_Interface'Class;
   type IAmbientLight_Ptr is access all IAmbientLight;
   type IAmbientLight2_Interface;
   type IAmbientLight2 is access all IAmbientLight2_Interface'Class;
   type IAmbientLight2_Ptr is access all IAmbientLight2;
   type IColorKeyFrameAnimation_Interface;
   type IColorKeyFrameAnimation is access all IColorKeyFrameAnimation_Interface'Class;
   type IColorKeyFrameAnimation_Ptr is access all IColorKeyFrameAnimation;
   type ICompositionAnimation_Interface;
   type ICompositionAnimation is access all ICompositionAnimation_Interface'Class;
   type ICompositionAnimation_Ptr is access all ICompositionAnimation;
   type ICompositionAnimation2_Interface;
   type ICompositionAnimation2 is access all ICompositionAnimation2_Interface'Class;
   type ICompositionAnimation2_Ptr is access all ICompositionAnimation2;
   type ICompositionAnimation3_Interface;
   type ICompositionAnimation3 is access all ICompositionAnimation3_Interface'Class;
   type ICompositionAnimation3_Ptr is access all ICompositionAnimation3;
   type IMap_String_String_Interface;
   type IMap_String_String is access all IMap_String_String_Interface'Class;
   type IMap_String_String_Ptr is access all IMap_String_String;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type ICompositionAnimationBase_Interface;
   type ICompositionAnimationBase is access all ICompositionAnimationBase_Interface'Class;
   type ICompositionAnimationBase_Ptr is access all ICompositionAnimationBase;
   type ICompositionAnimationGroup_Interface;
   type ICompositionAnimationGroup is access all ICompositionAnimationGroup_Interface'Class;
   type ICompositionAnimationGroup_Ptr is access all ICompositionAnimationGroup;
   type ICompositionBackdropBrush_Interface;
   type ICompositionBackdropBrush is access all ICompositionBackdropBrush_Interface'Class;
   type ICompositionBackdropBrush_Ptr is access all ICompositionBackdropBrush;
   type ICompositionBatchCompletedEventArgs_Interface;
   type ICompositionBatchCompletedEventArgs is access all ICompositionBatchCompletedEventArgs_Interface'Class;
   type ICompositionBatchCompletedEventArgs_Ptr is access all ICompositionBatchCompletedEventArgs;
   type ICompositionBrush_Interface;
   type ICompositionBrush is access all ICompositionBrush_Interface'Class;
   type ICompositionBrush_Ptr is access all ICompositionBrush;
   type ICompositionCapabilities_Interface;
   type ICompositionCapabilities is access all ICompositionCapabilities_Interface'Class;
   type ICompositionCapabilities_Ptr is access all ICompositionCapabilities;
   type ICompositionCapabilitiesStatics_Interface;
   type ICompositionCapabilitiesStatics is access all ICompositionCapabilitiesStatics_Interface'Class;
   type ICompositionCapabilitiesStatics_Ptr is access all ICompositionCapabilitiesStatics;
   type ICompositionClip_Interface;
   type ICompositionClip is access all ICompositionClip_Interface'Class;
   type ICompositionClip_Ptr is access all ICompositionClip;
   type ICompositionClip2_Interface;
   type ICompositionClip2 is access all ICompositionClip2_Interface'Class;
   type ICompositionClip2_Ptr is access all ICompositionClip2;
   type ICompositionColorBrush_Interface;
   type ICompositionColorBrush is access all ICompositionColorBrush_Interface'Class;
   type ICompositionColorBrush_Ptr is access all ICompositionColorBrush;
   type ICompositionColorGradientStop_Interface;
   type ICompositionColorGradientStop is access all ICompositionColorGradientStop_Interface'Class;
   type ICompositionColorGradientStop_Ptr is access all ICompositionColorGradientStop;
   type ICompositionColorGradientStopCollection_Interface;
   type ICompositionColorGradientStopCollection is access all ICompositionColorGradientStopCollection_Interface'Class;
   type ICompositionColorGradientStopCollection_Ptr is access all ICompositionColorGradientStopCollection;
   type ICompositionCommitBatch_Interface;
   type ICompositionCommitBatch is access all ICompositionCommitBatch_Interface'Class;
   type ICompositionCommitBatch_Ptr is access all ICompositionCommitBatch;
   type ICompositionDrawingSurface_Interface;
   type ICompositionDrawingSurface is access all ICompositionDrawingSurface_Interface'Class;
   type ICompositionDrawingSurface_Ptr is access all ICompositionDrawingSurface;
   type ICompositionDrawingSurface2_Interface;
   type ICompositionDrawingSurface2 is access all ICompositionDrawingSurface2_Interface'Class;
   type ICompositionDrawingSurface2_Ptr is access all ICompositionDrawingSurface2;
   type ICompositionEasingFunction_Interface;
   type ICompositionEasingFunction is access all ICompositionEasingFunction_Interface'Class;
   type ICompositionEasingFunction_Ptr is access all ICompositionEasingFunction;
   type ICompositionEffectBrush_Interface;
   type ICompositionEffectBrush is access all ICompositionEffectBrush_Interface'Class;
   type ICompositionEffectBrush_Ptr is access all ICompositionEffectBrush;
   type ICompositionEffectFactory_Interface;
   type ICompositionEffectFactory is access all ICompositionEffectFactory_Interface'Class;
   type ICompositionEffectFactory_Ptr is access all ICompositionEffectFactory;
   type ICompositionEffectSourceParameter_Interface;
   type ICompositionEffectSourceParameter is access all ICompositionEffectSourceParameter_Interface'Class;
   type ICompositionEffectSourceParameter_Ptr is access all ICompositionEffectSourceParameter;
   type ICompositionEffectSourceParameterFactory_Interface;
   type ICompositionEffectSourceParameterFactory is access all ICompositionEffectSourceParameterFactory_Interface'Class;
   type ICompositionEffectSourceParameterFactory_Ptr is access all ICompositionEffectSourceParameterFactory;
   type ICompositionGradientBrush_Interface;
   type ICompositionGradientBrush is access all ICompositionGradientBrush_Interface'Class;
   type ICompositionGradientBrush_Ptr is access all ICompositionGradientBrush;
   type IIterable_CompositionColorGradientStop_Interface;
   type IIterable_CompositionColorGradientStop is access all IIterable_CompositionColorGradientStop_Interface'Class;
   type IIterable_CompositionColorGradientStop_Ptr is access all IIterable_CompositionColorGradientStop;
   type IVector_CompositionColorGradientStop_Interface;
   type IVector_CompositionColorGradientStop is access all IVector_CompositionColorGradientStop_Interface'Class;
   type IVector_CompositionColorGradientStop_Ptr is access all IVector_CompositionColorGradientStop;
   type ICompositionGraphicsDevice_Interface;
   type ICompositionGraphicsDevice is access all ICompositionGraphicsDevice_Interface'Class;
   type ICompositionGraphicsDevice_Ptr is access all ICompositionGraphicsDevice;
   type ICompositionGraphicsDevice2_Interface;
   type ICompositionGraphicsDevice2 is access all ICompositionGraphicsDevice2_Interface'Class;
   type ICompositionGraphicsDevice2_Ptr is access all ICompositionGraphicsDevice2;
   type ICompositionLight_Interface;
   type ICompositionLight is access all ICompositionLight_Interface'Class;
   type ICompositionLight_Ptr is access all ICompositionLight;
   type ICompositionLight2_Interface;
   type ICompositionLight2 is access all ICompositionLight2_Interface'Class;
   type ICompositionLight2_Ptr is access all ICompositionLight2;
   type ICompositionLinearGradientBrush_Interface;
   type ICompositionLinearGradientBrush is access all ICompositionLinearGradientBrush_Interface'Class;
   type ICompositionLinearGradientBrush_Ptr is access all ICompositionLinearGradientBrush;
   type ICompositionMaskBrush_Interface;
   type ICompositionMaskBrush is access all ICompositionMaskBrush_Interface'Class;
   type ICompositionMaskBrush_Ptr is access all ICompositionMaskBrush;
   type ICompositionNineGridBrush_Interface;
   type ICompositionNineGridBrush is access all ICompositionNineGridBrush_Interface'Class;
   type ICompositionNineGridBrush_Ptr is access all ICompositionNineGridBrush;
   type ICompositionObject_Interface;
   type ICompositionObject is access all ICompositionObject_Interface'Class;
   type ICompositionObject_Ptr is access all ICompositionObject;
   type ICompositionObject2_Interface;
   type ICompositionObject2 is access all ICompositionObject2_Interface'Class;
   type ICompositionObject2_Ptr is access all ICompositionObject2;
   type ICompositionObject3_Interface;
   type ICompositionObject3 is access all ICompositionObject3_Interface'Class;
   type ICompositionObject3_Ptr is access all ICompositionObject3;
   type ICompositionPropertySet_Interface;
   type ICompositionPropertySet is access all ICompositionPropertySet_Interface'Class;
   type ICompositionPropertySet_Ptr is access all ICompositionPropertySet;
   type ICompositionPropertySet2_Interface;
   type ICompositionPropertySet2 is access all ICompositionPropertySet2_Interface'Class;
   type ICompositionPropertySet2_Ptr is access all ICompositionPropertySet2;
   type ICompositionScopedBatch_Interface;
   type ICompositionScopedBatch is access all ICompositionScopedBatch_Interface'Class;
   type ICompositionScopedBatch_Ptr is access all ICompositionScopedBatch;
   type ICompositionShadow_Interface;
   type ICompositionShadow is access all ICompositionShadow_Interface'Class;
   type ICompositionShadow_Ptr is access all ICompositionShadow;
   type ICompositionSurface_Interface;
   type ICompositionSurface is access all ICompositionSurface_Interface'Class;
   type ICompositionSurface_Ptr is access all ICompositionSurface;
   type ICompositionSurfaceBrush_Interface;
   type ICompositionSurfaceBrush is access all ICompositionSurfaceBrush_Interface'Class;
   type ICompositionSurfaceBrush_Ptr is access all ICompositionSurfaceBrush;
   type ICompositionSurfaceBrush2_Interface;
   type ICompositionSurfaceBrush2 is access all ICompositionSurfaceBrush2_Interface'Class;
   type ICompositionSurfaceBrush2_Ptr is access all ICompositionSurfaceBrush2;
   type ICompositionTarget_Interface;
   type ICompositionTarget is access all ICompositionTarget_Interface'Class;
   type ICompositionTarget_Ptr is access all ICompositionTarget;
   type ICompositionVirtualDrawingSurface_Interface;
   type ICompositionVirtualDrawingSurface is access all ICompositionVirtualDrawingSurface_Interface'Class;
   type ICompositionVirtualDrawingSurface_Ptr is access all ICompositionVirtualDrawingSurface;
   type ICompositor_Interface;
   type ICompositor is access all ICompositor_Interface'Class;
   type ICompositor_Ptr is access all ICompositor;
   type ICompositor2_Interface;
   type ICompositor2 is access all ICompositor2_Interface'Class;
   type ICompositor2_Ptr is access all ICompositor2;
   type IIterable_CompositionAnimation_Interface;
   type IIterable_CompositionAnimation is access all IIterable_CompositionAnimation_Interface'Class;
   type IIterable_CompositionAnimation_Ptr is access all IIterable_CompositionAnimation;
   type ICompositor3_Interface;
   type ICompositor3 is access all ICompositor3_Interface'Class;
   type ICompositor3_Ptr is access all ICompositor3;
   type ICompositor4_Interface;
   type ICompositor4 is access all ICompositor4_Interface'Class;
   type ICompositor4_Ptr is access all ICompositor4;
   type IContainerVisual_Interface;
   type IContainerVisual is access all IContainerVisual_Interface'Class;
   type IContainerVisual_Ptr is access all IContainerVisual;
   type ICubicBezierEasingFunction_Interface;
   type ICubicBezierEasingFunction is access all ICubicBezierEasingFunction_Interface'Class;
   type ICubicBezierEasingFunction_Ptr is access all ICubicBezierEasingFunction;
   type IDistantLight_Interface;
   type IDistantLight is access all IDistantLight_Interface'Class;
   type IDistantLight_Ptr is access all IDistantLight;
   type IDistantLight2_Interface;
   type IDistantLight2 is access all IDistantLight2_Interface'Class;
   type IDistantLight2_Ptr is access all IDistantLight2;
   type IDropShadow_Interface;
   type IDropShadow is access all IDropShadow_Interface'Class;
   type IDropShadow_Ptr is access all IDropShadow;
   type IDropShadow2_Interface;
   type IDropShadow2 is access all IDropShadow2_Interface'Class;
   type IDropShadow2_Ptr is access all IDropShadow2;
   type IExpressionAnimation_Interface;
   type IExpressionAnimation is access all IExpressionAnimation_Interface'Class;
   type IExpressionAnimation_Ptr is access all IExpressionAnimation;
   type IImplicitAnimationCollection_Interface;
   type IImplicitAnimationCollection is access all IImplicitAnimationCollection_Interface'Class;
   type IImplicitAnimationCollection_Ptr is access all IImplicitAnimationCollection;
   type IIterable_ICompositionAnimationBase_Interface;
   type IIterable_ICompositionAnimationBase is access all IIterable_ICompositionAnimationBase_Interface'Class;
   type IIterable_ICompositionAnimationBase_Ptr is access all IIterable_ICompositionAnimationBase;
   type IMap_String_ICompositionAnimationBase_Interface;
   type IMap_String_ICompositionAnimationBase is access all IMap_String_ICompositionAnimationBase_Interface'Class;
   type IMap_String_ICompositionAnimationBase_Ptr is access all IMap_String_ICompositionAnimationBase;
   type IInsetClip_Interface;
   type IInsetClip is access all IInsetClip_Interface'Class;
   type IInsetClip_Ptr is access all IInsetClip;
   type IKeyFrameAnimation_Interface;
   type IKeyFrameAnimation is access all IKeyFrameAnimation_Interface'Class;
   type IKeyFrameAnimation_Ptr is access all IKeyFrameAnimation;
   type IKeyFrameAnimation2_Interface;
   type IKeyFrameAnimation2 is access all IKeyFrameAnimation2_Interface'Class;
   type IKeyFrameAnimation2_Ptr is access all IKeyFrameAnimation2;
   type IKeyFrameAnimation3_Interface;
   type IKeyFrameAnimation3 is access all IKeyFrameAnimation3_Interface'Class;
   type IKeyFrameAnimation3_Ptr is access all IKeyFrameAnimation3;
   type ILayerVisual_Interface;
   type ILayerVisual is access all ILayerVisual_Interface'Class;
   type ILayerVisual_Ptr is access all ILayerVisual;
   type ILayerVisual2_Interface;
   type ILayerVisual2 is access all ILayerVisual2_Interface'Class;
   type ILayerVisual2_Ptr is access all ILayerVisual2;
   type ILinearEasingFunction_Interface;
   type ILinearEasingFunction is access all ILinearEasingFunction_Interface'Class;
   type ILinearEasingFunction_Ptr is access all ILinearEasingFunction;
   type INaturalMotionAnimation_Interface;
   type INaturalMotionAnimation is access all INaturalMotionAnimation_Interface'Class;
   type INaturalMotionAnimation_Ptr is access all INaturalMotionAnimation;
   type IPointLight_Interface;
   type IPointLight is access all IPointLight_Interface'Class;
   type IPointLight_Ptr is access all IPointLight;
   type IPointLight2_Interface;
   type IPointLight2 is access all IPointLight2_Interface'Class;
   type IPointLight2_Ptr is access all IPointLight2;
   type IQuaternionKeyFrameAnimation_Interface;
   type IQuaternionKeyFrameAnimation is access all IQuaternionKeyFrameAnimation_Interface'Class;
   type IQuaternionKeyFrameAnimation_Ptr is access all IQuaternionKeyFrameAnimation;
   type IRenderingDeviceReplacedEventArgs_Interface;
   type IRenderingDeviceReplacedEventArgs is access all IRenderingDeviceReplacedEventArgs_Interface'Class;
   type IRenderingDeviceReplacedEventArgs_Ptr is access all IRenderingDeviceReplacedEventArgs;
   type IScalarKeyFrameAnimation_Interface;
   type IScalarKeyFrameAnimation is access all IScalarKeyFrameAnimation_Interface'Class;
   type IScalarKeyFrameAnimation_Ptr is access all IScalarKeyFrameAnimation;
   type IScalarNaturalMotionAnimation_Interface;
   type IScalarNaturalMotionAnimation is access all IScalarNaturalMotionAnimation_Interface'Class;
   type IScalarNaturalMotionAnimation_Ptr is access all IScalarNaturalMotionAnimation;
   type ISpotLight_Interface;
   type ISpotLight is access all ISpotLight_Interface'Class;
   type ISpotLight_Ptr is access all ISpotLight;
   type ISpotLight2_Interface;
   type ISpotLight2 is access all ISpotLight2_Interface'Class;
   type ISpotLight2_Ptr is access all ISpotLight2;
   type ISpringScalarNaturalMotionAnimation_Interface;
   type ISpringScalarNaturalMotionAnimation is access all ISpringScalarNaturalMotionAnimation_Interface'Class;
   type ISpringScalarNaturalMotionAnimation_Ptr is access all ISpringScalarNaturalMotionAnimation;
   type ISpringVector2NaturalMotionAnimation_Interface;
   type ISpringVector2NaturalMotionAnimation is access all ISpringVector2NaturalMotionAnimation_Interface'Class;
   type ISpringVector2NaturalMotionAnimation_Ptr is access all ISpringVector2NaturalMotionAnimation;
   type ISpringVector3NaturalMotionAnimation_Interface;
   type ISpringVector3NaturalMotionAnimation is access all ISpringVector3NaturalMotionAnimation_Interface'Class;
   type ISpringVector3NaturalMotionAnimation_Ptr is access all ISpringVector3NaturalMotionAnimation;
   type ISpriteVisual_Interface;
   type ISpriteVisual is access all ISpriteVisual_Interface'Class;
   type ISpriteVisual_Ptr is access all ISpriteVisual;
   type ISpriteVisual2_Interface;
   type ISpriteVisual2 is access all ISpriteVisual2_Interface'Class;
   type ISpriteVisual2_Ptr is access all ISpriteVisual2;
   type IStepEasingFunction_Interface;
   type IStepEasingFunction is access all IStepEasingFunction_Interface'Class;
   type IStepEasingFunction_Ptr is access all IStepEasingFunction;
   type IVector2KeyFrameAnimation_Interface;
   type IVector2KeyFrameAnimation is access all IVector2KeyFrameAnimation_Interface'Class;
   type IVector2KeyFrameAnimation_Ptr is access all IVector2KeyFrameAnimation;
   type IVector2NaturalMotionAnimation_Interface;
   type IVector2NaturalMotionAnimation is access all IVector2NaturalMotionAnimation_Interface'Class;
   type IVector2NaturalMotionAnimation_Ptr is access all IVector2NaturalMotionAnimation;
   type IVector3NaturalMotionAnimation_Interface;
   type IVector3NaturalMotionAnimation is access all IVector3NaturalMotionAnimation_Interface'Class;
   type IVector3NaturalMotionAnimation_Ptr is access all IVector3NaturalMotionAnimation;
   type IVector3KeyFrameAnimation_Interface;
   type IVector3KeyFrameAnimation is access all IVector3KeyFrameAnimation_Interface'Class;
   type IVector3KeyFrameAnimation_Ptr is access all IVector3KeyFrameAnimation;
   type IVector4KeyFrameAnimation_Interface;
   type IVector4KeyFrameAnimation is access all IVector4KeyFrameAnimation_Interface'Class;
   type IVector4KeyFrameAnimation_Ptr is access all IVector4KeyFrameAnimation;
   type IVisual_Interface;
   type IVisual is access all IVisual_Interface'Class;
   type IVisual_Ptr is access all IVisual;
   type IVisual2_Interface;
   type IVisual2 is access all IVisual2_Interface'Class;
   type IVisual2_Ptr is access all IVisual2;
   type IVisualCollection_Interface;
   type IVisualCollection is access all IVisualCollection_Interface'Class;
   type IVisualCollection_Ptr is access all IVisualCollection;
   type IIterable_Visual_Interface;
   type IIterable_Visual is access all IIterable_Visual_Interface'Class;
   type IIterable_Visual_Ptr is access all IIterable_Visual;
   type IVisualUnorderedCollection_Interface;
   type IVisualUnorderedCollection is access all IVisualUnorderedCollection_Interface'Class;
   type IVisualUnorderedCollection_Ptr is access all IVisualUnorderedCollection;
   type ICompositionAnimationFactory_Interface;
   type ICompositionAnimationFactory is access all ICompositionAnimationFactory_Interface'Class;
   type ICompositionAnimationFactory_Ptr is access all ICompositionAnimationFactory;
   type ICompositionBrushFactory_Interface;
   type ICompositionBrushFactory is access all ICompositionBrushFactory_Interface'Class;
   type ICompositionBrushFactory_Ptr is access all ICompositionBrushFactory;
   type ICompositionClipFactory_Interface;
   type ICompositionClipFactory is access all ICompositionClipFactory_Interface'Class;
   type ICompositionClipFactory_Ptr is access all ICompositionClipFactory;
   type ICompositionGradientBrushFactory_Interface;
   type ICompositionGradientBrushFactory is access all ICompositionGradientBrushFactory_Interface'Class;
   type ICompositionGradientBrushFactory_Ptr is access all ICompositionGradientBrushFactory;
   type ICompositionDrawingSurfaceFactory_Interface;
   type ICompositionDrawingSurfaceFactory is access all ICompositionDrawingSurfaceFactory_Interface'Class;
   type ICompositionDrawingSurfaceFactory_Ptr is access all ICompositionDrawingSurfaceFactory;
   type ICompositionEasingFunctionFactory_Interface;
   type ICompositionEasingFunctionFactory is access all ICompositionEasingFunctionFactory_Interface'Class;
   type ICompositionEasingFunctionFactory_Ptr is access all ICompositionEasingFunctionFactory;
   type ICompositionLightFactory_Interface;
   type ICompositionLightFactory is access all ICompositionLightFactory_Interface'Class;
   type ICompositionLightFactory_Ptr is access all ICompositionLightFactory;
   type ICompositionObjectFactory_Interface;
   type ICompositionObjectFactory is access all ICompositionObjectFactory_Interface'Class;
   type ICompositionObjectFactory_Ptr is access all ICompositionObjectFactory;
   type ICompositionShadowFactory_Interface;
   type ICompositionShadowFactory is access all ICompositionShadowFactory_Interface'Class;
   type ICompositionShadowFactory_Ptr is access all ICompositionShadowFactory;
   type ICompositionTargetFactory_Interface;
   type ICompositionTargetFactory is access all ICompositionTargetFactory_Interface'Class;
   type ICompositionTargetFactory_Ptr is access all ICompositionTargetFactory;
   type ICompositionVirtualDrawingSurfaceFactory_Interface;
   type ICompositionVirtualDrawingSurfaceFactory is access all ICompositionVirtualDrawingSurfaceFactory_Interface'Class;
   type ICompositionVirtualDrawingSurfaceFactory_Ptr is access all ICompositionVirtualDrawingSurfaceFactory;
   type IContainerVisualFactory_Interface;
   type IContainerVisualFactory is access all IContainerVisualFactory_Interface'Class;
   type IContainerVisualFactory_Ptr is access all IContainerVisualFactory;
   type IKeyFrameAnimationFactory_Interface;
   type IKeyFrameAnimationFactory is access all IKeyFrameAnimationFactory_Interface'Class;
   type IKeyFrameAnimationFactory_Ptr is access all IKeyFrameAnimationFactory;
   type INaturalMotionAnimationFactory_Interface;
   type INaturalMotionAnimationFactory is access all INaturalMotionAnimationFactory_Interface'Class;
   type INaturalMotionAnimationFactory_Ptr is access all INaturalMotionAnimationFactory;
   type IScalarNaturalMotionAnimationFactory_Interface;
   type IScalarNaturalMotionAnimationFactory is access all IScalarNaturalMotionAnimationFactory_Interface'Class;
   type IScalarNaturalMotionAnimationFactory_Ptr is access all IScalarNaturalMotionAnimationFactory;
   type IVector2NaturalMotionAnimationFactory_Interface;
   type IVector2NaturalMotionAnimationFactory is access all IVector2NaturalMotionAnimationFactory_Interface'Class;
   type IVector2NaturalMotionAnimationFactory_Ptr is access all IVector2NaturalMotionAnimationFactory;
   type IVector3NaturalMotionAnimationFactory_Interface;
   type IVector3NaturalMotionAnimationFactory is access all IVector3NaturalMotionAnimationFactory_Interface'Class;
   type IVector3NaturalMotionAnimationFactory_Ptr is access all IVector3NaturalMotionAnimationFactory;
   type IVisualFactory_Interface;
   type IVisualFactory is access all IVisualFactory_Interface'Class;
   type IVisualFactory_Ptr is access all IVisualFactory;
   type IGraphicsEffectSource_Imported_Interface;
   type IGraphicsEffectSource_Imported is access all IGraphicsEffectSource_Imported_Interface'Class;
   type IGraphicsEffectSource_Imported_Ptr is access all IGraphicsEffectSource_Imported;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAmbientLight : aliased constant Windows.IID := (2759930017, 47044, 18167, (185, 191, 218, 244, 58, 68, 230, 238 ));
   
   type IAmbientLight_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IAmbientLight_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IAmbientLight_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAmbientLight2 : aliased constant Windows.IID := (996452031, 24471, 19604, (134, 229, 4, 45, 211, 134, 178, 125 ));
   
   type IAmbientLight2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Intensity
   (
      This       : access IAmbientLight2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Intensity
   (
      This       : access IAmbientLight2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IColorKeyFrameAnimation : aliased constant Windows.IID := (2477635049, 36357, 17811, (132, 163, 220, 161, 82, 120, 30, 86 ));
   
   type IColorKeyFrameAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InterpolationColorSpace
   (
      This       : access IColorKeyFrameAnimation_Interface
      ; RetVal : access Windows.UI.Composition.CompositionColorSpace
   )
   return Windows.HRESULT is abstract;
   
   function put_InterpolationColorSpace
   (
      This       : access IColorKeyFrameAnimation_Interface
      ; value : Windows.UI.Composition.CompositionColorSpace
   )
   return Windows.HRESULT is abstract;
   
   function InsertKeyFrame
   (
      This       : access IColorKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function InsertKeyFrameWithEasingFunction
   (
      This       : access IColorKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.UI.Color
      ; easingFunction : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionAnimation : aliased constant Windows.IID := (1179405356, 7338, 16481, (155, 64, 225, 63, 222, 21, 3, 202 ));
   
   type ICompositionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function ClearAllParameters
   (
      This       : access ICompositionAnimation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function ClearParameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetColorParameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function SetMatrix3x2Parameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function SetMatrix4x4Parameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   function SetQuaternionParameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function SetReferenceParameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; compositionObject : Windows.UI.Composition.ICompositionObject
   )
   return Windows.HRESULT is abstract;
   
   function SetScalarParameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetVector2Parameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function SetVector3Parameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function SetVector4Parameter
   (
      This       : access ICompositionAnimation_Interface
      ; key : Windows.String
      ; value : Windows.Foundation.Numerics.Vector4
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionAnimation2 : aliased constant Windows.IID := (916152382, 43023, 18760, (147, 227, 237, 35, 251, 56, 198, 203 ));
   
   type ICompositionAnimation2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetBooleanParameter
   (
      This       : access ICompositionAnimation2_Interface
      ; key : Windows.String
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Target
   (
      This       : access ICompositionAnimation2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Target
   (
      This       : access ICompositionAnimation2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionAnimation3 : aliased constant Windows.IID := (3575513869, 32164, 19415, (188, 45, 244, 81, 117, 41, 244, 58 ));
   
   type ICompositionAnimation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InitialValueExpressions
   (
      This       : access ICompositionAnimation3_Interface
      ; RetVal : access Windows.UI.Composition.IMap_String_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_String_String : aliased constant Windows.IID := (4140955392, 18882, 21166, (129, 84, 130, 111, 153, 8, 119, 60 ));
   
   type IMap_String_String_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_String_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_String_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_String_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionAnimationBase : aliased constant Windows.IID := (472656281, 59416, 18643, (166, 221, 215, 140, 130, 248, 172, 233 ));
   
   type ICompositionAnimationBase_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionAnimationGroup : aliased constant Windows.IID := (1585236236, 52500, 19975, (138, 85, 199, 37, 39, 170, 189, 172 ));
   
   type ICompositionAnimationGroup_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Count
   (
      This       : access ICompositionAnimationGroup_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function Add
   (
      This       : access ICompositionAnimationGroup_Interface
      ; value : Windows.UI.Composition.ICompositionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access ICompositionAnimationGroup_Interface
      ; value : Windows.UI.Composition.ICompositionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAll
   (
      This       : access ICompositionAnimationGroup_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionBackdropBrush : aliased constant Windows.IID := (3316428376, 14488, 18846, (141, 127, 34, 78, 145, 40, 106, 93 ));
   
   type ICompositionBackdropBrush_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionBatchCompletedEventArgs : aliased constant Windows.IID := (218159824, 37988, 17674, (165, 98, 46, 38, 152, 176, 168, 18 ));
   
   type ICompositionBatchCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionBrush : aliased constant Windows.IID := (2869786120, 12480, 16617, (181, 104, 182, 10, 107, 209, 251, 70 ));
   
   type ICompositionBrush_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionCapabilities : aliased constant Windows.IID := (2186491198, 46359, 18620, (177, 232, 75, 53, 97, 162, 225, 129 ));
   
   type ICompositionCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function AreEffectsSupported
   (
      This       : access ICompositionCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function AreEffectsFast
   (
      This       : access ICompositionCapabilities_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_Changed
   (
      This       : access ICompositionCapabilities_Interface
      ; handler : TypedEventHandler_ICompositionCapabilities_add_Changed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Changed
   (
      This       : access ICompositionCapabilities_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionCapabilitiesStatics : aliased constant Windows.IID := (4156008558, 25622, 18917, (141, 223, 175, 233, 73, 226, 5, 98 ));
   
   type ICompositionCapabilitiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ICompositionCapabilitiesStatics_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionCapabilities
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionClip : aliased constant Windows.IID := (483207762, 53191, 19150, (153, 131, 20, 107, 184, 235, 106, 60 ));
   
   type ICompositionClip_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionClip2 : aliased constant Windows.IID := (1486086249, 13590, 16609, (137, 224, 91, 169, 36, 146, 114, 53 ));
   
   type ICompositionClip2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnchorPoint
   (
      This       : access ICompositionClip2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_AnchorPoint
   (
      This       : access ICompositionClip2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterPoint
   (
      This       : access ICompositionClip2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterPoint
   (
      This       : access ICompositionClip2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access ICompositionClip2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access ICompositionClip2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngle
   (
      This       : access ICompositionClip2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngle
   (
      This       : access ICompositionClip2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngleInDegrees
   (
      This       : access ICompositionClip2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngleInDegrees
   (
      This       : access ICompositionClip2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access ICompositionClip2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_Scale
   (
      This       : access ICompositionClip2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformMatrix
   (
      This       : access ICompositionClip2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function put_TransformMatrix
   (
      This       : access ICompositionClip2_Interface
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionColorBrush : aliased constant Windows.IID := (723930206, 48949, 18481, (134, 66, 207, 112, 194, 15, 255, 47 ));
   
   type ICompositionColorBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access ICompositionColorBrush_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access ICompositionColorBrush_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionColorGradientStop : aliased constant Windows.IID := (1862322834, 51201, 20033, (154, 143, 165, 62, 32, 245, 119, 120 ));
   
   type ICompositionColorGradientStop_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access ICompositionColorGradientStop_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access ICompositionColorGradientStop_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access ICompositionColorGradientStop_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access ICompositionColorGradientStop_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionColorGradientStopCollection : aliased constant Windows.IID := (2669486316, 31492, 19229, (144, 188, 159, 163, 44, 12, 253, 38 ));
   
   type ICompositionColorGradientStopCollection_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionCommitBatch : aliased constant Windows.IID := (218159824, 51719, 17408, (140, 142, 203, 93, 176, 133, 89, 204 ));
   
   type ICompositionCommitBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsActive
   (
      This       : access ICompositionCommitBatch_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnded
   (
      This       : access ICompositionCommitBatch_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access ICompositionCommitBatch_Interface
      ; handler : TypedEventHandler_ICompositionCommitBatch_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access ICompositionCommitBatch_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionDrawingSurface : aliased constant Windows.IID := (2707866368, 64208, 19729, (158, 103, 228, 51, 22, 47, 244, 158 ));
   
   type ICompositionDrawingSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlphaMode
   (
      This       : access ICompositionDrawingSurface_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXAlphaMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PixelFormat
   (
      This       : access ICompositionDrawingSurface_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access ICompositionDrawingSurface_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionDrawingSurface2 : aliased constant Windows.IID := (4207995019, 58196, 17640, (142, 61, 196, 136, 13, 90, 33, 63 ));
   
   type ICompositionDrawingSurface2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SizeInt32
   (
      This       : access ICompositionDrawingSurface2_Interface
      ; RetVal : access Windows.Graphics.SizeInt32
   )
   return Windows.HRESULT is abstract;
   
   function Resize
   (
      This       : access ICompositionDrawingSurface2_Interface
      ; sizePixels : Windows.Graphics.SizeInt32
   )
   return Windows.HRESULT is abstract;
   
   function Scroll
   (
      This       : access ICompositionDrawingSurface2_Interface
      ; offset : Windows.Graphics.PointInt32
   )
   return Windows.HRESULT is abstract;
   
   function ScrollRect
   (
      This       : access ICompositionDrawingSurface2_Interface
      ; offset : Windows.Graphics.PointInt32
      ; scrollRect : Windows.Graphics.RectInt32
   )
   return Windows.HRESULT is abstract;
   
   function ScrollWithClip
   (
      This       : access ICompositionDrawingSurface2_Interface
      ; offset : Windows.Graphics.PointInt32
      ; clipRect : Windows.Graphics.RectInt32
   )
   return Windows.HRESULT is abstract;
   
   function ScrollRectWithClip
   (
      This       : access ICompositionDrawingSurface2_Interface
      ; offset : Windows.Graphics.PointInt32
      ; clipRect : Windows.Graphics.RectInt32
      ; scrollRect : Windows.Graphics.RectInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionEasingFunction : aliased constant Windows.IID := (1363534678, 49017, 20136, (140, 194, 107, 91, 71, 46, 108, 154 ));
   
   type ICompositionEasingFunction_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionEffectBrush : aliased constant Windows.IID := (3212802398, 33740, 17599, (164, 71, 62, 60, 7, 23, 137, 236 ));
   
   type ICompositionEffectBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSourceParameter
   (
      This       : access ICompositionEffectBrush_Interface
      ; name : Windows.String
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function SetSourceParameter
   (
      This       : access ICompositionEffectBrush_Interface
      ; name : Windows.String
      ; source : Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionEffectFactory : aliased constant Windows.IID := (3193316527, 47742, 17680, (152, 80, 65, 192, 180, 255, 116, 223 ));
   
   type ICompositionEffectFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateBrush
   (
      This       : access ICompositionEffectFactory_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionEffectBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access ICompositionEffectFactory_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function get_LoadStatus
   (
      This       : access ICompositionEffectFactory_Interface
      ; RetVal : access Windows.UI.Composition.CompositionEffectFactoryLoadStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionEffectSourceParameter : aliased constant Windows.IID := (2240459066, 12946, 20046, (179, 187, 43, 108, 101, 68, 166, 238 ));
   
   type ICompositionEffectSourceParameter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access ICompositionEffectSourceParameter_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionEffectSourceParameterFactory : aliased constant Windows.IID := (3017405046, 43939, 18212, (172, 243, 208, 57, 116, 100, 219, 28 ));
   
   type ICompositionEffectSourceParameterFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICompositionEffectSourceParameterFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.UI.Composition.ICompositionEffectSourceParameter
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionGradientBrush : aliased constant Windows.IID := (496437728, 65478, 19470, (169, 171, 52, 20, 77, 76, 144, 152 ));
   
   type ICompositionGradientBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnchorPoint
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_AnchorPoint
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterPoint
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterPoint
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_ColorStops
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionColorGradientStopCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendMode
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.UI.Composition.CompositionGradientExtendMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ExtendMode
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.UI.Composition.CompositionGradientExtendMode
   )
   return Windows.HRESULT is abstract;
   
   function get_InterpolationSpace
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.UI.Composition.CompositionColorSpace
   )
   return Windows.HRESULT is abstract;
   
   function put_InterpolationSpace
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.UI.Composition.CompositionColorSpace
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngle
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngle
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngleInDegrees
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngleInDegrees
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_Scale
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformMatrix
   (
      This       : access ICompositionGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function put_TransformMatrix
   (
      This       : access ICompositionGradientBrush_Interface
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_CompositionColorGradientStop : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_CompositionColorGradientStop_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_CompositionColorGradientStop_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_CompositionColorGradientStop : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IVector_CompositionColorGradientStop_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; value : Windows.UI.Composition.ICompositionColorGradientStop
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; value : Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_CompositionColorGradientStop_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_CompositionColorGradientStop_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Composition.ICompositionColorGradientStop_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_CompositionColorGradientStop_Interface
      ; items : Windows.UI.Composition.ICompositionColorGradientStop_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionGraphicsDevice : aliased constant Windows.IID := (4213360353, 32930, 18023, (153, 54, 219, 234, 246, 238, 254, 149 ));
   
   type ICompositionGraphicsDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDrawingSurface
   (
      This       : access ICompositionGraphicsDevice_Interface
      ; sizePixels : Windows.Foundation.Size
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
      ; alphaMode : Windows.Graphics.DirectX.DirectXAlphaMode
      ; RetVal : access Windows.UI.Composition.ICompositionDrawingSurface
   )
   return Windows.HRESULT is abstract;
   
   function add_RenderingDeviceReplaced
   (
      This       : access ICompositionGraphicsDevice_Interface
      ; handler : TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RenderingDeviceReplaced
   (
      This       : access ICompositionGraphicsDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionGraphicsDevice2 : aliased constant Windows.IID := (263765494, 49392, 19404, (159, 184, 8, 73, 130, 73, 13, 125 ));
   
   type ICompositionGraphicsDevice2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDrawingSurface2
   (
      This       : access ICompositionGraphicsDevice2_Interface
      ; sizePixels : Windows.Graphics.SizeInt32
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
      ; alphaMode : Windows.Graphics.DirectX.DirectXAlphaMode
      ; RetVal : access Windows.UI.Composition.ICompositionDrawingSurface
   )
   return Windows.HRESULT is abstract;
   
   function CreateVirtualDrawingSurface
   (
      This       : access ICompositionGraphicsDevice2_Interface
      ; sizePixels : Windows.Graphics.SizeInt32
      ; pixelFormat : Windows.Graphics.DirectX.DirectXPixelFormat
      ; alphaMode : Windows.Graphics.DirectX.DirectXAlphaMode
      ; RetVal : access Windows.UI.Composition.ICompositionVirtualDrawingSurface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionLight : aliased constant Windows.IID := (1101453250, 11869, 19393, (176, 158, 143, 10, 3, 227, 216, 211 ));
   
   type ICompositionLight_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Targets
   (
      This       : access ICompositionLight_Interface
      ; RetVal : access Windows.UI.Composition.IVisualUnorderedCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionLight2 : aliased constant Windows.IID := (2814171762, 62301, 16989, (155, 152, 35, 244, 32, 95, 102, 105 ));
   
   type ICompositionLight2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExclusionsFromTargets
   (
      This       : access ICompositionLight2_Interface
      ; RetVal : access Windows.UI.Composition.IVisualUnorderedCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionLinearGradientBrush : aliased constant Windows.IID := (2554053913, 43483, 16700, (162, 216, 42, 144, 86, 252, 82, 94 ));
   
   type ICompositionLinearGradientBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EndPoint
   (
      This       : access ICompositionLinearGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_EndPoint
   (
      This       : access ICompositionLinearGradientBrush_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_StartPoint
   (
      This       : access ICompositionLinearGradientBrush_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_StartPoint
   (
      This       : access ICompositionLinearGradientBrush_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionMaskBrush : aliased constant Windows.IID := (1378676894, 48747, 20289, (190, 73, 249, 34, 109, 71, 27, 74 ));
   
   type ICompositionMaskBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Mask
   (
      This       : access ICompositionMaskBrush_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Mask
   (
      This       : access ICompositionMaskBrush_Interface
      ; value : Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access ICompositionMaskBrush_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access ICompositionMaskBrush_Interface
      ; value : Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionNineGridBrush : aliased constant Windows.IID := (4065416420, 48268, 19431, (184, 15, 134, 133, 184, 60, 1, 134 ));
   
   type ICompositionNineGridBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BottomInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_BottomInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_BottomInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_BottomInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCenterHollow
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCenterHollow
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_LeftInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_LeftInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RightInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RightInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RightInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RightInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Source
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_TopInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_TopInset
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_TopInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_TopInsetScale
   (
      This       : access ICompositionNineGridBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetInsets
   (
      This       : access ICompositionNineGridBrush_Interface
      ; inset : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetInsetsWithValues
   (
      This       : access ICompositionNineGridBrush_Interface
      ; left : Windows.Single
      ; top : Windows.Single
      ; right : Windows.Single
      ; bottom : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetInsetScales
   (
      This       : access ICompositionNineGridBrush_Interface
      ; scale : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetInsetScalesWithValues
   (
      This       : access ICompositionNineGridBrush_Interface
      ; left : Windows.Single
      ; top : Windows.Single
      ; right : Windows.Single
      ; bottom : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionObject : aliased constant Windows.IID := (3165957445, 30217, 17744, (147, 79, 22, 0, 42, 104, 253, 237 ));
   
   type ICompositionObject_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Compositor
   (
      This       : access ICompositionObject_Interface
      ; RetVal : access Windows.UI.Composition.ICompositor
   )
   return Windows.HRESULT is abstract;
   
   function get_Dispatcher
   (
      This       : access ICompositionObject_Interface
      ; RetVal : access Windows.UI.Core.ICoreDispatcher
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access ICompositionObject_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function StartAnimation
   (
      This       : access ICompositionObject_Interface
      ; propertyName : Windows.String
      ; animation : Windows.UI.Composition.ICompositionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function StopAnimation
   (
      This       : access ICompositionObject_Interface
      ; propertyName : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionObject2 : aliased constant Windows.IID := (4018622113, 23807, 19304, (158, 48, 161, 81, 157, 8, 186, 3 ));
   
   type ICompositionObject2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Comment
   (
      This       : access ICompositionObject2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Comment
   (
      This       : access ICompositionObject2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ImplicitAnimations
   (
      This       : access ICompositionObject2_Interface
      ; RetVal : access Windows.UI.Composition.IImplicitAnimationCollection
   )
   return Windows.HRESULT is abstract;
   
   function put_ImplicitAnimations
   (
      This       : access ICompositionObject2_Interface
      ; value : Windows.UI.Composition.IImplicitAnimationCollection
   )
   return Windows.HRESULT is abstract;
   
   function StartAnimationGroup
   (
      This       : access ICompositionObject2_Interface
      ; value : Windows.UI.Composition.ICompositionAnimationBase
   )
   return Windows.HRESULT is abstract;
   
   function StopAnimationGroup
   (
      This       : access ICompositionObject2_Interface
      ; value : Windows.UI.Composition.ICompositionAnimationBase
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionObject3 : aliased constant Windows.IID := (1271036197, 56013, 19698, (152, 177, 152, 107, 118, 231, 235, 230 ));
   
   type ICompositionObject3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DispatcherQueue
   (
      This       : access ICompositionObject3_Interface
      ; RetVal : access Windows.System.IDispatcherQueue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionPropertySet : aliased constant Windows.IID := (3386298882, 24423, 17491, (145, 23, 158, 173, 212, 48, 211, 194 ));
   
   type ICompositionPropertySet_Interface is interface and Windows.IInspectable_Interface;
   
   function InsertColor
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function InsertMatrix3x2
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function InsertMatrix4x4
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   function InsertQuaternion
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function InsertScalar
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function InsertVector2
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function InsertVector3
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function InsertVector4
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : Windows.Foundation.Numerics.Vector4
   )
   return Windows.HRESULT is abstract;
   
   function TryGetColor
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.UI.Color
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   function TryGetMatrix3x2
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Foundation.Numerics.Matrix3x2
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   function TryGetMatrix4x4
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Foundation.Numerics.Matrix4x4
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   function TryGetQuaternion
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Foundation.Numerics.Quaternion
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   function TryGetScalar
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Single
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   function TryGetVector2
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Foundation.Numerics.Vector2
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   function TryGetVector3
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   function TryGetVector4
   (
      This       : access ICompositionPropertySet_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Foundation.Numerics.Vector4
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionPropertySet2 : aliased constant Windows.IID := (3732960030, 41489, 17493, (136, 128, 125, 15, 63, 106, 68, 253 ));
   
   type ICompositionPropertySet2_Interface is interface and Windows.IInspectable_Interface;
   
   function InsertBoolean
   (
      This       : access ICompositionPropertySet2_Interface
      ; propertyName : Windows.String
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function TryGetBoolean
   (
      This       : access ICompositionPropertySet2_Interface
      ; propertyName : Windows.String
      ; value : access Windows.Boolean
      ; RetVal : access Windows.UI.Composition.CompositionGetValueStatus
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionScopedBatch : aliased constant Windows.IID := (218159824, 64263, 18173, (140, 114, 98, 128, 209, 163, 209, 221 ));
   
   type ICompositionScopedBatch_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsActive
   (
      This       : access ICompositionScopedBatch_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnded
   (
      This       : access ICompositionScopedBatch_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function End_x
   (
      This       : access ICompositionScopedBatch_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Resume
   (
      This       : access ICompositionScopedBatch_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Suspend
   (
      This       : access ICompositionScopedBatch_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Completed
   (
      This       : access ICompositionScopedBatch_Interface
      ; handler : TypedEventHandler_ICompositionScopedBatch_add_Completed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Completed
   (
      This       : access ICompositionScopedBatch_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionShadow : aliased constant Windows.IID := (849236706, 17205, 18892, (177, 74, 55, 120, 45, 16, 240, 196 ));
   
   type ICompositionShadow_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionSurface : aliased constant Windows.IID := (354898957, 17095, 18342, (164, 8, 102, 143, 121, 169, 13, 251 ));
   
   type ICompositionSurface_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionSurfaceBrush : aliased constant Windows.IID := (2902551929, 7756, 19469, (156, 41, 131, 51, 140, 135, 193, 98 ));
   
   type ICompositionSurfaceBrush_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BitmapInterpolationMode
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; RetVal : access Windows.UI.Composition.CompositionBitmapInterpolationMode
   )
   return Windows.HRESULT is abstract;
   
   function put_BitmapInterpolationMode
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; value : Windows.UI.Composition.CompositionBitmapInterpolationMode
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalAlignmentRatio
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_HorizontalAlignmentRatio
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Stretch
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; RetVal : access Windows.UI.Composition.CompositionStretch
   )
   return Windows.HRESULT is abstract;
   
   function put_Stretch
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; value : Windows.UI.Composition.CompositionStretch
   )
   return Windows.HRESULT is abstract;
   
   function get_Surface
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionSurface
   )
   return Windows.HRESULT is abstract;
   
   function put_Surface
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; value : Windows.UI.Composition.ICompositionSurface
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalAlignmentRatio
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_VerticalAlignmentRatio
   (
      This       : access ICompositionSurfaceBrush_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionSurfaceBrush2 : aliased constant Windows.IID := (3530650837, 25845, 18066, (157, 199, 113, 182, 29, 126, 88, 128 ));
   
   type ICompositionSurfaceBrush2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnchorPoint
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_AnchorPoint
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterPoint
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterPoint
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngle
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngle
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngleInDegrees
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngleInDegrees
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_Scale
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformMatrix
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   function put_TransformMatrix
   (
      This       : access ICompositionSurfaceBrush2_Interface
      ; value : Windows.Foundation.Numerics.Matrix3x2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionTarget : aliased constant Windows.IID := (2713626810, 55078, 18019, (129, 41, 107, 94, 121, 39, 255, 166 ));
   
   type ICompositionTarget_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Root
   (
      This       : access ICompositionTarget_Interface
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function put_Root
   (
      This       : access ICompositionTarget_Interface
      ; value : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionVirtualDrawingSurface : aliased constant Windows.IID := (2848163035, 34624, 20372, (139, 157, 182, 133, 33, 231, 134, 61 ));
   
   type ICompositionVirtualDrawingSurface_Interface is interface and Windows.IInspectable_Interface;
   
   function Trim
   (
      This       : access ICompositionVirtualDrawingSurface_Interface
      ; rects : Windows.Graphics.RectInt32_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositor : aliased constant Windows.IID := (3020147280, 32652, 20099, (152, 95, 204, 69, 6, 0, 54, 216 ));
   
   type ICompositor_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateColorKeyFrameAnimation
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IColorKeyFrameAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateColorBrush
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionColorBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreateColorBrushWithColor
   (
      This       : access ICompositor_Interface
      ; color : Windows.UI.Color
      ; RetVal : access Windows.UI.Composition.ICompositionColorBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreateContainerVisual
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IContainerVisual
   )
   return Windows.HRESULT is abstract;
   
   function CreateCubicBezierEasingFunction
   (
      This       : access ICompositor_Interface
      ; controlPoint1 : Windows.Foundation.Numerics.Vector2
      ; controlPoint2 : Windows.Foundation.Numerics.Vector2
      ; RetVal : access Windows.UI.Composition.ICubicBezierEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   function CreateEffectFactory
   (
      This       : access ICompositor_Interface
      ; graphicsEffect : Windows.Graphics.Effects.IGraphicsEffect
      ; RetVal : access Windows.UI.Composition.ICompositionEffectFactory
   )
   return Windows.HRESULT is abstract;
   
   function CreateEffectFactoryWithProperties
   (
      This       : access ICompositor_Interface
      ; graphicsEffect : Windows.Graphics.Effects.IGraphicsEffect
      ; animatableProperties : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.UI.Composition.ICompositionEffectFactory
   )
   return Windows.HRESULT is abstract;
   
   function CreateExpressionAnimation
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateExpressionAnimationWithExpression
   (
      This       : access ICompositor_Interface
      ; expression : Windows.String
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateInsetClip
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IInsetClip
   )
   return Windows.HRESULT is abstract;
   
   function CreateInsetClipWithInsets
   (
      This       : access ICompositor_Interface
      ; leftInset : Windows.Single
      ; topInset : Windows.Single
      ; rightInset : Windows.Single
      ; bottomInset : Windows.Single
      ; RetVal : access Windows.UI.Composition.IInsetClip
   )
   return Windows.HRESULT is abstract;
   
   function CreateLinearEasingFunction
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.ILinearEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   function CreatePropertySet
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function CreateQuaternionKeyFrameAnimation
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IQuaternionKeyFrameAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateScalarKeyFrameAnimation
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IScalarKeyFrameAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateScopedBatch
   (
      This       : access ICompositor_Interface
      ; batchType : Windows.UI.Composition.CompositionBatchTypes
      ; RetVal : access Windows.UI.Composition.ICompositionScopedBatch
   )
   return Windows.HRESULT is abstract;
   
   function CreateSpriteVisual
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.ISpriteVisual
   )
   return Windows.HRESULT is abstract;
   
   function CreateSurfaceBrush
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionSurfaceBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreateSurfaceBrushWithSurface
   (
      This       : access ICompositor_Interface
      ; surface : Windows.UI.Composition.ICompositionSurface
      ; RetVal : access Windows.UI.Composition.ICompositionSurfaceBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreateTargetForCurrentView
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionTarget
   )
   return Windows.HRESULT is abstract;
   
   function CreateVector2KeyFrameAnimation
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IVector2KeyFrameAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateVector3KeyFrameAnimation
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IVector3KeyFrameAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateVector4KeyFrameAnimation
   (
      This       : access ICompositor_Interface
      ; RetVal : access Windows.UI.Composition.IVector4KeyFrameAnimation
   )
   return Windows.HRESULT is abstract;
   
   function GetCommitBatch
   (
      This       : access ICompositor_Interface
      ; batchType : Windows.UI.Composition.CompositionBatchTypes
      ; RetVal : access Windows.UI.Composition.ICompositionCommitBatch
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositor2 : aliased constant Windows.IID := (1934655964, 24100, 17882, (163, 143, 227, 44, 195, 73, 169, 160 ));
   
   type ICompositor2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAmbientLight
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.IAmbientLight
   )
   return Windows.HRESULT is abstract;
   
   function CreateAnimationGroup
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionAnimationGroup
   )
   return Windows.HRESULT is abstract;
   
   function CreateBackdropBrush
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBackdropBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreateDistantLight
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.IDistantLight
   )
   return Windows.HRESULT is abstract;
   
   function CreateDropShadow
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.IDropShadow
   )
   return Windows.HRESULT is abstract;
   
   function CreateImplicitAnimationCollection
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.IImplicitAnimationCollection
   )
   return Windows.HRESULT is abstract;
   
   function CreateLayerVisual
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.ILayerVisual
   )
   return Windows.HRESULT is abstract;
   
   function CreateMaskBrush
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionMaskBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreateNineGridBrush
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionNineGridBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreatePointLight
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.IPointLight
   )
   return Windows.HRESULT is abstract;
   
   function CreateSpotLight
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.ISpotLight
   )
   return Windows.HRESULT is abstract;
   
   function CreateStepEasingFunction
   (
      This       : access ICompositor2_Interface
      ; RetVal : access Windows.UI.Composition.IStepEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   function CreateStepEasingFunctionWithStepCount
   (
      This       : access ICompositor2_Interface
      ; stepCount : Windows.Int32
      ; RetVal : access Windows.UI.Composition.IStepEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_CompositionAnimation : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_CompositionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_CompositionAnimation_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositor3 : aliased constant Windows.IID := (3386740464, 28337, 20028, (166, 88, 103, 93, 156, 100, 212, 171 ));
   
   type ICompositor3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateHostBackdropBrush
   (
      This       : access ICompositor3_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBackdropBrush
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositor4 : aliased constant Windows.IID := (2923947914, 30992, 17445, (164, 130, 160, 91, 117, 138, 220, 233 ));
   
   type ICompositor4_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateColorGradientStop
   (
      This       : access ICompositor4_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function CreateColorGradientStopWithOffsetAndColor
   (
      This       : access ICompositor4_Interface
      ; offset : Windows.Single
      ; color : Windows.UI.Color
      ; RetVal : access Windows.UI.Composition.ICompositionColorGradientStop
   )
   return Windows.HRESULT is abstract;
   
   function CreateLinearGradientBrush
   (
      This       : access ICompositor4_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionLinearGradientBrush
   )
   return Windows.HRESULT is abstract;
   
   function CreateSpringScalarAnimation
   (
      This       : access ICompositor4_Interface
      ; RetVal : access Windows.UI.Composition.ISpringScalarNaturalMotionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateSpringVector2Animation
   (
      This       : access ICompositor4_Interface
      ; RetVal : access Windows.UI.Composition.ISpringVector2NaturalMotionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function CreateSpringVector3Animation
   (
      This       : access ICompositor4_Interface
      ; RetVal : access Windows.UI.Composition.ISpringVector3NaturalMotionAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContainerVisual : aliased constant Windows.IID := (49724532, 60704, 18291, (175, 230, 212, 155, 74, 147, 219, 50 ));
   
   type IContainerVisual_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Children
   (
      This       : access IContainerVisual_Interface
      ; RetVal : access Windows.UI.Composition.IVisualCollection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICubicBezierEasingFunction : aliased constant Windows.IID := (842335846, 49640, 17657, (150, 184, 201, 138, 207, 10, 230, 152 ));
   
   type ICubicBezierEasingFunction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ControlPoint1
   (
      This       : access ICubicBezierEasingFunction_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlPoint2
   (
      This       : access ICubicBezierEasingFunction_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDistantLight : aliased constant Windows.IID := (831322876, 23779, 19285, (171, 93, 7, 160, 3, 83, 172, 153 ));
   
   type IDistantLight_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IDistantLight_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IDistantLight_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_CoordinateSpace
   (
      This       : access IDistantLight_Interface
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function put_CoordinateSpace
   (
      This       : access IDistantLight_Interface
      ; value : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function get_Direction
   (
      This       : access IDistantLight_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Direction
   (
      This       : access IDistantLight_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDistantLight2 : aliased constant Windows.IID := (3687688732, 10571, 18647, (182, 14, 118, 223, 100, 170, 57, 43 ));
   
   type IDistantLight2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Intensity
   (
      This       : access IDistantLight2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Intensity
   (
      This       : access IDistantLight2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDropShadow : aliased constant Windows.IID := (3415702535, 41300, 18513, (133, 231, 168, 146, 76, 132, 250, 216 ));
   
   type IDropShadow_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BlurRadius
   (
      This       : access IDropShadow_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_BlurRadius
   (
      This       : access IDropShadow_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Color
   (
      This       : access IDropShadow_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IDropShadow_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Mask
   (
      This       : access IDropShadow_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Mask
   (
      This       : access IDropShadow_Interface
      ; value : Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access IDropShadow_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access IDropShadow_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Opacity
   (
      This       : access IDropShadow_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Opacity
   (
      This       : access IDropShadow_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDropShadow2 : aliased constant Windows.IID := (1816271036, 5561, 19501, (141, 74, 7, 103, 223, 17, 151, 122 ));
   
   type IDropShadow2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourcePolicy
   (
      This       : access IDropShadow2_Interface
      ; RetVal : access Windows.UI.Composition.CompositionDropShadowSourcePolicy
   )
   return Windows.HRESULT is abstract;
   
   function put_SourcePolicy
   (
      This       : access IDropShadow2_Interface
      ; value : Windows.UI.Composition.CompositionDropShadowSourcePolicy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IExpressionAnimation : aliased constant Windows.IID := (1791775793, 32061, 19443, (171, 182, 244, 75, 220, 72, 136, 193 ));
   
   type IExpressionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Expression
   (
      This       : access IExpressionAnimation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Expression
   (
      This       : access IExpressionAnimation_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IImplicitAnimationCollection : aliased constant Windows.IID := (93889535, 2706, 19613, (164, 39, 178, 85, 25, 37, 13, 191 ));
   
   type IImplicitAnimationCollection_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICompositionAnimationBase : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_ICompositionAnimationBase_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICompositionAnimationBase_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_String_ICompositionAnimationBase : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IMap_String_ICompositionAnimationBase_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_ICompositionAnimationBase_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_ICompositionAnimationBase_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_ICompositionAnimationBase_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_ICompositionAnimationBase_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionAnimationBase
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_ICompositionAnimationBase_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_ICompositionAnimationBase_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_ICompositionAnimationBase_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInsetClip : aliased constant Windows.IID := (510912071, 33991, 18298, (180, 116, 88, 128, 224, 68, 46, 21 ));
   
   type IInsetClip_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BottomInset
   (
      This       : access IInsetClip_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_BottomInset
   (
      This       : access IInsetClip_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftInset
   (
      This       : access IInsetClip_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_LeftInset
   (
      This       : access IInsetClip_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RightInset
   (
      This       : access IInsetClip_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RightInset
   (
      This       : access IInsetClip_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_TopInset
   (
      This       : access IInsetClip_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_TopInset
   (
      This       : access IInsetClip_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyFrameAnimation : aliased constant Windows.IID := (309231394, 15081, 17728, (154, 138, 222, 174, 138, 74, 74, 132 ));
   
   type IKeyFrameAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DelayTime
   (
      This       : access IKeyFrameAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DelayTime
   (
      This       : access IKeyFrameAnimation_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IKeyFrameAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Duration
   (
      This       : access IKeyFrameAnimation_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IterationBehavior
   (
      This       : access IKeyFrameAnimation_Interface
      ; RetVal : access Windows.UI.Composition.AnimationIterationBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_IterationBehavior
   (
      This       : access IKeyFrameAnimation_Interface
      ; value : Windows.UI.Composition.AnimationIterationBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_IterationCount
   (
      This       : access IKeyFrameAnimation_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_IterationCount
   (
      This       : access IKeyFrameAnimation_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyFrameCount
   (
      This       : access IKeyFrameAnimation_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_StopBehavior
   (
      This       : access IKeyFrameAnimation_Interface
      ; RetVal : access Windows.UI.Composition.AnimationStopBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_StopBehavior
   (
      This       : access IKeyFrameAnimation_Interface
      ; value : Windows.UI.Composition.AnimationStopBehavior
   )
   return Windows.HRESULT is abstract;
   
   function InsertExpressionKeyFrame
   (
      This       : access IKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function InsertExpressionKeyFrameWithEasingFunction
   (
      This       : access IKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.String
      ; easingFunction : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyFrameAnimation2 : aliased constant Windows.IID := (4105472187, 10560, 20160, (164, 26, 235, 109, 128, 26, 47, 24 ));
   
   type IKeyFrameAnimation2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Direction
   (
      This       : access IKeyFrameAnimation2_Interface
      ; RetVal : access Windows.UI.Composition.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   function put_Direction
   (
      This       : access IKeyFrameAnimation2_Interface
      ; value : Windows.UI.Composition.AnimationDirection
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyFrameAnimation3 : aliased constant Windows.IID := (2220617908, 55518, 17967, (135, 83, 200, 13, 67, 198, 255, 90 ));
   
   type IKeyFrameAnimation3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DelayBehavior
   (
      This       : access IKeyFrameAnimation3_Interface
      ; RetVal : access Windows.UI.Composition.AnimationDelayBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_DelayBehavior
   (
      This       : access IKeyFrameAnimation3_Interface
      ; value : Windows.UI.Composition.AnimationDelayBehavior
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILayerVisual : aliased constant Windows.IID := (2944678277, 1092, 18567, (142, 131, 180, 11, 37, 63, 130, 44 ));
   
   type ILayerVisual_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Effect
   (
      This       : access ILayerVisual_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionEffectBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Effect
   (
      This       : access ILayerVisual_Interface
      ; value : Windows.UI.Composition.ICompositionEffectBrush
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILayerVisual2 : aliased constant Windows.IID := (2566500075, 28451, 18929, (144, 177, 31, 89, 161, 79, 188, 227 ));
   
   type ILayerVisual2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Shadow
   (
      This       : access ILayerVisual2_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionShadow
   )
   return Windows.HRESULT is abstract;
   
   function put_Shadow
   (
      This       : access ILayerVisual2_Interface
      ; value : Windows.UI.Composition.ICompositionShadow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILinearEasingFunction : aliased constant Windows.IID := (2483066714, 51110, 18099, (172, 247, 26, 38, 138, 10, 17, 125 ));
   
   type ILinearEasingFunction_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_INaturalMotionAnimation : aliased constant Windows.IID := (1133371693, 30363, 18465, (169, 73, 40, 74, 101, 71, 232, 115 ));
   
   type INaturalMotionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DelayBehavior
   (
      This       : access INaturalMotionAnimation_Interface
      ; RetVal : access Windows.UI.Composition.AnimationDelayBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_DelayBehavior
   (
      This       : access INaturalMotionAnimation_Interface
      ; value : Windows.UI.Composition.AnimationDelayBehavior
   )
   return Windows.HRESULT is abstract;
   
   function get_DelayTime
   (
      This       : access INaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_DelayTime
   (
      This       : access INaturalMotionAnimation_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_StopBehavior
   (
      This       : access INaturalMotionAnimation_Interface
      ; RetVal : access Windows.UI.Composition.AnimationStopBehavior
   )
   return Windows.HRESULT is abstract;
   
   function put_StopBehavior
   (
      This       : access INaturalMotionAnimation_Interface
      ; value : Windows.UI.Composition.AnimationStopBehavior
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointLight : aliased constant Windows.IID := (2978301363, 3162, 19120, (190, 220, 79, 53, 70, 148, 130, 114 ));
   
   type IPointLight_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Color
   (
      This       : access IPointLight_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_Color
   (
      This       : access IPointLight_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ConstantAttenuation
   (
      This       : access IPointLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_ConstantAttenuation
   (
      This       : access IPointLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_CoordinateSpace
   (
      This       : access IPointLight_Interface
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function put_CoordinateSpace
   (
      This       : access IPointLight_Interface
      ; value : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function get_LinearAttenuation
   (
      This       : access IPointLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_LinearAttenuation
   (
      This       : access IPointLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access IPointLight_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access IPointLight_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_QuadraticAttenuation
   (
      This       : access IPointLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_QuadraticAttenuation
   (
      This       : access IPointLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointLight2 : aliased constant Windows.IID := (4025061164, 1656, 20329, (177, 100, 168, 16, 217, 149, 188, 183 ));
   
   type IPointLight2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Intensity
   (
      This       : access IPointLight2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Intensity
   (
      This       : access IPointLight2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IQuaternionKeyFrameAnimation : aliased constant Windows.IID := (1078876213, 60662, 16960, (133, 32, 103, 18, 121, 207, 54, 188 ));
   
   type IQuaternionKeyFrameAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function InsertKeyFrame
   (
      This       : access IQuaternionKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function InsertKeyFrameWithEasingFunction
   (
      This       : access IQuaternionKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Quaternion
      ; easingFunction : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRenderingDeviceReplacedEventArgs : aliased constant Windows.IID := (976333949, 10431, 20090, (133, 36, 113, 103, 157, 72, 15, 56 ));
   
   type IRenderingDeviceReplacedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GraphicsDevice
   (
      This       : access IRenderingDeviceReplacedEventArgs_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionGraphicsDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScalarKeyFrameAnimation : aliased constant Windows.IID := (2921893801, 9516, 19349, (167, 37, 191, 133, 227, 128, 0, 161 ));
   
   type IScalarKeyFrameAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function InsertKeyFrame
   (
      This       : access IScalarKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function InsertKeyFrameWithEasingFunction
   (
      This       : access IScalarKeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Single
      ; easingFunction : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScalarNaturalMotionAnimation : aliased constant Windows.IID := (2494121345, 49042, 18779, (181, 189, 210, 198, 89, 67, 7, 55 ));
   
   type IScalarNaturalMotionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FinalValue
   (
      This       : access IScalarNaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_FinalValue
   (
      This       : access IScalarNaturalMotionAnimation_Interface
      ; value : Windows.Foundation.IReference_Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialValue
   (
      This       : access IScalarNaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialValue
   (
      This       : access IScalarNaturalMotionAnimation_Interface
      ; value : Windows.Foundation.IReference_Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialVelocity
   (
      This       : access IScalarNaturalMotionAnimation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialVelocity
   (
      This       : access IScalarNaturalMotionAnimation_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpotLight : aliased constant Windows.IID := (1520427635, 17569, 20373, (164, 34, 143, 165, 17, 107, 219, 68 ));
   
   type ISpotLight_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConstantAttenuation
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_ConstantAttenuation
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_CoordinateSpace
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function put_CoordinateSpace
   (
      This       : access ISpotLight_Interface
      ; value : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function get_Direction
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Direction
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_InnerConeAngle
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InnerConeAngle
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InnerConeAngleInDegrees
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InnerConeAngleInDegrees
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_InnerConeColor
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_InnerConeColor
   (
      This       : access ISpotLight_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LinearAttenuation
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_LinearAttenuation
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_OuterConeAngle
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_OuterConeAngle
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_OuterConeAngleInDegrees
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_OuterConeAngleInDegrees
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_OuterConeColor
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_OuterConeColor
   (
      This       : access ISpotLight_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_QuadraticAttenuation
   (
      This       : access ISpotLight_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_QuadraticAttenuation
   (
      This       : access ISpotLight_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpotLight2 : aliased constant Windows.IID := (1693344094, 1670, 19946, (169, 232, 188, 58, 140, 112, 20, 89 ));
   
   type ISpotLight2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InnerConeIntensity
   (
      This       : access ISpotLight2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_InnerConeIntensity
   (
      This       : access ISpotLight2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_OuterConeIntensity
   (
      This       : access ISpotLight2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_OuterConeIntensity
   (
      This       : access ISpotLight2_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpringScalarNaturalMotionAnimation : aliased constant Windows.IID := (91400543, 14329, 20414, (184, 123, 92, 208, 58, 137, 80, 28 ));
   
   type ISpringScalarNaturalMotionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DampingRatio
   (
      This       : access ISpringScalarNaturalMotionAnimation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_DampingRatio
   (
      This       : access ISpringScalarNaturalMotionAnimation_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Period
   (
      This       : access ISpringScalarNaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Period
   (
      This       : access ISpringScalarNaturalMotionAnimation_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpringVector2NaturalMotionAnimation : aliased constant Windows.IID := (603231413, 61043, 20239, (164, 35, 64, 43, 148, 109, 244, 179 ));
   
   type ISpringVector2NaturalMotionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DampingRatio
   (
      This       : access ISpringVector2NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_DampingRatio
   (
      This       : access ISpringVector2NaturalMotionAnimation_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Period
   (
      This       : access ISpringVector2NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Period
   (
      This       : access ISpringVector2NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpringVector3NaturalMotionAnimation : aliased constant Windows.IID := (1820805599, 54651, 18324, (142, 45, 206, 203, 17, 225, 148, 229 ));
   
   type ISpringVector3NaturalMotionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DampingRatio
   (
      This       : access ISpringVector3NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_DampingRatio
   (
      This       : access ISpringVector3NaturalMotionAnimation_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Period
   (
      This       : access ISpringVector3NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function put_Period
   (
      This       : access ISpringVector3NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpriteVisual : aliased constant Windows.IID := (148919681, 6865, 20375, (151, 87, 64, 45, 118, 228, 35, 59 ));
   
   type ISpriteVisual_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Brush
   (
      This       : access ISpriteVisual_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   function put_Brush
   (
      This       : access ISpriteVisual_Interface
      ; value : Windows.UI.Composition.ICompositionBrush
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpriteVisual2 : aliased constant Windows.IID := (1485608548, 39290, 18512, (145, 254, 83, 203, 88, 248, 28, 233 ));
   
   type ISpriteVisual2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Shadow
   (
      This       : access ISpriteVisual2_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionShadow
   )
   return Windows.HRESULT is abstract;
   
   function put_Shadow
   (
      This       : access ISpriteVisual2_Interface
      ; value : Windows.UI.Composition.ICompositionShadow
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStepEasingFunction : aliased constant Windows.IID := (3502942027, 22028, 18955, (165, 246, 32, 108, 168, 195, 236, 214 ));
   
   type IStepEasingFunction_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FinalStep
   (
      This       : access IStepEasingFunction_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_FinalStep
   (
      This       : access IStepEasingFunction_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialStep
   (
      This       : access IStepEasingFunction_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialStep
   (
      This       : access IStepEasingFunction_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsFinalStepSingleFrame
   (
      This       : access IStepEasingFunction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsFinalStepSingleFrame
   (
      This       : access IStepEasingFunction_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInitialStepSingleFrame
   (
      This       : access IStepEasingFunction_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsInitialStepSingleFrame
   (
      This       : access IStepEasingFunction_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_StepCount
   (
      This       : access IStepEasingFunction_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_StepCount
   (
      This       : access IStepEasingFunction_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector2KeyFrameAnimation : aliased constant Windows.IID := (3745596693, 20009, 20241, (181, 94, 191, 42, 110, 179, 98, 148 ));
   
   type IVector2KeyFrameAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function InsertKeyFrame
   (
      This       : access IVector2KeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function InsertKeyFrameWithEasingFunction
   (
      This       : access IVector2KeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Vector2
      ; easingFunction : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector2NaturalMotionAnimation : aliased constant Windows.IID := (255724413, 58642, 18333, (160, 12, 119, 201, 58, 48, 163, 149 ));
   
   type IVector2NaturalMotionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FinalValue
   (
      This       : access IVector2NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector2 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_FinalValue
   (
      This       : access IVector2NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.Numerics.IReference_Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialValue
   (
      This       : access IVector2NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector2 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialValue
   (
      This       : access IVector2NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.Numerics.IReference_Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialVelocity
   (
      This       : access IVector2NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialVelocity
   (
      This       : access IVector2NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector3NaturalMotionAnimation : aliased constant Windows.IID := (2618754092, 58058, 17837, (150, 158, 78, 120, 183, 185, 173, 65 ));
   
   type IVector3NaturalMotionAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FinalValue
   (
      This       : access IVector3NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_FinalValue
   (
      This       : access IVector3NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.Numerics.IReference_Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialValue
   (
      This       : access IVector3NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialValue
   (
      This       : access IVector3NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.Numerics.IReference_Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialVelocity
   (
      This       : access IVector3NaturalMotionAnimation_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_InitialVelocity
   (
      This       : access IVector3NaturalMotionAnimation_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector3KeyFrameAnimation : aliased constant Windows.IID := (3355680170, 41601, 17346, (167, 61, 182, 142, 60, 83, 60, 64 ));
   
   type IVector3KeyFrameAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function InsertKeyFrame
   (
      This       : access IVector3KeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function InsertKeyFrameWithEasingFunction
   (
      This       : access IVector3KeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Vector3
      ; easingFunction : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector4KeyFrameAnimation : aliased constant Windows.IID := (609719387, 44509, 17285, (150, 6, 182, 163, 213, 228, 225, 185 ));
   
   type IVector4KeyFrameAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function InsertKeyFrame
   (
      This       : access IVector4KeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Vector4
   )
   return Windows.HRESULT is abstract;
   
   function InsertKeyFrameWithEasingFunction
   (
      This       : access IVector4KeyFrameAnimation_Interface
      ; normalizedProgressKey : Windows.Single
      ; value : Windows.Foundation.Numerics.Vector4
      ; easingFunction : Windows.UI.Composition.ICompositionEasingFunction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisual : aliased constant Windows.IID := (293478445, 43097, 19593, (135, 59, 194, 170, 86, 103, 136, 227 ));
   
   type IVisual_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnchorPoint
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_AnchorPoint
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_BackfaceVisibility
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.UI.Composition.CompositionBackfaceVisibility
   )
   return Windows.HRESULT is abstract;
   
   function put_BackfaceVisibility
   (
      This       : access IVisual_Interface
      ; value : Windows.UI.Composition.CompositionBackfaceVisibility
   )
   return Windows.HRESULT is abstract;
   
   function get_BorderMode
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.UI.Composition.CompositionBorderMode
   )
   return Windows.HRESULT is abstract;
   
   function put_BorderMode
   (
      This       : access IVisual_Interface
      ; value : Windows.UI.Composition.CompositionBorderMode
   )
   return Windows.HRESULT is abstract;
   
   function get_CenterPoint
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_CenterPoint
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Clip
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.UI.Composition.ICompositionClip
   )
   return Windows.HRESULT is abstract;
   
   function put_Clip
   (
      This       : access IVisual_Interface
      ; value : Windows.UI.Composition.ICompositionClip
   )
   return Windows.HRESULT is abstract;
   
   function get_CompositeMode
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.UI.Composition.CompositionCompositeMode
   )
   return Windows.HRESULT is abstract;
   
   function put_CompositeMode
   (
      This       : access IVisual_Interface
      ; value : Windows.UI.Composition.CompositionCompositeMode
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVisible
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsVisible
   (
      This       : access IVisual_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Offset
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Offset
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Opacity
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Opacity
   (
      This       : access IVisual_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function put_Orientation
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.HRESULT is abstract;
   
   function get_Parent
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.UI.Composition.IContainerVisual
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngle
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngle
   (
      This       : access IVisual_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAngleInDegrees
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAngleInDegrees
   (
      This       : access IVisual_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RotationAxis
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_RotationAxis
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_Scale
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function get_TransformMatrix
   (
      This       : access IVisual_Interface
      ; RetVal : access Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   function put_TransformMatrix
   (
      This       : access IVisual_Interface
      ; value : Windows.Foundation.Numerics.Matrix4x4
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisual2 : aliased constant Windows.IID := (810726929, 22211, 19518, (139, 243, 246, 225, 173, 71, 63, 6 ));
   
   type IVisual2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ParentForTransform
   (
      This       : access IVisual2_Interface
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function put_ParentForTransform
   (
      This       : access IVisual2_Interface
      ; value : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeOffsetAdjustment
   (
      This       : access IVisual2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativeOffsetAdjustment
   (
      This       : access IVisual2_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_RelativeSizeAdjustment
   (
      This       : access IVisual2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   function put_RelativeSizeAdjustment
   (
      This       : access IVisual2_Interface
      ; value : Windows.Foundation.Numerics.Vector2
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualCollection : aliased constant Windows.IID := (2339656965, 64830, 19096, (132, 168, 233, 73, 70, 140, 107, 203 ));
   
   type IVisualCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Count
   (
      This       : access IVisualCollection_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function InsertAbove
   (
      This       : access IVisualCollection_Interface
      ; newChild : Windows.UI.Composition.IVisual
      ; sibling : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function InsertAtBottom
   (
      This       : access IVisualCollection_Interface
      ; newChild : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function InsertAtTop
   (
      This       : access IVisualCollection_Interface
      ; newChild : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function InsertBelow
   (
      This       : access IVisualCollection_Interface
      ; newChild : Windows.UI.Composition.IVisual
      ; sibling : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IVisualCollection_Interface
      ; child : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAll
   (
      This       : access IVisualCollection_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_Visual : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_Visual_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Visual_Interface
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualUnorderedCollection : aliased constant Windows.IID := (865053296, 21704, 16551, (128, 41, 201, 206, 235, 10, 162, 80 ));
   
   type IVisualUnorderedCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Count
   (
      This       : access IVisualUnorderedCollection_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function Add
   (
      This       : access IVisualUnorderedCollection_Interface
      ; newVisual : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IVisualUnorderedCollection_Interface
      ; visual : Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAll
   (
      This       : access IVisualUnorderedCollection_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionAnimationFactory : aliased constant Windows.IID := (284607739, 28241, 19493, (187, 211, 88, 106, 155, 236, 62, 244 ));
   
   type ICompositionAnimationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionBrushFactory : aliased constant Windows.IID := (3662936908, 18000, 18372, (173, 118, 118, 83, 121, 96, 126, 214 ));
   
   type ICompositionBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionClipFactory : aliased constant Windows.IID := (3108523183, 8391, 19181, (172, 74, 156, 120, 186, 19, 2, 207 ));
   
   type ICompositionClipFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionGradientBrushFactory : aliased constant Windows.IID := (1456956887, 61833, 18633, (156, 141, 148, 218, 241, 190, 192, 16 ));
   
   type ICompositionGradientBrushFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionDrawingSurfaceFactory : aliased constant Windows.IID := (2492968970, 12589, 18105, (157, 179, 65, 47, 215, 148, 100, 200 ));
   
   type ICompositionDrawingSurfaceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionEasingFunctionFactory : aliased constant Windows.IID := (1619265396, 15776, 18761, (130, 0, 114, 6, 192, 1, 144, 160 ));
   
   type ICompositionEasingFunctionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionLightFactory : aliased constant Windows.IID := (110949126, 55868, 19268, (131, 138, 94, 3, 213, 26, 206, 85 ));
   
   type ICompositionLightFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionObjectFactory : aliased constant Windows.IID := (1361075294, 21898, 20266, (141, 57, 55, 191, 225, 226, 13, 221 ));
   
   type ICompositionObjectFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionShadowFactory : aliased constant Windows.IID := (572475695, 56506, 19345, (153, 158, 29, 194, 23, 160, 21, 48 ));
   
   type ICompositionShadowFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionTargetFactory : aliased constant Windows.IID := (2479725867, 34070, 19220, (168, 206, 244, 158, 33, 25, 236, 66 ));
   
   type ICompositionTargetFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionVirtualDrawingSurfaceFactory : aliased constant Windows.IID := (1734742124, 54635, 19017, (177, 223, 80, 118, 160, 98, 7, 104 ));
   
   type ICompositionVirtualDrawingSurfaceFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IContainerVisualFactory : aliased constant Windows.IID := (56862299, 51162, 19866, (149, 244, 105, 181, 200, 223, 103, 11 ));
   
   type IContainerVisualFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IKeyFrameAnimationFactory : aliased constant Windows.IID := (3204973560, 28970, 20417, (140, 135, 151, 8, 89, 237, 141, 46 ));
   
   type IKeyFrameAnimationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_INaturalMotionAnimationFactory : aliased constant Windows.IID := (4114270982, 53098, 17287, (163, 254, 82, 33, 243, 231, 224, 224 ));
   
   type INaturalMotionAnimationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IScalarNaturalMotionAnimationFactory : aliased constant Windows.IID := (2203755772, 26396, 16861, (175, 72, 174, 141, 239, 139, 21, 41 ));
   
   type IScalarNaturalMotionAnimationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IVector2NaturalMotionAnimationFactory : aliased constant Windows.IID := (2356477793, 1889, 18594, (189, 219, 106, 252, 197, 43, 137, 216 ));
   
   type IVector2NaturalMotionAnimationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IVector3NaturalMotionAnimationFactory : aliased constant Windows.IID := (564665647, 2176, 17787, (172, 135, 182, 9, 1, 140, 135, 109 ));
   
   type IVector3NaturalMotionAnimationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IVisualFactory : aliased constant Windows.IID := (2903505214, 46338, 20149, (135, 180, 154, 56, 167, 29, 1, 55 ));
   
   type IVisualFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   type IGraphicsEffectSource_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICompositionCapabilities_add_Changed : aliased constant Windows.IID := (1854719732, 27893, 22932, (148, 71, 114, 97, 113, 35, 110, 168 ));
   
   type TypedEventHandler_ICompositionCapabilities_add_Changed_Interface(Callback : access procedure (sender : Windows.UI.Composition.ICompositionCapabilities ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICompositionCapabilities_add_Changed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionCapabilities_add_Changed_Interface
      ; sender : Windows.UI.Composition.ICompositionCapabilities
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICompositionCommitBatch_add_Completed : aliased constant Windows.IID := (2649764950, 13187, 20619, (156, 117, 238, 132, 10, 126, 26, 57 ));
   
   type TypedEventHandler_ICompositionCommitBatch_add_Completed_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Composition.ICompositionBatchCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICompositionCommitBatch_add_Completed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionCommitBatch_add_Completed_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Composition.ICompositionBatchCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced : aliased constant Windows.IID := (630928062, 48390, 21442, (189, 81, 137, 232, 224, 249, 226, 57 ));
   
   type TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced_Interface(Callback : access procedure (sender : Windows.UI.Composition.ICompositionGraphicsDevice ; args : Windows.UI.Composition.IRenderingDeviceReplacedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionGraphicsDevice_add_RenderingDeviceReplaced_Interface
      ; sender : Windows.UI.Composition.ICompositionGraphicsDevice
      ; args : Windows.UI.Composition.IRenderingDeviceReplacedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ICompositionScopedBatch_add_Completed : aliased constant Windows.IID := (2649764950, 13187, 20619, (156, 117, 238, 132, 10, 126, 26, 57 ));
   
   type TypedEventHandler_ICompositionScopedBatch_add_Completed_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.UI.Composition.ICompositionBatchCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ICompositionScopedBatch_add_Completed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ICompositionScopedBatch_add_Completed_Interface
      ; sender : Windows.Object
      ; args : Windows.UI.Composition.ICompositionBatchCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype CompositionObject is Windows.UI.Composition.ICompositionObject;
   subtype InitialValueExpressionCollection is Windows.UI.Composition.IMap_String_String;
   subtype CompositionCapabilities is Windows.UI.Composition.ICompositionCapabilities;
   subtype CompositionColorGradientStop is Windows.UI.Composition.ICompositionColorGradientStop;
   subtype CompositionBatchCompletedEventArgs is Windows.UI.Composition.ICompositionBatchCompletedEventArgs;
   subtype CompositionEasingFunction is Windows.UI.Composition.ICompositionEasingFunction;
   subtype CompositionBrush is Windows.UI.Composition.ICompositionBrush;
   subtype CompositionEffectBrush is Windows.UI.Composition.ICompositionEffectBrush;
   subtype CompositionEffectSourceParameter is Windows.UI.Composition.ICompositionEffectSourceParameter;
   function Create
   (
      name : Windows.String
   )
   return Windows.UI.Composition.ICompositionEffectSourceParameter;
   
   subtype CompositionColorGradientStopCollection is Windows.UI.Composition.ICompositionColorGradientStopCollection;
   subtype CompositionGraphicsDevice is Windows.UI.Composition.ICompositionGraphicsDevice;
   subtype Compositor is Windows.UI.Composition.ICompositor;
   function CreateCompositor return Windows.UI.Composition.ICompositor;
   
   subtype CompositionPropertySet is Windows.UI.Composition.ICompositionPropertySet;
   subtype CompositionDrawingSurface is Windows.UI.Composition.ICompositionDrawingSurface;
   subtype CompositionVirtualDrawingSurface is Windows.UI.Composition.ICompositionVirtualDrawingSurface;
   subtype CompositionColorBrush is Windows.UI.Composition.ICompositionColorBrush;
   subtype CompositionEffectFactory is Windows.UI.Composition.ICompositionEffectFactory;
   subtype CompositionScopedBatch is Windows.UI.Composition.ICompositionScopedBatch;
   subtype CompositionSurfaceBrush is Windows.UI.Composition.ICompositionSurfaceBrush;
   subtype CompositionTarget is Windows.UI.Composition.ICompositionTarget;
   subtype CompositionCommitBatch is Windows.UI.Composition.ICompositionCommitBatch;
   subtype CompositionAnimationGroup is Windows.UI.Composition.ICompositionAnimationGroup;
   subtype CompositionBackdropBrush is Windows.UI.Composition.ICompositionBackdropBrush;
   subtype CompositionMaskBrush is Windows.UI.Composition.ICompositionMaskBrush;
   subtype CompositionNineGridBrush is Windows.UI.Composition.ICompositionNineGridBrush;
   subtype CubicBezierEasingFunction is Windows.UI.Composition.ICubicBezierEasingFunction;
   subtype ImplicitAnimationCollection is Windows.UI.Composition.IImplicitAnimationCollection;
   subtype CompositionShadow is Windows.UI.Composition.ICompositionShadow;
   subtype DropShadow is Windows.UI.Composition.IDropShadow;
   subtype LinearEasingFunction is Windows.UI.Composition.ILinearEasingFunction;
   subtype RenderingDeviceReplacedEventArgs is Windows.UI.Composition.IRenderingDeviceReplacedEventArgs;
   subtype StepEasingFunction is Windows.UI.Composition.IStepEasingFunction;
   subtype CompositionClip is Windows.UI.Composition.ICompositionClip;
   subtype InsetClip is Windows.UI.Composition.IInsetClip;
   subtype VisualCollection is Windows.UI.Composition.IVisualCollection;
   subtype VisualUnorderedCollection is Windows.UI.Composition.IVisualUnorderedCollection;
   subtype CompositionAnimation is Windows.UI.Composition.ICompositionAnimation;
   subtype ExpressionAnimation is Windows.UI.Composition.IExpressionAnimation;
   subtype Visual is Windows.UI.Composition.IVisual;
   subtype ContainerVisual is Windows.UI.Composition.IContainerVisual;
   subtype SpriteVisual is Windows.UI.Composition.ISpriteVisual;
   subtype LayerVisual is Windows.UI.Composition.ILayerVisual;
   subtype CompositionGradientBrush is Windows.UI.Composition.ICompositionGradientBrush;
   subtype CompositionLinearGradientBrush is Windows.UI.Composition.ICompositionLinearGradientBrush;
   subtype CompositionLight is Windows.UI.Composition.ICompositionLight;
   subtype AmbientLight is Windows.UI.Composition.IAmbientLight;
   subtype DistantLight is Windows.UI.Composition.IDistantLight;
   subtype PointLight is Windows.UI.Composition.IPointLight;
   subtype SpotLight is Windows.UI.Composition.ISpotLight;
   subtype KeyFrameAnimation is Windows.UI.Composition.IKeyFrameAnimation;
   subtype ColorKeyFrameAnimation is Windows.UI.Composition.IColorKeyFrameAnimation;
   subtype QuaternionKeyFrameAnimation is Windows.UI.Composition.IQuaternionKeyFrameAnimation;
   subtype ScalarKeyFrameAnimation is Windows.UI.Composition.IScalarKeyFrameAnimation;
   subtype Vector2KeyFrameAnimation is Windows.UI.Composition.IVector2KeyFrameAnimation;
   subtype Vector3KeyFrameAnimation is Windows.UI.Composition.IVector3KeyFrameAnimation;
   subtype Vector4KeyFrameAnimation is Windows.UI.Composition.IVector4KeyFrameAnimation;
   subtype NaturalMotionAnimation is Windows.UI.Composition.INaturalMotionAnimation;
   subtype ScalarNaturalMotionAnimation is Windows.UI.Composition.IScalarNaturalMotionAnimation;
   subtype SpringScalarNaturalMotionAnimation is Windows.UI.Composition.ISpringScalarNaturalMotionAnimation;
   subtype Vector2NaturalMotionAnimation is Windows.UI.Composition.IVector2NaturalMotionAnimation;
   subtype SpringVector2NaturalMotionAnimation is Windows.UI.Composition.ISpringVector2NaturalMotionAnimation;
   subtype Vector3NaturalMotionAnimation is Windows.UI.Composition.IVector3NaturalMotionAnimation;
   subtype SpringVector3NaturalMotionAnimation is Windows.UI.Composition.ISpringVector3NaturalMotionAnimation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.UI.Composition.ICompositionCapabilities;
   
end;
