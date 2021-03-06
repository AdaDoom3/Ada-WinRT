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
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.UI.Input;
--------------------------------------------------------------------------------
package Windows.UI.Composition.Interactions is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type InteractionChainingMode is (
      Auto,
      Always,
      Never
   );
   for InteractionChainingMode use (
      Auto => 0,
      Always => 1,
      Never => 2
   );
   for InteractionChainingMode'Size use 32;
   
   type InteractionChainingMode_Ptr is access InteractionChainingMode;
   
   type InteractionSourceMode is (
      Disabled,
      EnabledWithInertia,
      EnabledWithoutInertia
   );
   for InteractionSourceMode use (
      Disabled => 0,
      EnabledWithInertia => 1,
      EnabledWithoutInertia => 2
   );
   for InteractionSourceMode'Size use 32;
   
   type InteractionSourceMode_Ptr is access InteractionSourceMode;
   
   type VisualInteractionSourceRedirectionMode is (
      Off,
      CapableTouchpadOnly
   );
   for VisualInteractionSourceRedirectionMode use (
      Off => 0,
      CapableTouchpadOnly => 1
   );
   for VisualInteractionSourceRedirectionMode'Size use 32;
   
   type VisualInteractionSourceRedirectionMode_Ptr is access VisualInteractionSourceRedirectionMode;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICompositionConditionalValue_Interface;
   type ICompositionConditionalValue is access all ICompositionConditionalValue_Interface'Class;
   type ICompositionConditionalValue_Ptr is access all ICompositionConditionalValue;
   type ICompositionConditionalValueStatics_Interface;
   type ICompositionConditionalValueStatics is access all ICompositionConditionalValueStatics_Interface'Class;
   type ICompositionConditionalValueStatics_Ptr is access all ICompositionConditionalValueStatics;
   type ICompositionInteractionSource_Interface;
   type ICompositionInteractionSource is access all ICompositionInteractionSource_Interface'Class;
   type ICompositionInteractionSource_Ptr is access all ICompositionInteractionSource;
   type ICompositionInteractionSourceCollection_Interface;
   type ICompositionInteractionSourceCollection is access all ICompositionInteractionSourceCollection_Interface'Class;
   type ICompositionInteractionSourceCollection_Ptr is access all ICompositionInteractionSourceCollection;
   type IInteractionTracker_Interface;
   type IInteractionTracker is access all IInteractionTracker_Interface'Class;
   type IInteractionTracker_Ptr is access all IInteractionTracker;
   type IInteractionTrackerOwner_Interface;
   type IInteractionTrackerOwner is access all IInteractionTrackerOwner_Interface'Class;
   type IInteractionTrackerOwner_Ptr is access all IInteractionTrackerOwner;
   type IInteractionTrackerStatics_Interface;
   type IInteractionTrackerStatics is access all IInteractionTrackerStatics_Interface'Class;
   type IInteractionTrackerStatics_Ptr is access all IInteractionTrackerStatics;
   type IInteractionTracker2_Interface;
   type IInteractionTracker2 is access all IInteractionTracker2_Interface'Class;
   type IInteractionTracker2_Ptr is access all IInteractionTracker2;
   type IInteractionTracker3_Interface;
   type IInteractionTracker3 is access all IInteractionTracker3_Interface'Class;
   type IInteractionTracker3_Ptr is access all IInteractionTracker3;
   type IInteractionTrackerCustomAnimationStateEnteredArgs_Interface;
   type IInteractionTrackerCustomAnimationStateEnteredArgs is access all IInteractionTrackerCustomAnimationStateEnteredArgs_Interface'Class;
   type IInteractionTrackerCustomAnimationStateEnteredArgs_Ptr is access all IInteractionTrackerCustomAnimationStateEnteredArgs;
   type IInteractionTrackerIdleStateEnteredArgs_Interface;
   type IInteractionTrackerIdleStateEnteredArgs is access all IInteractionTrackerIdleStateEnteredArgs_Interface'Class;
   type IInteractionTrackerIdleStateEnteredArgs_Ptr is access all IInteractionTrackerIdleStateEnteredArgs;
   type IInteractionTrackerInteractingStateEnteredArgs_Interface;
   type IInteractionTrackerInteractingStateEnteredArgs is access all IInteractionTrackerInteractingStateEnteredArgs_Interface'Class;
   type IInteractionTrackerInteractingStateEnteredArgs_Ptr is access all IInteractionTrackerInteractingStateEnteredArgs;
   type IInteractionTrackerInertiaModifier_Interface;
   type IInteractionTrackerInertiaModifier is access all IInteractionTrackerInertiaModifier_Interface'Class;
   type IInteractionTrackerInertiaModifier_Ptr is access all IInteractionTrackerInertiaModifier;
   type IInteractionTrackerInertiaNaturalMotion_Interface;
   type IInteractionTrackerInertiaNaturalMotion is access all IInteractionTrackerInertiaNaturalMotion_Interface'Class;
   type IInteractionTrackerInertiaNaturalMotion_Ptr is access all IInteractionTrackerInertiaNaturalMotion;
   type IInteractionTrackerInertiaNaturalMotionStatics_Interface;
   type IInteractionTrackerInertiaNaturalMotionStatics is access all IInteractionTrackerInertiaNaturalMotionStatics_Interface'Class;
   type IInteractionTrackerInertiaNaturalMotionStatics_Ptr is access all IInteractionTrackerInertiaNaturalMotionStatics;
   type IInteractionTrackerInertiaRestingValue_Interface;
   type IInteractionTrackerInertiaRestingValue is access all IInteractionTrackerInertiaRestingValue_Interface'Class;
   type IInteractionTrackerInertiaRestingValue_Ptr is access all IInteractionTrackerInertiaRestingValue;
   type IInteractionTrackerInertiaRestingValueStatics_Interface;
   type IInteractionTrackerInertiaRestingValueStatics is access all IInteractionTrackerInertiaRestingValueStatics_Interface'Class;
   type IInteractionTrackerInertiaRestingValueStatics_Ptr is access all IInteractionTrackerInertiaRestingValueStatics;
   type IInteractionTrackerInertiaMotion_Interface;
   type IInteractionTrackerInertiaMotion is access all IInteractionTrackerInertiaMotion_Interface'Class;
   type IInteractionTrackerInertiaMotion_Ptr is access all IInteractionTrackerInertiaMotion;
   type IInteractionTrackerInertiaMotionStatics_Interface;
   type IInteractionTrackerInertiaMotionStatics is access all IInteractionTrackerInertiaMotionStatics_Interface'Class;
   type IInteractionTrackerInertiaMotionStatics_Ptr is access all IInteractionTrackerInertiaMotionStatics;
   type IInteractionTrackerInertiaStateEnteredArgs_Interface;
   type IInteractionTrackerInertiaStateEnteredArgs is access all IInteractionTrackerInertiaStateEnteredArgs_Interface'Class;
   type IInteractionTrackerInertiaStateEnteredArgs_Ptr is access all IInteractionTrackerInertiaStateEnteredArgs;
   type IInteractionTrackerRequestIgnoredArgs_Interface;
   type IInteractionTrackerRequestIgnoredArgs is access all IInteractionTrackerRequestIgnoredArgs_Interface'Class;
   type IInteractionTrackerRequestIgnoredArgs_Ptr is access all IInteractionTrackerRequestIgnoredArgs;
   type IInteractionTrackerValuesChangedArgs_Interface;
   type IInteractionTrackerValuesChangedArgs is access all IInteractionTrackerValuesChangedArgs_Interface'Class;
   type IInteractionTrackerValuesChangedArgs_Ptr is access all IInteractionTrackerValuesChangedArgs;
   type IInteractionTrackerVector2InertiaModifier_Interface;
   type IInteractionTrackerVector2InertiaModifier is access all IInteractionTrackerVector2InertiaModifier_Interface'Class;
   type IInteractionTrackerVector2InertiaModifier_Ptr is access all IInteractionTrackerVector2InertiaModifier;
   type IVisualInteractionSource_Interface;
   type IVisualInteractionSource is access all IVisualInteractionSource_Interface'Class;
   type IVisualInteractionSource_Ptr is access all IVisualInteractionSource;
   type IVisualInteractionSourceStatics_Interface;
   type IVisualInteractionSourceStatics is access all IVisualInteractionSourceStatics_Interface'Class;
   type IVisualInteractionSourceStatics_Ptr is access all IVisualInteractionSourceStatics;
   type IVisualInteractionSource2_Interface;
   type IVisualInteractionSource2 is access all IVisualInteractionSource2_Interface'Class;
   type IVisualInteractionSource2_Ptr is access all IVisualInteractionSource2;
   type IInteractionTrackerInertiaModifierFactory_Interface;
   type IInteractionTrackerInertiaModifierFactory is access all IInteractionTrackerInertiaModifierFactory_Interface'Class;
   type IInteractionTrackerInertiaModifierFactory_Ptr is access all IInteractionTrackerInertiaModifierFactory;
   type IInteractionTrackerVector2InertiaModifierFactory_Interface;
   type IInteractionTrackerVector2InertiaModifierFactory is access all IInteractionTrackerVector2InertiaModifierFactory_Interface'Class;
   type IInteractionTrackerVector2InertiaModifierFactory_Ptr is access all IInteractionTrackerVector2InertiaModifierFactory;
   type IInteractionTrackerVector2InertiaNaturalMotion_Interface;
   type IInteractionTrackerVector2InertiaNaturalMotion is access all IInteractionTrackerVector2InertiaNaturalMotion_Interface'Class;
   type IInteractionTrackerVector2InertiaNaturalMotion_Ptr is access all IInteractionTrackerVector2InertiaNaturalMotion;
   type IInteractionTrackerVector2InertiaNaturalMotionStatics_Interface;
   type IInteractionTrackerVector2InertiaNaturalMotionStatics is access all IInteractionTrackerVector2InertiaNaturalMotionStatics_Interface'Class;
   type IInteractionTrackerVector2InertiaNaturalMotionStatics_Ptr is access all IInteractionTrackerVector2InertiaNaturalMotionStatics;
   type IVisualInteractionSourceObjectFactory_Interface;
   type IVisualInteractionSourceObjectFactory is access all IVisualInteractionSourceObjectFactory_Interface'Class;
   type IVisualInteractionSourceObjectFactory_Ptr is access all IVisualInteractionSourceObjectFactory;
   type IIterable_ICompositionInteractionSource_Interface;
   type IIterable_ICompositionInteractionSource is access all IIterable_ICompositionInteractionSource_Interface'Class;
   type IIterable_ICompositionInteractionSource_Ptr is access all IIterable_ICompositionInteractionSource;
   type IIterator_IInteractionTrackerInertiaModifier_Interface;
   type IIterator_IInteractionTrackerInertiaModifier is access all IIterator_IInteractionTrackerInertiaModifier_Interface'Class;
   type IIterator_IInteractionTrackerInertiaModifier_Ptr is access all IIterator_IInteractionTrackerInertiaModifier;
   type IIterable_IInteractionTrackerInertiaModifier_Interface;
   type IIterable_IInteractionTrackerInertiaModifier is access all IIterable_IInteractionTrackerInertiaModifier_Interface'Class;
   type IIterable_IInteractionTrackerInertiaModifier_Ptr is access all IIterable_IInteractionTrackerInertiaModifier;
   type IIterator_ICompositionConditionalValue_Interface;
   type IIterator_ICompositionConditionalValue is access all IIterator_ICompositionConditionalValue_Interface'Class;
   type IIterator_ICompositionConditionalValue_Ptr is access all IIterator_ICompositionConditionalValue;
   type IIterable_ICompositionConditionalValue_Interface;
   type IIterable_ICompositionConditionalValue is access all IIterable_ICompositionConditionalValue_Interface'Class;
   type IIterable_ICompositionConditionalValue_Ptr is access all IIterable_ICompositionConditionalValue;
   type IIterator_IInteractionTrackerVector2InertiaModifier_Interface;
   type IIterator_IInteractionTrackerVector2InertiaModifier is access all IIterator_IInteractionTrackerVector2InertiaModifier_Interface'Class;
   type IIterator_IInteractionTrackerVector2InertiaModifier_Ptr is access all IIterator_IInteractionTrackerVector2InertiaModifier;
   type IIterable_IInteractionTrackerVector2InertiaModifier_Interface;
   type IIterable_IInteractionTrackerVector2InertiaModifier is access all IIterable_IInteractionTrackerVector2InertiaModifier_Interface'Class;
   type IIterable_IInteractionTrackerVector2InertiaModifier_Ptr is access all IIterable_IInteractionTrackerVector2InertiaModifier;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICompositionConditionalValue : aliased constant Windows.IID := (1126499640, 60275, 17761, (167, 29, 26, 67, 234, 235, 122, 155 ));
   
   type ICompositionConditionalValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Condition
   (
      This       : access ICompositionConditionalValue_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_Condition
   (
      This       : access ICompositionConditionalValue_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ICompositionConditionalValue_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access ICompositionConditionalValue_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionConditionalValueStatics : aliased constant Windows.IID := (151800690, 33895, 19722, (144, 101, 172, 70, 184, 10, 85, 34 ));
   
   type ICompositionConditionalValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access ICompositionConditionalValueStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.UI.Composition.Interactions.ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionInteractionSource : aliased constant Windows.IID := (70984753, 1763, 18778, (186, 84, 64, 159, 0, 23, 250, 192 ));
   
   type ICompositionInteractionSource_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ICompositionInteractionSourceCollection : aliased constant Windows.IID := (457608779, 42431, 18392, (165, 71, 56, 148, 21, 90, 21, 140 ));
   
   type ICompositionInteractionSourceCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Count
   (
      This       : access ICompositionInteractionSourceCollection_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function Add
   (
      This       : access ICompositionInteractionSourceCollection_Interface
      ; value : Windows.UI.Composition.Interactions.ICompositionInteractionSource
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access ICompositionInteractionSourceCollection_Interface
      ; value : Windows.UI.Composition.Interactions.ICompositionInteractionSource
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAll
   (
      This       : access ICompositionInteractionSourceCollection_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTracker : aliased constant Windows.IID := (713985201, 4096, 17430, (131, 99, 204, 39, 251, 135, 115, 8 ));
   
   type IInteractionTracker_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InteractionSources
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.ICompositionInteractionSourceCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPositionRoundingSuggested
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxPosition
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxPosition
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxScale
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_MaxScale
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_MinPosition
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function put_MinPosition
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_MinScale
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_MinScale
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalRestingPosition
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalRestingScale
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Owner
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTrackerOwner
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionInertiaDecayRate
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionInertiaDecayRate
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Foundation.Numerics.IReference_Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionVelocityInPixelsPerSecond
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleInertiaDecayRate
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleInertiaDecayRate
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Foundation.IReference_Single
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleVelocityInPercentPerSecond
   (
      This       : access IInteractionTracker_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function AdjustPositionXIfGreaterThanThreshold
   (
      This       : access IInteractionTracker_Interface
      ; adjustment : Windows.Single
      ; positionThreshold : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function AdjustPositionYIfGreaterThanThreshold
   (
      This       : access IInteractionTracker_Interface
      ; adjustment : Windows.Single
      ; positionThreshold : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function ConfigurePositionXInertiaModifiers
   (
      This       : access IInteractionTracker_Interface
      ; modifiers : Windows.UI.Composition.Interactions.IIterable_IInteractionTrackerInertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   function ConfigurePositionYInertiaModifiers
   (
      This       : access IInteractionTracker_Interface
      ; modifiers : Windows.UI.Composition.Interactions.IIterable_IInteractionTrackerInertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureScaleInertiaModifiers
   (
      This       : access IInteractionTracker_Interface
      ; modifiers : Windows.UI.Composition.Interactions.IIterable_IInteractionTrackerInertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdatePosition
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdatePositionBy
   (
      This       : access IInteractionTracker_Interface
      ; amount : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdatePositionWithAnimation
   (
      This       : access IInteractionTracker_Interface
      ; animation : Windows.UI.Composition.ICompositionAnimation
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdatePositionWithAdditionalVelocity
   (
      This       : access IInteractionTracker_Interface
      ; velocityInPixelsPerSecond : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdateScale
   (
      This       : access IInteractionTracker_Interface
      ; value : Windows.Single
      ; centerPoint : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdateScaleWithAnimation
   (
      This       : access IInteractionTracker_Interface
      ; animation : Windows.UI.Composition.ICompositionAnimation
      ; centerPoint : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function TryUpdateScaleWithAdditionalVelocity
   (
      This       : access IInteractionTracker_Interface
      ; velocityInPercentPerSecond : Windows.Single
      ; centerPoint : Windows.Foundation.Numerics.Vector3
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerOwner : aliased constant Windows.IID := (3677260531, 19947, 20051, (178, 156, 176, 108, 159, 150, 214, 81 ));
   
   type IInteractionTrackerOwner_Interface is interface and Windows.IInspectable_Interface;
   
   function CustomAnimationStateEntered
   (
      This       : access IInteractionTrackerOwner_Interface
      ; sender : Windows.UI.Composition.Interactions.IInteractionTracker
      ; args : Windows.UI.Composition.Interactions.IInteractionTrackerCustomAnimationStateEnteredArgs
   )
   return Windows.HRESULT is abstract;
   
   function IdleStateEntered
   (
      This       : access IInteractionTrackerOwner_Interface
      ; sender : Windows.UI.Composition.Interactions.IInteractionTracker
      ; args : Windows.UI.Composition.Interactions.IInteractionTrackerIdleStateEnteredArgs
   )
   return Windows.HRESULT is abstract;
   
   function InertiaStateEntered
   (
      This       : access IInteractionTrackerOwner_Interface
      ; sender : Windows.UI.Composition.Interactions.IInteractionTracker
      ; args : Windows.UI.Composition.Interactions.IInteractionTrackerInertiaStateEnteredArgs
   )
   return Windows.HRESULT is abstract;
   
   function InteractingStateEntered
   (
      This       : access IInteractionTrackerOwner_Interface
      ; sender : Windows.UI.Composition.Interactions.IInteractionTracker
      ; args : Windows.UI.Composition.Interactions.IInteractionTrackerInteractingStateEnteredArgs
   )
   return Windows.HRESULT is abstract;
   
   function RequestIgnored
   (
      This       : access IInteractionTrackerOwner_Interface
      ; sender : Windows.UI.Composition.Interactions.IInteractionTracker
      ; args : Windows.UI.Composition.Interactions.IInteractionTrackerRequestIgnoredArgs
   )
   return Windows.HRESULT is abstract;
   
   function ValuesChanged
   (
      This       : access IInteractionTrackerOwner_Interface
      ; sender : Windows.UI.Composition.Interactions.IInteractionTracker
      ; args : Windows.UI.Composition.Interactions.IInteractionTrackerValuesChangedArgs
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerStatics : aliased constant Windows.IID := (3148208055, 26000, 17560, (141, 108, 235, 98, 181, 20, 201, 42 ));
   
   type IInteractionTrackerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IInteractionTrackerStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTracker
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithOwner
   (
      This       : access IInteractionTrackerStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; owner : Windows.UI.Composition.Interactions.IInteractionTrackerOwner
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTracker
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTracker2 : aliased constant Windows.IID := (628529726, 52845, 17548, (131, 134, 146, 98, 13, 36, 7, 86 ));
   
   type IInteractionTracker2_Interface is interface and Windows.IInspectable_Interface;
   
   function ConfigureCenterPointXInertiaModifiers
   (
      This       : access IInteractionTracker2_Interface
      ; conditionalValues : Windows.UI.Composition.Interactions.IIterable_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureCenterPointYInertiaModifiers
   (
      This       : access IInteractionTracker2_Interface
      ; conditionalValues : Windows.UI.Composition.Interactions.IIterable_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTracker3 : aliased constant Windows.IID := (3871725474, 23627, 17094, (132, 183, 246, 148, 65, 177, 128, 145 ));
   
   type IInteractionTracker3_Interface is interface and Windows.IInspectable_Interface;
   
   function ConfigureVector2PositionInertiaModifiers
   (
      This       : access IInteractionTracker3_Interface
      ; modifiers : Windows.UI.Composition.Interactions.IIterable_IInteractionTrackerVector2InertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerCustomAnimationStateEnteredArgs : aliased constant Windows.IID := (2367458545, 55216, 17228, (165, 210, 45, 118, 17, 134, 72, 52 ));
   
   type IInteractionTrackerCustomAnimationStateEnteredArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IInteractionTrackerCustomAnimationStateEnteredArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerIdleStateEnteredArgs : aliased constant Windows.IID := (1342255018, 5392, 16706, (161, 165, 1, 155, 9, 248, 133, 123 ));
   
   type IInteractionTrackerIdleStateEnteredArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IInteractionTrackerIdleStateEnteredArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInteractingStateEnteredArgs : aliased constant Windows.IID := (2804300089, 41339, 16401, (153, 253, 181, 194, 79, 20, 55, 72 ));
   
   type IInteractionTrackerInteractingStateEnteredArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IInteractionTrackerInteractingStateEnteredArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaModifier : aliased constant Windows.IID := (2699217184, 9908, 19874, (139, 97, 94, 104, 57, 121, 187, 226 ));
   
   type IInteractionTrackerInertiaModifier_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaNaturalMotion : aliased constant Windows.IID := (1890376366, 10204, 18669, (163, 195, 109, 97, 201, 160, 41, 210 ));
   
   type IInteractionTrackerInertiaNaturalMotion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Condition
   (
      This       : access IInteractionTrackerInertiaNaturalMotion_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_Condition
   (
      This       : access IInteractionTrackerInertiaNaturalMotion_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalMotion
   (
      This       : access IInteractionTrackerInertiaNaturalMotion_Interface
      ; RetVal : access Windows.UI.Composition.IScalarNaturalMotionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_NaturalMotion
   (
      This       : access IInteractionTrackerInertiaNaturalMotion_Interface
      ; value : Windows.UI.Composition.IScalarNaturalMotionAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaNaturalMotionStatics : aliased constant Windows.IID := (3487192496, 24126, 17033, (147, 45, 238, 95, 80, 231, 66, 131 ));
   
   type IInteractionTrackerInertiaNaturalMotionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IInteractionTrackerInertiaNaturalMotionStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaRestingValue : aliased constant Windows.IID := (2264394761, 20630, 16752, (156, 200, 223, 47, 225, 1, 187, 147 ));
   
   type IInteractionTrackerInertiaRestingValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Condition
   (
      This       : access IInteractionTrackerInertiaRestingValue_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_Condition
   (
      This       : access IInteractionTrackerInertiaRestingValue_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function get_RestingValue
   (
      This       : access IInteractionTrackerInertiaRestingValue_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_RestingValue
   (
      This       : access IInteractionTrackerInertiaRestingValue_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaRestingValueStatics : aliased constant Windows.IID := (418203289, 1861, 16534, (188, 171, 58, 78, 153, 86, 155, 207 ));
   
   type IInteractionTrackerInertiaRestingValueStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IInteractionTrackerInertiaRestingValueStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaMotion : aliased constant Windows.IID := (76689372, 61780, 19640, (191, 51, 204, 27, 166, 17, 230, 219 ));
   
   type IInteractionTrackerInertiaMotion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Condition
   (
      This       : access IInteractionTrackerInertiaMotion_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_Condition
   (
      This       : access IInteractionTrackerInertiaMotion_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function get_Motion
   (
      This       : access IInteractionTrackerInertiaMotion_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_Motion
   (
      This       : access IInteractionTrackerInertiaMotion_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaMotionStatics : aliased constant Windows.IID := (2361933270, 47739, 17178, (132, 75, 110, 172, 145, 48, 249, 154 ));
   
   type IInteractionTrackerInertiaMotionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IInteractionTrackerInertiaMotionStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaStateEnteredArgs : aliased constant Windows.IID := (2266008818, 59391, 20349, (159, 253, 215, 47, 30, 64, 155, 99 ));
   
   type IInteractionTrackerInertiaStateEnteredArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ModifiedRestingPosition
   (
      This       : access IInteractionTrackerInertiaStateEnteredArgs_Interface
      ; RetVal : access Windows.Foundation.Numerics.IReference_Vector3 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ModifiedRestingScale
   (
      This       : access IInteractionTrackerInertiaStateEnteredArgs_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalRestingPosition
   (
      This       : access IInteractionTrackerInertiaStateEnteredArgs_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalRestingScale
   (
      This       : access IInteractionTrackerInertiaStateEnteredArgs_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionVelocityInPixelsPerSecond
   (
      This       : access IInteractionTrackerInertiaStateEnteredArgs_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestId
   (
      This       : access IInteractionTrackerInertiaStateEnteredArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleVelocityInPercentPerSecond
   (
      This       : access IInteractionTrackerInertiaStateEnteredArgs_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerRequestIgnoredArgs : aliased constant Windows.IID := (2162000625, 52773, 18575, (145, 221, 203, 100, 85, 204, 255, 46 ));
   
   type IInteractionTrackerRequestIgnoredArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RequestId
   (
      This       : access IInteractionTrackerRequestIgnoredArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerValuesChangedArgs : aliased constant Windows.IID := (3474290927, 54239, 17665, (185, 230, 240, 47, 178, 47, 115, 208 ));
   
   type IInteractionTrackerValuesChangedArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IInteractionTrackerValuesChangedArgs_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestId
   (
      This       : access IInteractionTrackerValuesChangedArgs_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access IInteractionTrackerValuesChangedArgs_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerVector2InertiaModifier : aliased constant Windows.IID := (2279639728, 12422, 18515, (164, 183, 119, 136, 42, 213, 215, 227 ));
   
   type IInteractionTrackerVector2InertiaModifier_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IVisualInteractionSource : aliased constant Windows.IID := (3389950598, 55510, 16657, (176, 136, 112, 52, 123, 210, 176, 237 ));
   
   type IVisualInteractionSource_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPositionXRailsEnabled
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPositionXRailsEnabled
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPositionYRailsEnabled
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsPositionYRailsEnabled
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ManipulationRedirectionMode
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.VisualInteractionSourceRedirectionMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ManipulationRedirectionMode
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.UI.Composition.Interactions.VisualInteractionSourceRedirectionMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionXChainingMode
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.InteractionChainingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionXChainingMode
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.UI.Composition.Interactions.InteractionChainingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionXSourceMode
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.InteractionSourceMode
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionXSourceMode
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.UI.Composition.Interactions.InteractionSourceMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionYChainingMode
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.InteractionChainingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionYChainingMode
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.UI.Composition.Interactions.InteractionChainingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionYSourceMode
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.InteractionSourceMode
   )
   return Windows.HRESULT is abstract;
   
   function put_PositionYSourceMode
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.UI.Composition.Interactions.InteractionSourceMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleChainingMode
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.InteractionChainingMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleChainingMode
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.UI.Composition.Interactions.InteractionChainingMode
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleSourceMode
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.InteractionSourceMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaleSourceMode
   (
      This       : access IVisualInteractionSource_Interface
      ; value : Windows.UI.Composition.Interactions.InteractionSourceMode
   )
   return Windows.HRESULT is abstract;
   
   function get_Source
   (
      This       : access IVisualInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.IVisual
   )
   return Windows.HRESULT is abstract;
   
   function TryRedirectForManipulation
   (
      This       : access IVisualInteractionSource_Interface
      ; pointerPoint : Windows.UI.Input.IPointerPoint
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualInteractionSourceStatics : aliased constant Windows.IID := (916022753, 34373, 20341, (186, 0, 100, 121, 205, 16, 200, 230 ));
   
   type IVisualInteractionSourceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IVisualInteractionSourceStatics_Interface
      ; source : Windows.UI.Composition.IVisual
      ; RetVal : access Windows.UI.Composition.Interactions.IVisualInteractionSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualInteractionSource2 : aliased constant Windows.IID := (2861648019, 42812, 16717, (128, 208, 36, 155, 173, 47, 189, 147 ));
   
   type IVisualInteractionSource2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeltaPosition
   (
      This       : access IVisualInteractionSource2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_DeltaScale
   (
      This       : access IVisualInteractionSource2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access IVisualInteractionSource2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_PositionVelocity
   (
      This       : access IVisualInteractionSource2_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access IVisualInteractionSource2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaleVelocity
   (
      This       : access IVisualInteractionSource2_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureCenterPointXModifiers
   (
      This       : access IVisualInteractionSource2_Interface
      ; conditionalValues : Windows.UI.Composition.Interactions.IIterable_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureCenterPointYModifiers
   (
      This       : access IVisualInteractionSource2_Interface
      ; conditionalValues : Windows.UI.Composition.Interactions.IIterable_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureDeltaPositionXModifiers
   (
      This       : access IVisualInteractionSource2_Interface
      ; conditionalValues : Windows.UI.Composition.Interactions.IIterable_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureDeltaPositionYModifiers
   (
      This       : access IVisualInteractionSource2_Interface
      ; conditionalValues : Windows.UI.Composition.Interactions.IIterable_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   function ConfigureDeltaScaleModifiers
   (
      This       : access IVisualInteractionSource2_Interface
      ; conditionalValues : Windows.UI.Composition.Interactions.IIterable_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerInertiaModifierFactory : aliased constant Windows.IID := (2570590462, 51534, 19334, (135, 243, 146, 38, 101, 186, 70, 185 ));
   
   type IInteractionTrackerInertiaModifierFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerVector2InertiaModifierFactory : aliased constant Windows.IID := (1946277572, 27757, 18655, (188, 62, 23, 30, 34, 126, 125, 127 ));
   
   type IInteractionTrackerVector2InertiaModifierFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerVector2InertiaNaturalMotion : aliased constant Windows.IID := (1595369820, 5677, 19463, (148, 0, 194, 130, 178, 130, 118, 202 ));
   
   type IInteractionTrackerVector2InertiaNaturalMotion_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Condition
   (
      This       : access IInteractionTrackerVector2InertiaNaturalMotion_Interface
      ; RetVal : access Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_Condition
   (
      This       : access IInteractionTrackerVector2InertiaNaturalMotion_Interface
      ; value : Windows.UI.Composition.IExpressionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function get_NaturalMotion
   (
      This       : access IInteractionTrackerVector2InertiaNaturalMotion_Interface
      ; RetVal : access Windows.UI.Composition.IVector2NaturalMotionAnimation
   )
   return Windows.HRESULT is abstract;
   
   function put_NaturalMotion
   (
      This       : access IInteractionTrackerVector2InertiaNaturalMotion_Interface
      ; value : Windows.UI.Composition.IVector2NaturalMotionAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInteractionTrackerVector2InertiaNaturalMotionStatics : aliased constant Windows.IID := (2181044808, 2496, 17231, (129, 137, 20, 28, 102, 223, 54, 47 ));
   
   type IInteractionTrackerVector2InertiaNaturalMotionStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IInteractionTrackerVector2InertiaNaturalMotionStatics_Interface
      ; compositor : Windows.UI.Composition.ICompositor
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualInteractionSourceObjectFactory : aliased constant Windows.IID := (2999619964, 59786, 16882, (179, 201, 137, 28, 146, 102, 200, 246 ));
   
   type IVisualInteractionSourceObjectFactory_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICompositionInteractionSource : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_ICompositionInteractionSource_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICompositionInteractionSource_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.ICompositionInteractionSource
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IInteractionTrackerInertiaModifier : aliased constant Windows.IID := (1180794247, 11474, 24113, (154, 48, 234, 134, 248, 170, 124, 161 ));
   
   type IIterator_IInteractionTrackerInertiaModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInteractionTrackerInertiaModifier_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInteractionTrackerInertiaModifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInteractionTrackerInertiaModifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInteractionTrackerInertiaModifier_Interface
      ; items : Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IInteractionTrackerInertiaModifier : aliased constant Windows.IID := (2586074176, 43750, 23035, (135, 245, 75, 176, 85, 153, 240, 177 ));
   
   type IIterable_IInteractionTrackerInertiaModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInteractionTrackerInertiaModifier_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.IIterator_IInteractionTrackerInertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ICompositionConditionalValue : aliased constant Windows.IID := (2322968621, 14737, 21926, (191, 226, 130, 203, 125, 214, 91, 152 ));
   
   type IIterator_ICompositionConditionalValue_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ICompositionConditionalValue_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ICompositionConditionalValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ICompositionConditionalValue_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ICompositionConditionalValue_Interface
      ; items : Windows.UI.Composition.Interactions.ICompositionConditionalValue_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ICompositionConditionalValue : aliased constant Windows.IID := (2993177723, 62745, 23781, (137, 205, 183, 225, 188, 86, 82, 238 ));
   
   type IIterable_ICompositionConditionalValue_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ICompositionConditionalValue_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.IIterator_ICompositionConditionalValue
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IInteractionTrackerVector2InertiaModifier : aliased constant Windows.IID := (2002963115, 23362, 22872, (159, 73, 6, 174, 253, 67, 173, 117 ));
   
   type IIterator_IInteractionTrackerVector2InertiaModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInteractionTrackerVector2InertiaModifier_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInteractionTrackerVector2InertiaModifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInteractionTrackerVector2InertiaModifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInteractionTrackerVector2InertiaModifier_Interface
      ; items : Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IInteractionTrackerVector2InertiaModifier : aliased constant Windows.IID := (988467160, 51185, 22540, (162, 59, 153, 102, 110, 66, 230, 43 ));
   
   type IIterable_IInteractionTrackerVector2InertiaModifier_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInteractionTrackerVector2InertiaModifier_Interface
      ; RetVal : access Windows.UI.Composition.Interactions.IIterator_IInteractionTrackerVector2InertiaModifier
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype InteractionTrackerCustomAnimationStateEnteredArgs is Windows.UI.Composition.Interactions.IInteractionTrackerCustomAnimationStateEnteredArgs;
   subtype InteractionTrackerIdleStateEnteredArgs is Windows.UI.Composition.Interactions.IInteractionTrackerIdleStateEnteredArgs;
   subtype InteractionTrackerInertiaStateEnteredArgs is Windows.UI.Composition.Interactions.IInteractionTrackerInertiaStateEnteredArgs;
   subtype InteractionTrackerInteractingStateEnteredArgs is Windows.UI.Composition.Interactions.IInteractionTrackerInteractingStateEnteredArgs;
   subtype InteractionTrackerRequestIgnoredArgs is Windows.UI.Composition.Interactions.IInteractionTrackerRequestIgnoredArgs;
   subtype InteractionTrackerValuesChangedArgs is Windows.UI.Composition.Interactions.IInteractionTrackerValuesChangedArgs;
   subtype CompositionConditionalValue is Windows.UI.Composition.Interactions.ICompositionConditionalValue;
   subtype CompositionInteractionSourceCollection is Windows.UI.Composition.Interactions.ICompositionInteractionSourceCollection;
   subtype InteractionTracker is Windows.UI.Composition.Interactions.IInteractionTracker;
   subtype InteractionTrackerInertiaModifier is Windows.UI.Composition.Interactions.IInteractionTrackerInertiaModifier;
   subtype InteractionTrackerVector2InertiaModifier is Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaModifier;
   subtype InteractionTrackerInertiaNaturalMotion is Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion;
   subtype InteractionTrackerInertiaRestingValue is Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue;
   subtype InteractionTrackerInertiaMotion is Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion;
   subtype VisualInteractionSource is Windows.UI.Composition.Interactions.IVisualInteractionSource;
   subtype InteractionTrackerVector2InertiaNaturalMotion is Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.ICompositionConditionalValue;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTracker;
   
   function CreateWithOwner
   (
      compositor : Windows.UI.Composition.ICompositor
      ; owner : Windows.UI.Composition.Interactions.IInteractionTrackerOwner
   )
   return Windows.UI.Composition.Interactions.IInteractionTracker;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerInertiaNaturalMotion;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerInertiaRestingValue;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerInertiaMotion;
   
   function Create
   (
      source : Windows.UI.Composition.IVisual
   )
   return Windows.UI.Composition.Interactions.IVisualInteractionSource;
   
   function Create
   (
      compositor : Windows.UI.Composition.ICompositor
   )
   return Windows.UI.Composition.Interactions.IInteractionTrackerVector2InertiaNaturalMotion;
   
end;
