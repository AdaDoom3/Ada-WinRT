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
limited with Windows.UI.Xaml.Automation.Peers;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.UI.Xaml.Automation is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type AnnotationType is (
      Unknown,
      SpellingError,
      GrammarError,
      Comment,
      FormulaError,
      TrackChanges,
      Header,
      Footer,
      Highlighted,
      Endnote,
      Footnote,
      InsertionChange,
      DeletionChange,
      MoveChange,
      FormatChange,
      UnsyncedChange,
      EditingLockedChange,
      ExternalChange,
      ConflictingChange,
      Author,
      AdvancedProofingIssue,
      DataValidationError,
      CircularReferenceError
   );
   for AnnotationType use (
      Unknown => 60000,
      SpellingError => 60001,
      GrammarError => 60002,
      Comment => 60003,
      FormulaError => 60004,
      TrackChanges => 60005,
      Header => 60006,
      Footer => 60007,
      Highlighted => 60008,
      Endnote => 60009,
      Footnote => 60010,
      InsertionChange => 60011,
      DeletionChange => 60012,
      MoveChange => 60013,
      FormatChange => 60014,
      UnsyncedChange => 60015,
      EditingLockedChange => 60016,
      ExternalChange => 60017,
      ConflictingChange => 60018,
      Author => 60019,
      AdvancedProofingIssue => 60020,
      DataValidationError => 60021,
      CircularReferenceError => 60022
   );
   for AnnotationType'Size use 32;
   
   type AnnotationType_Ptr is access AnnotationType;
   
   type AutomationTextEditChangeType is (
      None,
      AutoCorrect,
      Composition,
      CompositionFinalized
   );
   for AutomationTextEditChangeType use (
      None => 0,
      AutoCorrect => 1,
      Composition => 2,
      CompositionFinalized => 3
   );
   for AutomationTextEditChangeType'Size use 32;
   
   type AutomationTextEditChangeType_Ptr is access AutomationTextEditChangeType;
   
   type DockPosition is (
      Top,
      Left,
      Bottom,
      Right,
      Fill,
      None
   );
   for DockPosition use (
      Top => 0,
      Left => 1,
      Bottom => 2,
      Right => 3,
      Fill => 4,
      None => 5
   );
   for DockPosition'Size use 32;
   
   type DockPosition_Ptr is access DockPosition;
   
   type ExpandCollapseState is (
      Collapsed,
      Expanded,
      PartiallyExpanded,
      LeafNode
   );
   for ExpandCollapseState use (
      Collapsed => 0,
      Expanded => 1,
      PartiallyExpanded => 2,
      LeafNode => 3
   );
   for ExpandCollapseState'Size use 32;
   
   type ExpandCollapseState_Ptr is access ExpandCollapseState;
   
   type RowOrColumnMajor is (
      RowMajor,
      ColumnMajor,
      Indeterminate
   );
   for RowOrColumnMajor use (
      RowMajor => 0,
      ColumnMajor => 1,
      Indeterminate => 2
   );
   for RowOrColumnMajor'Size use 32;
   
   type RowOrColumnMajor_Ptr is access RowOrColumnMajor;
   
   type ScrollAmount is (
      LargeDecrement,
      SmallDecrement,
      NoAmount,
      LargeIncrement,
      SmallIncrement
   );
   for ScrollAmount use (
      LargeDecrement => 0,
      SmallDecrement => 1,
      NoAmount => 2,
      LargeIncrement => 3,
      SmallIncrement => 4
   );
   for ScrollAmount'Size use 32;
   
   type ScrollAmount_Ptr is access ScrollAmount;
   
   type SupportedTextSelection is (
      None,
      Single,
      Multiple
   );
   for SupportedTextSelection use (
      None => 0,
      Single => 1,
      Multiple => 2
   );
   for SupportedTextSelection'Size use 32;
   
   type SupportedTextSelection_Ptr is access SupportedTextSelection;
   
   type SynchronizedInputType is (
      KeyUp,
      KeyDown,
      LeftMouseUp,
      LeftMouseDown,
      RightMouseUp,
      RightMouseDown
   );
   for SynchronizedInputType use (
      KeyUp => 1,
      KeyDown => 2,
      LeftMouseUp => 4,
      LeftMouseDown => 8,
      RightMouseUp => 16,
      RightMouseDown => 32
   );
   for SynchronizedInputType'Size use 32;
   
   type SynchronizedInputType_Ptr is access SynchronizedInputType;
   
   type ToggleState is (
      Off,
      On,
      Indeterminate
   );
   for ToggleState use (
      Off => 0,
      On => 1,
      Indeterminate => 2
   );
   for ToggleState'Size use 32;
   
   type ToggleState_Ptr is access ToggleState;
   
   type WindowInteractionState is (
      Running,
      Closing,
      ReadyForUserInteraction,
      BlockedByModalWindow,
      NotResponding
   );
   for WindowInteractionState use (
      Running => 0,
      Closing => 1,
      ReadyForUserInteraction => 2,
      BlockedByModalWindow => 3,
      NotResponding => 4
   );
   for WindowInteractionState'Size use 32;
   
   type WindowInteractionState_Ptr is access WindowInteractionState;
   
   type WindowVisualState is (
      Normal,
      Maximized,
      Minimized
   );
   for WindowVisualState use (
      Normal => 0,
      Maximized => 1,
      Minimized => 2
   );
   for WindowVisualState'Size use 32;
   
   type WindowVisualState_Ptr is access WindowVisualState;
   
   type ZoomUnit is (
      NoAmount,
      LargeDecrement,
      SmallDecrement,
      LargeIncrement,
      SmallIncrement
   );
   for ZoomUnit use (
      NoAmount => 0,
      LargeDecrement => 1,
      SmallDecrement => 2,
      LargeIncrement => 3,
      SmallIncrement => 4
   );
   for ZoomUnit'Size use 32;
   
   type ZoomUnit_Ptr is access ZoomUnit;
   
   type AutomationActiveEnd is (
      None,
      Start,
      End_x
   );
   for AutomationActiveEnd use (
      None => 0,
      Start => 1,
      End_x => 2
   );
   for AutomationActiveEnd'Size use 32;
   
   type AutomationActiveEnd_Ptr is access AutomationActiveEnd;
   
   type AutomationAnimationStyle is (
      None,
      LasVegasLights,
      BlinkingBackground,
      SparkleText,
      MarchingBlackAnts,
      MarchingRedAnts,
      Shimmer,
      Other
   );
   for AutomationAnimationStyle use (
      None => 0,
      LasVegasLights => 1,
      BlinkingBackground => 2,
      SparkleText => 3,
      MarchingBlackAnts => 4,
      MarchingRedAnts => 5,
      Shimmer => 6,
      Other => 7
   );
   for AutomationAnimationStyle'Size use 32;
   
   type AutomationAnimationStyle_Ptr is access AutomationAnimationStyle;
   
   type AutomationBulletStyle is (
      None,
      HollowRoundBullet,
      FilledRoundBullet,
      HollowSquareBullet,
      FilledSquareBullet,
      DashBullet,
      Other
   );
   for AutomationBulletStyle use (
      None => 0,
      HollowRoundBullet => 1,
      FilledRoundBullet => 2,
      HollowSquareBullet => 3,
      FilledSquareBullet => 4,
      DashBullet => 5,
      Other => 6
   );
   for AutomationBulletStyle'Size use 32;
   
   type AutomationBulletStyle_Ptr is access AutomationBulletStyle;
   
   type AutomationCaretBidiMode is (
      LTR,
      RTL
   );
   for AutomationCaretBidiMode use (
      LTR => 0,
      RTL => 1
   );
   for AutomationCaretBidiMode'Size use 32;
   
   type AutomationCaretBidiMode_Ptr is access AutomationCaretBidiMode;
   
   type AutomationCaretPosition is (
      Unknown,
      EndOfLine,
      BeginningOfLine
   );
   for AutomationCaretPosition use (
      Unknown => 0,
      EndOfLine => 1,
      BeginningOfLine => 2
   );
   for AutomationCaretPosition'Size use 32;
   
   type AutomationCaretPosition_Ptr is access AutomationCaretPosition;
   
   type AutomationFlowDirections is (
      Default,
      RightToLeft,
      BottomToTop,
      Vertical
   );
   for AutomationFlowDirections use (
      Default => 0,
      RightToLeft => 1,
      BottomToTop => 2,
      Vertical => 3
   );
   for AutomationFlowDirections'Size use 32;
   
   type AutomationFlowDirections_Ptr is access AutomationFlowDirections;
   
   type AutomationOutlineStyles is (
      None,
      Outline,
      Shadow,
      Engraved,
      Embossed
   );
   for AutomationOutlineStyles use (
      None => 0,
      Outline => 1,
      Shadow => 2,
      Engraved => 3,
      Embossed => 4
   );
   for AutomationOutlineStyles'Size use 32;
   
   type AutomationOutlineStyles_Ptr is access AutomationOutlineStyles;
   
   type AutomationStyleId is (
      Heading1,
      Heading2,
      Heading3,
      Heading4,
      Heading5,
      Heading6,
      Heading7,
      Heading8,
      Heading9,
      Title,
      Subtitle,
      Normal,
      Emphasis,
      Quote,
      BulletedList
   );
   for AutomationStyleId use (
      Heading1 => 70001,
      Heading2 => 70002,
      Heading3 => 70003,
      Heading4 => 70004,
      Heading5 => 70005,
      Heading6 => 70006,
      Heading7 => 70007,
      Heading8 => 70008,
      Heading9 => 70009,
      Title => 70010,
      Subtitle => 70011,
      Normal => 70012,
      Emphasis => 70013,
      Quote => 70014,
      BulletedList => 70015
   );
   for AutomationStyleId'Size use 32;
   
   type AutomationStyleId_Ptr is access AutomationStyleId;
   
   type AutomationTextDecorationLineStyle is (
      None,
      Single,
      WordsOnly,
      Double,
      Dot,
      Dash,
      DashDot,
      DashDotDot,
      Wavy,
      ThickSingle,
      DoubleWavy,
      ThickWavy,
      LongDash,
      ThickDash,
      ThickDashDot,
      ThickDashDotDot,
      ThickDot,
      ThickLongDash,
      Other
   );
   for AutomationTextDecorationLineStyle use (
      None => 0,
      Single => 1,
      WordsOnly => 2,
      Double => 3,
      Dot => 4,
      Dash => 5,
      DashDot => 6,
      DashDotDot => 7,
      Wavy => 8,
      ThickSingle => 9,
      DoubleWavy => 10,
      ThickWavy => 11,
      LongDash => 12,
      ThickDash => 13,
      ThickDashDot => 14,
      ThickDashDotDot => 15,
      ThickDot => 16,
      ThickLongDash => 17,
      Other => 18
   );
   for AutomationTextDecorationLineStyle'Size use 32;
   
   type AutomationTextDecorationLineStyle_Ptr is access AutomationTextDecorationLineStyle;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAnnotationPatternIdentifiers_Interface;
   type IAnnotationPatternIdentifiers is access all IAnnotationPatternIdentifiers_Interface'Class;
   type IAnnotationPatternIdentifiers_Ptr is access all IAnnotationPatternIdentifiers;
   type IAnnotationPatternIdentifiersStatics_Interface;
   type IAnnotationPatternIdentifiersStatics is access all IAnnotationPatternIdentifiersStatics_Interface'Class;
   type IAnnotationPatternIdentifiersStatics_Ptr is access all IAnnotationPatternIdentifiersStatics;
   type IAutomationElementIdentifiers_Interface;
   type IAutomationElementIdentifiers is access all IAutomationElementIdentifiers_Interface'Class;
   type IAutomationElementIdentifiers_Ptr is access all IAutomationElementIdentifiers;
   type IAutomationElementIdentifiersStatics_Interface;
   type IAutomationElementIdentifiersStatics is access all IAutomationElementIdentifiersStatics_Interface'Class;
   type IAutomationElementIdentifiersStatics_Ptr is access all IAutomationElementIdentifiersStatics;
   type IAutomationElementIdentifiersStatics2_Interface;
   type IAutomationElementIdentifiersStatics2 is access all IAutomationElementIdentifiersStatics2_Interface'Class;
   type IAutomationElementIdentifiersStatics2_Ptr is access all IAutomationElementIdentifiersStatics2;
   type IAutomationElementIdentifiersStatics3_Interface;
   type IAutomationElementIdentifiersStatics3 is access all IAutomationElementIdentifiersStatics3_Interface'Class;
   type IAutomationElementIdentifiersStatics3_Ptr is access all IAutomationElementIdentifiersStatics3;
   type IAutomationElementIdentifiersStatics4_Interface;
   type IAutomationElementIdentifiersStatics4 is access all IAutomationElementIdentifiersStatics4_Interface'Class;
   type IAutomationElementIdentifiersStatics4_Ptr is access all IAutomationElementIdentifiersStatics4;
   type IAutomationElementIdentifiersStatics5_Interface;
   type IAutomationElementIdentifiersStatics5 is access all IAutomationElementIdentifiersStatics5_Interface'Class;
   type IAutomationElementIdentifiersStatics5_Ptr is access all IAutomationElementIdentifiersStatics5;
   type IAutomationElementIdentifiersStatics6_Interface;
   type IAutomationElementIdentifiersStatics6 is access all IAutomationElementIdentifiersStatics6_Interface'Class;
   type IAutomationElementIdentifiersStatics6_Ptr is access all IAutomationElementIdentifiersStatics6;
   type IAutomationProperties_Interface;
   type IAutomationProperties is access all IAutomationProperties_Interface'Class;
   type IAutomationProperties_Ptr is access all IAutomationProperties;
   type IAutomationPropertiesStatics_Interface;
   type IAutomationPropertiesStatics is access all IAutomationPropertiesStatics_Interface'Class;
   type IAutomationPropertiesStatics_Ptr is access all IAutomationPropertiesStatics;
   type IAutomationPropertiesStatics2_Interface;
   type IAutomationPropertiesStatics2 is access all IAutomationPropertiesStatics2_Interface'Class;
   type IAutomationPropertiesStatics2_Ptr is access all IAutomationPropertiesStatics2;
   type IAutomationPropertiesStatics3_Interface;
   type IAutomationPropertiesStatics3 is access all IAutomationPropertiesStatics3_Interface'Class;
   type IAutomationPropertiesStatics3_Ptr is access all IAutomationPropertiesStatics3;
   type IAutomationPropertiesStatics4_Interface;
   type IAutomationPropertiesStatics4 is access all IAutomationPropertiesStatics4_Interface'Class;
   type IAutomationPropertiesStatics4_Ptr is access all IAutomationPropertiesStatics4;
   type IAutomationPropertiesStatics5_Interface;
   type IAutomationPropertiesStatics5 is access all IAutomationPropertiesStatics5_Interface'Class;
   type IAutomationPropertiesStatics5_Ptr is access all IAutomationPropertiesStatics5;
   type IAutomationPropertiesStatics6_Interface;
   type IAutomationPropertiesStatics6 is access all IAutomationPropertiesStatics6_Interface'Class;
   type IAutomationPropertiesStatics6_Ptr is access all IAutomationPropertiesStatics6;
   type IAutomationProperty_Interface;
   type IAutomationProperty is access all IAutomationProperty_Interface'Class;
   type IAutomationProperty_Ptr is access all IAutomationProperty;
   type IDockPatternIdentifiers_Interface;
   type IDockPatternIdentifiers is access all IDockPatternIdentifiers_Interface'Class;
   type IDockPatternIdentifiers_Ptr is access all IDockPatternIdentifiers;
   type IDockPatternIdentifiersStatics_Interface;
   type IDockPatternIdentifiersStatics is access all IDockPatternIdentifiersStatics_Interface'Class;
   type IDockPatternIdentifiersStatics_Ptr is access all IDockPatternIdentifiersStatics;
   type IDragPatternIdentifiers_Interface;
   type IDragPatternIdentifiers is access all IDragPatternIdentifiers_Interface'Class;
   type IDragPatternIdentifiers_Ptr is access all IDragPatternIdentifiers;
   type IDragPatternIdentifiersStatics_Interface;
   type IDragPatternIdentifiersStatics is access all IDragPatternIdentifiersStatics_Interface'Class;
   type IDragPatternIdentifiersStatics_Ptr is access all IDragPatternIdentifiersStatics;
   type IDropTargetPatternIdentifiers_Interface;
   type IDropTargetPatternIdentifiers is access all IDropTargetPatternIdentifiers_Interface'Class;
   type IDropTargetPatternIdentifiers_Ptr is access all IDropTargetPatternIdentifiers;
   type IDropTargetPatternIdentifiersStatics_Interface;
   type IDropTargetPatternIdentifiersStatics is access all IDropTargetPatternIdentifiersStatics_Interface'Class;
   type IDropTargetPatternIdentifiersStatics_Ptr is access all IDropTargetPatternIdentifiersStatics;
   type IExpandCollapsePatternIdentifiers_Interface;
   type IExpandCollapsePatternIdentifiers is access all IExpandCollapsePatternIdentifiers_Interface'Class;
   type IExpandCollapsePatternIdentifiers_Ptr is access all IExpandCollapsePatternIdentifiers;
   type IExpandCollapsePatternIdentifiersStatics_Interface;
   type IExpandCollapsePatternIdentifiersStatics is access all IExpandCollapsePatternIdentifiersStatics_Interface'Class;
   type IExpandCollapsePatternIdentifiersStatics_Ptr is access all IExpandCollapsePatternIdentifiersStatics;
   type IGridItemPatternIdentifiers_Interface;
   type IGridItemPatternIdentifiers is access all IGridItemPatternIdentifiers_Interface'Class;
   type IGridItemPatternIdentifiers_Ptr is access all IGridItemPatternIdentifiers;
   type IGridItemPatternIdentifiersStatics_Interface;
   type IGridItemPatternIdentifiersStatics is access all IGridItemPatternIdentifiersStatics_Interface'Class;
   type IGridItemPatternIdentifiersStatics_Ptr is access all IGridItemPatternIdentifiersStatics;
   type IGridPatternIdentifiers_Interface;
   type IGridPatternIdentifiers is access all IGridPatternIdentifiers_Interface'Class;
   type IGridPatternIdentifiers_Ptr is access all IGridPatternIdentifiers;
   type IGridPatternIdentifiersStatics_Interface;
   type IGridPatternIdentifiersStatics is access all IGridPatternIdentifiersStatics_Interface'Class;
   type IGridPatternIdentifiersStatics_Ptr is access all IGridPatternIdentifiersStatics;
   type IMultipleViewPatternIdentifiers_Interface;
   type IMultipleViewPatternIdentifiers is access all IMultipleViewPatternIdentifiers_Interface'Class;
   type IMultipleViewPatternIdentifiers_Ptr is access all IMultipleViewPatternIdentifiers;
   type IMultipleViewPatternIdentifiersStatics_Interface;
   type IMultipleViewPatternIdentifiersStatics is access all IMultipleViewPatternIdentifiersStatics_Interface'Class;
   type IMultipleViewPatternIdentifiersStatics_Ptr is access all IMultipleViewPatternIdentifiersStatics;
   type IRangeValuePatternIdentifiers_Interface;
   type IRangeValuePatternIdentifiers is access all IRangeValuePatternIdentifiers_Interface'Class;
   type IRangeValuePatternIdentifiers_Ptr is access all IRangeValuePatternIdentifiers;
   type IRangeValuePatternIdentifiersStatics_Interface;
   type IRangeValuePatternIdentifiersStatics is access all IRangeValuePatternIdentifiersStatics_Interface'Class;
   type IRangeValuePatternIdentifiersStatics_Ptr is access all IRangeValuePatternIdentifiersStatics;
   type IScrollPatternIdentifiers_Interface;
   type IScrollPatternIdentifiers is access all IScrollPatternIdentifiers_Interface'Class;
   type IScrollPatternIdentifiers_Ptr is access all IScrollPatternIdentifiers;
   type IScrollPatternIdentifiersStatics_Interface;
   type IScrollPatternIdentifiersStatics is access all IScrollPatternIdentifiersStatics_Interface'Class;
   type IScrollPatternIdentifiersStatics_Ptr is access all IScrollPatternIdentifiersStatics;
   type ISelectionItemPatternIdentifiers_Interface;
   type ISelectionItemPatternIdentifiers is access all ISelectionItemPatternIdentifiers_Interface'Class;
   type ISelectionItemPatternIdentifiers_Ptr is access all ISelectionItemPatternIdentifiers;
   type ISelectionItemPatternIdentifiersStatics_Interface;
   type ISelectionItemPatternIdentifiersStatics is access all ISelectionItemPatternIdentifiersStatics_Interface'Class;
   type ISelectionItemPatternIdentifiersStatics_Ptr is access all ISelectionItemPatternIdentifiersStatics;
   type ISelectionPatternIdentifiers_Interface;
   type ISelectionPatternIdentifiers is access all ISelectionPatternIdentifiers_Interface'Class;
   type ISelectionPatternIdentifiers_Ptr is access all ISelectionPatternIdentifiers;
   type ISelectionPatternIdentifiersStatics_Interface;
   type ISelectionPatternIdentifiersStatics is access all ISelectionPatternIdentifiersStatics_Interface'Class;
   type ISelectionPatternIdentifiersStatics_Ptr is access all ISelectionPatternIdentifiersStatics;
   type ISpreadsheetItemPatternIdentifiers_Interface;
   type ISpreadsheetItemPatternIdentifiers is access all ISpreadsheetItemPatternIdentifiers_Interface'Class;
   type ISpreadsheetItemPatternIdentifiers_Ptr is access all ISpreadsheetItemPatternIdentifiers;
   type ISpreadsheetItemPatternIdentifiersStatics_Interface;
   type ISpreadsheetItemPatternIdentifiersStatics is access all ISpreadsheetItemPatternIdentifiersStatics_Interface'Class;
   type ISpreadsheetItemPatternIdentifiersStatics_Ptr is access all ISpreadsheetItemPatternIdentifiersStatics;
   type IStylesPatternIdentifiers_Interface;
   type IStylesPatternIdentifiers is access all IStylesPatternIdentifiers_Interface'Class;
   type IStylesPatternIdentifiers_Ptr is access all IStylesPatternIdentifiers;
   type IStylesPatternIdentifiersStatics_Interface;
   type IStylesPatternIdentifiersStatics is access all IStylesPatternIdentifiersStatics_Interface'Class;
   type IStylesPatternIdentifiersStatics_Ptr is access all IStylesPatternIdentifiersStatics;
   type ITableItemPatternIdentifiers_Interface;
   type ITableItemPatternIdentifiers is access all ITableItemPatternIdentifiers_Interface'Class;
   type ITableItemPatternIdentifiers_Ptr is access all ITableItemPatternIdentifiers;
   type ITableItemPatternIdentifiersStatics_Interface;
   type ITableItemPatternIdentifiersStatics is access all ITableItemPatternIdentifiersStatics_Interface'Class;
   type ITableItemPatternIdentifiersStatics_Ptr is access all ITableItemPatternIdentifiersStatics;
   type ITablePatternIdentifiers_Interface;
   type ITablePatternIdentifiers is access all ITablePatternIdentifiers_Interface'Class;
   type ITablePatternIdentifiers_Ptr is access all ITablePatternIdentifiers;
   type ITablePatternIdentifiersStatics_Interface;
   type ITablePatternIdentifiersStatics is access all ITablePatternIdentifiersStatics_Interface'Class;
   type ITablePatternIdentifiersStatics_Ptr is access all ITablePatternIdentifiersStatics;
   type ITogglePatternIdentifiers_Interface;
   type ITogglePatternIdentifiers is access all ITogglePatternIdentifiers_Interface'Class;
   type ITogglePatternIdentifiers_Ptr is access all ITogglePatternIdentifiers;
   type ITogglePatternIdentifiersStatics_Interface;
   type ITogglePatternIdentifiersStatics is access all ITogglePatternIdentifiersStatics_Interface'Class;
   type ITogglePatternIdentifiersStatics_Ptr is access all ITogglePatternIdentifiersStatics;
   type ITransformPattern2Identifiers_Interface;
   type ITransformPattern2Identifiers is access all ITransformPattern2Identifiers_Interface'Class;
   type ITransformPattern2Identifiers_Ptr is access all ITransformPattern2Identifiers;
   type ITransformPattern2IdentifiersStatics_Interface;
   type ITransformPattern2IdentifiersStatics is access all ITransformPattern2IdentifiersStatics_Interface'Class;
   type ITransformPattern2IdentifiersStatics_Ptr is access all ITransformPattern2IdentifiersStatics;
   type ITransformPatternIdentifiers_Interface;
   type ITransformPatternIdentifiers is access all ITransformPatternIdentifiers_Interface'Class;
   type ITransformPatternIdentifiers_Ptr is access all ITransformPatternIdentifiers;
   type ITransformPatternIdentifiersStatics_Interface;
   type ITransformPatternIdentifiersStatics is access all ITransformPatternIdentifiersStatics_Interface'Class;
   type ITransformPatternIdentifiersStatics_Ptr is access all ITransformPatternIdentifiersStatics;
   type IValuePatternIdentifiers_Interface;
   type IValuePatternIdentifiers is access all IValuePatternIdentifiers_Interface'Class;
   type IValuePatternIdentifiers_Ptr is access all IValuePatternIdentifiers;
   type IValuePatternIdentifiersStatics_Interface;
   type IValuePatternIdentifiersStatics is access all IValuePatternIdentifiersStatics_Interface'Class;
   type IValuePatternIdentifiersStatics_Ptr is access all IValuePatternIdentifiersStatics;
   type IWindowPatternIdentifiers_Interface;
   type IWindowPatternIdentifiers is access all IWindowPatternIdentifiers_Interface'Class;
   type IWindowPatternIdentifiers_Ptr is access all IWindowPatternIdentifiers;
   type IWindowPatternIdentifiersStatics_Interface;
   type IWindowPatternIdentifiersStatics is access all IWindowPatternIdentifiersStatics_Interface'Class;
   type IWindowPatternIdentifiersStatics_Ptr is access all IWindowPatternIdentifiersStatics;
   type IAutomationAnnotation_Interface;
   type IAutomationAnnotation is access all IAutomationAnnotation_Interface'Class;
   type IAutomationAnnotation_Ptr is access all IAutomationAnnotation;
   type IAutomationAnnotationStatics_Interface;
   type IAutomationAnnotationStatics is access all IAutomationAnnotationStatics_Interface'Class;
   type IAutomationAnnotationStatics_Ptr is access all IAutomationAnnotationStatics;
   type IAutomationAnnotationFactory_Interface;
   type IAutomationAnnotationFactory is access all IAutomationAnnotationFactory_Interface'Class;
   type IAutomationAnnotationFactory_Ptr is access all IAutomationAnnotationFactory;
   type IIterator_IAutomationAnnotation_Interface;
   type IIterator_IAutomationAnnotation is access all IIterator_IAutomationAnnotation_Interface'Class;
   type IIterator_IAutomationAnnotation_Ptr is access all IIterator_IAutomationAnnotation;
   type IIterable_IAutomationAnnotation_Interface;
   type IIterable_IAutomationAnnotation is access all IIterable_IAutomationAnnotation_Interface'Class;
   type IIterable_IAutomationAnnotation_Ptr is access all IIterable_IAutomationAnnotation;
   type IVectorView_IAutomationAnnotation_Interface;
   type IVectorView_IAutomationAnnotation is access all IVectorView_IAutomationAnnotation_Interface'Class;
   type IVectorView_IAutomationAnnotation_Ptr is access all IVectorView_IAutomationAnnotation;
   type IVector_IAutomationAnnotation_Interface;
   type IVector_IAutomationAnnotation is access all IVector_IAutomationAnnotation_Interface'Class;
   type IVector_IAutomationAnnotation_Ptr is access all IVector_IAutomationAnnotation;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAnnotationPatternIdentifiers : aliased constant Windows.IID := (3564478657, 18610, 20032, (166, 207, 61, 196, 182, 56, 192, 222 ));
   
   type IAnnotationPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAnnotationPatternIdentifiersStatics : aliased constant Windows.IID := (3773014877, 53607, 18140, (149, 171, 51, 10, 246, 26, 235, 181 ));
   
   type IAnnotationPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AnnotationTypeIdProperty
   (
      This       : access IAnnotationPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AnnotationTypeNameProperty
   (
      This       : access IAnnotationPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthorProperty
   (
      This       : access IAnnotationPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DateTimeProperty
   (
      This       : access IAnnotationPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetProperty
   (
      This       : access IAnnotationPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationElementIdentifiers : aliased constant Windows.IID := (3867829199, 17221, 20013, (138, 106, 73, 204, 225, 250, 45, 204 ));
   
   type IAutomationElementIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationElementIdentifiersStatics : aliased constant Windows.IID := (1162426783, 33600, 19815, (185, 191, 140, 42, 198, 160, 119, 58 ));
   
   type IAutomationElementIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AcceleratorKeyProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AutomationIdProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundingRectangleProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClassNameProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ClickablePointProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlTypeProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HasKeyboardFocusProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HelpTextProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsContentElementProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsControlElementProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsEnabledProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsKeyboardFocusableProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOffscreenProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPasswordProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRequiredForFormProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemStatusProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemTypeProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LabeledByProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalizedControlTypeProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_NameProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_OrientationProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LiveSettingProperty
   (
      This       : access IAutomationElementIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationElementIdentifiersStatics2 : aliased constant Windows.IID := (3050025442, 54623, 18089, (158, 218, 26, 71, 66, 81, 93, 195 ));
   
   type IAutomationElementIdentifiersStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ControlledPeersProperty
   (
      This       : access IAutomationElementIdentifiersStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationElementIdentifiersStatics3 : aliased constant Windows.IID := (257736381, 46059, 16515, (173, 199, 12, 47, 57, 187, 53, 67 ));
   
   type IAutomationElementIdentifiersStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PositionInSetProperty
   (
      This       : access IAutomationElementIdentifiersStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SizeOfSetProperty
   (
      This       : access IAutomationElementIdentifiersStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LevelProperty
   (
      This       : access IAutomationElementIdentifiersStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_AnnotationsProperty
   (
      This       : access IAutomationElementIdentifiersStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationElementIdentifiersStatics4 : aliased constant Windows.IID := (1526013813, 22803, 19832, (179, 48, 166, 245, 11, 115, 237, 155 ));
   
   type IAutomationElementIdentifiersStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LandmarkTypeProperty
   (
      This       : access IAutomationElementIdentifiersStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalizedLandmarkTypeProperty
   (
      This       : access IAutomationElementIdentifiersStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationElementIdentifiersStatics5 : aliased constant Windows.IID := (2557116934, 56921, 17145, (161, 231, 98, 184, 175, 158, 117, 109 ));
   
   type IAutomationElementIdentifiersStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPeripheralProperty
   (
      This       : access IAutomationElementIdentifiersStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDataValidForFormProperty
   (
      This       : access IAutomationElementIdentifiersStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FullDescriptionProperty
   (
      This       : access IAutomationElementIdentifiersStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DescribedByProperty
   (
      This       : access IAutomationElementIdentifiersStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowsToProperty
   (
      This       : access IAutomationElementIdentifiersStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowsFromProperty
   (
      This       : access IAutomationElementIdentifiersStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationElementIdentifiersStatics6 : aliased constant Windows.IID := (3729960973, 33576, 20142, (128, 53, 248, 219, 153, 200, 186, 196 ));
   
   type IAutomationElementIdentifiersStatics6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CultureProperty
   (
      This       : access IAutomationElementIdentifiersStatics6_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationProperties : aliased constant Windows.IID := (1758929708, 58914, 18665, (175, 11, 31, 250, 51, 204, 92, 186 ));
   
   type IAutomationProperties_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPropertiesStatics : aliased constant Windows.IID := (3055091067, 13008, 18800, (156, 66, 124, 3, 154, 199, 190, 120 ));
   
   type IAutomationPropertiesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AcceleratorKeyProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetAcceleratorKey
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetAcceleratorKey
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessKeyProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessKey
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetAccessKey
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AutomationIdProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetAutomationId
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetAutomationId
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HelpTextProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetHelpText
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetHelpText
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRequiredForFormProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsRequiredForForm
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetIsRequiredForForm
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemStatusProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetItemStatus
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetItemStatus
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ItemTypeProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetItemType
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetItemType
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LabeledByProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetLabeledBy
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function SetLabeledBy
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function get_NameProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetName
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetName
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LiveSettingProperty
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetLiveSetting
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT is abstract;
   
   function SetLiveSetting
   (
      This       : access IAutomationPropertiesStatics_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPropertiesStatics2 : aliased constant Windows.IID := (964056191, 28809, 18433, (143, 29, 170, 183, 128, 144, 209, 160 ));
   
   type IAutomationPropertiesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AccessibilityViewProperty
   (
      This       : access IAutomationPropertiesStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetAccessibilityView
   (
      This       : access IAutomationPropertiesStatics2_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AccessibilityView
   )
   return Windows.HRESULT is abstract;
   
   function SetAccessibilityView
   (
      This       : access IAutomationPropertiesStatics2_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AccessibilityView
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlledPeersProperty
   (
      This       : access IAutomationPropertiesStatics2_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetControlledPeers
   (
      This       : access IAutomationPropertiesStatics2_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IVector_IUIElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPropertiesStatics3 : aliased constant Windows.IID := (2071320373, 23729, 17069, (155, 87, 95, 171, 168, 193, 134, 127 ));
   
   type IAutomationPropertiesStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PositionInSetProperty
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetPositionInSet
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetPositionInSet
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SizeOfSetProperty
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetSizeOfSet
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetSizeOfSet
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LevelProperty
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetLevel
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetLevel
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_AnnotationsProperty
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetAnnotations
   (
      This       : access IAutomationPropertiesStatics3_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.Automation.IVector_IAutomationAnnotation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPropertiesStatics4 : aliased constant Windows.IID := (4158006869, 12570, 19324, (161, 49, 82, 78, 137, 205, 60, 249 ));
   
   type IAutomationPropertiesStatics4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LandmarkTypeProperty
   (
      This       : access IAutomationPropertiesStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetLandmarkType
   (
      This       : access IAutomationPropertiesStatics4_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType
   )
   return Windows.HRESULT is abstract;
   
   function SetLandmarkType
   (
      This       : access IAutomationPropertiesStatics4_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalizedLandmarkTypeProperty
   (
      This       : access IAutomationPropertiesStatics4_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalizedLandmarkType
   (
      This       : access IAutomationPropertiesStatics4_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetLocalizedLandmarkType
   (
      This       : access IAutomationPropertiesStatics4_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPropertiesStatics5 : aliased constant Windows.IID := (199449382, 51449, 16802, (180, 219, 230, 167, 163, 43, 12, 52 ));
   
   type IAutomationPropertiesStatics5_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPeripheralProperty
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsPeripheral
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetIsPeripheral
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsDataValidForFormProperty
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetIsDataValidForForm
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetIsDataValidForForm
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_FullDescriptionProperty
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetFullDescription
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetFullDescription
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LocalizedControlTypeProperty
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalizedControlType
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetLocalizedControlType
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DescribedByProperty
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetDescribedBy
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IVector_IDependencyObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowsToProperty
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetFlowsTo
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IVector_IDependencyObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_FlowsFromProperty
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetFlowsFrom
   (
      This       : access IAutomationPropertiesStatics5_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.UI.Xaml.IVector_IDependencyObject -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationPropertiesStatics6 : aliased constant Windows.IID := (3323855631, 60233, 20061, (176, 18, 76, 28, 150, 195, 144, 27 ));
   
   type IAutomationPropertiesStatics6_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CultureProperty
   (
      This       : access IAutomationPropertiesStatics6_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function GetCulture
   (
      This       : access IAutomationPropertiesStatics6_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetCulture
   (
      This       : access IAutomationPropertiesStatics6_Interface
      ; element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationProperty : aliased constant Windows.IID := (3056015707, 12839, 19990, (149, 52, 221, 236, 227, 13, 219, 70 ));
   
   type IAutomationProperty_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IDockPatternIdentifiers : aliased constant Windows.IID := (3436704998, 58617, 18431, (189, 231, 55, 139, 17, 247, 142, 9 ));
   
   type IDockPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IDockPatternIdentifiersStatics : aliased constant Windows.IID := (730276956, 60800, 20453, (142, 180, 112, 138, 57, 200, 65, 229 ));
   
   type IDockPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DockPositionProperty
   (
      This       : access IDockPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDragPatternIdentifiers : aliased constant Windows.IID := (1650911621, 19719, 20096, (130, 235, 143, 150, 105, 10, 26, 12 ));
   
   type IDragPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IDragPatternIdentifiersStatics : aliased constant Windows.IID := (704984989, 5973, 16514, (157, 144, 70, 241, 65, 29, 121, 134 ));
   
   type IDragPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DropEffectProperty
   (
      This       : access IDragPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DropEffectsProperty
   (
      This       : access IDragPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_GrabbedItemsProperty
   (
      This       : access IDragPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGrabbedProperty
   (
      This       : access IDragPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDropTargetPatternIdentifiers : aliased constant Windows.IID := (294015283, 42750, 17972, (189, 24, 14, 246, 18, 183, 178, 8 ));
   
   type IDropTargetPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IDropTargetPatternIdentifiersStatics : aliased constant Windows.IID := (459879172, 35323, 19210, (148, 82, 202, 44, 102, 170, 249, 243 ));
   
   type IDropTargetPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DropTargetEffectProperty
   (
      This       : access IDropTargetPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_DropTargetEffectsProperty
   (
      This       : access IDropTargetPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IExpandCollapsePatternIdentifiers : aliased constant Windows.IID := (2953231040, 29979, 19797, (146, 203, 97, 62, 193, 189, 245, 208 ));
   
   type IExpandCollapsePatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IExpandCollapsePatternIdentifiersStatics : aliased constant Windows.IID := (3615584212, 28384, 20280, (142, 20, 86, 239, 33, 173, 172, 253 ));
   
   type IExpandCollapsePatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExpandCollapseStateProperty
   (
      This       : access IExpandCollapsePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGridItemPatternIdentifiers : aliased constant Windows.IID := (1970750705, 12933, 20401, (128, 59, 37, 69, 189, 67, 21, 153 ));
   
   type IGridItemPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGridItemPatternIdentifiersStatics : aliased constant Windows.IID := (561849346, 24134, 19809, (135, 148, 184, 238, 142, 119, 71, 20 ));
   
   type IGridItemPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColumnProperty
   (
      This       : access IGridItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ColumnSpanProperty
   (
      This       : access IGridItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ContainingGridProperty
   (
      This       : access IGridItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RowProperty
   (
      This       : access IGridItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RowSpanProperty
   (
      This       : access IGridItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IGridPatternIdentifiers : aliased constant Windows.IID := (3372390415, 38597, 17676, (144, 68, 126, 82, 194, 79, 158, 148 ));
   
   type IGridPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IGridPatternIdentifiersStatics : aliased constant Windows.IID := (2076463859, 41345, 16695, (141, 233, 31, 155, 26, 131, 32, 237 ));
   
   type IGridPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColumnCountProperty
   (
      This       : access IGridPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RowCountProperty
   (
      This       : access IGridPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMultipleViewPatternIdentifiers : aliased constant Windows.IID := (1566364600, 7698, 18571, (176, 234, 94, 108, 184, 152, 22, 225 ));
   
   type IMultipleViewPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IMultipleViewPatternIdentifiersStatics : aliased constant Windows.IID := (2848958063, 27524, 19825, (158, 72, 215, 100, 211, 188, 218, 142 ));
   
   type IMultipleViewPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CurrentViewProperty
   (
      This       : access IMultipleViewPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedViewsProperty
   (
      This       : access IMultipleViewPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRangeValuePatternIdentifiers : aliased constant Windows.IID := (4168486725, 13257, 18045, (188, 158, 209, 81, 82, 99, 172, 225 ));
   
   type IRangeValuePatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IRangeValuePatternIdentifiersStatics : aliased constant Windows.IID := (3458417935, 7207, 17791, (184, 21, 122, 94, 70, 134, 61, 187 ));
   
   type IRangeValuePatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReadOnlyProperty
   (
      This       : access IRangeValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_LargeChangeProperty
   (
      This       : access IRangeValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaximumProperty
   (
      This       : access IRangeValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinimumProperty
   (
      This       : access IRangeValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallChangeProperty
   (
      This       : access IRangeValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ValueProperty
   (
      This       : access IRangeValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IScrollPatternIdentifiers : aliased constant Windows.IID := (912986115, 16988, 18769, (174, 131, 213, 33, 231, 59, 198, 150 ));
   
   type IScrollPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IScrollPatternIdentifiersStatics : aliased constant Windows.IID := (1274601633, 64383, 20388, (131, 179, 207, 174, 177, 3, 166, 133 ));
   
   type IScrollPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HorizontallyScrollableProperty
   (
      This       : access IScrollPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalScrollPercentProperty
   (
      This       : access IScrollPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalViewSizeProperty
   (
      This       : access IScrollPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_NoScroll
   (
      This       : access IScrollPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticallyScrollableProperty
   (
      This       : access IScrollPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalScrollPercentProperty
   (
      This       : access IScrollPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalViewSizeProperty
   (
      This       : access IScrollPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISelectionItemPatternIdentifiers : aliased constant Windows.IID := (766485530, 16120, 19381, (160, 43, 62, 225, 178, 39, 71, 64 ));
   
   type ISelectionItemPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISelectionItemPatternIdentifiersStatics : aliased constant Windows.IID := (2836975971, 18558, 20030, (159, 134, 123, 68, 172, 190, 39, 206 ));
   
   type ISelectionItemPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSelectedProperty
   (
      This       : access ISelectionItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionContainerProperty
   (
      This       : access ISelectionItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISelectionPatternIdentifiers : aliased constant Windows.IID := (1252421552, 58359, 18271, (183, 141, 248, 168, 59, 183, 48, 196 ));
   
   type ISelectionPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISelectionPatternIdentifiersStatics : aliased constant Windows.IID := (2466470732, 27472, 16545, (178, 63, 92, 120, 221, 189, 71, 154 ));
   
   type ISelectionPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanSelectMultipleProperty
   (
      This       : access ISelectionPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSelectionRequiredProperty
   (
      This       : access ISelectionPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionProperty
   (
      This       : access ISelectionPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpreadsheetItemPatternIdentifiers : aliased constant Windows.IID := (2218032665, 51787, 18082, (167, 148, 200, 121, 40, 163, 177, 171 ));
   
   type ISpreadsheetItemPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ISpreadsheetItemPatternIdentifiersStatics : aliased constant Windows.IID := (1130727289, 21376, 20242, (180, 104, 180, 243, 104, 173, 68, 153 ));
   
   type ISpreadsheetItemPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FormulaProperty
   (
      This       : access ISpreadsheetItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStylesPatternIdentifiers : aliased constant Windows.IID := (2967790081, 59549, 17259, (130, 135, 79, 121, 3, 70, 104, 121 ));
   
   type IStylesPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IStylesPatternIdentifiersStatics : aliased constant Windows.IID := (1384793466, 48188, 19784, (148, 175, 31, 104, 112, 60, 162, 150 ));
   
   type IStylesPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExtendedPropertiesProperty
   (
      This       : access IStylesPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FillColorProperty
   (
      This       : access IStylesPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FillPatternColorProperty
   (
      This       : access IStylesPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_FillPatternStyleProperty
   (
      This       : access IStylesPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ShapeProperty
   (
      This       : access IStylesPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleIdProperty
   (
      This       : access IStylesPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_StyleNameProperty
   (
      This       : access IStylesPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITableItemPatternIdentifiers : aliased constant Windows.IID := (3274106285, 32887, 19556, (152, 228, 232, 59, 207, 27, 67, 137 ));
   
   type ITableItemPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITableItemPatternIdentifiersStatics : aliased constant Windows.IID := (616872227, 59810, 19945, (178, 164, 168, 178, 45, 11, 227, 98 ));
   
   type ITableItemPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColumnHeaderItemsProperty
   (
      This       : access ITableItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RowHeaderItemsProperty
   (
      This       : access ITableItemPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITablePatternIdentifiers : aliased constant Windows.IID := (953222398, 3340, 16682, (191, 141, 81, 237, 230, 131, 186, 245 ));
   
   type ITablePatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITablePatternIdentifiersStatics : aliased constant Windows.IID := (1963408677, 13001, 18691, (174, 207, 220, 53, 4, 203, 210, 68 ));
   
   type ITablePatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ColumnHeadersProperty
   (
      This       : access ITablePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RowHeadersProperty
   (
      This       : access ITablePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_RowOrColumnMajorProperty
   (
      This       : access ITablePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITogglePatternIdentifiers : aliased constant Windows.IID := (2115575659, 13524, 19175, (131, 172, 41, 248, 136, 130, 217, 133 ));
   
   type ITogglePatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITogglePatternIdentifiersStatics : aliased constant Windows.IID := (3354875204, 5285, 20271, (146, 252, 118, 5, 36, 222, 6, 234 ));
   
   type ITogglePatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ToggleStateProperty
   (
      This       : access ITogglePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITransformPattern2Identifiers : aliased constant Windows.IID := (145399869, 56999, 16431, (128, 151, 154, 39, 131, 214, 14, 93 ));
   
   type ITransformPattern2Identifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITransformPattern2IdentifiersStatics : aliased constant Windows.IID := (2023110212, 4592, 18044, (167, 43, 93, 172, 65, 193, 246, 254 ));
   
   type ITransformPattern2IdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanZoomProperty
   (
      This       : access ITransformPattern2IdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ZoomLevelProperty
   (
      This       : access ITransformPattern2IdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxZoomProperty
   (
      This       : access ITransformPattern2IdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_MinZoomProperty
   (
      This       : access ITransformPattern2IdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITransformPatternIdentifiers : aliased constant Windows.IID := (3826342796, 50120, 18999, (185, 148, 39, 9, 167, 129, 22, 101 ));
   
   type ITransformPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_ITransformPatternIdentifiersStatics : aliased constant Windows.IID := (1165028779, 55045, 16580, (161, 220, 233, 172, 252, 239, 133, 246 ));
   
   type ITransformPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanMoveProperty
   (
      This       : access ITransformPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CanResizeProperty
   (
      This       : access ITransformPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CanRotateProperty
   (
      This       : access ITransformPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IValuePatternIdentifiers : aliased constant Windows.IID := (1113323084, 21299, 20033, (180, 112, 43, 173, 20, 236, 208, 133 ));
   
   type IValuePatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IValuePatternIdentifiersStatics : aliased constant Windows.IID := (3259492599, 44492, 17423, (177, 35, 51, 120, 138, 64, 82, 90 ));
   
   type IValuePatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsReadOnlyProperty
   (
      This       : access IValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ValueProperty
   (
      This       : access IValuePatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWindowPatternIdentifiers : aliased constant Windows.IID := (972524468, 28722, 16866, (183, 158, 39, 183, 74, 134, 40, 222 ));
   
   type IWindowPatternIdentifiers_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IWindowPatternIdentifiersStatics : aliased constant Windows.IID := (131116294, 25346, 19753, (135, 139, 25, 218, 3, 252, 34, 141 ));
   
   type IWindowPatternIdentifiersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanMaximizeProperty
   (
      This       : access IWindowPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_CanMinimizeProperty
   (
      This       : access IWindowPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsModalProperty
   (
      This       : access IWindowPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTopmostProperty
   (
      This       : access IWindowPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_WindowInteractionStateProperty
   (
      This       : access IWindowPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_WindowVisualStateProperty
   (
      This       : access IWindowPatternIdentifiersStatics_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationAnnotation : aliased constant Windows.IID := (4215025866, 984, 17944, (145, 191, 228, 216, 79, 74, 243, 24 ));
   
   type IAutomationAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access IAutomationAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.HRESULT is abstract;
   
   function put_Type
   (
      This       : access IAutomationAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.HRESULT is abstract;
   
   function get_Element
   (
      This       : access IAutomationAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   function put_Element
   (
      This       : access IAutomationAnnotation_Interface
      ; value : Windows.UI.Xaml.IUIElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationAnnotationStatics : aliased constant Windows.IID := (3842239159, 20197, 18635, (181, 184, 187, 205, 70, 201, 209, 218 ));
   
   type IAutomationAnnotationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TypeProperty
   (
      This       : access IAutomationAnnotationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementProperty
   (
      This       : access IAutomationAnnotationStatics_Interface
      ; RetVal : access Windows.UI.Xaml.IDependencyProperty
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAutomationAnnotationFactory : aliased constant Windows.IID := (1225194066, 56768, 20073, (183, 107, 1, 157, 146, 141, 130, 47 ));
   
   type IAutomationAnnotationFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstance
   (
      This       : access IAutomationAnnotationFactory_Interface
      ; type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithElementParameter
   (
      This       : access IAutomationAnnotationFactory_Interface
      ; type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; element : Windows.UI.Xaml.IUIElement
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IAutomationAnnotation : aliased constant Windows.IID := (2127768483, 56076, 23124, (171, 67, 48, 98, 138, 251, 194, 216 ));
   
   type IIterator_IAutomationAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IAutomationAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IAutomationAnnotation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IAutomationAnnotation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IAutomationAnnotation_Interface
      ; items : Windows.UI.Xaml.Automation.IAutomationAnnotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IAutomationAnnotation : aliased constant Windows.IID := (3336704203, 7291, 24170, (147, 107, 97, 212, 229, 54, 162, 145 ));
   
   type IIterable_IAutomationAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IAutomationAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IIterator_IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IAutomationAnnotation : aliased constant Windows.IID := (2763563628, 36873, 21396, (152, 200, 152, 16, 126, 128, 219, 97 ));
   
   type IVectorView_IAutomationAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IAutomationAnnotation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IAutomationAnnotation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IAutomationAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.IAutomationAnnotation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IAutomationAnnotation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Automation.IAutomationAnnotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IAutomationAnnotation : aliased constant Windows.IID := (1935240322, 63205, 23383, (141, 197, 85, 108, 183, 168, 251, 230 ));
   
   type IVector_IAutomationAnnotation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; RetVal : access Windows.UI.Xaml.Automation.IVectorView_IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.IAutomationAnnotation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; value : Windows.UI.Xaml.Automation.IAutomationAnnotation
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IAutomationAnnotation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IAutomationAnnotation_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.Xaml.Automation.IAutomationAnnotation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IAutomationAnnotation_Interface
      ; items : Windows.UI.Xaml.Automation.IAutomationAnnotation_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype AutomationProperty is Windows.UI.Xaml.Automation.IAutomationProperty;
   subtype AnnotationPatternIdentifiers is Windows.UI.Xaml.Automation.IAnnotationPatternIdentifiers;
   subtype AutomationElementIdentifiers is Windows.UI.Xaml.Automation.IAutomationElementIdentifiers;
   subtype AutomationProperties is Windows.UI.Xaml.Automation.IAutomationProperties;
   subtype DockPatternIdentifiers is Windows.UI.Xaml.Automation.IDockPatternIdentifiers;
   subtype DragPatternIdentifiers is Windows.UI.Xaml.Automation.IDragPatternIdentifiers;
   subtype DropTargetPatternIdentifiers is Windows.UI.Xaml.Automation.IDropTargetPatternIdentifiers;
   subtype ExpandCollapsePatternIdentifiers is Windows.UI.Xaml.Automation.IExpandCollapsePatternIdentifiers;
   subtype GridItemPatternIdentifiers is Windows.UI.Xaml.Automation.IGridItemPatternIdentifiers;
   subtype GridPatternIdentifiers is Windows.UI.Xaml.Automation.IGridPatternIdentifiers;
   subtype MultipleViewPatternIdentifiers is Windows.UI.Xaml.Automation.IMultipleViewPatternIdentifiers;
   subtype RangeValuePatternIdentifiers is Windows.UI.Xaml.Automation.IRangeValuePatternIdentifiers;
   subtype ScrollPatternIdentifiers is Windows.UI.Xaml.Automation.IScrollPatternIdentifiers;
   subtype SelectionItemPatternIdentifiers is Windows.UI.Xaml.Automation.ISelectionItemPatternIdentifiers;
   subtype SelectionPatternIdentifiers is Windows.UI.Xaml.Automation.ISelectionPatternIdentifiers;
   subtype SpreadsheetItemPatternIdentifiers is Windows.UI.Xaml.Automation.ISpreadsheetItemPatternIdentifiers;
   subtype StylesPatternIdentifiers is Windows.UI.Xaml.Automation.IStylesPatternIdentifiers;
   subtype TableItemPatternIdentifiers is Windows.UI.Xaml.Automation.ITableItemPatternIdentifiers;
   subtype TablePatternIdentifiers is Windows.UI.Xaml.Automation.ITablePatternIdentifiers;
   subtype TogglePatternIdentifiers is Windows.UI.Xaml.Automation.ITogglePatternIdentifiers;
   subtype TransformPattern2Identifiers is Windows.UI.Xaml.Automation.ITransformPattern2Identifiers;
   subtype TransformPatternIdentifiers is Windows.UI.Xaml.Automation.ITransformPatternIdentifiers;
   subtype ValuePatternIdentifiers is Windows.UI.Xaml.Automation.IValuePatternIdentifiers;
   subtype WindowPatternIdentifiers is Windows.UI.Xaml.Automation.IWindowPatternIdentifiers;
   subtype AutomationAnnotation is Windows.UI.Xaml.Automation.IAutomationAnnotation;
   function CreateInstance
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.UI.Xaml.Automation.IAutomationAnnotation;
   
   function CreateWithElementParameter
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.Automation.IAutomationAnnotation;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_AnnotationTypeIdProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_AnnotationTypeNameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_AuthorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_DateTimeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_TargetProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_PositionInSetProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_SizeOfSetProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_LevelProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_AnnotationsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsPeripheralProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsDataValidForFormProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_FullDescriptionProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_DescribedByProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_FlowsToProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_FlowsFromProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ControlledPeersProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CultureProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_AcceleratorKeyProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_AccessKeyProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_AutomationIdProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_BoundingRectangleProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ClassNameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ClickablePointProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ControlTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_HasKeyboardFocusProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_HelpTextProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsContentElementProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsControlElementProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsEnabledProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsKeyboardFocusableProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsOffscreenProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsPasswordProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsRequiredForFormProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ItemStatusProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ItemTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_LabeledByProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_LocalizedControlTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_NameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_OrientationProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_LiveSettingProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_LandmarkTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_LocalizedLandmarkTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsPeripheralProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsPeripheral
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetIsPeripheral
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_IsDataValidForFormProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsDataValidForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetIsDataValidForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_FullDescriptionProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetFullDescription
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetFullDescription
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_LocalizedControlTypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetLocalizedControlType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetLocalizedControlType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_DescribedByProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetDescribedBy
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IDependencyObject;
   
   function get_FlowsToProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetFlowsTo
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IDependencyObject;
   
   function get_FlowsFromProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetFlowsFrom
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IDependencyObject;
   
   function get_LandmarkTypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType;
   
   procedure SetLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType
   )
   ;
   
   function get_LocalizedLandmarkTypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetLocalizedLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetLocalizedLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_AccessibilityViewProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetAccessibilityView
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.Peers.AccessibilityView;
   
   procedure SetAccessibilityView
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AccessibilityView
   )
   ;
   
   function get_ControlledPeersProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetControlledPeers
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IUIElement;
   
   function get_CultureProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetCulture
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetCulture
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_AcceleratorKeyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetAcceleratorKey
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetAcceleratorKey
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_AccessKeyProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetAccessKey
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetAccessKey
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_AutomationIdProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetAutomationId
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetAutomationId
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_HelpTextProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetHelpText
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetHelpText
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_IsRequiredForFormProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetIsRequiredForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean;
   
   procedure SetIsRequiredForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   ;
   
   function get_ItemStatusProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetItemStatus
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetItemStatus
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_ItemTypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetItemType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetItemType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_LabeledByProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetLabeledBy
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IUIElement;
   
   procedure SetLabeledBy
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.IUIElement
   )
   ;
   
   function get_NameProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetName
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String;
   
   procedure SetName
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   ;
   
   function get_LiveSettingProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetLiveSetting
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting;
   
   procedure SetLiveSetting
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   ;
   
   function get_PositionInSetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetPositionInSet
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetPositionInSet
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_SizeOfSetProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetSizeOfSet
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetSizeOfSet
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_LevelProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetLevel
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32;
   
   procedure SetLevel
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   ;
   
   function get_AnnotationsProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function GetAnnotations
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.IVector_IAutomationAnnotation;
   
   function get_DockPositionProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_DropEffectProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_DropEffectsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_GrabbedItemsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsGrabbedProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_DropTargetEffectProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_DropTargetEffectsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ExpandCollapseStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ColumnProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ColumnSpanProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ContainingGridProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_RowProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_RowSpanProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ColumnCountProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_RowCountProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CurrentViewProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_SupportedViewsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsReadOnlyProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_LargeChangeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_MaximumProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_MinimumProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_SmallChangeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ValueProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_HorizontallyScrollableProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_HorizontalScrollPercentProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_HorizontalViewSizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_NoScroll
   return Windows.Double;
   
   function get_VerticallyScrollableProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_VerticalScrollPercentProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_VerticalViewSizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsSelectedProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_SelectionContainerProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CanSelectMultipleProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsSelectionRequiredProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_SelectionProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_FormulaProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ExtendedPropertiesProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_FillColorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_FillPatternColorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_FillPatternStyleProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ShapeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_StyleIdProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_StyleNameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ColumnHeaderItemsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_RowHeaderItemsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ColumnHeadersProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_RowHeadersProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_RowOrColumnMajorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ToggleStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CanZoomProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ZoomLevelProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_MaxZoomProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_MinZoomProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CanMoveProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CanResizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CanRotateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsReadOnlyProperty_IValuePatternIdentifiers
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_ValueProperty_IValuePatternIdentifiers
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CanMaximizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_CanMinimizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsModalProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_IsTopmostProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_WindowInteractionStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_WindowVisualStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty;
   
   function get_TypeProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
   function get_ElementProperty
   return Windows.UI.Xaml.IDependencyProperty;
   
end;
