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
package Windows.UI is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type Color is record
      A : Windows.UInt8;
      R : Windows.UInt8;
      G : Windows.UInt8;
      B : Windows.UInt8;
   end record;
   pragma Convention (C_Pass_By_Copy , Color);
   
   type Color_Ptr is access Color;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IColorHelper_Interface;
   type IColorHelper is access all IColorHelper_Interface'Class;
   type IColorHelper_Ptr is access all IColorHelper;
   type IColorHelperStatics_Interface;
   type IColorHelperStatics is access all IColorHelperStatics_Interface'Class;
   type IColorHelperStatics_Ptr is access all IColorHelperStatics;
   type IColorHelperStatics2_Interface;
   type IColorHelperStatics2 is access all IColorHelperStatics2_Interface'Class;
   type IColorHelperStatics2_Ptr is access all IColorHelperStatics2;
   type IColors_Interface;
   type IColors is access all IColors_Interface'Class;
   type IColors_Ptr is access all IColors;
   type IColorsStatics_Interface;
   type IColorsStatics is access all IColorsStatics_Interface'Class;
   type IColorsStatics_Ptr is access all IColorsStatics;
   type IReference_Color_Interface;
   type IReference_Color is access all IReference_Color_Interface'Class;
   type IReference_Color_Ptr is access all IReference_Color;
   type IIterator_Color_Interface;
   type IIterator_Color is access all IIterator_Color_Interface'Class;
   type IIterator_Color_Ptr is access all IIterator_Color;
   type IIterable_Color_Interface;
   type IIterable_Color is access all IIterable_Color_Interface'Class;
   type IIterable_Color_Ptr is access all IIterable_Color;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IColorHelper : aliased constant Windows.IID := (423427047, 26055, 17728, (173, 8, 98, 131, 186, 118, 135, 154 ));
   
   type IColorHelper_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IColorHelperStatics : aliased constant Windows.IID := (2231688170, 64362, 16708, (166, 194, 51, 73, 156, 146, 132, 245 ));
   
   type IColorHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromArgb
   (
      This       : access IColorHelperStatics_Interface
      ; a : Windows.UInt8
      ; r : Windows.UInt8
      ; g : Windows.UInt8
      ; b : Windows.UInt8
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IColorHelperStatics2 : aliased constant Windows.IID := (618245890, 28336, 19348, (133, 92, 252, 240, 129, 141, 154, 22 ));
   
   type IColorHelperStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function ToDisplayName
   (
      This       : access IColorHelperStatics2_Interface
      ; color : Windows.UI.Color
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IColors : aliased constant Windows.IID := (2609681190, 19622, 19685, (137, 148, 158, 255, 101, 202, 189, 204 ));
   
   type IColors_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IColorsStatics : aliased constant Windows.IID := (3488951812, 52390, 17940, (161, 126, 117, 73, 16, 200, 74, 153 ));
   
   type IColorsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AliceBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_AntiqueWhite
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Aqua
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Aquamarine
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Azure
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Beige
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Bisque
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Black
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BlanchedAlmond
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Blue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BlueViolet
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Brown
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BurlyWood
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_CadetBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Chartreuse
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Chocolate
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Coral
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_CornflowerBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Cornsilk
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Crimson
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Cyan
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkCyan
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkGoldenrod
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkGray
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkKhaki
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkMagenta
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkOliveGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkOrange
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkOrchid
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkRed
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkSalmon
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkSeaGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkSlateBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkSlateGray
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkTurquoise
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DarkViolet
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DeepPink
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DeepSkyBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DimGray
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_DodgerBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Firebrick
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_FloralWhite
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ForestGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Fuchsia
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Gainsboro
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_GhostWhite
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Gold
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Goldenrod
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Gray
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Green
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_GreenYellow
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Honeydew
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_HotPink
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_IndianRed
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Indigo
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Ivory
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Khaki
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Lavender
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LavenderBlush
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LawnGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LemonChiffon
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightCoral
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightCyan
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightGoldenrodYellow
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightGray
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightPink
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightSalmon
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightSeaGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightSkyBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightSlateGray
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightSteelBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LightYellow
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Lime
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_LimeGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Linen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Magenta
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Maroon
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumAquamarine
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumOrchid
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumPurple
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumSeaGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumSlateBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumSpringGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumTurquoise
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MediumVioletRed
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MidnightBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MintCream
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_MistyRose
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Moccasin
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_NavajoWhite
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Navy
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_OldLace
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Olive
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_OliveDrab
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Orange
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_OrangeRed
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Orchid
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PaleGoldenrod
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PaleGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PaleTurquoise
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PaleVioletRed
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PapayaWhip
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PeachPuff
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Peru
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Pink
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Plum
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_PowderBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Purple
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Red
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_RosyBrown
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_RoyalBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SaddleBrown
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Salmon
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SandyBrown
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SeaGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SeaShell
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Sienna
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Silver
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SkyBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SlateBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SlateGray
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Snow
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SpringGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_SteelBlue
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Tan
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Teal
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Thistle
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Tomato
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Transparent
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Turquoise
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Violet
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Wheat
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_White
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_WhiteSmoke
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Yellow
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_YellowGreen
   (
      This       : access IColorsStatics_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IReference_Color : aliased constant Windows.IID := (2878233873, 45249, 23073, (149, 174, 241, 107, 243, 163, 118, 36 ));
   
   type IReference_Color_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Value
   (
      This       : access IReference_Color_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_Color : aliased constant Windows.IID := (3291548434, 31426, 24155, (181, 17, 229, 70, 238, 164, 115, 180 ));
   
   type IIterator_Color_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_Color_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_Color_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_Color_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_Color_Interface
      ; items : Windows.UI.Color_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_Color : aliased constant Windows.IID := (2469326686, 11311, 24238, (146, 154, 116, 233, 115, 181, 124, 39 ));
   
   type IIterable_Color_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_Color_Interface
      ; RetVal : access Windows.UI.IIterator_Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ColorHelper is Windows.UI.IColorHelper;
   subtype Colors is Windows.UI.IColors;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function ToDisplayName
   (
      color : Windows.UI.Color
   )
   return Windows.String;
   
   function FromArgb
   (
      a : Windows.UInt8
      ; r : Windows.UInt8
      ; g : Windows.UInt8
      ; b : Windows.UInt8
   )
   return Windows.UI.Color;
   
   function get_AliceBlue
   return Windows.UI.Color;
   
   function get_AntiqueWhite
   return Windows.UI.Color;
   
   function get_Aqua
   return Windows.UI.Color;
   
   function get_Aquamarine
   return Windows.UI.Color;
   
   function get_Azure
   return Windows.UI.Color;
   
   function get_Beige
   return Windows.UI.Color;
   
   function get_Bisque
   return Windows.UI.Color;
   
   function get_Black
   return Windows.UI.Color;
   
   function get_BlanchedAlmond
   return Windows.UI.Color;
   
   function get_Blue
   return Windows.UI.Color;
   
   function get_BlueViolet
   return Windows.UI.Color;
   
   function get_Brown
   return Windows.UI.Color;
   
   function get_BurlyWood
   return Windows.UI.Color;
   
   function get_CadetBlue
   return Windows.UI.Color;
   
   function get_Chartreuse
   return Windows.UI.Color;
   
   function get_Chocolate
   return Windows.UI.Color;
   
   function get_Coral
   return Windows.UI.Color;
   
   function get_CornflowerBlue
   return Windows.UI.Color;
   
   function get_Cornsilk
   return Windows.UI.Color;
   
   function get_Crimson
   return Windows.UI.Color;
   
   function get_Cyan
   return Windows.UI.Color;
   
   function get_DarkBlue
   return Windows.UI.Color;
   
   function get_DarkCyan
   return Windows.UI.Color;
   
   function get_DarkGoldenrod
   return Windows.UI.Color;
   
   function get_DarkGray
   return Windows.UI.Color;
   
   function get_DarkGreen
   return Windows.UI.Color;
   
   function get_DarkKhaki
   return Windows.UI.Color;
   
   function get_DarkMagenta
   return Windows.UI.Color;
   
   function get_DarkOliveGreen
   return Windows.UI.Color;
   
   function get_DarkOrange
   return Windows.UI.Color;
   
   function get_DarkOrchid
   return Windows.UI.Color;
   
   function get_DarkRed
   return Windows.UI.Color;
   
   function get_DarkSalmon
   return Windows.UI.Color;
   
   function get_DarkSeaGreen
   return Windows.UI.Color;
   
   function get_DarkSlateBlue
   return Windows.UI.Color;
   
   function get_DarkSlateGray
   return Windows.UI.Color;
   
   function get_DarkTurquoise
   return Windows.UI.Color;
   
   function get_DarkViolet
   return Windows.UI.Color;
   
   function get_DeepPink
   return Windows.UI.Color;
   
   function get_DeepSkyBlue
   return Windows.UI.Color;
   
   function get_DimGray
   return Windows.UI.Color;
   
   function get_DodgerBlue
   return Windows.UI.Color;
   
   function get_Firebrick
   return Windows.UI.Color;
   
   function get_FloralWhite
   return Windows.UI.Color;
   
   function get_ForestGreen
   return Windows.UI.Color;
   
   function get_Fuchsia
   return Windows.UI.Color;
   
   function get_Gainsboro
   return Windows.UI.Color;
   
   function get_GhostWhite
   return Windows.UI.Color;
   
   function get_Gold
   return Windows.UI.Color;
   
   function get_Goldenrod
   return Windows.UI.Color;
   
   function get_Gray
   return Windows.UI.Color;
   
   function get_Green
   return Windows.UI.Color;
   
   function get_GreenYellow
   return Windows.UI.Color;
   
   function get_Honeydew
   return Windows.UI.Color;
   
   function get_HotPink
   return Windows.UI.Color;
   
   function get_IndianRed
   return Windows.UI.Color;
   
   function get_Indigo
   return Windows.UI.Color;
   
   function get_Ivory
   return Windows.UI.Color;
   
   function get_Khaki
   return Windows.UI.Color;
   
   function get_Lavender
   return Windows.UI.Color;
   
   function get_LavenderBlush
   return Windows.UI.Color;
   
   function get_LawnGreen
   return Windows.UI.Color;
   
   function get_LemonChiffon
   return Windows.UI.Color;
   
   function get_LightBlue
   return Windows.UI.Color;
   
   function get_LightCoral
   return Windows.UI.Color;
   
   function get_LightCyan
   return Windows.UI.Color;
   
   function get_LightGoldenrodYellow
   return Windows.UI.Color;
   
   function get_LightGreen
   return Windows.UI.Color;
   
   function get_LightGray
   return Windows.UI.Color;
   
   function get_LightPink
   return Windows.UI.Color;
   
   function get_LightSalmon
   return Windows.UI.Color;
   
   function get_LightSeaGreen
   return Windows.UI.Color;
   
   function get_LightSkyBlue
   return Windows.UI.Color;
   
   function get_LightSlateGray
   return Windows.UI.Color;
   
   function get_LightSteelBlue
   return Windows.UI.Color;
   
   function get_LightYellow
   return Windows.UI.Color;
   
   function get_Lime
   return Windows.UI.Color;
   
   function get_LimeGreen
   return Windows.UI.Color;
   
   function get_Linen
   return Windows.UI.Color;
   
   function get_Magenta
   return Windows.UI.Color;
   
   function get_Maroon
   return Windows.UI.Color;
   
   function get_MediumAquamarine
   return Windows.UI.Color;
   
   function get_MediumBlue
   return Windows.UI.Color;
   
   function get_MediumOrchid
   return Windows.UI.Color;
   
   function get_MediumPurple
   return Windows.UI.Color;
   
   function get_MediumSeaGreen
   return Windows.UI.Color;
   
   function get_MediumSlateBlue
   return Windows.UI.Color;
   
   function get_MediumSpringGreen
   return Windows.UI.Color;
   
   function get_MediumTurquoise
   return Windows.UI.Color;
   
   function get_MediumVioletRed
   return Windows.UI.Color;
   
   function get_MidnightBlue
   return Windows.UI.Color;
   
   function get_MintCream
   return Windows.UI.Color;
   
   function get_MistyRose
   return Windows.UI.Color;
   
   function get_Moccasin
   return Windows.UI.Color;
   
   function get_NavajoWhite
   return Windows.UI.Color;
   
   function get_Navy
   return Windows.UI.Color;
   
   function get_OldLace
   return Windows.UI.Color;
   
   function get_Olive
   return Windows.UI.Color;
   
   function get_OliveDrab
   return Windows.UI.Color;
   
   function get_Orange
   return Windows.UI.Color;
   
   function get_OrangeRed
   return Windows.UI.Color;
   
   function get_Orchid
   return Windows.UI.Color;
   
   function get_PaleGoldenrod
   return Windows.UI.Color;
   
   function get_PaleGreen
   return Windows.UI.Color;
   
   function get_PaleTurquoise
   return Windows.UI.Color;
   
   function get_PaleVioletRed
   return Windows.UI.Color;
   
   function get_PapayaWhip
   return Windows.UI.Color;
   
   function get_PeachPuff
   return Windows.UI.Color;
   
   function get_Peru
   return Windows.UI.Color;
   
   function get_Pink
   return Windows.UI.Color;
   
   function get_Plum
   return Windows.UI.Color;
   
   function get_PowderBlue
   return Windows.UI.Color;
   
   function get_Purple
   return Windows.UI.Color;
   
   function get_Red
   return Windows.UI.Color;
   
   function get_RosyBrown
   return Windows.UI.Color;
   
   function get_RoyalBlue
   return Windows.UI.Color;
   
   function get_SaddleBrown
   return Windows.UI.Color;
   
   function get_Salmon
   return Windows.UI.Color;
   
   function get_SandyBrown
   return Windows.UI.Color;
   
   function get_SeaGreen
   return Windows.UI.Color;
   
   function get_SeaShell
   return Windows.UI.Color;
   
   function get_Sienna
   return Windows.UI.Color;
   
   function get_Silver
   return Windows.UI.Color;
   
   function get_SkyBlue
   return Windows.UI.Color;
   
   function get_SlateBlue
   return Windows.UI.Color;
   
   function get_SlateGray
   return Windows.UI.Color;
   
   function get_Snow
   return Windows.UI.Color;
   
   function get_SpringGreen
   return Windows.UI.Color;
   
   function get_SteelBlue
   return Windows.UI.Color;
   
   function get_Tan
   return Windows.UI.Color;
   
   function get_Teal
   return Windows.UI.Color;
   
   function get_Thistle
   return Windows.UI.Color;
   
   function get_Tomato
   return Windows.UI.Color;
   
   function get_Transparent
   return Windows.UI.Color;
   
   function get_Turquoise
   return Windows.UI.Color;
   
   function get_Violet
   return Windows.UI.Color;
   
   function get_Wheat
   return Windows.UI.Color;
   
   function get_White
   return Windows.UI.Color;
   
   function get_WhiteSmoke
   return Windows.UI.Color;
   
   function get_Yellow
   return Windows.UI.Color;
   
   function get_YellowGreen
   return Windows.UI.Color;
   
end;
