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
with Windows.Networking.Sockets;
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.Proximity is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access MessageReceivedHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
      ; message : Windows.Networking.Proximity.IProximityMessage
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IProximityDevice(sender), Windows.Networking.Proximity.IProximityMessage(message));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access MessageTransmittedHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
      ; messageId : Windows.Int64
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IProximityDevice(sender), messageId);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access DeviceArrivedEventHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IProximityDevice(sender));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access DeviceDepartedEventHandler_Interface
      ; sender : Windows.Networking.Proximity.IProximityDevice
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IProximityDevice(sender));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Added_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IPeerWatcher(sender), Windows.Networking.Proximity.IPeerInformation(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Removed_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IPeerWatcher(sender), Windows.Networking.Proximity.IPeerInformation(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Updated_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IPeerWatcher(sender), Windows.Networking.Proximity.IPeerInformation(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_EnumerationCompleted_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IPeerWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPeerWatcher_add_Stopped_Interface
      ; sender : Windows.Networking.Proximity.IPeerWatcher
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.Proximity.IPeerWatcher(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Networking.Proximity.ITriggeredConnectionStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Networking.Proximity.ITriggeredConnectionStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested_Interface
      ; sender : Windows.Object
      ; args : Windows.Networking.Proximity.IConnectionRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Networking.Proximity.IConnectionRequestedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.ProximityDevice");
      m_Factory     : IProximityDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProximityDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDeviceSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Networking.Proximity.IProximityDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.ProximityDevice");
      m_Factory     : IProximityDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Proximity.IProximityDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProximityDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Networking.Proximity.IProximityDevice is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.ProximityDevice");
      m_Factory     : IProximityDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Proximity.IProximityDevice;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IProximityDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Role
   return Windows.Networking.Proximity.PeerRole is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Proximity.PeerRole;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Role(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_Role
   (
      value : Windows.Networking.Proximity.PeerRole
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_Role(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_DiscoveryData
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DiscoveryData(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_DiscoveryData
   (
      value : Windows.Storage.Streams.IBuffer
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_DiscoveryData(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function CreateWatcher
   return Windows.Networking.Proximity.IPeerWatcher is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Proximity.IPeerWatcher;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllowBluetooth
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowBluetooth(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AllowBluetooth
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AllowBluetooth(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AllowInfrastructure
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowInfrastructure(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AllowInfrastructure
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AllowInfrastructure(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AllowWiFiDirect
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowWiFiDirect(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_AllowWiFiDirect
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_AllowWiFiDirect(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_DisplayName
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DisplayName(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_DisplayName
   (
      value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_DisplayName(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_SupportedDiscoveryTypes
   return Windows.Networking.Proximity.PeerDiscoveryTypes is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Proximity.PeerDiscoveryTypes;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedDiscoveryTypes(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AlternateIdentities
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AlternateIdentities(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure Start
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Start;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure StartWithMessage
   (
      peerMessage : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.StartWithMessage(peerMessage);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure Stop
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Stop;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_TriggeredConnectionStateChanged
   (
      handler : TypedEventHandler_IPeerFinderStatics_add_TriggeredConnectionStateChanged
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_TriggeredConnectionStateChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_TriggeredConnectionStateChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_TriggeredConnectionStateChanged(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_ConnectionRequested
   (
      handler : TypedEventHandler_IPeerFinderStatics_add_ConnectionRequested
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ConnectionRequested(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ConnectionRequested
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ConnectionRequested(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function FindAllPeersAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllPeersAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ConnectAsync
   (
      peerInformation : Windows.Networking.Proximity.IPeerInformation
   )
   return Windows.Networking.Sockets.IAsyncOperation_IStreamSocket is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.Proximity.PeerFinder");
      m_Factory     : IPeerFinderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.Sockets.IAsyncOperation_IStreamSocket;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPeerFinderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ConnectAsync(peerInformation, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
