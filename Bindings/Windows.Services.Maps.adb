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
with Windows.Devices.Geolocation;
with Windows.UI.Popups;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Services.Maps is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMapLocationFinderResult_Interface
      ; asyncInfo : Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMapRouteFinderResult_Interface
      ; asyncInfo : Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      point : Windows.Devices.Geolocation.IGeopoint
      ; kind : Windows.Services.Maps.WaypointKind
   )
   return Windows.Services.Maps.IEnhancedWaypoint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.EnhancedWaypoint");
      m_Factory     : Windows.Services.Maps.IEnhancedWaypointFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IEnhancedWaypoint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEnhancedWaypointFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(point, kind, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMapRouteDrivingOptions return Windows.Services.Maps.IMapRouteDrivingOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteDrivingOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Services.Maps.IMapRouteDrivingOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Services.Maps.IID_IMapRouteDrivingOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePlaceInfoCreateOptions return Windows.Services.Maps.IPlaceInfoCreateOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.PlaceInfoCreateOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Services.Maps.IPlaceInfoCreateOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Services.Maps.IID_IPlaceInfoCreateOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function Create
   (
      referencePoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IPlaceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.PlaceInfo");
      m_Factory     : IPlaceInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IPlaceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaceInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(referencePoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithGeopointAndOptions
   (
      referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IPlaceInfoCreateOptions
   )
   return Windows.Services.Maps.IPlaceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.PlaceInfo");
      m_Factory     : IPlaceInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IPlaceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaceInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithGeopointAndOptions(referencePoint, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIdentifier
   (
      identifier : Windows.String
   )
   return Windows.Services.Maps.IPlaceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.PlaceInfo");
      m_Factory     : IPlaceInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IPlaceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaceInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdentifier(identifier, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromIdentifierWithOptions
   (
      identifier : Windows.String
      ; defaultPoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IPlaceInfoCreateOptions
   )
   return Windows.Services.Maps.IPlaceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.PlaceInfo");
      m_Factory     : IPlaceInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IPlaceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaceInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromIdentifierWithOptions(identifier, defaultPoint, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromMapLocation
   (
      location : Windows.Services.Maps.IMapLocation
   )
   return Windows.Services.Maps.IPlaceInfo is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.PlaceInfo");
      m_Factory     : IPlaceInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IPlaceInfo;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaceInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromMapLocation(location, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsShowSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.PlaceInfo");
      m_Factory     : IPlaceInfoStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPlaceInfoStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsShowSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindLocationsAtAsync
   (
      queryPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapLocationFinder");
      m_Factory     : IMapLocationFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLocationFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindLocationsAtAsync(queryPoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindLocationsAsync
   (
      searchText : Windows.String
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapLocationFinder");
      m_Factory     : IMapLocationFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLocationFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindLocationsAsync(searchText, referencePoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindLocationsWithMaxCountAsync
   (
      searchText : Windows.String
      ; referencePoint : Windows.Devices.Geolocation.IGeopoint
      ; maxCount : Windows.UInt32
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapLocationFinder");
      m_Factory     : IMapLocationFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLocationFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindLocationsWithMaxCountAsync(searchText, referencePoint, maxCount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindLocationsAtWithAccuracyAsync
   (
      queryPoint : Windows.Devices.Geolocation.IGeopoint
      ; accuracy : Windows.Services.Maps.MapLocationDesiredAccuracy
   )
   return Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapLocationFinder");
      m_Factory     : IMapLocationFinderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapLocationFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapLocationFinderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindLocationsAtWithAccuracyAsync(queryPoint, accuracy, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteWithOptionsAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; options : Windows.Services.Maps.IMapRouteDrivingOptions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteWithOptionsAsync(startPoint, endPoint, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteAsync(startPoint, endPoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteWithOptimizationAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteWithOptimizationAsync(startPoint, endPoint, optimization, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteWithOptimizationAndRestrictionsAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteWithOptimizationAndRestrictionsAsync(startPoint, endPoint, optimization, restrictions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; headingInDegrees : Windows.Double
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync(startPoint, endPoint, optimization, restrictions, headingInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteFromWaypointsAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteFromWaypointsAsync(wayPoints, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteFromWaypointsAndOptimizationAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteFromWaypointsAndOptimizationAsync(wayPoints, optimization, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync(wayPoints, optimization, restrictions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
      ; optimization : Windows.Services.Maps.MapRouteOptimization
      ; restrictions : Windows.Services.Maps.MapRouteRestrictions
      ; headingInDegrees : Windows.Double
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync(wayPoints, optimization, restrictions, headingInDegrees, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetWalkingRouteAsync
   (
      startPoint : Windows.Devices.Geolocation.IGeopoint
      ; endPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetWalkingRouteAsync(startPoint, endPoint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetWalkingRouteFromWaypointsAsync
   (
      wayPoints : Windows.Devices.Geolocation.IIterable_IGeopoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetWalkingRouteFromWaypointsAsync(wayPoints, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteFromEnhancedWaypointsAsync
   (
      waypoints : Windows.Services.Maps.IIterable_IEnhancedWaypoint
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteFromEnhancedWaypointsAsync(waypoints, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDrivingRouteFromEnhancedWaypointsWithOptionsAsync
   (
      waypoints : Windows.Services.Maps.IIterable_IEnhancedWaypoint
      ; options : Windows.Services.Maps.IMapRouteDrivingOptions
   )
   return Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapRouteFinder");
      m_Factory     : IMapRouteFinderStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.IAsyncOperation_IMapRouteFinderResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapRouteFinderStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDrivingRouteFromEnhancedWaypointsWithOptionsAsync(waypoints, options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DataAttributions
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapService");
      m_Factory     : IMapServiceStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapServiceStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DataAttributions(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_DataUsagePreference
   (
      value : Windows.Services.Maps.MapServiceDataUsagePreference
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapService");
      m_Factory     : IMapServiceStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapServiceStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_DataUsagePreference(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_DataUsagePreference
   return Windows.Services.Maps.MapServiceDataUsagePreference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapService");
      m_Factory     : IMapServiceStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Services.Maps.MapServiceDataUsagePreference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapServiceStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DataUsagePreference(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_ServiceToken
   (
      value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapService");
      m_Factory     : IMapServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_ServiceToken(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ServiceToken
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapService");
      m_Factory     : IMapServiceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapServiceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ServiceToken(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WorldViewRegionCode
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapService");
      m_Factory     : IMapServiceStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapServiceStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WorldViewRegionCode(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ShowDownloadedMapsUI
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapManager");
      m_Factory     : IMapManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowDownloadedMapsUI;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ShowMapsUpdateUI
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Services.Maps.MapManager");
      m_Factory     : IMapManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMapManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowMapsUpdateUI;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
end;
