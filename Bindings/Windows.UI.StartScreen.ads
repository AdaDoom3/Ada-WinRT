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
limited with Windows.UI.Popups;
limited with Windows.Perception.Spatial;
limited with Windows.System;
limited with Windows.ApplicationModel.Core;
--------------------------------------------------------------------------------
package Windows.UI.StartScreen is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type JumpListSystemGroupKind is (
      None,
      Frequent,
      Recent
   );
   for JumpListSystemGroupKind use (
      None => 0,
      Frequent => 1,
      Recent => 2
   );
   for JumpListSystemGroupKind'Size use 32;
   
   type JumpListSystemGroupKind_Ptr is access JumpListSystemGroupKind;
   
   type JumpListItemKind is (
      Arguments,
      Separator
   );
   for JumpListItemKind use (
      Arguments => 0,
      Separator => 1
   );
   for JumpListItemKind'Size use 32;
   
   type JumpListItemKind_Ptr is access JumpListItemKind;
   
   
   type TileOptions is new Windows.UInt32;
   
   type TileOptions_Ptr is access TileOptions;
   
   type TileSize is (
      Default,
      Square150x150,
      Wide310x150,
      Square310x310,
      Square71x71,
      Square44x44
   );
   for TileSize use (
      Default => 0,
      Square150x150 => 3,
      Wide310x150 => 4,
      Square310x310 => 5,
      Square71x71 => 6,
      Square44x44 => 7
   );
   for TileSize'Size use 32;
   
   type TileSize_Ptr is access TileSize;
   
   type ForegroundText is (
      Dark,
      Light
   );
   for ForegroundText use (
      Dark => 0,
      Light => 1
   );
   for ForegroundText'Size use 32;
   
   type ForegroundText_Ptr is access ForegroundText;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IJumpList_Interface;
   type AsyncOperationCompletedHandler_IJumpList is access all AsyncOperationCompletedHandler_IJumpList_Interface'Class;
   type AsyncOperationCompletedHandler_IJumpList_Ptr is access all AsyncOperationCompletedHandler_IJumpList;
   type TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested_Interface;
   type TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested is access all TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested_Interface'Class;
   type TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested_Ptr is access all TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IJumpListItem_Interface;
   type IJumpListItem is access all IJumpListItem_Interface'Class;
   type IJumpListItem_Ptr is access all IJumpListItem;
   type IJumpListItemStatics_Interface;
   type IJumpListItemStatics is access all IJumpListItemStatics_Interface'Class;
   type IJumpListItemStatics_Ptr is access all IJumpListItemStatics;
   type IJumpList_Interface;
   type IJumpList is access all IJumpList_Interface'Class;
   type IJumpList_Ptr is access all IJumpList;
   type IJumpListStatics_Interface;
   type IJumpListStatics is access all IJumpListStatics_Interface'Class;
   type IJumpListStatics_Ptr is access all IJumpListStatics;
   type ISecondaryTile_Interface;
   type ISecondaryTile is access all ISecondaryTile_Interface'Class;
   type ISecondaryTile_Ptr is access all ISecondaryTile;
   type ISecondaryTile2_Interface;
   type ISecondaryTile2 is access all ISecondaryTile2_Interface'Class;
   type ISecondaryTile2_Ptr is access all ISecondaryTile2;
   type ISecondaryTileVisualElements_Interface;
   type ISecondaryTileVisualElements is access all ISecondaryTileVisualElements_Interface'Class;
   type ISecondaryTileVisualElements_Ptr is access all ISecondaryTileVisualElements;
   type ISecondaryTileVisualElements2_Interface;
   type ISecondaryTileVisualElements2 is access all ISecondaryTileVisualElements2_Interface'Class;
   type ISecondaryTileVisualElements2_Ptr is access all ISecondaryTileVisualElements2;
   type ISecondaryTileVisualElements3_Interface;
   type ISecondaryTileVisualElements3 is access all ISecondaryTileVisualElements3_Interface'Class;
   type ISecondaryTileVisualElements3_Ptr is access all ISecondaryTileVisualElements3;
   type ITileMixedRealityModel_Interface;
   type ITileMixedRealityModel is access all ITileMixedRealityModel_Interface'Class;
   type ITileMixedRealityModel_Ptr is access all ITileMixedRealityModel;
   type ISecondaryTileVisualElements4_Interface;
   type ISecondaryTileVisualElements4 is access all ISecondaryTileVisualElements4_Interface'Class;
   type ISecondaryTileVisualElements4_Ptr is access all ISecondaryTileVisualElements4;
   type ISecondaryTileFactory_Interface;
   type ISecondaryTileFactory is access all ISecondaryTileFactory_Interface'Class;
   type ISecondaryTileFactory_Ptr is access all ISecondaryTileFactory;
   type ISecondaryTileFactory2_Interface;
   type ISecondaryTileFactory2 is access all ISecondaryTileFactory2_Interface'Class;
   type ISecondaryTileFactory2_Ptr is access all ISecondaryTileFactory2;
   type ISecondaryTileStatics_Interface;
   type ISecondaryTileStatics is access all ISecondaryTileStatics_Interface'Class;
   type ISecondaryTileStatics_Ptr is access all ISecondaryTileStatics;
   type IVisualElementsRequestedEventArgs_Interface;
   type IVisualElementsRequestedEventArgs is access all IVisualElementsRequestedEventArgs_Interface'Class;
   type IVisualElementsRequestedEventArgs_Ptr is access all IVisualElementsRequestedEventArgs;
   type IVisualElementsRequest_Interface;
   type IVisualElementsRequest is access all IVisualElementsRequest_Interface'Class;
   type IVisualElementsRequest_Ptr is access all IVisualElementsRequest;
   type IVisualElementsRequestDeferral_Interface;
   type IVisualElementsRequestDeferral is access all IVisualElementsRequestDeferral_Interface'Class;
   type IVisualElementsRequestDeferral_Ptr is access all IVisualElementsRequestDeferral;
   type IStartScreenManager_Interface;
   type IStartScreenManager is access all IStartScreenManager_Interface'Class;
   type IStartScreenManager_Ptr is access all IStartScreenManager;
   type IStartScreenManagerStatics_Interface;
   type IStartScreenManagerStatics is access all IStartScreenManagerStatics_Interface'Class;
   type IStartScreenManagerStatics_Ptr is access all IStartScreenManagerStatics;
   type IIterator_IJumpListItem_Interface;
   type IIterator_IJumpListItem is access all IIterator_IJumpListItem_Interface'Class;
   type IIterator_IJumpListItem_Ptr is access all IIterator_IJumpListItem;
   type IIterable_IJumpListItem_Interface;
   type IIterable_IJumpListItem is access all IIterable_IJumpListItem_Interface'Class;
   type IIterable_IJumpListItem_Ptr is access all IIterable_IJumpListItem;
   type IVectorView_IJumpListItem_Interface;
   type IVectorView_IJumpListItem is access all IVectorView_IJumpListItem_Interface'Class;
   type IVectorView_IJumpListItem_Ptr is access all IVectorView_IJumpListItem;
   type IVector_IJumpListItem_Interface;
   type IVector_IJumpListItem is access all IVector_IJumpListItem_Interface'Class;
   type IVector_IJumpListItem_Ptr is access all IVector_IJumpListItem;
   type IAsyncOperation_IJumpList_Interface;
   type IAsyncOperation_IJumpList is access all IAsyncOperation_IJumpList_Interface'Class;
   type IAsyncOperation_IJumpList_Ptr is access all IAsyncOperation_IJumpList;
   type IIterator_ISecondaryTileVisualElements_Interface;
   type IIterator_ISecondaryTileVisualElements is access all IIterator_ISecondaryTileVisualElements_Interface'Class;
   type IIterator_ISecondaryTileVisualElements_Ptr is access all IIterator_ISecondaryTileVisualElements;
   type IIterable_ISecondaryTileVisualElements_Interface;
   type IIterable_ISecondaryTileVisualElements is access all IIterable_ISecondaryTileVisualElements_Interface'Class;
   type IIterable_ISecondaryTileVisualElements_Ptr is access all IIterable_ISecondaryTileVisualElements;
   type IVectorView_ISecondaryTileVisualElements_Interface;
   type IVectorView_ISecondaryTileVisualElements is access all IVectorView_ISecondaryTileVisualElements_Interface'Class;
   type IVectorView_ISecondaryTileVisualElements_Ptr is access all IVectorView_ISecondaryTileVisualElements;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IJumpListItem : aliased constant Windows.IID := (2061199127, 35677, 18464, (153, 91, 155, 65, 141, 190, 72, 176 ));
   
   type IJumpListItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Kind
   (
      This       : access IJumpListItem_Interface
      ; RetVal : access Windows.UI.StartScreen.JumpListItemKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Arguments
   (
      This       : access IJumpListItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RemovedByUser
   (
      This       : access IJumpListItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IJumpListItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IJumpListItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IJumpListItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IJumpListItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_GroupName
   (
      This       : access IJumpListItem_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_GroupName
   (
      This       : access IJumpListItem_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Logo
   (
      This       : access IJumpListItem_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Logo
   (
      This       : access IJumpListItem_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJumpListItemStatics : aliased constant Windows.IID := (4055876840, 51114, 18891, (141, 222, 236, 252, 205, 122, 215, 228 ));
   
   type IJumpListItemStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithArguments
   (
      This       : access IJumpListItemStatics_Interface
      ; arguments : Windows.String
      ; displayName : Windows.String
      ; RetVal : access Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function CreateSeparator
   (
      This       : access IJumpListItemStatics_Interface
      ; RetVal : access Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJumpList : aliased constant Windows.IID := (2955103294, 52591, 19638, (166, 17, 97, 253, 80, 95, 62, 209 ));
   
   type IJumpList_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Items
   (
      This       : access IJumpList_Interface
      ; RetVal : access Windows.UI.StartScreen.IVector_IJumpListItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SystemGroupKind
   (
      This       : access IJumpList_Interface
      ; RetVal : access Windows.UI.StartScreen.JumpListSystemGroupKind
   )
   return Windows.HRESULT is abstract;
   
   function put_SystemGroupKind
   (
      This       : access IJumpList_Interface
      ; value : Windows.UI.StartScreen.JumpListSystemGroupKind
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IJumpList_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IJumpListStatics : aliased constant Windows.IID := (2816525953, 59006, 19316, (130, 80, 63, 50, 44, 77, 146, 195 ));
   
   type IJumpListStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function LoadCurrentAsync
   (
      This       : access IJumpListStatics_Interface
      ; RetVal : access Windows.UI.StartScreen.IAsyncOperation_IJumpList -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsSupported
   (
      This       : access IJumpListStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTile : aliased constant Windows.IID := (2661175776, 11189, 19392, (187, 141, 66, 178, 58, 188, 200, 141 ));
   
   type ISecondaryTile_Interface is interface and Windows.IInspectable_Interface;
   
   function put_TileId
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TileId
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Arguments
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Arguments
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ShortName
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ShortName
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Logo
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Logo
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_SmallLogo
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_SmallLogo
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_WideLogo
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_WideLogo
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_LockScreenBadgeLogo
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_LockScreenBadgeLogo
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_LockScreenDisplayBadgeAndTileText
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_LockScreenDisplayBadgeAndTileText
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_TileOptions
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.UI.StartScreen.TileOptions
   )
   return Windows.HRESULT is abstract;
   
   function get_TileOptions
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.UI.StartScreen.TileOptions
   )
   return Windows.HRESULT is abstract;
   
   function put_ForegroundText
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.UI.StartScreen.ForegroundText
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundText
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.UI.StartScreen.ForegroundText
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access ISecondaryTile_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function RequestCreateAsync
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestCreateAsyncWithPoint
   (
      This       : access ISecondaryTile_Interface
      ; invocationPoint : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestCreateAsyncWithRect
   (
      This       : access ISecondaryTile_Interface
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestCreateAsyncWithRectAndPlacement
   (
      This       : access ISecondaryTile_Interface
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDeleteAsync
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDeleteAsyncWithPoint
   (
      This       : access ISecondaryTile_Interface
      ; invocationPoint : Windows.Foundation.Point
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDeleteAsyncWithRect
   (
      This       : access ISecondaryTile_Interface
      ; selection : Windows.Foundation.Rect
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDeleteAsyncWithRectAndPlacement
   (
      This       : access ISecondaryTile_Interface
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateAsync
   (
      This       : access ISecondaryTile_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTile2 : aliased constant Windows.IID := (3002518581, 12880, 18832, (146, 60, 41, 74, 180, 182, 148, 221 ));
   
   type ISecondaryTile2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_PhoneticName
   (
      This       : access ISecondaryTile2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PhoneticName
   (
      This       : access ISecondaryTile2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_VisualElements
   (
      This       : access ISecondaryTile2_Interface
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTileVisualElements
   )
   return Windows.HRESULT is abstract;
   
   function put_RoamingEnabled
   (
      This       : access ISecondaryTile2_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_RoamingEnabled
   (
      This       : access ISecondaryTile2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function add_VisualElementsRequested
   (
      This       : access ISecondaryTile2_Interface
      ; handler : TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VisualElementsRequested
   (
      This       : access ISecondaryTile2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTileVisualElements : aliased constant Windows.IID := (495842099, 33118, 16703, (159, 80, 168, 29, 167, 10, 150, 178 ));
   
   type ISecondaryTileVisualElements_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Square30x30Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Square30x30Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Square70x70Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Square70x70Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Square150x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Square150x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Wide310x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Wide310x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Square310x310Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Square310x310Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ForegroundText
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.UI.StartScreen.ForegroundText
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundText
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.UI.StartScreen.ForegroundText
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowNameOnSquare150x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowNameOnSquare150x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowNameOnWide310x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowNameOnWide310x150Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_ShowNameOnSquare310x310Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ShowNameOnSquare310x310Logo
   (
      This       : access ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTileVisualElements2 : aliased constant Windows.IID := (4247663056, 22492, 18324, (142, 207, 86, 130, 245, 243, 230, 239 ));
   
   type ISecondaryTileVisualElements2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Square71x71Logo
   (
      This       : access ISecondaryTileVisualElements2_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Square71x71Logo
   (
      This       : access ISecondaryTileVisualElements2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTileVisualElements3 : aliased constant Windows.IID := (1454725846, 53596, 16628, (129, 231, 87, 255, 216, 248, 164, 233 ));
   
   type ISecondaryTileVisualElements3_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Square44x44Logo
   (
      This       : access ISecondaryTileVisualElements3_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Square44x44Logo
   (
      This       : access ISecondaryTileVisualElements3_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITileMixedRealityModel : aliased constant Windows.IID := (2960543323, 34941, 16962, (154, 25, 61, 10, 78, 167, 128, 49 ));
   
   type ITileMixedRealityModel_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Uri
   (
      This       : access ITileMixedRealityModel_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access ITileMixedRealityModel_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_BoundingBox
   (
      This       : access ITileMixedRealityModel_Interface
      ; value : Windows.Perception.Spatial.IReference_SpatialBoundingBox
   )
   return Windows.HRESULT is abstract;
   
   function get_BoundingBox
   (
      This       : access ITileMixedRealityModel_Interface
      ; RetVal : access Windows.Perception.Spatial.IReference_SpatialBoundingBox -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTileVisualElements4 : aliased constant Windows.IID := (1716936983, 46404, 16594, (141, 18, 116, 212, 236, 36, 208, 76 ));
   
   type ISecondaryTileVisualElements4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MixedRealityModel
   (
      This       : access ISecondaryTileVisualElements4_Interface
      ; RetVal : access Windows.UI.StartScreen.ITileMixedRealityModel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTileFactory : aliased constant Windows.IID := (1475685536, 20924, 19135, (142, 191, 98, 122, 3, 152, 176, 90 ));
   
   type ISecondaryTileFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateTile
   (
      This       : access ISecondaryTileFactory_Interface
      ; tileId : Windows.String
      ; shortName : Windows.String
      ; displayName : Windows.String
      ; arguments : Windows.String
      ; tileOptions : Windows.UI.StartScreen.TileOptions
      ; logoReference : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTile
   )
   return Windows.HRESULT is abstract;
   
   function CreateWideTile
   (
      This       : access ISecondaryTileFactory_Interface
      ; tileId : Windows.String
      ; shortName : Windows.String
      ; displayName : Windows.String
      ; arguments : Windows.String
      ; tileOptions : Windows.UI.StartScreen.TileOptions
      ; logoReference : Windows.Foundation.IUriRuntimeClass
      ; wideLogoReference : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTile
   )
   return Windows.HRESULT is abstract;
   
   function CreateWithId
   (
      This       : access ISecondaryTileFactory_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTileFactory2 : aliased constant Windows.IID := (659262011, 21037, 17550, (158, 178, 208, 103, 42, 179, 69, 200 ));
   
   type ISecondaryTileFactory2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateMinimalTile
   (
      This       : access ISecondaryTileFactory2_Interface
      ; tileId : Windows.String
      ; displayName : Windows.String
      ; arguments : Windows.String
      ; square150x150Logo : Windows.Foundation.IUriRuntimeClass
      ; desiredSize : Windows.UI.StartScreen.TileSize
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISecondaryTileStatics : aliased constant Windows.IID := (2576387502, 53329, 18038, (135, 254, 158, 194, 66, 216, 60, 116 ));
   
   type ISecondaryTileStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Exists
   (
      This       : access ISecondaryTileStatics_Interface
      ; tileId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function FindAllAsync
   (
      This       : access ISecondaryTileStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllForApplicationAsync
   (
      This       : access ISecondaryTileStatics_Interface
      ; applicationId : Windows.String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindAllForPackageAsync
   (
      This       : access ISecondaryTileStatics_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualElementsRequestedEventArgs : aliased constant Windows.IID := (2070923650, 14861, 20174, (175, 150, 205, 23, 225, 176, 11, 45 ));
   
   type IVisualElementsRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IVisualElementsRequestedEventArgs_Interface
      ; RetVal : access Windows.UI.StartScreen.IVisualElementsRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualElementsRequest : aliased constant Windows.IID := (3241685818, 37640, 16498, (136, 204, 208, 104, 219, 52, 124, 104 ));
   
   type IVisualElementsRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VisualElements
   (
      This       : access IVisualElementsRequest_Interface
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTileVisualElements
   )
   return Windows.HRESULT is abstract;
   
   function get_AlternateVisualElements
   (
      This       : access IVisualElementsRequest_Interface
      ; RetVal : access Windows.UI.StartScreen.IVectorView_ISecondaryTileVisualElements -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access IVisualElementsRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IVisualElementsRequest_Interface
      ; RetVal : access Windows.UI.StartScreen.IVisualElementsRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVisualElementsRequestDeferral : aliased constant Windows.IID := (2707779248, 294, 17239, (130, 4, 189, 130, 187, 42, 4, 109 ));
   
   type IVisualElementsRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IVisualElementsRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStartScreenManager : aliased constant Windows.IID := (1243466699, 9961, 20148, (137, 51, 133, 158, 182, 236, 219, 41 ));
   
   type IStartScreenManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IStartScreenManager_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function SupportsAppListEntry
   (
      This       : access IStartScreenManager_Interface
      ; appListEntry : Windows.ApplicationModel.Core.IAppListEntry
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ContainsAppListEntryAsync
   (
      This       : access IStartScreenManager_Interface
      ; appListEntry : Windows.ApplicationModel.Core.IAppListEntry
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAddAppListEntryAsync
   (
      This       : access IStartScreenManager_Interface
      ; appListEntry : Windows.ApplicationModel.Core.IAppListEntry
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStartScreenManagerStatics : aliased constant Windows.IID := (2019946255, 46469, 17998, (137, 147, 52, 232, 248, 115, 141, 72 ));
   
   type IStartScreenManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IStartScreenManagerStatics_Interface
      ; RetVal : access Windows.UI.StartScreen.IStartScreenManager
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IStartScreenManagerStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.UI.StartScreen.IStartScreenManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IJumpListItem : aliased constant Windows.IID := (4137639108, 79, 21483, (137, 230, 120, 110, 70, 5, 136, 164 ));
   
   type IIterator_IJumpListItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IJumpListItem_Interface
      ; RetVal : access Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IJumpListItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IJumpListItem_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IJumpListItem_Interface
      ; items : Windows.UI.StartScreen.IJumpListItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IJumpListItem : aliased constant Windows.IID := (319451764, 6907, 23568, (171, 234, 97, 216, 22, 146, 164, 150 ));
   
   type IIterable_IJumpListItem_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IJumpListItem_Interface
      ; RetVal : access Windows.UI.StartScreen.IIterator_IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IJumpListItem : aliased constant Windows.IID := (3191966697, 43890, 22192, (182, 211, 236, 112, 239, 17, 246, 99 ));
   
   type IVectorView_IJumpListItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IJumpListItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IJumpListItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IJumpListItem_Interface
      ; value : Windows.UI.StartScreen.IJumpListItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IJumpListItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.StartScreen.IJumpListItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IJumpListItem : aliased constant Windows.IID := (2945400754, 61817, 24330, (170, 9, 40, 148, 46, 237, 246, 37 ));
   
   type IVector_IJumpListItem_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IJumpListItem_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IJumpListItem_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IJumpListItem_Interface
      ; RetVal : access Windows.UI.StartScreen.IVectorView_IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IJumpListItem_Interface
      ; value : Windows.UI.StartScreen.IJumpListItem
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IJumpListItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IJumpListItem_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IJumpListItem_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IJumpListItem_Interface
      ; value : Windows.UI.StartScreen.IJumpListItem
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IJumpListItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IJumpListItem_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IJumpListItem_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.StartScreen.IJumpListItem_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IJumpListItem_Interface
      ; items : Windows.UI.StartScreen.IJumpListItem_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IJumpList : aliased constant Windows.IID := (469797976, 29499, 23362, (150, 42, 179, 51, 40, 35, 108, 211 ));
   
   type IAsyncOperation_IJumpList_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IJumpList_Interface
      ; handler : Windows.UI.StartScreen.AsyncOperationCompletedHandler_IJumpList
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IJumpList_Interface
      ; RetVal : access Windows.UI.StartScreen.AsyncOperationCompletedHandler_IJumpList
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IJumpList_Interface
      ; RetVal : access Windows.UI.StartScreen.IJumpList
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ISecondaryTileVisualElements : aliased constant Windows.IID := (3150373228, 51918, 21040, (136, 4, 34, 152, 55, 81, 104, 172 ));
   
   type IIterator_ISecondaryTileVisualElements_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTileVisualElements
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ISecondaryTileVisualElements_Interface
      ; items : Windows.UI.StartScreen.ISecondaryTileVisualElements_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ISecondaryTileVisualElements : aliased constant Windows.IID := (1861731156, 61779, 23379, (153, 194, 224, 69, 199, 140, 206, 8 ));
   
   type IIterable_ISecondaryTileVisualElements_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.UI.StartScreen.IIterator_ISecondaryTileVisualElements
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ISecondaryTileVisualElements : aliased constant Windows.IID := (483576987, 42012, 24007, (157, 149, 76, 239, 105, 162, 147, 244 ));
   
   type IVectorView_ISecondaryTileVisualElements_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ISecondaryTileVisualElements_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.StartScreen.ISecondaryTileVisualElements
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ISecondaryTileVisualElements_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ISecondaryTileVisualElements_Interface
      ; value : Windows.UI.StartScreen.ISecondaryTileVisualElements
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ISecondaryTileVisualElements_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.StartScreen.ISecondaryTileVisualElements_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IJumpList : aliased constant Windows.IID := (1006926954, 50523, 21637, (182, 115, 141, 75, 215, 195, 66, 226 ));
   
   type AsyncOperationCompletedHandler_IJumpList_Interface(Callback : access procedure (asyncInfo : Windows.UI.StartScreen.IAsyncOperation_IJumpList ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IJumpList'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IJumpList_Interface
      ; asyncInfo : Windows.UI.StartScreen.IAsyncOperation_IJumpList
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested : aliased constant Windows.IID := (47839592, 64118, 23927, (147, 75, 102, 94, 124, 59, 231, 207 ));
   
   type TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested_Interface(Callback : access procedure (sender : Windows.UI.StartScreen.ISecondaryTile ; args : Windows.UI.StartScreen.IVisualElementsRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISecondaryTile2_add_VisualElementsRequested_Interface
      ; sender : Windows.UI.StartScreen.ISecondaryTile
      ; args : Windows.UI.StartScreen.IVisualElementsRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype JumpListItem is Windows.UI.StartScreen.IJumpListItem;
   subtype JumpList is Windows.UI.StartScreen.IJumpList;
   subtype SecondaryTileVisualElements is Windows.UI.StartScreen.ISecondaryTileVisualElements;
   subtype SecondaryTile is Windows.UI.StartScreen.ISecondaryTile;
   function CreateSecondaryTile return Windows.UI.StartScreen.ISecondaryTile;
   
   subtype VisualElementsRequestedEventArgs is Windows.UI.StartScreen.IVisualElementsRequestedEventArgs;
   subtype TileMixedRealityModel is Windows.UI.StartScreen.ITileMixedRealityModel;
   subtype VisualElementsRequest is Windows.UI.StartScreen.IVisualElementsRequest;
   subtype VisualElementsRequestDeferral is Windows.UI.StartScreen.IVisualElementsRequestDeferral;
   subtype StartScreenManager is Windows.UI.StartScreen.IStartScreenManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateWithArguments
   (
      arguments : Windows.String
      ; displayName : Windows.String
   )
   return Windows.UI.StartScreen.IJumpListItem;
   
   function CreateSeparator
   return Windows.UI.StartScreen.IJumpListItem;
   
   function LoadCurrentAsync
   return Windows.UI.StartScreen.IAsyncOperation_IJumpList;
   
   function IsSupported
   return Windows.Boolean;
   
   function Exists
   (
      tileId : Windows.String
   )
   return Windows.Boolean;
   
   function FindAllAsync
   return Windows.Address;
   
   function FindAllForApplicationAsync
   (
      applicationId : Windows.String
   )
   return Windows.Address;
   
   function FindAllForPackageAsync
   return Windows.Address;
   
   function GetDefault
   return Windows.UI.StartScreen.IStartScreenManager;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.UI.StartScreen.IStartScreenManager;
   
end;
