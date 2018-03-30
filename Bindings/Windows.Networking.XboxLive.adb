--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.XboxLive is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IXboxLiveDeviceAddress_add_SnapshotChanged_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveDeviceAddress
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.XboxLive.IXboxLiveDeviceAddress(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IXboxLiveEndpointPairTemplate_add_InboundEndpointPairCreated_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
      ; args : Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate(sender), Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs(args));
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IXboxLiveEndpointPairCreationResult_Interface
      ; asyncInfo : Windows.Networking.XboxLive.IAsyncOperation_IXboxLiveEndpointPairCreationResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IXboxLiveEndpointPair_add_StateChanged_Interface
      ; sender : Windows.Networking.XboxLive.IXboxLiveEndpointPair
      ; args : Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.XboxLive.IXboxLiveEndpointPair(sender), Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateXboxLiveQualityOfServiceMeasurement return Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.XboxLive.IID_IXboxLiveQualityOfServiceMeasurement'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function CreateFromSnapshotBase64
   (
      base64 : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSnapshotBase64(base64, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromSnapshotBuffer
   (
      buffer : Windows.Storage.Streams.IBuffer
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSnapshotBuffer(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromSnapshotBytes
   (
      buffer : Windows.UInt8_Ptr
   )
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSnapshotBytes(buffer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLocal
   return Windows.Networking.XboxLive.IXboxLiveDeviceAddress is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveDeviceAddress;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLocal(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxSnapshotBytesSize
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveDeviceAddress");
      m_Factory     : IXboxLiveDeviceAddressStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveDeviceAddressStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxSnapshotBytesSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindEndpointPairBySocketAddressBytes
   (
      localSocketAddress : Windows.UInt8_Ptr
      ; remoteSocketAddress : Windows.UInt8_Ptr
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPair is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPair");
      m_Factory     : IXboxLiveEndpointPairStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveEndpointPair;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindEndpointPairBySocketAddressBytes(localSocketAddress, remoteSocketAddress, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindEndpointPairByHostNamesAndPorts
   (
      localHostName : Windows.Networking.IHostName
      ; localPort : Windows.String
      ; remoteHostName : Windows.Networking.IHostName
      ; remotePort : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPair is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPair");
      m_Factory     : IXboxLiveEndpointPairStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveEndpointPair;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindEndpointPairByHostNamesAndPorts(localHostName, localPort, remoteHostName, remotePort, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTemplateByName
   (
      name : Windows.String
   )
   return Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPairTemplate");
      m_Factory     : IXboxLiveEndpointPairTemplateStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairTemplateStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTemplateByName(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Templates
   return Windows.Networking.XboxLive.IVectorView_IXboxLiveEndpointPairTemplate is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveEndpointPairTemplate");
      m_Factory     : IXboxLiveEndpointPairTemplateStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.XboxLive.IVectorView_IXboxLiveEndpointPairTemplate;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveEndpointPairTemplateStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Templates(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure PublishPrivatePayloadBytes
   (
      payload : Windows.UInt8_Ptr
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.PublishPrivatePayloadBytes(payload);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ClearPrivatePayload
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ClearPrivatePayload;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_MaxSimultaneousProbeConnections
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxSimultaneousProbeConnections(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_MaxSimultaneousProbeConnections
   (
      value : Windows.UInt32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_MaxSimultaneousProbeConnections(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsSystemOutboundBandwidthConstrained
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSystemOutboundBandwidthConstrained(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IsSystemOutboundBandwidthConstrained
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IsSystemOutboundBandwidthConstrained(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsSystemInboundBandwidthConstrained
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSystemInboundBandwidthConstrained(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IsSystemInboundBandwidthConstrained
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IsSystemInboundBandwidthConstrained(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_PublishedPrivatePayload
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PublishedPrivatePayload(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_PublishedPrivatePayload
   (
      value : Windows.Storage.Streams.IBuffer
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_PublishedPrivatePayload(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_MaxPrivatePayloadSize
   return Windows.UInt32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement");
      m_Factory     : IXboxLiveQualityOfServiceMeasurementStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXboxLiveQualityOfServiceMeasurementStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxPrivatePayloadSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;