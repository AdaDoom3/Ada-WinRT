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
with Windows.Foundation.Collections;
package Windows.UI.Core.AnimationMetrics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PropertyAnimationType is (
      Scale,
      Translation,
      Opacity
   );
   for PropertyAnimationType use (
      Scale => 0,
      Translation => 1,
      Opacity => 2
   );
   for PropertyAnimationType'Size use 32;
   
   type PropertyAnimationType_Ptr is access PropertyAnimationType;
   
   type AnimationEffect is (
      Expand,
      Collapse,
      Reposition,
      FadeIn,
      FadeOut,
      AddToList,
      DeleteFromList,
      AddToGrid,
      DeleteFromGrid,
      AddToSearchGrid,
      DeleteFromSearchGrid,
      AddToSearchList,
      DeleteFromSearchList,
      ShowEdgeUI,
      ShowPanel,
      HideEdgeUI,
      HidePanel,
      ShowPopup,
      HidePopup,
      PointerDown,
      PointerUp,
      DragSourceStart,
      DragSourceEnd,
      TransitionContent,
      Reveal,
      Hide,
      DragBetweenEnter,
      DragBetweenLeave,
      SwipeSelect,
      SwipeDeselect,
      SwipeReveal,
      EnterPage,
      TransitionPage,
      CrossFade,
      Peek,
      UpdateBadge
   );
   for AnimationEffect use (
      Expand => 0,
      Collapse => 1,
      Reposition => 2,
      FadeIn => 3,
      FadeOut => 4,
      AddToList => 5,
      DeleteFromList => 6,
      AddToGrid => 7,
      DeleteFromGrid => 8,
      AddToSearchGrid => 9,
      DeleteFromSearchGrid => 10,
      AddToSearchList => 11,
      DeleteFromSearchList => 12,
      ShowEdgeUI => 13,
      ShowPanel => 14,
      HideEdgeUI => 15,
      HidePanel => 16,
      ShowPopup => 17,
      HidePopup => 18,
      PointerDown => 19,
      PointerUp => 20,
      DragSourceStart => 21,
      DragSourceEnd => 22,
      TransitionContent => 23,
      Reveal => 24,
      Hide => 25,
      DragBetweenEnter => 26,
      DragBetweenLeave => 27,
      SwipeSelect => 28,
      SwipeDeselect => 29,
      SwipeReveal => 30,
      EnterPage => 31,
      TransitionPage => 32,
      CrossFade => 33,
      Peek => 34,
      UpdateBadge => 35
   );
   for AnimationEffect'Size use 32;
   
   type AnimationEffect_Ptr is access AnimationEffect;
   
   type AnimationEffectTarget is (
      Primary,
      Added,
      Affected,
      Background,
      Content,
      Deleted,
      Deselected,
      DragSource,
      Hidden,
      Incoming,
      Outgoing,
      Outline,
      Remaining,
      Revealed,
      RowIn,
      RowOut,
      Selected,
      Selection,
      Shown,
      Tapped
   );
   for AnimationEffectTarget use (
      Primary => 0,
      Added => 1,
      Affected => 2,
      Background => 3,
      Content => 4,
      Deleted => 5,
      Deselected => 6,
      DragSource => 7,
      Hidden => 8,
      Incoming => 9,
      Outgoing => 10,
      Outline => 11,
      Remaining => 12,
      Revealed => 13,
      RowIn => 14,
      RowOut => 15,
      Selected => 16,
      Selection => 17,
      Shown => 18,
      Tapped => 19
   );
   for AnimationEffectTarget'Size use 32;
   
   type AnimationEffectTarget_Ptr is access AnimationEffectTarget;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type AnimationMetricsContract is null record;
   pragma Convention (C_Pass_By_Copy , AnimationMetricsContract);
   
   type AnimationMetricsContract_Ptr is access AnimationMetricsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPropertyAnimation_Interface;
   type IPropertyAnimation is access all IPropertyAnimation_Interface'Class;
   type IPropertyAnimation_Ptr is access all IPropertyAnimation;
   type IScaleAnimation_Interface;
   type IScaleAnimation is access all IScaleAnimation_Interface'Class;
   type IScaleAnimation_Ptr is access all IScaleAnimation;
   type IOpacityAnimation_Interface;
   type IOpacityAnimation is access all IOpacityAnimation_Interface'Class;
   type IOpacityAnimation_Ptr is access all IOpacityAnimation;
   type IAnimationDescription_Interface;
   type IAnimationDescription is access all IAnimationDescription_Interface'Class;
   type IAnimationDescription_Ptr is access all IAnimationDescription;
   type IAnimationDescriptionFactory_Interface;
   type IAnimationDescriptionFactory is access all IAnimationDescriptionFactory_Interface'Class;
   type IAnimationDescriptionFactory_Ptr is access all IAnimationDescriptionFactory;
   type IIterator_IPropertyAnimation_Interface;
   type IIterator_IPropertyAnimation is access all IIterator_IPropertyAnimation_Interface'Class;
   type IIterator_IPropertyAnimation_Ptr is access all IIterator_IPropertyAnimation;
   type IIterable_IPropertyAnimation_Interface;
   type IIterable_IPropertyAnimation is access all IIterable_IPropertyAnimation_Interface'Class;
   type IIterable_IPropertyAnimation_Ptr is access all IIterable_IPropertyAnimation;
   type IVectorView_IPropertyAnimation_Interface;
   type IVectorView_IPropertyAnimation is access all IVectorView_IPropertyAnimation_Interface'Class;
   type IVectorView_IPropertyAnimation_Ptr is access all IVectorView_IPropertyAnimation;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IPropertyAnimation : aliased constant Windows.IID := (973190362, 19852, 16670, (182, 21, 26, 222, 104, 58, 153, 3 ));
   
   type IPropertyAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IPropertyAnimation_Interface
      ; RetVal : access Windows.UI.Core.AnimationMetrics.PropertyAnimationType
   )
   return Windows.HRESULT is abstract;
   
   function get_Delay
   (
      This       : access IPropertyAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Duration
   (
      This       : access IPropertyAnimation_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_Control1
   (
      This       : access IPropertyAnimation_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_Control2
   (
      This       : access IPropertyAnimation_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScaleAnimation : aliased constant Windows.IID := (37049031, 29099, 17036, (156, 159, 211, 23, 128, 150, 73, 149 ));
   
   type IScaleAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InitialScaleX
   (
      This       : access IScaleAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InitialScaleY
   (
      This       : access IScaleAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FinalScaleX
   (
      This       : access IScaleAnimation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_FinalScaleY
   (
      This       : access IScaleAnimation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_NormalizedOrigin
   (
      This       : access IScaleAnimation_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOpacityAnimation : aliased constant Windows.IID := (2151328741, 61054, 17759, (132, 233, 37, 6, 175, 184, 210, 180 ));
   
   type IOpacityAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InitialOpacity
   (
      This       : access IOpacityAnimation_Interface
      ; RetVal : access Windows.Foundation.IReference_Single -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FinalOpacity
   (
      This       : access IOpacityAnimation_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAnimationDescription : aliased constant Windows.IID := (2098308425, 48701, 16862, (176, 129, 5, 193, 73, 150, 47, 155 ));
   
   type IAnimationDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Animations
   (
      This       : access IAnimationDescription_Interface
      ; RetVal : access Windows.UI.Core.AnimationMetrics.IVectorView_IPropertyAnimation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_StaggerDelay
   (
      This       : access IAnimationDescription_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_StaggerDelayFactor
   (
      This       : access IAnimationDescription_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_DelayLimit
   (
      This       : access IAnimationDescription_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ZOrder
   (
      This       : access IAnimationDescription_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAnimationDescriptionFactory : aliased constant Windows.IID := (3336731326, 49659, 18613, (146, 113, 236, 199, 10, 200, 110, 240 ));
   
   type IAnimationDescriptionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IAnimationDescriptionFactory_Interface
      ; effect : Windows.UI.Core.AnimationMetrics.AnimationEffect
      ; target : Windows.UI.Core.AnimationMetrics.AnimationEffectTarget
      ; RetVal : access Windows.UI.Core.AnimationMetrics.IAnimationDescription
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPropertyAnimation : aliased constant Windows.IID := (3144128979, 40730, 23118, (169, 64, 148, 95, 26, 184, 196, 254 ));
   
   type IIterator_IPropertyAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPropertyAnimation_Interface
      ; RetVal : access Windows.UI.Core.AnimationMetrics.IPropertyAnimation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPropertyAnimation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPropertyAnimation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPropertyAnimation_Interface
      ; items : Windows.UI.Core.AnimationMetrics.IPropertyAnimation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPropertyAnimation : aliased constant Windows.IID := (3344899025, 41921, 22657, (157, 160, 30, 205, 184, 229, 27, 195 ));
   
   type IIterable_IPropertyAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPropertyAnimation_Interface
      ; RetVal : access Windows.UI.Core.AnimationMetrics.IIterator_IPropertyAnimation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPropertyAnimation : aliased constant Windows.IID := (980343133, 27216, 24237, (164, 198, 9, 248, 186, 188, 99, 44 ));
   
   type IVectorView_IPropertyAnimation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPropertyAnimation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Core.AnimationMetrics.IPropertyAnimation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPropertyAnimation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPropertyAnimation_Interface
      ; value : Windows.UI.Core.AnimationMetrics.IPropertyAnimation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPropertyAnimation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Core.AnimationMetrics.IPropertyAnimation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AnimationDescription is Windows.UI.Core.AnimationMetrics.IAnimationDescription;
   function CreateInstance
   (
      effect : Windows.UI.Core.AnimationMetrics.AnimationEffect
      ; target : Windows.UI.Core.AnimationMetrics.AnimationEffectTarget
   )
   return Windows.UI.Core.AnimationMetrics.IAnimationDescription;
   
   subtype PropertyAnimation is Windows.UI.Core.AnimationMetrics.IPropertyAnimation;
   subtype ScaleAnimation is Windows.UI.Core.AnimationMetrics.IScaleAnimation;
   subtype TranslationAnimation is Windows.UI.Core.AnimationMetrics.IPropertyAnimation;
   subtype OpacityAnimation is Windows.UI.Core.AnimationMetrics.IOpacityAnimation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
