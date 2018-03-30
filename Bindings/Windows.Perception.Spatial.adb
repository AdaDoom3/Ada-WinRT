--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
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
   
   
   function QueryInterface(This : access TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialAnchor_add_RawCoordinateSystemAdjusted or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISpatialAnchorStore_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISpatialAnchorStore or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_SpatialPerceptionAccessStatus or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_ISpatialLocator_add_LocatabilityChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialLocator_add_LocatabilityChanged or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialLocator_add_PositionalTrackingDeactivating or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ISpatialStageFrameOfReference_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ISpatialStageFrameOfReference or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_ISpatialEntityWatcher_add_Added_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialEntityWatcher_add_Added or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_ISpatialEntityWatcher_add_Updated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialEntityWatcher_add_Updated or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_ISpatialEntityWatcher_add_Removed_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialEntityWatcher_add_Removed or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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
   
   function QueryInterface(This : access TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_ISpatialEntityWatcher_add_EnumerationCompleted or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
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