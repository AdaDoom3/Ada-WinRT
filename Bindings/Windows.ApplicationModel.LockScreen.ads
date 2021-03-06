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
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.LockScreen is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged_Interface;
   type TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged is access all TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged_Interface'Class;
   type TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged_Ptr is access all TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged;
   type TypedEventHandler_ILockScreenInfo_add_BadgesChanged_Interface;
   type TypedEventHandler_ILockScreenInfo_add_BadgesChanged is access all TypedEventHandler_ILockScreenInfo_add_BadgesChanged_Interface'Class;
   type TypedEventHandler_ILockScreenInfo_add_BadgesChanged_Ptr is access all TypedEventHandler_ILockScreenInfo_add_BadgesChanged;
   type TypedEventHandler_ILockScreenInfo_add_DetailTextChanged_Interface;
   type TypedEventHandler_ILockScreenInfo_add_DetailTextChanged is access all TypedEventHandler_ILockScreenInfo_add_DetailTextChanged_Interface'Class;
   type TypedEventHandler_ILockScreenInfo_add_DetailTextChanged_Ptr is access all TypedEventHandler_ILockScreenInfo_add_DetailTextChanged;
   type TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged_Interface;
   type TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged is access all TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged_Interface'Class;
   type TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged_Ptr is access all TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged;
   type TypedEventHandler_ILockApplicationHost_add_Unlocking_Interface;
   type TypedEventHandler_ILockApplicationHost_add_Unlocking is access all TypedEventHandler_ILockApplicationHost_add_Unlocking_Interface'Class;
   type TypedEventHandler_ILockApplicationHost_add_Unlocking_Ptr is access all TypedEventHandler_ILockApplicationHost_add_Unlocking;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ILockScreenBadge_Interface;
   type ILockScreenBadge is access all ILockScreenBadge_Interface'Class;
   type ILockScreenBadge_Ptr is access all ILockScreenBadge;
   type ILockScreenInfo_Interface;
   type ILockScreenInfo is access all ILockScreenInfo_Interface'Class;
   type ILockScreenInfo_Ptr is access all ILockScreenInfo;
   type ILockScreenUnlockingDeferral_Interface;
   type ILockScreenUnlockingDeferral is access all ILockScreenUnlockingDeferral_Interface'Class;
   type ILockScreenUnlockingDeferral_Ptr is access all ILockScreenUnlockingDeferral;
   type ILockScreenUnlockingEventArgs_Interface;
   type ILockScreenUnlockingEventArgs is access all ILockScreenUnlockingEventArgs_Interface'Class;
   type ILockScreenUnlockingEventArgs_Ptr is access all ILockScreenUnlockingEventArgs;
   type ILockApplicationHost_Interface;
   type ILockApplicationHost is access all ILockApplicationHost_Interface'Class;
   type ILockApplicationHost_Ptr is access all ILockApplicationHost;
   type ILockApplicationHostStatics_Interface;
   type ILockApplicationHostStatics is access all ILockApplicationHostStatics_Interface'Class;
   type ILockApplicationHostStatics_Ptr is access all ILockApplicationHostStatics;
   type IIterator_ILockScreenBadge_Interface;
   type IIterator_ILockScreenBadge is access all IIterator_ILockScreenBadge_Interface'Class;
   type IIterator_ILockScreenBadge_Ptr is access all IIterator_ILockScreenBadge;
   type IIterable_ILockScreenBadge_Interface;
   type IIterable_ILockScreenBadge is access all IIterable_ILockScreenBadge_Interface'Class;
   type IIterable_ILockScreenBadge_Ptr is access all IIterable_ILockScreenBadge;
   type IVectorView_ILockScreenBadge_Interface;
   type IVectorView_ILockScreenBadge is access all IVectorView_ILockScreenBadge_Interface'Class;
   type IVectorView_ILockScreenBadge_Ptr is access all IVectorView_ILockScreenBadge;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ILockScreenBadge : aliased constant Windows.IID := (3914401241, 11263, 19888, (155, 79, 56, 36, 119, 139, 156, 154 ));
   
   type ILockScreenBadge_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Logo
   (
      This       : access ILockScreenBadge_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Glyph
   (
      This       : access ILockScreenBadge_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function get_Number
   (
      This       : access ILockScreenBadge_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_AutomationName
   (
      This       : access ILockScreenBadge_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function LaunchApp
   (
      This       : access ILockScreenBadge_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILockScreenInfo : aliased constant Windows.IID := (4120553052, 38673, 19913, (166, 48, 149, 182, 203, 140, 218, 208 ));
   
   type ILockScreenInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function add_LockScreenImageChanged
   (
      This       : access ILockScreenInfo_Interface
      ; handler : TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LockScreenImageChanged
   (
      This       : access ILockScreenInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_LockScreenImage
   (
      This       : access ILockScreenInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   function add_BadgesChanged
   (
      This       : access ILockScreenInfo_Interface
      ; handler : TypedEventHandler_ILockScreenInfo_add_BadgesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_BadgesChanged
   (
      This       : access ILockScreenInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Badges
   (
      This       : access ILockScreenInfo_Interface
      ; RetVal : access Windows.ApplicationModel.LockScreen.IVectorView_ILockScreenBadge -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_DetailTextChanged
   (
      This       : access ILockScreenInfo_Interface
      ; handler : TypedEventHandler_ILockScreenInfo_add_DetailTextChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DetailTextChanged
   (
      This       : access ILockScreenInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_DetailText
   (
      This       : access ILockScreenInfo_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_AlarmIconChanged
   (
      This       : access ILockScreenInfo_Interface
      ; handler : TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AlarmIconChanged
   (
      This       : access ILockScreenInfo_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_AlarmIcon
   (
      This       : access ILockScreenInfo_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILockScreenUnlockingDeferral : aliased constant Windows.IID := (2122128086, 20995, 17383, (155, 214, 124, 57, 71, 209, 227, 254 ));
   
   type ILockScreenUnlockingDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access ILockScreenUnlockingDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILockScreenUnlockingEventArgs : aliased constant Windows.IID := (1155973127, 30203, 19131, (159, 139, 130, 71, 72, 144, 12, 113 ));
   
   type ILockScreenUnlockingEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access ILockScreenUnlockingEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.LockScreen.ILockScreenUnlockingDeferral
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access ILockScreenUnlockingEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILockApplicationHost : aliased constant Windows.IID := (955134381, 55631, 20092, (129, 250, 79, 68, 54, 80, 98, 129 ));
   
   type ILockApplicationHost_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestUnlock
   (
      This       : access ILockApplicationHost_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_Unlocking
   (
      This       : access ILockApplicationHost_Interface
      ; handler : TypedEventHandler_ILockApplicationHost_add_Unlocking
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Unlocking
   (
      This       : access ILockApplicationHost_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILockApplicationHostStatics : aliased constant Windows.IID := (4103056270, 9175, 20067, (150, 161, 102, 111, 245, 45, 59, 44 ));
   
   type ILockApplicationHostStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access ILockApplicationHostStatics_Interface
      ; RetVal : access Windows.ApplicationModel.LockScreen.ILockApplicationHost
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ILockScreenBadge : aliased constant Windows.IID := (2369321252, 5453, 22277, (143, 11, 237, 97, 53, 63, 108, 226 ));
   
   type IIterator_ILockScreenBadge_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ILockScreenBadge_Interface
      ; RetVal : access Windows.ApplicationModel.LockScreen.ILockScreenBadge
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ILockScreenBadge_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ILockScreenBadge_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ILockScreenBadge_Interface
      ; items : Windows.ApplicationModel.LockScreen.ILockScreenBadge_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ILockScreenBadge : aliased constant Windows.IID := (1854070492, 46926, 20538, (176, 11, 156, 111, 71, 241, 42, 15 ));
   
   type IIterable_ILockScreenBadge_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ILockScreenBadge_Interface
      ; RetVal : access Windows.ApplicationModel.LockScreen.IIterator_ILockScreenBadge
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ILockScreenBadge : aliased constant Windows.IID := (2691910037, 38082, 20674, (136, 162, 208, 112, 252, 209, 211, 56 ));
   
   type IVectorView_ILockScreenBadge_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ILockScreenBadge_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.LockScreen.ILockScreenBadge
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ILockScreenBadge_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ILockScreenBadge_Interface
      ; value : Windows.ApplicationModel.LockScreen.ILockScreenBadge
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ILockScreenBadge_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.LockScreen.ILockScreenBadge_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged : aliased constant Windows.IID := (2347361955, 63626, 21545, (141, 163, 103, 107, 125, 79, 26, 91 ));
   
   type TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_LockScreenImageChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILockScreenInfo_add_BadgesChanged : aliased constant Windows.IID := (2347361955, 63626, 21545, (141, 163, 103, 107, 125, 79, 26, 91 ));
   
   type TypedEventHandler_ILockScreenInfo_add_BadgesChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILockScreenInfo_add_BadgesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_BadgesChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILockScreenInfo_add_DetailTextChanged : aliased constant Windows.IID := (2347361955, 63626, 21545, (141, 163, 103, 107, 125, 79, 26, 91 ));
   
   type TypedEventHandler_ILockScreenInfo_add_DetailTextChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILockScreenInfo_add_DetailTextChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_DetailTextChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged : aliased constant Windows.IID := (2347361955, 63626, 21545, (141, 163, 103, 107, 125, 79, 26, 91 ));
   
   type TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILockScreenInfo_add_AlarmIconChanged_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockScreenInfo
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ILockApplicationHost_add_Unlocking : aliased constant Windows.IID := (3037046, 35419, 23443, (140, 108, 156, 76, 135, 136, 245, 180 ));
   
   type TypedEventHandler_ILockApplicationHost_add_Unlocking_Interface(Callback : access procedure (sender : Windows.ApplicationModel.LockScreen.ILockApplicationHost ; args : Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ILockApplicationHost_add_Unlocking'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ILockApplicationHost_add_Unlocking_Interface
      ; sender : Windows.ApplicationModel.LockScreen.ILockApplicationHost
      ; args : Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype LockScreenInfo is Windows.ApplicationModel.LockScreen.ILockScreenInfo;
   subtype LockScreenBadge is Windows.ApplicationModel.LockScreen.ILockScreenBadge;
   subtype LockScreenUnlockingDeferral is Windows.ApplicationModel.LockScreen.ILockScreenUnlockingDeferral;
   subtype LockApplicationHost is Windows.ApplicationModel.LockScreen.ILockApplicationHost;
   subtype LockScreenUnlockingEventArgs is Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.ApplicationModel.LockScreen.ILockApplicationHost;
   
end;
