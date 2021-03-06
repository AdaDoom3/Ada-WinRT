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
limited with Windows.ApplicationModel.Core;
--------------------------------------------------------------------------------
package Windows.UI.Shell is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IAdaptiveCard_Interface;
   type IAdaptiveCard is access all IAdaptiveCard_Interface'Class;
   type IAdaptiveCard_Ptr is access all IAdaptiveCard;
   type IAdaptiveCardBuilderStatics_Interface;
   type IAdaptiveCardBuilderStatics is access all IAdaptiveCardBuilderStatics_Interface'Class;
   type IAdaptiveCardBuilderStatics_Ptr is access all IAdaptiveCardBuilderStatics;
   type ITaskbarManager_Interface;
   type ITaskbarManager is access all ITaskbarManager_Interface'Class;
   type ITaskbarManager_Ptr is access all ITaskbarManager;
   type ITaskbarManagerStatics_Interface;
   type ITaskbarManagerStatics is access all ITaskbarManagerStatics_Interface'Class;
   type ITaskbarManagerStatics_Ptr is access all ITaskbarManagerStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IAdaptiveCard : aliased constant Windows.IID := (1926256268, 41588, 16845, (130, 168, 152, 157, 64, 185, 176, 94 ));
   
   type IAdaptiveCard_Interface is interface and Windows.IInspectable_Interface;
   
   function ToJson
   (
      This       : access IAdaptiveCard_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAdaptiveCardBuilderStatics : aliased constant Windows.IID := (1986891528, 54270, 17223, (160, 188, 185, 234, 154, 109, 194, 142 ));
   
   type IAdaptiveCardBuilderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAdaptiveCardFromJson
   (
      This       : access IAdaptiveCardBuilderStatics_Interface
      ; value : Windows.String
      ; RetVal : access Windows.UI.Shell.IAdaptiveCard
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITaskbarManager : aliased constant Windows.IID := (2269710873, 6873, 18932, (178, 232, 134, 115, 141, 197, 172, 64 ));
   
   type ITaskbarManager_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsSupported
   (
      This       : access ITaskbarManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPinningAllowed
   (
      This       : access ITaskbarManager_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCurrentAppPinnedAsync
   (
      This       : access ITaskbarManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function IsAppListEntryPinnedAsync
   (
      This       : access ITaskbarManager_Interface
      ; appListEntry : Windows.ApplicationModel.Core.IAppListEntry
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPinCurrentAppAsync
   (
      This       : access ITaskbarManager_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPinAppListEntryAsync
   (
      This       : access ITaskbarManager_Interface
      ; appListEntry : Windows.ApplicationModel.Core.IAppListEntry
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITaskbarManagerStatics : aliased constant Windows.IID := (3677530996, 56914, 20454, (183, 182, 149, 255, 159, 131, 149, 223 ));
   
   type ITaskbarManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access ITaskbarManagerStatics_Interface
      ; RetVal : access Windows.UI.Shell.ITaskbarManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype TaskbarManager is Windows.UI.Shell.ITaskbarManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateAdaptiveCardFromJson
   (
      value : Windows.String
   )
   return Windows.UI.Shell.IAdaptiveCard;
   
   function GetDefault
   return Windows.UI.Shell.ITaskbarManager;
   
end;
