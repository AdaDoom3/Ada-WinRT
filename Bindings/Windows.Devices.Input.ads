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
with Windows.Foundation;
package Windows.Devices.Input is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type PointerDeviceType is (
      Touch,
      Pen,
      Mouse
   );
   for PointerDeviceType use (
      Touch => 0,
      Pen => 1,
      Mouse => 2
   );
   for PointerDeviceType'Size use 32;
   
   type PointerDeviceType_Ptr is access PointerDeviceType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PointerDeviceUsage is record
      UsagePage : Windows.UInt32;
      Usage : Windows.UInt32;
      MinLogical : Windows.Int32;
      MaxLogical : Windows.Int32;
      MinPhysical : Windows.Int32;
      MaxPhysical : Windows.Int32;
      Unit : Windows.UInt32;
      PhysicalMultiplier : Windows.Single;
   end record;
   pragma Convention (C_Pass_By_Copy , PointerDeviceUsage);
   
   type PointerDeviceUsage_Ptr is access PointerDeviceUsage;
   
   type MouseDelta is record
      X : Windows.Int32;
      Y : Windows.Int32;
   end record;
   pragma Convention (C_Pass_By_Copy , MouseDelta);
   
   type MouseDelta_Ptr is access MouseDelta;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IMouseDevice_add_MouseMoved_Interface;
   type TypedEventHandler_IMouseDevice_add_MouseMoved is access all TypedEventHandler_IMouseDevice_add_MouseMoved_Interface'Class;
   type TypedEventHandler_IMouseDevice_add_MouseMoved_Ptr is access all TypedEventHandler_IMouseDevice_add_MouseMoved;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMouseCapabilities_Interface;
   type IMouseCapabilities is access all IMouseCapabilities_Interface'Class;
   type IMouseCapabilities_Ptr is access all IMouseCapabilities;
   type IKeyboardCapabilities_Interface;
   type IKeyboardCapabilities is access all IKeyboardCapabilities_Interface'Class;
   type IKeyboardCapabilities_Ptr is access all IKeyboardCapabilities;
   type ITouchCapabilities_Interface;
   type ITouchCapabilities is access all ITouchCapabilities_Interface'Class;
   type ITouchCapabilities_Ptr is access all ITouchCapabilities;
   type IPointerDeviceStatics_Interface;
   type IPointerDeviceStatics is access all IPointerDeviceStatics_Interface'Class;
   type IPointerDeviceStatics_Ptr is access all IPointerDeviceStatics;
   type IPointerDevice_Interface;
   type IPointerDevice is access all IPointerDevice_Interface'Class;
   type IPointerDevice_Ptr is access all IPointerDevice;
   type IPointerDevice2_Interface;
   type IPointerDevice2 is access all IPointerDevice2_Interface'Class;
   type IPointerDevice2_Ptr is access all IPointerDevice2;
   type IMouseEventArgs_Interface;
   type IMouseEventArgs is access all IMouseEventArgs_Interface'Class;
   type IMouseEventArgs_Ptr is access all IMouseEventArgs;
   type IMouseDevice_Interface;
   type IMouseDevice is access all IMouseDevice_Interface'Class;
   type IMouseDevice_Ptr is access all IMouseDevice;
   type IMouseDeviceStatics_Interface;
   type IMouseDeviceStatics is access all IMouseDeviceStatics_Interface'Class;
   type IMouseDeviceStatics_Ptr is access all IMouseDeviceStatics;
   type IIterator_IPointerDevice_Interface;
   type IIterator_IPointerDevice is access all IIterator_IPointerDevice_Interface'Class;
   type IIterator_IPointerDevice_Ptr is access all IIterator_IPointerDevice;
   type IIterable_IPointerDevice_Interface;
   type IIterable_IPointerDevice is access all IIterable_IPointerDevice_Interface'Class;
   type IIterable_IPointerDevice_Ptr is access all IIterable_IPointerDevice;
   type IVectorView_IPointerDevice_Interface;
   type IVectorView_IPointerDevice is access all IVectorView_IPointerDevice_Interface'Class;
   type IVectorView_IPointerDevice_Ptr is access all IVectorView_IPointerDevice;
   type IIterator_PointerDeviceUsage_Interface;
   type IIterator_PointerDeviceUsage is access all IIterator_PointerDeviceUsage_Interface'Class;
   type IIterator_PointerDeviceUsage_Ptr is access all IIterator_PointerDeviceUsage;
   type IIterable_PointerDeviceUsage_Interface;
   type IIterable_PointerDeviceUsage is access all IIterable_PointerDeviceUsage_Interface'Class;
   type IIterable_PointerDeviceUsage_Ptr is access all IIterable_PointerDeviceUsage;
   type IVectorView_PointerDeviceUsage_Interface;
   type IVectorView_PointerDeviceUsage is access all IVectorView_PointerDeviceUsage_Interface'Class;
   type IVectorView_PointerDeviceUsage_Ptr is access all IVectorView_PointerDeviceUsage;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IMouseCapabilities : aliased constant Windows.IID := (3164987427, 32217, 19307, (154, 146, 85, 212, 60, 179, 143, 115 ));
   
   type IMouseCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MousePresent
   (
      This       : access IMouseCapabilities_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_VerticalWheelPresent
   (
      This       : access IMouseCapabilities_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_HorizontalWheelPresent
   (
      This       : access IMouseCapabilities_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_SwapButtons
   (
      This       : access IMouseCapabilities_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_NumberOfButtons
   (
      This       : access IMouseCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyboardCapabilities : aliased constant Windows.IID := (977247062, 26520, 19388, (131, 62, 15, 52, 177, 124, 101, 255 ));
   
   type IKeyboardCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeyboardPresent
   (
      This       : access IKeyboardCapabilities_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITouchCapabilities : aliased constant Windows.IID := (551376377, 5105, 18120, (146, 133, 44, 5, 250, 62, 218, 111 ));
   
   type ITouchCapabilities_Interface is interface and Windows.IInspectable_Interface;
   
   function get_TouchPresent
   (
      This       : access ITouchCapabilities_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_Contacts
   (
      This       : access ITouchCapabilities_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointerDeviceStatics : aliased constant Windows.IID := (3635976865, 53702, 16750, (189, 141, 87, 144, 145, 77, 197, 99 ));
   
   type IPointerDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetPointerDevice
   (
      This       : access IPointerDeviceStatics_Interface
      ; pointerId : Windows.UInt32
      ; RetVal : access Windows.Devices.Input.IPointerDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetPointerDevices
   (
      This       : access IPointerDeviceStatics_Interface
      ; RetVal : access Windows.Devices.Input.IVectorView_IPointerDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointerDevice : aliased constant Windows.IID := (2479471356, 60363, 18046, (130, 198, 39, 111, 234, 227, 107, 90 ));
   
   type IPointerDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PointerDeviceType
   (
      This       : access IPointerDevice_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceType
   )
   return Windows.HRESULT is abstract;
   
   function get_IsIntegrated
   (
      This       : access IPointerDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxContacts
   (
      This       : access IPointerDevice_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalDeviceRect
   (
      This       : access IPointerDevice_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_ScreenRect
   (
      This       : access IPointerDevice_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedUsages
   (
      This       : access IPointerDevice_Interface
      ; RetVal : access Windows.Devices.Input.IVectorView_PointerDeviceUsage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPointerDevice2 : aliased constant Windows.IID := (4171682464, 50308, 18591, (174, 62, 48, 210, 238, 31, 253, 62 ));
   
   type IPointerDevice2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MaxPointersWithZDistance
   (
      This       : access IPointerDevice2_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMouseEventArgs : aliased constant Windows.IID := (4129663581, 9044, 19655, (146, 48, 150, 148, 28, 150, 159, 222 ));
   
   type IMouseEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MouseDelta
   (
      This       : access IMouseEventArgs_Interface
      ; RetVal : access Windows.Devices.Input.MouseDelta
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMouseDevice : aliased constant Windows.IID := (2297295960, 62152, 18932, (190, 31, 194, 86, 179, 136, 188, 17 ));
   
   type IMouseDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function add_MouseMoved
   (
      This       : access IMouseDevice_Interface
      ; handler : TypedEventHandler_IMouseDevice_add_MouseMoved
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MouseMoved
   (
      This       : access IMouseDevice_Interface
      ; cookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMouseDeviceStatics : aliased constant Windows.IID := (1212846149, 28016, 18907, (142, 104, 70, 255, 189, 23, 211, 141 ));
   
   type IMouseDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IMouseDeviceStatics_Interface
      ; RetVal : access Windows.Devices.Input.IMouseDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IPointerDevice : aliased constant Windows.IID := (3734266908, 31072, 24525, (171, 232, 214, 186, 96, 158, 247, 211 ));
   
   type IIterator_IPointerDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IPointerDevice_Interface
      ; RetVal : access Windows.Devices.Input.IPointerDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IPointerDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IPointerDevice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IPointerDevice_Interface
      ; items : Windows.Devices.Input.IPointerDevice_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IPointerDevice : aliased constant Windows.IID := (2904974892, 33883, 23661, (174, 170, 64, 111, 72, 194, 26, 233 ));
   
   type IIterable_IPointerDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IPointerDevice_Interface
      ; RetVal : access Windows.Devices.Input.IIterator_IPointerDevice
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IPointerDevice : aliased constant Windows.IID := (3478549745, 38920, 23083, (128, 184, 86, 132, 237, 14, 168, 22 ));
   
   type IVectorView_IPointerDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IPointerDevice_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Input.IPointerDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IPointerDevice_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IPointerDevice_Interface
      ; value : Windows.Devices.Input.IPointerDevice
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IPointerDevice_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Input.IPointerDevice_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_PointerDeviceUsage : aliased constant Windows.IID := (2595362317, 4591, 24266, (141, 217, 62, 19, 170, 78, 95, 153 ));
   
   type IIterator_PointerDeviceUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_PointerDeviceUsage_Interface
      ; RetVal : access Windows.Devices.Input.PointerDeviceUsage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_PointerDeviceUsage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_PointerDeviceUsage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_PointerDeviceUsage_Interface
      ; items : Windows.Devices.Input.PointerDeviceUsage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_PointerDeviceUsage : aliased constant Windows.IID := (1496147480, 60075, 23161, (164, 122, 199, 252, 11, 116, 154, 78 ));
   
   type IIterable_PointerDeviceUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_PointerDeviceUsage_Interface
      ; RetVal : access Windows.Devices.Input.IIterator_PointerDeviceUsage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_PointerDeviceUsage : aliased constant Windows.IID := (2388274302, 14384, 20693, (146, 186, 49, 99, 200, 156, 187, 208 ));
   
   type IVectorView_PointerDeviceUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_PointerDeviceUsage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.Input.PointerDeviceUsage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_PointerDeviceUsage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_PointerDeviceUsage_Interface
      ; value : Windows.Devices.Input.PointerDeviceUsage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_PointerDeviceUsage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.Input.PointerDeviceUsage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IMouseDevice_add_MouseMoved : aliased constant Windows.IID := (1567810964, 10468, 22677, (163, 75, 234, 145, 15, 112, 253, 187 ));
   
   type TypedEventHandler_IMouseDevice_add_MouseMoved_Interface(Callback : access procedure (sender : Windows.Devices.Input.IMouseDevice ; args : Windows.Devices.Input.IMouseEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IMouseDevice_add_MouseMoved'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IMouseDevice_add_MouseMoved_Interface
      ; sender : Windows.Devices.Input.IMouseDevice
      ; args : Windows.Devices.Input.IMouseEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PointerDevice is Windows.Devices.Input.IPointerDevice;
   subtype MouseDevice is Windows.Devices.Input.IMouseDevice;
   subtype MouseEventArgs is Windows.Devices.Input.IMouseEventArgs;
   subtype MouseCapabilities is Windows.Devices.Input.IMouseCapabilities;
   function CreateMouseCapabilities return Windows.Devices.Input.IMouseCapabilities;
   
   subtype KeyboardCapabilities is Windows.Devices.Input.IKeyboardCapabilities;
   function CreateKeyboardCapabilities return Windows.Devices.Input.IKeyboardCapabilities;
   
   subtype TouchCapabilities is Windows.Devices.Input.ITouchCapabilities;
   function CreateTouchCapabilities return Windows.Devices.Input.ITouchCapabilities;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetPointerDevice
   (
      pointerId : Windows.UInt32
   )
   return Windows.Devices.Input.IPointerDevice;
   
   function GetPointerDevices
   return Windows.Devices.Input.IVectorView_IPointerDevice;
   
   function GetForCurrentView
   return Windows.Devices.Input.IMouseDevice;
   
end;
