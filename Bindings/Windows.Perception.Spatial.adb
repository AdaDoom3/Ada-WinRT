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
with Windows.Storage.Streams;
with Windows.Perception;
with Windows.System.RemoteSystems;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Perception.Spatial is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted_Interface
      ; sender : Windows.Perception.Spatial.ISpatialAnchor
      ; args : Windows.Perception.Spatial.ISpatialAnchorRawCoordinateSystemAdjustedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.ISpatialAnchor(sender), Windows.Perception.Spatial.ISpatialAnchorRawCoordinateSystemAdjustedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpatialAnchorStore_Interface
      ; asyncInfo : Windows.Perception.Spatial.IAsyncOperation_ISpatialAnchorStore
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
      This       : access AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus_Interface
      ; asyncInfo : Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus
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
      This       : access TypedEventHandler_ISpatialLocator_add_LocatabilityChanged_Interface
      ; sender : Windows.Perception.Spatial.ISpatialLocator
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.ISpatialLocator(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating_Interface
      ; sender : Windows.Perception.Spatial.ISpatialLocator
      ; args : Windows.Perception.Spatial.ISpatialLocatorPositionalTrackingDeactivatingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.ISpatialLocator(sender), Windows.Perception.Spatial.ISpatialLocatorPositionalTrackingDeactivatingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpatialStageFrameOfReference_Interface
      ; asyncInfo : Windows.Perception.Spatial.IAsyncOperation_ISpatialStageFrameOfReference
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
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_Added_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Perception.Spatial.ISpatialEntityAddedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.ISpatialEntityWatcher(sender), Windows.Perception.Spatial.ISpatialEntityAddedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_Updated_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Perception.Spatial.ISpatialEntityUpdatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.ISpatialEntityWatcher(sender), Windows.Perception.Spatial.ISpatialEntityUpdatedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_Removed_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Perception.Spatial.ISpatialEntityRemovedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.ISpatialEntityWatcher(sender), Windows.Perception.Spatial.ISpatialEntityRemovedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Perception.Spatial.ISpatialEntityWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Perception.Spatial.ISpatialEntityWatcher(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateWithSpatialAnchor
   (
      spatialAnchor : Windows.Perception.Spatial.ISpatialAnchor
   )
   return Windows.Perception.Spatial.ISpatialEntity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialEntity");
      m_Factory     : Windows.Perception.Spatial.ISpatialEntityFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialEntity := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialEntityFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSpatialAnchor(spatialAnchor, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithSpatialAnchorAndProperties
   (
      spatialAnchor : Windows.Perception.Spatial.ISpatialAnchor
      ; propertySet : Windows.Foundation.Collections.IPropertySet
   )
   return Windows.Perception.Spatial.ISpatialEntity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialEntity");
      m_Factory     : Windows.Perception.Spatial.ISpatialEntityFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialEntity := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialEntityFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSpatialAnchorAndProperties(spatialAnchor, propertySet, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function TryCreateRelativeTo
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.Perception.Spatial.ISpatialAnchor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialAnchor");
      m_Factory     : ISpatialAnchorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialAnchor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialAnchorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateRelativeTo(coordinateSystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryCreateWithPositionRelativeTo
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
   )
   return Windows.Perception.Spatial.ISpatialAnchor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialAnchor");
      m_Factory     : ISpatialAnchorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialAnchor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialAnchorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateWithPositionRelativeTo(coordinateSystem, position, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryCreateWithPositionAndOrientationRelativeTo
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; position : Windows.Foundation.Numerics.Vector3
      ; orientation : Windows.Foundation.Numerics.Quaternion
   )
   return Windows.Perception.Spatial.ISpatialAnchor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialAnchor");
      m_Factory     : ISpatialAnchorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialAnchor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialAnchorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryCreateWithPositionAndOrientationRelativeTo(coordinateSystem, position, orientation, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Perception.Spatial.ISpatialLocator is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialLocator");
      m_Factory     : ISpatialLocatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialLocator;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialLocatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStoreAsync
   return Windows.Perception.Spatial.IAsyncOperation_ISpatialAnchorStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialAnchorManager");
      m_Factory     : ISpatialAnchorManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.IAsyncOperation_ISpatialAnchorStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialAnchorManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromBox
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; box : Windows.Perception.Spatial.SpatialBoundingBox
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialBoundingVolume");
      m_Factory     : ISpatialBoundingVolumeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialBoundingVolume;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialBoundingVolumeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromBox(coordinateSystem, box, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromOrientedBox
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; box : Windows.Perception.Spatial.SpatialBoundingOrientedBox
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialBoundingVolume");
      m_Factory     : ISpatialBoundingVolumeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialBoundingVolume;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialBoundingVolumeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromOrientedBox(coordinateSystem, box, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromSphere
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; sphere : Windows.Perception.Spatial.SpatialBoundingSphere
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialBoundingVolume");
      m_Factory     : ISpatialBoundingVolumeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialBoundingVolume;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialBoundingVolumeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromSphere(coordinateSystem, sphere, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromFrustum
   (
      coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; frustum : Windows.Perception.Spatial.SpatialBoundingFrustum
   )
   return Windows.Perception.Spatial.ISpatialBoundingVolume is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialBoundingVolume");
      m_Factory     : ISpatialBoundingVolumeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialBoundingVolume;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialBoundingVolumeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromFrustum(coordinateSystem, frustum, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Current
   return Windows.Perception.Spatial.ISpatialStageFrameOfReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialStageFrameOfReference");
      m_Factory     : ISpatialStageFrameOfReferenceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialStageFrameOfReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialStageFrameOfReferenceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_CurrentChanged
   (
      handler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialStageFrameOfReference");
      m_Factory     : ISpatialStageFrameOfReferenceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialStageFrameOfReferenceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_CurrentChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_CurrentChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialStageFrameOfReference");
      m_Factory     : ISpatialStageFrameOfReferenceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialStageFrameOfReferenceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_CurrentChanged(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function RequestNewStageAsync
   return Windows.Perception.Spatial.IAsyncOperation_ISpatialStageFrameOfReference is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialStageFrameOfReference");
      m_Factory     : ISpatialStageFrameOfReferenceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.IAsyncOperation_ISpatialStageFrameOfReference;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialStageFrameOfReferenceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestNewStageAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialEntityStore");
      m_Factory     : ISpatialEntityStoreStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialEntityStoreStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TryGetForRemoteSystemSession
   (
      session : Windows.System.RemoteSystems.IRemoteSystemSession
   )
   return Windows.Perception.Spatial.ISpatialEntityStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Perception.Spatial.SpatialEntityStore");
      m_Factory     : ISpatialEntityStoreStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Perception.Spatial.ISpatialEntityStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpatialEntityStoreStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TryGetForRemoteSystemSession(session, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
