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
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.UI.Text is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CaretType is (
      Normal,
      Null_x
   );
   for CaretType use (
      Normal => 0,
      Null_x => 1
   );
   for CaretType'Size use 32;
   
   type CaretType_Ptr is access CaretType;
   
   type FindOptions is (
      None,
      Word,
      Case_x
   );
   for FindOptions use (
      None => 0,
      Word => 2,
      Case_x => 4
   );
   for FindOptions'Size use 32;
   
   type FindOptions_Ptr is access FindOptions;
   
   type FormatEffect is (
      Off,
      On,
      Toggle,
      Undefined
   );
   for FormatEffect use (
      Off => 0,
      On => 1,
      Toggle => 2,
      Undefined => 3
   );
   for FormatEffect'Size use 32;
   
   type FormatEffect_Ptr is access FormatEffect;
   
   type HorizontalCharacterAlignment is (
      Left,
      Right,
      Center
   );
   for HorizontalCharacterAlignment use (
      Left => 0,
      Right => 1,
      Center => 2
   );
   for HorizontalCharacterAlignment'Size use 32;
   
   type HorizontalCharacterAlignment_Ptr is access HorizontalCharacterAlignment;
   
   type LetterCase is (
      Lower,
      Upper
   );
   for LetterCase use (
      Lower => 0,
      Upper => 1
   );
   for LetterCase'Size use 32;
   
   type LetterCase_Ptr is access LetterCase;
   
   type LineSpacingRule is (
      Undefined,
      Single,
      OneAndHalf,
      Double,
      AtLeast,
      Exactly,
      Multiple,
      Percent
   );
   for LineSpacingRule use (
      Undefined => 0,
      Single => 1,
      OneAndHalf => 2,
      Double => 3,
      AtLeast => 4,
      Exactly => 5,
      Multiple => 6,
      Percent => 7
   );
   for LineSpacingRule'Size use 32;
   
   type LineSpacingRule_Ptr is access LineSpacingRule;
   
   type LinkType is (
      Undefined,
      NotALink,
      ClientLink,
      FriendlyLinkName,
      FriendlyLinkAddress,
      AutoLink,
      AutoLinkEmail,
      AutoLinkPhone,
      AutoLinkPath
   );
   for LinkType use (
      Undefined => 0,
      NotALink => 1,
      ClientLink => 2,
      FriendlyLinkName => 3,
      FriendlyLinkAddress => 4,
      AutoLink => 5,
      AutoLinkEmail => 6,
      AutoLinkPhone => 7,
      AutoLinkPath => 8
   );
   for LinkType'Size use 32;
   
   type LinkType_Ptr is access LinkType;
   
   type MarkerAlignment is (
      Undefined,
      Left,
      Center,
      Right
   );
   for MarkerAlignment use (
      Undefined => 0,
      Left => 1,
      Center => 2,
      Right => 3
   );
   for MarkerAlignment'Size use 32;
   
   type MarkerAlignment_Ptr is access MarkerAlignment;
   
   type MarkerStyle is (
      Undefined,
      Parenthesis,
      Parentheses,
      Period,
      Plain,
      Minus,
      NoNumber
   );
   for MarkerStyle use (
      Undefined => 0,
      Parenthesis => 1,
      Parentheses => 2,
      Period => 3,
      Plain => 4,
      Minus => 5,
      NoNumber => 6
   );
   for MarkerStyle'Size use 32;
   
   type MarkerStyle_Ptr is access MarkerStyle;
   
   type MarkerType is (
      Undefined,
      None,
      Bullet,
      Arabic,
      LowercaseEnglishLetter,
      UppercaseEnglishLetter,
      LowercaseRoman,
      UppercaseRoman,
      UnicodeSequence,
      CircledNumber,
      BlackCircleWingding,
      WhiteCircleWingding,
      ArabicWide,
      SimplifiedChinese,
      TraditionalChinese,
      JapanSimplifiedChinese,
      JapanKorea,
      ArabicDictionary,
      ArabicAbjad,
      Hebrew,
      ThaiAlphabetic,
      ThaiNumeric,
      DevanagariVowel,
      DevanagariConsonant,
      DevanagariNumeric
   );
   for MarkerType use (
      Undefined => 0,
      None => 1,
      Bullet => 2,
      Arabic => 3,
      LowercaseEnglishLetter => 4,
      UppercaseEnglishLetter => 5,
      LowercaseRoman => 6,
      UppercaseRoman => 7,
      UnicodeSequence => 8,
      CircledNumber => 9,
      BlackCircleWingding => 10,
      WhiteCircleWingding => 11,
      ArabicWide => 12,
      SimplifiedChinese => 13,
      TraditionalChinese => 14,
      JapanSimplifiedChinese => 15,
      JapanKorea => 16,
      ArabicDictionary => 17,
      ArabicAbjad => 18,
      Hebrew => 19,
      ThaiAlphabetic => 20,
      ThaiNumeric => 21,
      DevanagariVowel => 22,
      DevanagariConsonant => 23,
      DevanagariNumeric => 24
   );
   for MarkerType'Size use 32;
   
   type MarkerType_Ptr is access MarkerType;
   
   type ParagraphAlignment is (
      Undefined,
      Left,
      Center,
      Right,
      Justify
   );
   for ParagraphAlignment use (
      Undefined => 0,
      Left => 1,
      Center => 2,
      Right => 3,
      Justify => 4
   );
   for ParagraphAlignment'Size use 32;
   
   type ParagraphAlignment_Ptr is access ParagraphAlignment;
   
   type ParagraphStyle is (
      Undefined,
      None,
      Normal,
      Heading1,
      Heading2,
      Heading3,
      Heading4,
      Heading5,
      Heading6,
      Heading7,
      Heading8,
      Heading9
   );
   for ParagraphStyle use (
      Undefined => 0,
      None => 1,
      Normal => 2,
      Heading1 => 3,
      Heading2 => 4,
      Heading3 => 5,
      Heading4 => 6,
      Heading5 => 7,
      Heading6 => 8,
      Heading7 => 9,
      Heading8 => 10,
      Heading9 => 11
   );
   for ParagraphStyle'Size use 32;
   
   type ParagraphStyle_Ptr is access ParagraphStyle;
   
   type PointOptions is (
      None,
      IncludeInset,
      Start,
      ClientCoordinates,
      AllowOffClient,
      Transform,
      NoHorizontalScroll,
      NoVerticalScroll
   );
   for PointOptions use (
      None => 0,
      IncludeInset => 1,
      Start => 32,
      ClientCoordinates => 256,
      AllowOffClient => 512,
      Transform => 1024,
      NoHorizontalScroll => 65536,
      NoVerticalScroll => 262144
   );
   for PointOptions'Size use 32;
   
   type PointOptions_Ptr is access PointOptions;
   
   type RangeGravity is (
      UIBehavior,
      Backward,
      Forward,
      Inward,
      Outward
   );
   for RangeGravity use (
      UIBehavior => 0,
      Backward => 1,
      Forward => 2,
      Inward => 3,
      Outward => 4
   );
   for RangeGravity'Size use 32;
   
   type RangeGravity_Ptr is access RangeGravity;
   
   type SelectionOptions is (
      StartActive,
      AtEndOfLine,
      Overtype,
      Active,
      Replace
   );
   for SelectionOptions use (
      StartActive => 1,
      AtEndOfLine => 2,
      Overtype => 4,
      Active => 8,
      Replace => 16
   );
   for SelectionOptions'Size use 32;
   
   type SelectionOptions_Ptr is access SelectionOptions;
   
   type SelectionType is (
      None,
      InsertionPoint,
      Normal,
      InlineShape,
      Shape
   );
   for SelectionType use (
      None => 0,
      InsertionPoint => 1,
      Normal => 2,
      InlineShape => 7,
      Shape => 8
   );
   for SelectionType'Size use 32;
   
   type SelectionType_Ptr is access SelectionType;
   
   type TabAlignment is (
      Left,
      Center,
      Right,
      Decimal,
      Bar
   );
   for TabAlignment use (
      Left => 0,
      Center => 1,
      Right => 2,
      Decimal => 3,
      Bar => 4
   );
   for TabAlignment'Size use 32;
   
   type TabAlignment_Ptr is access TabAlignment;
   
   type TabLeader is (
      Spaces,
      Dots,
      Dashes,
      Lines,
      ThickLines,
      Equals
   );
   for TabLeader use (
      Spaces => 0,
      Dots => 1,
      Dashes => 2,
      Lines => 3,
      ThickLines => 4,
      Equals => 5
   );
   for TabLeader'Size use 32;
   
   type TabLeader_Ptr is access TabLeader;
   
   type TextGetOptions is (
      None,
      AdjustCrlf,
      UseCrlf,
      UseObjectText,
      AllowFinalEop,
      NoHidden,
      IncludeNumbering,
      FormatRtf,
      UseLf
   );
   for TextGetOptions use (
      None => 0,
      AdjustCrlf => 1,
      UseCrlf => 2,
      UseObjectText => 4,
      AllowFinalEop => 8,
      NoHidden => 32,
      IncludeNumbering => 64,
      FormatRtf => 8192,
      UseLf => 16777216
   );
   for TextGetOptions'Size use 32;
   
   type TextGetOptions_Ptr is access TextGetOptions;
   
   type TextSetOptions is (
      None,
      UnicodeBidi,
      Unlink,
      Unhide,
      CheckTextLimit,
      FormatRtf,
      ApplyRtfDocumentDefaults
   );
   for TextSetOptions use (
      None => 0,
      UnicodeBidi => 1,
      Unlink => 8,
      Unhide => 16,
      CheckTextLimit => 32,
      FormatRtf => 8192,
      ApplyRtfDocumentDefaults => 16384
   );
   for TextSetOptions'Size use 32;
   
   type TextSetOptions_Ptr is access TextSetOptions;
   
   type TextRangeUnit is (
      Character,
      Word,
      Sentence,
      Paragraph,
      Line,
      Story,
      Screen,
      Section,
      Window,
      CharacterFormat,
      ParagraphFormat,
      Object,
      HardParagraph,
      Cluster,
      Bold,
      Italic,
      Underline,
      Strikethrough,
      ProtectedText,
      Link,
      SmallCaps,
      AllCaps,
      Hidden,
      Outline,
      Shadow,
      Imprint,
      Disabled,
      Revised,
      Subscript,
      Superscript,
      FontBound,
      LinkProtected
   );
   for TextRangeUnit use (
      Character => 0,
      Word => 1,
      Sentence => 2,
      Paragraph => 3,
      Line => 4,
      Story => 5,
      Screen => 6,
      Section => 7,
      Window => 8,
      CharacterFormat => 9,
      ParagraphFormat => 10,
      Object => 11,
      HardParagraph => 12,
      Cluster => 13,
      Bold => 14,
      Italic => 15,
      Underline => 16,
      Strikethrough => 17,
      ProtectedText => 18,
      Link => 19,
      SmallCaps => 20,
      AllCaps => 21,
      Hidden => 22,
      Outline => 23,
      Shadow => 24,
      Imprint => 25,
      Disabled => 26,
      Revised => 27,
      Subscript => 28,
      Superscript => 29,
      FontBound => 30,
      LinkProtected => 31
   );
   for TextRangeUnit'Size use 32;
   
   type TextRangeUnit_Ptr is access TextRangeUnit;
   
   type TextScript is (
      Undefined,
      Ansi,
      EastEurope,
      Cyrillic,
      Greek,
      Turkish,
      Hebrew,
      Arabic,
      Baltic,
      Vietnamese,
      Default,
      Symbol,
      Thai,
      ShiftJis,
      GB2312,
      Hangul,
      Big5,
      PC437,
      Oem,
      Mac,
      Armenian,
      Syriac,
      Thaana,
      Devanagari,
      Bengali,
      Gurmukhi,
      Gujarati,
      Oriya,
      Tamil,
      Telugu,
      Kannada,
      Malayalam,
      Sinhala,
      Lao,
      Tibetan,
      Myanmar,
      Georgian,
      Jamo,
      Ethiopic,
      Cherokee,
      Aboriginal,
      Ogham,
      Runic,
      Khmer,
      Mongolian,
      Braille,
      Yi,
      Limbu,
      TaiLe,
      NewTaiLue,
      SylotiNagri,
      Kharoshthi,
      Kayahli,
      UnicodeSymbol,
      Emoji,
      Glagolitic,
      Lisu,
      Vai,
      NKo,
      Osmanya,
      PhagsPa,
      Gothic,
      Deseret,
      Tifinagh
   );
   for TextScript use (
      Undefined => 0,
      Ansi => 1,
      EastEurope => 2,
      Cyrillic => 3,
      Greek => 4,
      Turkish => 5,
      Hebrew => 6,
      Arabic => 7,
      Baltic => 8,
      Vietnamese => 9,
      Default => 10,
      Symbol => 11,
      Thai => 12,
      ShiftJis => 13,
      GB2312 => 14,
      Hangul => 15,
      Big5 => 16,
      PC437 => 17,
      Oem => 18,
      Mac => 19,
      Armenian => 20,
      Syriac => 21,
      Thaana => 22,
      Devanagari => 23,
      Bengali => 24,
      Gurmukhi => 25,
      Gujarati => 26,
      Oriya => 27,
      Tamil => 28,
      Telugu => 29,
      Kannada => 30,
      Malayalam => 31,
      Sinhala => 32,
      Lao => 33,
      Tibetan => 34,
      Myanmar => 35,
      Georgian => 36,
      Jamo => 37,
      Ethiopic => 38,
      Cherokee => 39,
      Aboriginal => 40,
      Ogham => 41,
      Runic => 42,
      Khmer => 43,
      Mongolian => 44,
      Braille => 45,
      Yi => 46,
      Limbu => 47,
      TaiLe => 48,
      NewTaiLue => 49,
      SylotiNagri => 50,
      Kharoshthi => 51,
      Kayahli => 52,
      UnicodeSymbol => 53,
      Emoji => 54,
      Glagolitic => 55,
      Lisu => 56,
      Vai => 57,
      NKo => 58,
      Osmanya => 59,
      PhagsPa => 60,
      Gothic => 61,
      Deseret => 62,
      Tifinagh => 63
   );
   for TextScript'Size use 32;
   
   type TextScript_Ptr is access TextScript;
   
   type UnderlineType is (
      Undefined,
      None,
      Single,
      Words,
      Double,
      Dotted,
      Dash,
      DashDot,
      DashDotDot,
      Wave,
      Thick,
      Thin,
      DoubleWave,
      HeavyWave,
      LongDash,
      ThickDash,
      ThickDashDot,
      ThickDashDotDot,
      ThickDotted,
      ThickLongDash
   );
   for UnderlineType use (
      Undefined => 0,
      None => 1,
      Single => 2,
      Words => 3,
      Double => 4,
      Dotted => 5,
      Dash => 6,
      DashDot => 7,
      DashDotDot => 8,
      Wave => 9,
      Thick => 10,
      Thin => 11,
      DoubleWave => 12,
      HeavyWave => 13,
      LongDash => 14,
      ThickDash => 15,
      ThickDashDot => 16,
      ThickDashDotDot => 17,
      ThickDotted => 18,
      ThickLongDash => 19
   );
   for UnderlineType'Size use 32;
   
   type UnderlineType_Ptr is access UnderlineType;
   
   type VerticalCharacterAlignment is (
      Top,
      Baseline,
      Bottom
   );
   for VerticalCharacterAlignment use (
      Top => 0,
      Baseline => 1,
      Bottom => 2
   );
   for VerticalCharacterAlignment'Size use 32;
   
   type VerticalCharacterAlignment_Ptr is access VerticalCharacterAlignment;
   
   type FontStretch is (
      Undefined,
      UltraCondensed,
      ExtraCondensed,
      Condensed,
      SemiCondensed,
      Normal,
      SemiExpanded,
      Expanded,
      ExtraExpanded,
      UltraExpanded
   );
   for FontStretch use (
      Undefined => 0,
      UltraCondensed => 1,
      ExtraCondensed => 2,
      Condensed => 3,
      SemiCondensed => 4,
      Normal => 5,
      SemiExpanded => 6,
      Expanded => 7,
      ExtraExpanded => 8,
      UltraExpanded => 9
   );
   for FontStretch'Size use 32;
   
   type FontStretch_Ptr is access FontStretch;
   
   type FontStyle is (
      Normal,
      Oblique,
      Italic
   );
   for FontStyle use (
      Normal => 0,
      Oblique => 1,
      Italic => 2
   );
   for FontStyle'Size use 32;
   
   type FontStyle_Ptr is access FontStyle;
   
   type TextDecorations is (
      None,
      Underline,
      Strikethrough
   );
   for TextDecorations use (
      None => 0,
      Underline => 1,
      Strikethrough => 2
   );
   for TextDecorations'Size use 32;
   
   type TextDecorations_Ptr is access TextDecorations;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type FontWeight is record
      Weight : Windows.UInt16;
   end record;
   pragma Convention (C_Pass_By_Copy , FontWeight);
   
   type FontWeight_Ptr is access FontWeight;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ITextConstantsStatics_Interface;
   type ITextConstantsStatics is access all ITextConstantsStatics_Interface'Class;
   type ITextConstantsStatics_Ptr is access all ITextConstantsStatics;
   type ITextDocument_Interface;
   type ITextDocument is access all ITextDocument_Interface'Class;
   type ITextDocument_Ptr is access all ITextDocument;
   type ITextRange_Interface;
   type ITextRange is access all ITextRange_Interface'Class;
   type ITextRange_Ptr is access all ITextRange;
   type ITextSelection_Interface;
   type ITextSelection is access all ITextSelection_Interface'Class;
   type ITextSelection_Ptr is access all ITextSelection;
   type ITextCharacterFormat_Interface;
   type ITextCharacterFormat is access all ITextCharacterFormat_Interface'Class;
   type ITextCharacterFormat_Ptr is access all ITextCharacterFormat;
   type ITextParagraphFormat_Interface;
   type ITextParagraphFormat is access all ITextParagraphFormat_Interface'Class;
   type ITextParagraphFormat_Ptr is access all ITextParagraphFormat;
   type ITextDocument2_Interface;
   type ITextDocument2 is access all ITextDocument2_Interface'Class;
   type ITextDocument2_Ptr is access all ITextDocument2;
   type IFontWeights_Interface;
   type IFontWeights is access all IFontWeights_Interface'Class;
   type IFontWeights_Ptr is access all IFontWeights;
   type IFontWeightsStatics_Interface;
   type IFontWeightsStatics is access all IFontWeightsStatics_Interface'Class;
   type IFontWeightsStatics_Ptr is access all IFontWeightsStatics;
   type IReference_UnderlineType_Interface;
   type IReference_UnderlineType is access all IReference_UnderlineType_Interface'Class;
   type IReference_UnderlineType_Ptr is access all IReference_UnderlineType;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ITextConstantsStatics : aliased constant Windows.IID := (2006875187, 6301, 19450, (151, 200, 16, 219, 19, 93, 151, 110 ));
   
   type ITextConstantsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AutoColor
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MinUnitCount
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxUnitCount
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_UndefinedColor
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_UndefinedFloatValue
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_UndefinedInt32Value
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_UndefinedFontStretch
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontStretch
   )
   return Windows.HRESULT is abstract;
   
   function get_UndefinedFontStyle
   (
      This       : access ITextConstantsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontStyle
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextDocument : aliased constant Windows.IID := (3203288539, 37042, 16524, (162, 246, 10, 10, 195, 30, 51, 228 ));
   
   type ITextDocument_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CaretType
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.UI.Text.CaretType
   )
   return Windows.HRESULT is abstract;
   
   function put_CaretType
   (
      This       : access ITextDocument_Interface
      ; value : Windows.UI.Text.CaretType
   )
   return Windows.HRESULT is abstract;
   
   function get_DefaultTabStop
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_DefaultTabStop
   (
      This       : access ITextDocument_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Selection
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.UI.Text.ITextSelection
   )
   return Windows.HRESULT is abstract;
   
   function get_UndoLimit
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_UndoLimit
   (
      This       : access ITextDocument_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function CanCopy
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CanPaste
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CanRedo
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CanUndo
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ApplyDisplayUpdates
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function BatchDisplayUpdates
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function BeginUndoGroup
   (
      This       : access ITextDocument_Interface
   )
   return Windows.HRESULT is abstract;
   
   function EndUndoGroup
   (
      This       : access ITextDocument_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultCharacterFormat
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.UI.Text.ITextCharacterFormat
   )
   return Windows.HRESULT is abstract;
   
   function GetDefaultParagraphFormat
   (
      This       : access ITextDocument_Interface
      ; RetVal : access Windows.UI.Text.ITextParagraphFormat
   )
   return Windows.HRESULT is abstract;
   
   function GetRange
   (
      This       : access ITextDocument_Interface
      ; startPosition : Windows.Int32
      ; endPosition : Windows.Int32
      ; RetVal : access Windows.UI.Text.ITextRange
   )
   return Windows.HRESULT is abstract;
   
   function GetRangeFromPoint
   (
      This       : access ITextDocument_Interface
      ; point : Windows.Foundation.Point
      ; options : Windows.UI.Text.PointOptions
      ; RetVal : access Windows.UI.Text.ITextRange
   )
   return Windows.HRESULT is abstract;
   
   function GetText
   (
      This       : access ITextDocument_Interface
      ; options : Windows.UI.Text.TextGetOptions
      ; value : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LoadFromStream
   (
      This       : access ITextDocument_Interface
      ; options : Windows.UI.Text.TextSetOptions
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function Redo
   (
      This       : access ITextDocument_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SaveToStream
   (
      This       : access ITextDocument_Interface
      ; options : Windows.UI.Text.TextGetOptions
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function SetDefaultCharacterFormat
   (
      This       : access ITextDocument_Interface
      ; value : Windows.UI.Text.ITextCharacterFormat
   )
   return Windows.HRESULT is abstract;
   
   function SetDefaultParagraphFormat
   (
      This       : access ITextDocument_Interface
      ; value : Windows.UI.Text.ITextParagraphFormat
   )
   return Windows.HRESULT is abstract;
   
   function SetText
   (
      This       : access ITextDocument_Interface
      ; options : Windows.UI.Text.TextSetOptions
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Undo
   (
      This       : access ITextDocument_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextRange : aliased constant Windows.IID := (1537101399, 49266, 17056, (137, 69, 175, 80, 62, 229, 71, 104 ));
   
   type ITextRange_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Character
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function put_Character
   (
      This       : access ITextRange_Interface
      ; value : Windows.UInt8
   )
   return Windows.HRESULT is abstract;
   
   function get_CharacterFormat
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.UI.Text.ITextCharacterFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_CharacterFormat
   (
      This       : access ITextRange_Interface
      ; value : Windows.UI.Text.ITextCharacterFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_FormattedText
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.UI.Text.ITextRange
   )
   return Windows.HRESULT is abstract;
   
   function put_FormattedText
   (
      This       : access ITextRange_Interface
      ; value : Windows.UI.Text.ITextRange
   )
   return Windows.HRESULT is abstract;
   
   function get_EndPosition
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_EndPosition
   (
      This       : access ITextRange_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Gravity
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.UI.Text.RangeGravity
   )
   return Windows.HRESULT is abstract;
   
   function put_Gravity
   (
      This       : access ITextRange_Interface
      ; value : Windows.UI.Text.RangeGravity
   )
   return Windows.HRESULT is abstract;
   
   function get_Length
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Link
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Link
   (
      This       : access ITextRange_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ParagraphFormat
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.UI.Text.ITextParagraphFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_ParagraphFormat
   (
      This       : access ITextRange_Interface
      ; value : Windows.UI.Text.ITextParagraphFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_StartPosition
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_StartPosition
   (
      This       : access ITextRange_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_StoryLength
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Text
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access ITextRange_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CanPaste
   (
      This       : access ITextRange_Interface
      ; format : Windows.Int32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ChangeCase
   (
      This       : access ITextRange_Interface
      ; value : Windows.UI.Text.LetterCase
   )
   return Windows.HRESULT is abstract;
   
   function Collapse
   (
      This       : access ITextRange_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Copy
   (
      This       : access ITextRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Cut
   (
      This       : access ITextRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Delete
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function EndOf
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function Expand
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function FindText
   (
      This       : access ITextRange_Interface
      ; value : Windows.String
      ; scanLength : Windows.Int32
      ; options : Windows.UI.Text.FindOptions
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetCharacterUtf32
   (
      This       : access ITextRange_Interface
      ; value : access Windows.UInt32
      ; offset : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetClone
   (
      This       : access ITextRange_Interface
      ; RetVal : access Windows.UI.Text.ITextRange
   )
   return Windows.HRESULT is abstract;
   
   function GetIndex
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetPoint
   (
      This       : access ITextRange_Interface
      ; horizontalAlign : Windows.UI.Text.HorizontalCharacterAlignment
      ; verticalAlign : Windows.UI.Text.VerticalCharacterAlignment
      ; options : Windows.UI.Text.PointOptions
      ; point : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function GetRect
   (
      This       : access ITextRange_Interface
      ; options : Windows.UI.Text.PointOptions
      ; rect : access Windows.Foundation.Rect
      ; hit : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function GetText
   (
      This       : access ITextRange_Interface
      ; options : Windows.UI.Text.TextGetOptions
      ; value : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetTextViaStream
   (
      This       : access ITextRange_Interface
      ; options : Windows.UI.Text.TextGetOptions
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function InRange
   (
      This       : access ITextRange_Interface
      ; range_x : Windows.UI.Text.ITextRange
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function InsertImage
   (
      This       : access ITextRange_Interface
      ; width : Windows.Int32
      ; height : Windows.Int32
      ; ascent : Windows.Int32
      ; verticalAlign : Windows.UI.Text.VerticalCharacterAlignment
      ; alternateText : Windows.String
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function InStory
   (
      This       : access ITextRange_Interface
      ; range_x : Windows.UI.Text.ITextRange
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsEqual
   (
      This       : access ITextRange_Interface
      ; range_x : Windows.UI.Text.ITextRange
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Move
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveEnd
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveStart
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function Paste
   (
      This       : access ITextRange_Interface
      ; format : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ScrollIntoView
   (
      This       : access ITextRange_Interface
      ; value : Windows.UI.Text.PointOptions
   )
   return Windows.HRESULT is abstract;
   
   function MatchSelection
   (
      This       : access ITextRange_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetIndex
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; index : Windows.Int32
      ; extend : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetPoint
   (
      This       : access ITextRange_Interface
      ; point : Windows.Foundation.Point
      ; options : Windows.UI.Text.PointOptions
      ; extend : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetRange
   (
      This       : access ITextRange_Interface
      ; startPosition : Windows.Int32
      ; endPosition : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetText
   (
      This       : access ITextRange_Interface
      ; options : Windows.UI.Text.TextSetOptions
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetTextViaStream
   (
      This       : access ITextRange_Interface
      ; options : Windows.UI.Text.TextSetOptions
      ; value : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function StartOf
   (
      This       : access ITextRange_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextSelection : aliased constant Windows.IID := (2798872356, 62095, 17162, (178, 207, 195, 67, 103, 30, 192, 233 ));
   
   type ITextSelection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Options
   (
      This       : access ITextSelection_Interface
      ; RetVal : access Windows.UI.Text.SelectionOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_Options
   (
      This       : access ITextSelection_Interface
      ; value : Windows.UI.Text.SelectionOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access ITextSelection_Interface
      ; RetVal : access Windows.UI.Text.SelectionType
   )
   return Windows.HRESULT is abstract;
   
   function EndKey
   (
      This       : access ITextSelection_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function HomeKey
   (
      This       : access ITextSelection_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveDown
   (
      This       : access ITextSelection_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveLeft
   (
      This       : access ITextSelection_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveRight
   (
      This       : access ITextSelection_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function MoveUp
   (
      This       : access ITextSelection_Interface
      ; unit : Windows.UI.Text.TextRangeUnit
      ; count : Windows.Int32
      ; extend : Windows.Boolean
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function TypeText
   (
      This       : access ITextSelection_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextCharacterFormat : aliased constant Windows.IID := (1524560859, 1531, 17453, (128, 101, 100, 42, 254, 160, 44, 237 ));
   
   type ITextCharacterFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AllCaps
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_AllCaps
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Bold
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_Bold
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStretch
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FontStretch
   )
   return Windows.HRESULT is abstract;
   
   function put_FontStretch
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FontStretch
   )
   return Windows.HRESULT is abstract;
   
   function get_FontStyle
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FontStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_FontStyle
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FontStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundColor
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_ForegroundColor
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Hidden
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_Hidden
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Italic
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_Italic
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Kerning
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Kerning
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_LanguageTag
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_LanguageTag
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LinkType
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.LinkType
   )
   return Windows.HRESULT is abstract;
   
   function get_Name
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Outline
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_Outline
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Position
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Position
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_ProtectedText
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_ProtectedText
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Size
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallCaps
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_SmallCaps
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Spacing
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_Spacing
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_Strikethrough
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_Strikethrough
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Subscript
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_Subscript
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Superscript
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_Superscript
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_TextScript
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.TextScript
   )
   return Windows.HRESULT is abstract;
   
   function put_TextScript
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.TextScript
   )
   return Windows.HRESULT is abstract;
   
   function get_Underline
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.UnderlineType
   )
   return Windows.HRESULT is abstract;
   
   function put_Underline
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.UnderlineType
   )
   return Windows.HRESULT is abstract;
   
   function get_Weight
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Weight
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function SetClone
   (
      This       : access ITextCharacterFormat_Interface
      ; value : Windows.UI.Text.ITextCharacterFormat
   )
   return Windows.HRESULT is abstract;
   
   function GetClone
   (
      This       : access ITextCharacterFormat_Interface
      ; RetVal : access Windows.UI.Text.ITextCharacterFormat
   )
   return Windows.HRESULT is abstract;
   
   function IsEqual
   (
      This       : access ITextCharacterFormat_Interface
      ; format : Windows.UI.Text.ITextCharacterFormat
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextParagraphFormat : aliased constant Windows.IID := (754503590, 18038, 18826, (147, 245, 187, 219, 252, 11, 216, 131 ));
   
   type ITextParagraphFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Alignment
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.ParagraphAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_Alignment
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.ParagraphAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_FirstLineIndent
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_KeepTogether
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_KeepTogether
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_KeepWithNext
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_KeepWithNext
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftIndent
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_LineSpacing
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_LineSpacingRule
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.LineSpacingRule
   )
   return Windows.HRESULT is abstract;
   
   function get_ListAlignment
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.MarkerAlignment
   )
   return Windows.HRESULT is abstract;
   
   function put_ListAlignment
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.MarkerAlignment
   )
   return Windows.HRESULT is abstract;
   
   function get_ListLevelIndex
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ListLevelIndex
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ListStart
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_ListStart
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_ListStyle
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.MarkerStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_ListStyle
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.MarkerStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_ListTab
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_ListTab
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_ListType
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.MarkerType
   )
   return Windows.HRESULT is abstract;
   
   function put_ListType
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.MarkerType
   )
   return Windows.HRESULT is abstract;
   
   function get_NoLineNumber
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_NoLineNumber
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_PageBreakBefore
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_PageBreakBefore
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_RightIndent
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_RightIndent
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RightToLeft
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_RightToLeft
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_Style
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.ParagraphStyle
   )
   return Windows.HRESULT is abstract;
   
   function put_Style
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.ParagraphStyle
   )
   return Windows.HRESULT is abstract;
   
   function get_SpaceAfter
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_SpaceAfter
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_SpaceBefore
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function put_SpaceBefore
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_WidowControl
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function put_WidowControl
   (
      This       : access ITextParagraphFormat_Interface
      ; value : Windows.UI.Text.FormatEffect
   )
   return Windows.HRESULT is abstract;
   
   function get_TabCount
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function AddTab
   (
      This       : access ITextParagraphFormat_Interface
      ; position : Windows.Single
      ; align : Windows.UI.Text.TabAlignment
      ; leader : Windows.UI.Text.TabLeader
   )
   return Windows.HRESULT is abstract;
   
   function ClearAllTabs
   (
      This       : access ITextParagraphFormat_Interface
   )
   return Windows.HRESULT is abstract;
   
   function DeleteTab
   (
      This       : access ITextParagraphFormat_Interface
      ; position : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetClone
   (
      This       : access ITextParagraphFormat_Interface
      ; RetVal : access Windows.UI.Text.ITextParagraphFormat
   )
   return Windows.HRESULT is abstract;
   
   function GetTab
   (
      This       : access ITextParagraphFormat_Interface
      ; index : Windows.Int32
      ; position : access Windows.Single
      ; align : access Windows.UI.Text.TabAlignment
      ; leader : access Windows.UI.Text.TabLeader
   )
   return Windows.HRESULT is abstract;
   
   function IsEqual
   (
      This       : access ITextParagraphFormat_Interface
      ; format : Windows.UI.Text.ITextParagraphFormat
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetClone
   (
      This       : access ITextParagraphFormat_Interface
      ; format : Windows.UI.Text.ITextParagraphFormat
   )
   return Windows.HRESULT is abstract;
   
   function SetIndents
   (
      This       : access ITextParagraphFormat_Interface
      ; start : Windows.Single
      ; left : Windows.Single
      ; right : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function SetLineSpacing
   (
      This       : access ITextParagraphFormat_Interface
      ; rule : Windows.UI.Text.LineSpacingRule
      ; spacing : Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITextDocument2 : aliased constant Windows.IID := (4063301906, 35977, 18889, (145, 24, 240, 87, 203, 184, 20, 238 ));
   
   type ITextDocument2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlignmentIncludesTrailingWhitespace
   (
      This       : access ITextDocument2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_AlignmentIncludesTrailingWhitespace
   (
      This       : access ITextDocument2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IgnoreTrailingCharacterSpacing
   (
      This       : access ITextDocument2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IgnoreTrailingCharacterSpacing
   (
      This       : access ITextDocument2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IFontWeights : aliased constant Windows.IID := (2021696580, 427, 18839, (133, 23, 223, 130, 42, 12, 69, 241 ));
   
   type IFontWeights_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IFontWeightsStatics : aliased constant Windows.IID := (3015014869, 7081, 18667, (157, 173, 192, 149, 232, 194, 59, 163 ));
   
   type IFontWeightsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Black
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_Bold
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtraBlack
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtraBold
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtraLight
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_Light
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_Medium
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_Normal
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_SemiBold
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_SemiLight
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   function get_Thin
   (
      This       : access IFontWeightsStatics_Interface
      ; RetVal : access Windows.UI.Text.FontWeight
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_UnderlineType : aliased constant Windows.IID := (459533335, 31531, 23038, (171, 157, 182, 14, 164, 249, 201, 184 ));
   
   type IReference_UnderlineType_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_UnderlineType_Interface
      ; RetVal : access Windows.UI.Text.UnderlineType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype RichEditTextDocument is Windows.UI.Text.ITextDocument;
   subtype FontWeights is Windows.UI.Text.IFontWeights;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_AutoColor
   return Windows.UI.Color;
   
   function get_MinUnitCount
   return Windows.Int32;
   
   function get_MaxUnitCount
   return Windows.Int32;
   
   function get_UndefinedColor
   return Windows.UI.Color;
   
   function get_UndefinedFloatValue
   return Windows.Single;
   
   function get_UndefinedInt32Value
   return Windows.Int32;
   
   function get_UndefinedFontStretch
   return Windows.UI.Text.FontStretch;
   
   function get_UndefinedFontStyle
   return Windows.UI.Text.FontStyle;
   
   function get_Black
   return Windows.UI.Text.FontWeight;
   
   function get_Bold
   return Windows.UI.Text.FontWeight;
   
   function get_ExtraBlack
   return Windows.UI.Text.FontWeight;
   
   function get_ExtraBold
   return Windows.UI.Text.FontWeight;
   
   function get_ExtraLight
   return Windows.UI.Text.FontWeight;
   
   function get_Light
   return Windows.UI.Text.FontWeight;
   
   function get_Medium
   return Windows.UI.Text.FontWeight;
   
   function get_Normal
   return Windows.UI.Text.FontWeight;
   
   function get_SemiBold
   return Windows.UI.Text.FontWeight;
   
   function get_SemiLight
   return Windows.UI.Text.FontWeight;
   
   function get_Thin
   return Windows.UI.Text.FontWeight;
   
end;
