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
limited with Windows.Gaming.Input;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.UI.Input.Preview.Injection is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type InjectedInputTouchParameters is (
      None,
      Contact,
      Orientation,
      Pressure
   );
   for InjectedInputTouchParameters use (
      None => 0,
      Contact => 1,
      Orientation => 2,
      Pressure => 4
   );
   for InjectedInputTouchParameters'Size use 32;
   
   type InjectedInputTouchParameters_Ptr is access InjectedInputTouchParameters;
   
   type InjectedInputPointerOptions is (
      None,
      New_x,
      InRange,
      InContact,
      FirstButton,
      SecondButton,
      Primary,
      Confidence,
      Canceled,
      PointerDown,
      Update,
      PointerUp,
      CaptureChanged
   );
   for InjectedInputPointerOptions use (
      None => 0,
      New_x => 1,
      InRange => 2,
      InContact => 4,
      FirstButton => 16,
      SecondButton => 32,
      Primary => 8192,
      Confidence => 16384,
      Canceled => 32768,
      PointerDown => 65536,
      Update => 131072,
      PointerUp => 262144,
      CaptureChanged => 2097152
   );
   for InjectedInputPointerOptions'Size use 32;
   
   type InjectedInputPointerOptions_Ptr is access InjectedInputPointerOptions;
   
   type InjectedInputButtonChangeKind is (
      None,
      FirstButtonDown,
      FirstButtonUp,
      SecondButtonDown,
      SecondButtonUp,
      ThirdButtonDown,
      ThirdButtonUp,
      FourthButtonDown,
      FourthButtonUp,
      FifthButtonDown,
      FifthButtonUp
   );
   for InjectedInputButtonChangeKind use (
      None => 0,
      FirstButtonDown => 1,
      FirstButtonUp => 2,
      SecondButtonDown => 3,
      SecondButtonUp => 4,
      ThirdButtonDown => 5,
      ThirdButtonUp => 6,
      FourthButtonDown => 7,
      FourthButtonUp => 8,
      FifthButtonDown => 9,
      FifthButtonUp => 10
   );
   for InjectedInputButtonChangeKind'Size use 32;
   
   type InjectedInputButtonChangeKind_Ptr is access InjectedInputButtonChangeKind;
   
   type InjectedInputPenButtons is (
      None,
      Barrel,
      Inverted,
      Eraser
   );
   for InjectedInputPenButtons use (
      None => 0,
      Barrel => 1,
      Inverted => 2,
      Eraser => 4
   );
   for InjectedInputPenButtons'Size use 32;
   
   type InjectedInputPenButtons_Ptr is access InjectedInputPenButtons;
   
   type InjectedInputPenParameters is (
      None,
      Pressure,
      Rotation,
      TiltX,
      TiltY
   );
   for InjectedInputPenParameters use (
      None => 0,
      Pressure => 1,
      Rotation => 2,
      TiltX => 4,
      TiltY => 8
   );
   for InjectedInputPenParameters'Size use 32;
   
   type InjectedInputPenParameters_Ptr is access InjectedInputPenParameters;
   
   type InjectedInputMouseOptions is (
      None,
      Move,
      LeftDown,
      LeftUp,
      RightDown,
      RightUp,
      MiddleDown,
      MiddleUp,
      XDown,
      XUp,
      Wheel,
      HWheel,
      MoveNoCoalesce,
      VirtualDesk,
      Absolute
   );
   for InjectedInputMouseOptions use (
      None => 0,
      Move => 1,
      LeftDown => 2,
      LeftUp => 4,
      RightDown => 8,
      RightUp => 16,
      MiddleDown => 32,
      MiddleUp => 64,
      XDown => 128,
      XUp => 256,
      Wheel => 2048,
      HWheel => 4096,
      MoveNoCoalesce => 8192,
      VirtualDesk => 16384,
      Absolute => 32768
   );
   for InjectedInputMouseOptions'Size use 32;
   
   type InjectedInputMouseOptions_Ptr is access InjectedInputMouseOptions;
   
   type InjectedInputKeyOptions is (
      None,
      ExtendedKey,
      KeyUp,
      Unicode,
      ScanCode
   );
   for InjectedInputKeyOptions use (
      None => 0,
      ExtendedKey => 1,
      KeyUp => 2,
      Unicode => 4,
      ScanCode => 8
   );
   for InjectedInputKeyOptions'Size use 32;
   
   type InjectedInputKeyOptions_Ptr is access InjectedInputKeyOptions;
   
   type InjectedInputShortcut is (
      Back,
      Start,
      Search
   );
   for InjectedInputShortcut use (
      Back => 0,
      Start => 1,
      Search => 2
   );
   for InjectedInputShortcut'Size use 32;
   
   type InjectedInputShortcut_Ptr is access InjectedInputShortcut;
   
   type InjectedInputVisualizationMode is (
      None,
      Default,
      Indirect
   );
   for InjectedInputVisualizationMode use (
      None => 0,
      Default => 1,
      Indirect => 2
   );
   for InjectedInputVisualizationMode'Size use 32;
   
   type InjectedInputVisualizationMode_Ptr is access InjectedInputVisualizationMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type InjectedInputRectangle is record
      Left : Windows.Int32;
      Top : Windows.Int32;
      Bottom : Windows.Int32;
      Right : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , InjectedInputRectangle);
   
   type InjectedInputRectangle_Ptr is access InjectedInputRectangle;
   
   type InjectedInputPoint is record
      PositionX : Windows.Int32;
      PositionY : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , InjectedInputPoint);
   
   type InjectedInputPoint_Ptr is access InjectedInputPoint;
   
   type InjectedInputPointerInfo is record
      PointerId : Windows.UInt32;
      PointerOptions : Windows.UI.Input.Preview.Injection.InjectedInputPointerOptions;
      PixelLocation : Windows.UI.Input.Preview.Injection.InjectedInputPoint;
      TimeOffsetInMilliseconds : Windows.UInt32;
      PerformanceCount : Windows.UInt64;
   end record;
   pragma Convention (C_Pass_By_Copy , InjectedInputPointerInfo);
   
   type InjectedInputPointerInfo_Ptr is access InjectedInputPointerInfo;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IInjectedInputTouchInfo_Interface;
   type IInjectedInputTouchInfo is access all IInjectedInputTouchInfo_Interface'Class;
   type IInjectedInputTouchInfo_Ptr is access all IInjectedInputTouchInfo;
   type IInjectedInputPenInfo_Interface;
   type IInjectedInputPenInfo is access all IInjectedInputPenInfo_Interface'Class;
   type IInjectedInputPenInfo_Ptr is access all IInjectedInputPenInfo;
   type IInjectedInputMouseInfo_Interface;
   type IInjectedInputMouseInfo is access all IInjectedInputMouseInfo_Interface'Class;
   type IInjectedInputMouseInfo_Ptr is access all IInjectedInputMouseInfo;
   type IInjectedInputKeyboardInfo_Interface;
   type IInjectedInputKeyboardInfo is access all IInjectedInputKeyboardInfo_Interface'Class;
   type IInjectedInputKeyboardInfo_Ptr is access all IInjectedInputKeyboardInfo;
   type IInjectedInputGamepadInfo_Interface;
   type IInjectedInputGamepadInfo is access all IInjectedInputGamepadInfo_Interface'Class;
   type IInjectedInputGamepadInfo_Ptr is access all IInjectedInputGamepadInfo;
   type IInjectedInputGamepadInfoFactory_Interface;
   type IInjectedInputGamepadInfoFactory is access all IInjectedInputGamepadInfoFactory_Interface'Class;
   type IInjectedInputGamepadInfoFactory_Ptr is access all IInjectedInputGamepadInfoFactory;
   type IInputInjector_Interface;
   type IInputInjector is access all IInputInjector_Interface'Class;
   type IInputInjector_Ptr is access all IInputInjector;
   type IInputInjector2_Interface;
   type IInputInjector2 is access all IInputInjector2_Interface'Class;
   type IInputInjector2_Ptr is access all IInputInjector2;
   type IInputInjectorStatics_Interface;
   type IInputInjectorStatics is access all IInputInjectorStatics_Interface'Class;
   type IInputInjectorStatics_Ptr is access all IInputInjectorStatics;
   type IInputInjectorStatics2_Interface;
   type IInputInjectorStatics2 is access all IInputInjectorStatics2_Interface'Class;
   type IInputInjectorStatics2_Ptr is access all IInputInjectorStatics2;
   type IIterator_IInjectedInputKeyboardInfo_Interface;
   type IIterator_IInjectedInputKeyboardInfo is access all IIterator_IInjectedInputKeyboardInfo_Interface'Class;
   type IIterator_IInjectedInputKeyboardInfo_Ptr is access all IIterator_IInjectedInputKeyboardInfo;
   type IIterable_IInjectedInputKeyboardInfo_Interface;
   type IIterable_IInjectedInputKeyboardInfo is access all IIterable_IInjectedInputKeyboardInfo_Interface'Class;
   type IIterable_IInjectedInputKeyboardInfo_Ptr is access all IIterable_IInjectedInputKeyboardInfo;
   type IIterator_IInjectedInputMouseInfo_Interface;
   type IIterator_IInjectedInputMouseInfo is access all IIterator_IInjectedInputMouseInfo_Interface'Class;
   type IIterator_IInjectedInputMouseInfo_Ptr is access all IIterator_IInjectedInputMouseInfo;
   type IIterable_IInjectedInputMouseInfo_Interface;
   type IIterable_IInjectedInputMouseInfo is access all IIterable_IInjectedInputMouseInfo_Interface'Class;
   type IIterable_IInjectedInputMouseInfo_Ptr is access all IIterable_IInjectedInputMouseInfo;
   type IIterator_IInjectedInputTouchInfo_Interface;
   type IIterator_IInjectedInputTouchInfo is access all IIterator_IInjectedInputTouchInfo_Interface'Class;
   type IIterator_IInjectedInputTouchInfo_Ptr is access all IIterator_IInjectedInputTouchInfo;
   type IIterable_IInjectedInputTouchInfo_Interface;
   type IIterable_IInjectedInputTouchInfo is access all IIterable_IInjectedInputTouchInfo_Interface'Class;
   type IIterable_IInjectedInputTouchInfo_Ptr is access all IIterable_IInjectedInputTouchInfo;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IInjectedInputTouchInfo : aliased constant Windows.IID := (575656415, 17384, 24309, (81, 10, 105, 202, 140, 155, 76, 40 ));
   
   type IInjectedInputTouchInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Contact
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputRectangle
   )
   return Windows.HRESULT is abstract;
   
   function put_Contact
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputRectangle
   )
   return Windows.HRESULT is abstract;
   
   function get_Orientation
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_Orientation
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PointerInfo
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputPointerInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerInfo
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputPointerInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_Pressure
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Pressure
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TouchParameters
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputTouchParameters
   )
   return Windows.HRESULT is abstract;
   
   function put_TouchParameters
   (
      This       : access IInjectedInputTouchInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputTouchParameters
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInjectedInputPenInfo : aliased constant Windows.IID := (1799400707, 51742, 21799, (126, 2, 40, 40, 84, 11, 177, 212 ));
   
   type IInjectedInputPenInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerInfo
   (
      This       : access IInjectedInputPenInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputPointerInfo
   )
   return Windows.HRESULT is abstract;
   
   function put_PointerInfo
   (
      This       : access IInjectedInputPenInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputPointerInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_PenButtons
   (
      This       : access IInjectedInputPenInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputPenButtons
   )
   return Windows.HRESULT is abstract;
   
   function put_PenButtons
   (
      This       : access IInjectedInputPenInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputPenButtons
   )
   return Windows.HRESULT is abstract;
   
   function get_PenParameters
   (
      This       : access IInjectedInputPenInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputPenParameters
   )
   return Windows.HRESULT is abstract;
   
   function put_PenParameters
   (
      This       : access IInjectedInputPenInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputPenParameters
   )
   return Windows.HRESULT is abstract;
   
   function get_Pressure
   (
      This       : access IInjectedInputPenInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Pressure
   (
      This       : access IInjectedInputPenInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Rotation
   (
      This       : access IInjectedInputPenInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Rotation
   (
      This       : access IInjectedInputPenInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_TiltX
   (
      This       : access IInjectedInputPenInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_TiltX
   (
      This       : access IInjectedInputPenInfo_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_TiltY
   (
      This       : access IInjectedInputPenInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_TiltY
   (
      This       : access IInjectedInputPenInfo_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInjectedInputMouseInfo : aliased constant Windows.IID := (2532666987, 58490, 23796, (65, 141, 138, 95, 185, 103, 12, 125 ));
   
   type IInjectedInputMouseInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MouseOptions
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputMouseOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_MouseOptions
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputMouseOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_MouseData
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_MouseData
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_DeltaY
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_DeltaY
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_DeltaX
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function put_DeltaX
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; value : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_TimeOffsetInMilliseconds
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_TimeOffsetInMilliseconds
   (
      This       : access IInjectedInputMouseInfo_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInjectedInputKeyboardInfo : aliased constant Windows.IID := (1262932288, 11114, 24570, (126, 174, 189, 7, 123, 5, 42, 205 ));
   
   type IInjectedInputKeyboardInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyOptions
   (
      This       : access IInjectedInputKeyboardInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.InjectedInputKeyOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_KeyOptions
   (
      This       : access IInjectedInputKeyboardInfo_Interface
      ; value : Windows.UI.Input.Preview.Injection.InjectedInputKeyOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_ScanCode
   (
      This       : access IInjectedInputKeyboardInfo_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function put_ScanCode
   (
      This       : access IInjectedInputKeyboardInfo_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_VirtualKey
   (
      This       : access IInjectedInputKeyboardInfo_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function put_VirtualKey
   (
      This       : access IInjectedInputKeyboardInfo_Interface
      ; value : Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInjectedInputGamepadInfo : aliased constant Windows.IID := (548313663, 57105, 17778, (169, 171, 215, 91, 138, 94, 72, 173 ));
   
   type IInjectedInputGamepadInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Buttons
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; RetVal : access Windows.Gaming.Input.GamepadButtons
   )
   return Windows.HRESULT is abstract;
   
   function put_Buttons
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; value : Windows.Gaming.Input.GamepadButtons
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftThumbstickX
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LeftThumbstickX
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftThumbstickY
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LeftThumbstickY
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_LeftTrigger
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_LeftTrigger
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RightThumbstickX
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RightThumbstickX
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RightThumbstickY
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RightThumbstickY
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_RightTrigger
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_RightTrigger
   (
      This       : access IInjectedInputGamepadInfo_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInjectedInputGamepadInfoFactory : aliased constant Windows.IID := (1499031670, 27705, 20164, (139, 42, 41, 239, 125, 225, 138, 202 ));
   
   type IInjectedInputGamepadInfoFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateInstanceFromGamepadReading
   (
      This       : access IInjectedInputGamepadInfoFactory_Interface
      ; reading : Windows.Gaming.Input.GamepadReading
      ; RetVal : access Windows.UI.Input.Preview.Injection.IInjectedInputGamepadInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputInjector : aliased constant Windows.IID := (2395107204, 2818, 19410, (173, 122, 61, 70, 88, 190, 62, 24 ));
   
   type IInputInjector_Interface is interface and Windows.IInspectable_Interface;
   
   function InjectKeyboardInput
   (
      This       : access IInputInjector_Interface
      ; input : Windows.UI.Input.Preview.Injection.IIterable_IInjectedInputKeyboardInfo
   )
   return Windows.HRESULT is abstract;
   
   function InjectMouseInput
   (
      This       : access IInputInjector_Interface
      ; input : Windows.UI.Input.Preview.Injection.IIterable_IInjectedInputMouseInfo
   )
   return Windows.HRESULT is abstract;
   
   function InitializeTouchInjection
   (
      This       : access IInputInjector_Interface
      ; visualMode : Windows.UI.Input.Preview.Injection.InjectedInputVisualizationMode
   )
   return Windows.HRESULT is abstract;
   
   function InjectTouchInput
   (
      This       : access IInputInjector_Interface
      ; input : Windows.UI.Input.Preview.Injection.IIterable_IInjectedInputTouchInfo
   )
   return Windows.HRESULT is abstract;
   
   function UninitializeTouchInjection
   (
      This       : access IInputInjector_Interface
   )
   return Windows.HRESULT is abstract;
   
   function InitializePenInjection
   (
      This       : access IInputInjector_Interface
      ; visualMode : Windows.UI.Input.Preview.Injection.InjectedInputVisualizationMode
   )
   return Windows.HRESULT is abstract;
   
   function InjectPenInput
   (
      This       : access IInputInjector_Interface
      ; input : Windows.UI.Input.Preview.Injection.IInjectedInputPenInfo
   )
   return Windows.HRESULT is abstract;
   
   function UninitializePenInjection
   (
      This       : access IInputInjector_Interface
   )
   return Windows.HRESULT is abstract;
   
   function InjectShortcut
   (
      This       : access IInputInjector_Interface
      ; shortcut : Windows.UI.Input.Preview.Injection.InjectedInputShortcut
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputInjector2 : aliased constant Windows.IID := (2390397021, 5203, 17319, (155, 203, 6, 214, 215, 179, 5, 247 ));
   
   type IInputInjector2_Interface is interface and Windows.IInspectable_Interface;
   
   function InitializeGamepadInjection
   (
      This       : access IInputInjector2_Interface
   )
   return Windows.HRESULT is abstract;
   
   function InjectGamepadInput
   (
      This       : access IInputInjector2_Interface
      ; input : Windows.UI.Input.Preview.Injection.IInjectedInputGamepadInfo
   )
   return Windows.HRESULT is abstract;
   
   function UninitializeGamepadInjection
   (
      This       : access IInputInjector2_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputInjectorStatics : aliased constant Windows.IID := (3735972163, 29698, 16705, (165, 198, 12, 1, 170, 87, 177, 106 ));
   
   type IInputInjectorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function TryCreate
   (
      This       : access IInputInjectorStatics_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IInputInjector
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IInputInjectorStatics2 : aliased constant Windows.IID := (2765830395, 56716, 16719, (149, 234, 248, 126, 244, 192, 174, 108 ));
   
   type IInputInjectorStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function TryCreateForAppBroadcastOnly
   (
      This       : access IInputInjectorStatics2_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IInputInjector
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IInjectedInputKeyboardInfo : aliased constant Windows.IID := (1343119102, 15297, 23963, (188, 252, 193, 244, 57, 80, 95, 18 ));
   
   type IIterator_IInjectedInputKeyboardInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInjectedInputKeyboardInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IInjectedInputKeyboardInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInjectedInputKeyboardInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInjectedInputKeyboardInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInjectedInputKeyboardInfo_Interface
      ; items : Windows.UI.Input.Preview.Injection.IInjectedInputKeyboardInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IInjectedInputKeyboardInfo : aliased constant Windows.IID := (366359311, 40087, 22277, (182, 119, 135, 37, 133, 102, 79, 181 ));
   
   type IIterable_IInjectedInputKeyboardInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInjectedInputKeyboardInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IIterator_IInjectedInputKeyboardInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IInjectedInputMouseInfo : aliased constant Windows.IID := (2516898265, 5956, 23507, (181, 185, 212, 123, 148, 52, 250, 203 ));
   
   type IIterator_IInjectedInputMouseInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IInjectedInputMouseInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInjectedInputMouseInfo_Interface
      ; items : Windows.UI.Input.Preview.Injection.IInjectedInputMouseInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IInjectedInputMouseInfo : aliased constant Windows.IID := (1815406013, 4004, 21060, (137, 251, 4, 191, 212, 128, 236, 216 ));
   
   type IIterable_IInjectedInputMouseInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInjectedInputMouseInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IIterator_IInjectedInputMouseInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IInjectedInputTouchInfo : aliased constant Windows.IID := (1271475858, 54062, 22906, (174, 36, 179, 136, 97, 197, 251, 8 ));
   
   type IIterator_IInjectedInputTouchInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IInjectedInputTouchInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IInjectedInputTouchInfo_Interface
      ; items : Windows.UI.Input.Preview.Injection.IInjectedInputTouchInfo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IInjectedInputTouchInfo : aliased constant Windows.IID := (2891951115, 33440, 21558, (146, 132, 231, 219, 11, 244, 230, 21 ));
   
   type IIterable_IInjectedInputTouchInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IInjectedInputTouchInfo_Interface
      ; RetVal : access Windows.UI.Input.Preview.Injection.IIterator_IInjectedInputTouchInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype InjectedInputGamepadInfo is Windows.UI.Input.Preview.Injection.IInjectedInputGamepadInfo;
   function CreateInjectedInputGamepadInfo return Windows.UI.Input.Preview.Injection.IInjectedInputGamepadInfo;
   
   subtype InjectedInputKeyboardInfo is Windows.UI.Input.Preview.Injection.IInjectedInputKeyboardInfo;
   function CreateInjectedInputKeyboardInfo return Windows.UI.Input.Preview.Injection.IInjectedInputKeyboardInfo;
   
   subtype InjectedInputMouseInfo is Windows.UI.Input.Preview.Injection.IInjectedInputMouseInfo;
   function CreateInjectedInputMouseInfo return Windows.UI.Input.Preview.Injection.IInjectedInputMouseInfo;
   
   subtype InjectedInputTouchInfo is Windows.UI.Input.Preview.Injection.IInjectedInputTouchInfo;
   function CreateInjectedInputTouchInfo return Windows.UI.Input.Preview.Injection.IInjectedInputTouchInfo;
   
   subtype InjectedInputPenInfo is Windows.UI.Input.Preview.Injection.IInjectedInputPenInfo;
   function CreateInjectedInputPenInfo return Windows.UI.Input.Preview.Injection.IInjectedInputPenInfo;
   
   subtype InputInjector is Windows.UI.Input.Preview.Injection.IInputInjector;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function TryCreateForAppBroadcastOnly
   return Windows.UI.Input.Preview.Injection.IInputInjector;
   
   function TryCreate
   return Windows.UI.Input.Preview.Injection.IInputInjector;
   
end;
