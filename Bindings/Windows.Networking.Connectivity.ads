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
with Windows; use Windows;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Networking.Connectivity is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type NetworkCostType is (
      Unknown,
      Unrestricted,
      Fixed,
      Variable
   );
   for NetworkCostType use (
      Unknown => 0,
      Unrestricted => 1,
      Fixed => 2,
      Variable => 3
   );
   for NetworkCostType'Size use 32;
   
   type NetworkCostType_Ptr is access NetworkCostType;
   
   type NetworkConnectivityLevel is (
      None,
      LocalAccess,
      ConstrainedInternetAccess,
      InternetAccess
   );
   for NetworkConnectivityLevel use (
      None => 0,
      LocalAccess => 1,
      ConstrainedInternetAccess => 2,
      InternetAccess => 3
   );
   for NetworkConnectivityLevel'Size use 32;
   
   type NetworkConnectivityLevel_Ptr is access NetworkConnectivityLevel;
   
   type NetworkTypes is (
      None,
      Internet,
      PrivateNetwork
   );
   for NetworkTypes use (
      None => 0,
      Internet => 1,
      PrivateNetwork => 2
   );
   for NetworkTypes'Size use 32;
   
   type NetworkTypes_Ptr is access NetworkTypes;
   
   type RoamingStates is (
      None,
      NotRoaming,
      Roaming
   );
   for RoamingStates use (
      None => 0,
      NotRoaming => 1,
      Roaming => 2
   );
   for RoamingStates'Size use 32;
   
   type RoamingStates_Ptr is access RoamingStates;
   
   type NetworkAuthenticationType is (
      None,
      Unknown,
      Open80211,
      SharedKey80211,
      Wpa,
      WpaPsk,
      WpaNone,
      Rsna,
      RsnaPsk,
      Ihv
   );
   for NetworkAuthenticationType use (
      None => 0,
      Unknown => 1,
      Open80211 => 2,
      SharedKey80211 => 3,
      Wpa => 4,
      WpaPsk => 5,
      WpaNone => 6,
      Rsna => 7,
      RsnaPsk => 8,
      Ihv => 9
   );
   for NetworkAuthenticationType'Size use 32;
   
   type NetworkAuthenticationType_Ptr is access NetworkAuthenticationType;
   
   type NetworkEncryptionType is (
      None,
      Unknown,
      Wep,
      Wep40,
      Wep104,
      Tkip,
      Ccmp,
      WpaUseGroup,
      RsnUseGroup,
      Ihv
   );
   for NetworkEncryptionType use (
      None => 0,
      Unknown => 1,
      Wep => 2,
      Wep40 => 3,
      Wep104 => 4,
      Tkip => 5,
      Ccmp => 6,
      WpaUseGroup => 7,
      RsnUseGroup => 8,
      Ihv => 9
   );
   for NetworkEncryptionType'Size use 32;
   
   type NetworkEncryptionType_Ptr is access NetworkEncryptionType;
   
   type DomainConnectivityLevel is (
      None,
      Unauthenticated,
      Authenticated
   );
   for DomainConnectivityLevel use (
      None => 0,
      Unauthenticated => 1,
      Authenticated => 2
   );
   for DomainConnectivityLevel'Size use 32;
   
   type DomainConnectivityLevel_Ptr is access DomainConnectivityLevel;
   
   type DataUsageGranularity is (
      PerMinute,
      PerHour,
      PerDay,
      Total
   );
   for DataUsageGranularity use (
      PerMinute => 0,
      PerHour => 1,
      PerDay => 2,
      Total => 3
   );
   for DataUsageGranularity'Size use 32;
   
   type DataUsageGranularity_Ptr is access DataUsageGranularity;
   
   type CellularApnAuthenticationType is (
      None,
      Pap,
      Chap,
      Mschapv2
   );
   for CellularApnAuthenticationType use (
      None => 0,
      Pap => 1,
      Chap => 2,
      Mschapv2 => 3
   );
   for CellularApnAuthenticationType'Size use 32;
   
   type CellularApnAuthenticationType_Ptr is access CellularApnAuthenticationType;
   
   type TriStates is (
      DoNotCare,
      No,
      Yes
   );
   for TriStates use (
      DoNotCare => 0,
      No => 1,
      Yes => 2
   );
   for TriStates'Size use 32;
   
   type TriStates_Ptr is access TriStates;
   
   type WwanNetworkRegistrationState is (
      None,
      Deregistered,
      Searching,
      Home,
      Roaming,
      Partner,
      Denied
   );
   for WwanNetworkRegistrationState use (
      None => 0,
      Deregistered => 1,
      Searching => 2,
      Home => 3,
      Roaming => 4,
      Partner => 5,
      Denied => 6
   );
   for WwanNetworkRegistrationState'Size use 32;
   
   type WwanNetworkRegistrationState_Ptr is access WwanNetworkRegistrationState;
   
   type WwanDataClass is (
      None,
      Gprs,
      Edge,
      Umts,
      Hsdpa,
      Hsupa,
      LteAdvanced,
      Cdma1xRtt,
      Cdma1xEvdo,
      Cdma1xEvdoRevA,
      Cdma1xEvdv,
      Cdma3xRtt,
      Cdma1xEvdoRevB,
      CdmaUmb,
      Custom
   );
   for WwanDataClass use (
      None => 0,
      Gprs => 1,
      Edge => 2,
      Umts => 4,
      Hsdpa => 8,
      Hsupa => 16,
      LteAdvanced => 32,
      Cdma1xRtt => 65536,
      Cdma1xEvdo => 131072,
      Cdma1xEvdoRevA => 262144,
      Cdma1xEvdv => 524288,
      Cdma3xRtt => 1048576,
      Cdma1xEvdoRevB => 2097152,
      CdmaUmb => 4194304,
      Custom => 2147483648
   );
   for WwanDataClass'Size use 32;
   
   type WwanDataClass_Ptr is access WwanDataClass;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type NetworkUsageStates is record
      Roaming : Windows.Networking.Connectivity.TriStates;
      Shared : Windows.Networking.Connectivity.TriStates;
   end record;
   pragma Convention (C_Pass_By_Copy , NetworkUsageStates);
   
   type NetworkUsageStates_Ptr is access NetworkUsageStates;
   
   type WwanContract is null record;
   pragma Convention (C_Pass_By_Copy , WwanContract);
   
   type WwanContract_Ptr is access WwanContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type NetworkStatusChangedEventHandler_Interface;
   type NetworkStatusChangedEventHandler is access all NetworkStatusChangedEventHandler_Interface'Class;
   type NetworkStatusChangedEventHandler_Ptr is access all NetworkStatusChangedEventHandler;
   type AsyncOperationCompletedHandler_IProxyConfiguration_Interface;
   type AsyncOperationCompletedHandler_IProxyConfiguration is access all AsyncOperationCompletedHandler_IProxyConfiguration_Interface'Class;
   type AsyncOperationCompletedHandler_IProxyConfiguration_Ptr is access all AsyncOperationCompletedHandler_IProxyConfiguration;
   type AsyncOperationCompletedHandler_IConnectionProfile_Interface;
   type AsyncOperationCompletedHandler_IConnectionProfile is access all AsyncOperationCompletedHandler_IConnectionProfile_Interface'Class;
   type AsyncOperationCompletedHandler_IConnectionProfile_Ptr is access all AsyncOperationCompletedHandler_IConnectionProfile;
   type AsyncOperationCompletedHandler_IConnectionSession_Interface;
   type AsyncOperationCompletedHandler_IConnectionSession is access all AsyncOperationCompletedHandler_IConnectionSession_Interface'Class;
   type AsyncOperationCompletedHandler_IConnectionSession_Ptr is access all AsyncOperationCompletedHandler_IConnectionSession;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDataUsage_Interface;
   type IDataUsage is access all IDataUsage_Interface'Class;
   type IDataUsage_Ptr is access all IDataUsage;
   type IDataPlanUsage_Interface;
   type IDataPlanUsage is access all IDataPlanUsage_Interface'Class;
   type IDataPlanUsage_Ptr is access all IDataPlanUsage;
   type IDataPlanStatus_Interface;
   type IDataPlanStatus is access all IDataPlanStatus_Interface'Class;
   type IDataPlanStatus_Ptr is access all IDataPlanStatus;
   type IConnectionCost_Interface;
   type IConnectionCost is access all IConnectionCost_Interface'Class;
   type IConnectionCost_Ptr is access all IConnectionCost;
   type IConnectionCost2_Interface;
   type IConnectionCost2 is access all IConnectionCost2_Interface'Class;
   type IConnectionCost2_Ptr is access all IConnectionCost2;
   type INetworkSecuritySettings_Interface;
   type INetworkSecuritySettings is access all INetworkSecuritySettings_Interface'Class;
   type INetworkSecuritySettings_Ptr is access all INetworkSecuritySettings;
   type IConnectionProfile_Interface;
   type IConnectionProfile is access all IConnectionProfile_Interface'Class;
   type IConnectionProfile_Ptr is access all IConnectionProfile;
   type IWlanConnectionProfileDetails_Interface;
   type IWlanConnectionProfileDetails is access all IWlanConnectionProfileDetails_Interface'Class;
   type IWlanConnectionProfileDetails_Ptr is access all IWlanConnectionProfileDetails;
   type IConnectivityInterval_Interface;
   type IConnectivityInterval is access all IConnectivityInterval_Interface'Class;
   type IConnectivityInterval_Ptr is access all IConnectivityInterval;
   type INetworkUsage_Interface;
   type INetworkUsage is access all INetworkUsage_Interface'Class;
   type INetworkUsage_Ptr is access all INetworkUsage;
   type IAttributedNetworkUsage_Interface;
   type IAttributedNetworkUsage is access all IAttributedNetworkUsage_Interface'Class;
   type IAttributedNetworkUsage_Ptr is access all IAttributedNetworkUsage;
   type IProviderNetworkUsage_Interface;
   type IProviderNetworkUsage is access all IProviderNetworkUsage_Interface'Class;
   type IProviderNetworkUsage_Ptr is access all IProviderNetworkUsage;
   type IConnectionProfile2_Interface;
   type IConnectionProfile2 is access all IConnectionProfile2_Interface'Class;
   type IConnectionProfile2_Ptr is access all IConnectionProfile2;
   type IConnectionProfile3_Interface;
   type IConnectionProfile3 is access all IConnectionProfile3_Interface'Class;
   type IConnectionProfile3_Ptr is access all IConnectionProfile3;
   type IConnectionProfile4_Interface;
   type IConnectionProfile4 is access all IConnectionProfile4_Interface'Class;
   type IConnectionProfile4_Ptr is access all IConnectionProfile4;
   type ILanIdentifierData_Interface;
   type ILanIdentifierData is access all ILanIdentifierData_Interface'Class;
   type ILanIdentifierData_Ptr is access all ILanIdentifierData;
   type ILanIdentifier_Interface;
   type ILanIdentifier is access all ILanIdentifier_Interface'Class;
   type ILanIdentifier_Ptr is access all ILanIdentifier;
   type INetworkInformationStatics_Interface;
   type INetworkInformationStatics is access all INetworkInformationStatics_Interface'Class;
   type INetworkInformationStatics_Ptr is access all INetworkInformationStatics;
   type IConnectionProfileFilter_Interface;
   type IConnectionProfileFilter is access all IConnectionProfileFilter_Interface'Class;
   type IConnectionProfileFilter_Ptr is access all IConnectionProfileFilter;
   type IConnectionProfileFilter2_Interface;
   type IConnectionProfileFilter2 is access all IConnectionProfileFilter2_Interface'Class;
   type IConnectionProfileFilter2_Ptr is access all IConnectionProfileFilter2;
   type INetworkInformationStatics2_Interface;
   type INetworkInformationStatics2 is access all INetworkInformationStatics2_Interface'Class;
   type INetworkInformationStatics2_Ptr is access all INetworkInformationStatics2;
   type INetworkItem_Interface;
   type INetworkItem is access all INetworkItem_Interface'Class;
   type INetworkItem_Ptr is access all INetworkItem;
   type INetworkAdapter_Interface;
   type INetworkAdapter is access all INetworkAdapter_Interface'Class;
   type INetworkAdapter_Ptr is access all INetworkAdapter;
   type IIPInformation_Interface;
   type IIPInformation is access all IIPInformation_Interface'Class;
   type IIPInformation_Ptr is access all IIPInformation;
   type IProxyConfiguration_Interface;
   type IProxyConfiguration is access all IProxyConfiguration_Interface'Class;
   type IProxyConfiguration_Ptr is access all IProxyConfiguration;
   type IConnectionSession_Interface;
   type IConnectionSession is access all IConnectionSession_Interface'Class;
   type IConnectionSession_Ptr is access all IConnectionSession;
   type IRoutePolicy_Interface;
   type IRoutePolicy is access all IRoutePolicy_Interface'Class;
   type IRoutePolicy_Ptr is access all IRoutePolicy;
   type IRoutePolicyFactory_Interface;
   type IRoutePolicyFactory is access all IRoutePolicyFactory_Interface'Class;
   type IRoutePolicyFactory_Ptr is access all IRoutePolicyFactory;
   type ICellularApnContext_Interface;
   type ICellularApnContext is access all ICellularApnContext_Interface'Class;
   type ICellularApnContext_Ptr is access all ICellularApnContext;
   type IConnectivityManagerStatics_Interface;
   type IConnectivityManagerStatics is access all IConnectivityManagerStatics_Interface'Class;
   type IConnectivityManagerStatics_Ptr is access all IConnectivityManagerStatics;
   type INetworkStateChangeEventDetails_Interface;
   type INetworkStateChangeEventDetails is access all INetworkStateChangeEventDetails_Interface'Class;
   type INetworkStateChangeEventDetails_Ptr is access all INetworkStateChangeEventDetails;
   type INetworkStateChangeEventDetails2_Interface;
   type INetworkStateChangeEventDetails2 is access all INetworkStateChangeEventDetails2_Interface'Class;
   type INetworkStateChangeEventDetails2_Ptr is access all INetworkStateChangeEventDetails2;
   type IWwanConnectionProfileDetails_Interface;
   type IWwanConnectionProfileDetails is access all IWwanConnectionProfileDetails_Interface'Class;
   type IWwanConnectionProfileDetails_Ptr is access all IWwanConnectionProfileDetails;
   type IIterator_IConnectionProfile_Interface;
   type IIterator_IConnectionProfile is access all IIterator_IConnectionProfile_Interface'Class;
   type IIterator_IConnectionProfile_Ptr is access all IIterator_IConnectionProfile;
   type IIterable_IConnectionProfile_Interface;
   type IIterable_IConnectionProfile is access all IIterable_IConnectionProfile_Interface'Class;
   type IIterable_IConnectionProfile_Ptr is access all IIterable_IConnectionProfile;
   type IVectorView_IConnectionProfile_Interface;
   type IVectorView_IConnectionProfile is access all IVectorView_IConnectionProfile_Interface'Class;
   type IVectorView_IConnectionProfile_Ptr is access all IVectorView_IConnectionProfile;
   type IIterator_ILanIdentifier_Interface;
   type IIterator_ILanIdentifier is access all IIterator_ILanIdentifier_Interface'Class;
   type IIterator_ILanIdentifier_Ptr is access all IIterator_ILanIdentifier;
   type IIterable_ILanIdentifier_Interface;
   type IIterable_ILanIdentifier is access all IIterable_ILanIdentifier_Interface'Class;
   type IIterable_ILanIdentifier_Ptr is access all IIterable_ILanIdentifier;
   type IVectorView_ILanIdentifier_Interface;
   type IVectorView_ILanIdentifier is access all IVectorView_ILanIdentifier_Interface'Class;
   type IVectorView_ILanIdentifier_Ptr is access all IVectorView_ILanIdentifier;
   type IAsyncOperation_IProxyConfiguration_Interface;
   type IAsyncOperation_IProxyConfiguration is access all IAsyncOperation_IProxyConfiguration_Interface'Class;
   type IAsyncOperation_IProxyConfiguration_Ptr is access all IAsyncOperation_IProxyConfiguration;
   type IAsyncOperation_IConnectionProfile_Interface;
   type IAsyncOperation_IConnectionProfile is access all IAsyncOperation_IConnectionProfile_Interface'Class;
   type IAsyncOperation_IConnectionProfile_Ptr is access all IAsyncOperation_IConnectionProfile;
   type IAsyncOperation_IConnectionSession_Interface;
   type IAsyncOperation_IConnectionSession is access all IAsyncOperation_IConnectionSession_Interface'Class;
   type IAsyncOperation_IConnectionSession_Ptr is access all IAsyncOperation_IConnectionSession;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDataUsage : aliased constant Windows.IID := (3242401235, 45382, 19769, (185, 89, 12, 105, 176, 150, 197, 18 ));
   
   type IDataUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BytesSent
   (
      This       : access IDataUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesReceived
   (
      This       : access IDataUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPlanUsage : aliased constant Windows.IID := (3105966381, 15172, 18431, (179, 97, 190, 89, 230, 158, 209, 176 ));
   
   type IDataPlanUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_MegabytesUsed
   (
      This       : access IDataPlanUsage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_LastSyncTime
   (
      This       : access IDataPlanUsage_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPlanStatus : aliased constant Windows.IID := (2541390732, 14469, 16627, (136, 81, 66, 205, 43, 213, 104, 187 ));
   
   type IDataPlanStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DataPlanUsage
   (
      This       : access IDataPlanStatus_Interface
      ; RetVal : access Windows.Networking.Connectivity.IDataPlanUsage
   )
   return Windows.HRESULT is abstract;
   
   function get_DataLimitInMegabytes
   (
      This       : access IDataPlanStatus_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InboundBitsPerSecond
   (
      This       : access IDataPlanStatus_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_OutboundBitsPerSecond
   (
      This       : access IDataPlanStatus_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt64 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NextBillingCycle
   (
      This       : access IDataPlanStatus_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxTransferSizeInMegabytes
   (
      This       : access IDataPlanStatus_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionCost : aliased constant Windows.IID := (3134707753, 13334, 19216, (162, 2, 186, 192, 176, 117, 189, 174 ));
   
   type IConnectionCost_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkCostType
   (
      This       : access IConnectionCost_Interface
      ; RetVal : access Windows.Networking.Connectivity.NetworkCostType
   )
   return Windows.HRESULT is abstract;
   
   function get_Roaming
   (
      This       : access IConnectionCost_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_OverDataLimit
   (
      This       : access IConnectionCost_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ApproachingDataLimit
   (
      This       : access IConnectionCost_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionCost2 : aliased constant Windows.IID := (2383493637, 57865, 17737, (187, 37, 94, 13, 182, 145, 203, 5 ));
   
   type IConnectionCost2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BackgroundDataUsageRestricted
   (
      This       : access IConnectionCost2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkSecuritySettings : aliased constant Windows.IID := (2090892941, 37243, 19295, (184, 77, 40, 247, 165, 172, 84, 2 ));
   
   type INetworkSecuritySettings_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAuthenticationType
   (
      This       : access INetworkSecuritySettings_Interface
      ; RetVal : access Windows.Networking.Connectivity.NetworkAuthenticationType
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkEncryptionType
   (
      This       : access INetworkSecuritySettings_Interface
      ; RetVal : access Windows.Networking.Connectivity.NetworkEncryptionType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionProfile : aliased constant Windows.IID := (1908020284, 22926, 18896, (132, 235, 143, 235, 174, 220, 193, 149 ));
   
   type IConnectionProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProfileName
   (
      This       : access IConnectionProfile_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetNetworkConnectivityLevel
   (
      This       : access IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.NetworkConnectivityLevel
   )
   return Windows.HRESULT is abstract;
   
   function GetNetworkNames
   (
      This       : access IConnectionProfile_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConnectionCost
   (
      This       : access IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.IConnectionCost
   )
   return Windows.HRESULT is abstract;
   
   function GetDataPlanStatus
   (
      This       : access IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.IDataPlanStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkAdapter
   (
      This       : access IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkAdapter
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalUsage
   (
      This       : access IConnectionProfile_Interface
      ; StartTime : Windows.Foundation.DateTime
      ; EndTime : Windows.Foundation.DateTime
      ; RetVal : access Windows.Networking.Connectivity.IDataUsage
   )
   return Windows.HRESULT is abstract;
   
   function GetLocalUsagePerRoamingStates
   (
      This       : access IConnectionProfile_Interface
      ; StartTime : Windows.Foundation.DateTime
      ; EndTime : Windows.Foundation.DateTime
      ; States : Windows.Networking.Connectivity.RoamingStates
      ; RetVal : access Windows.Networking.Connectivity.IDataUsage
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkSecuritySettings
   (
      This       : access IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkSecuritySettings
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWlanConnectionProfileDetails : aliased constant Windows.IID := (1444976843, 45914, 19441, (168, 132, 183, 85, 126, 136, 255, 134 ));
   
   type IWlanConnectionProfileDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function GetConnectedSsid
   (
      This       : access IWlanConnectionProfileDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectivityInterval : aliased constant Windows.IID := (1336557567, 26438, 18468, (169, 100, 238, 216, 232, 127, 135, 9 ));
   
   type IConnectivityInterval_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StartTime
   (
      This       : access IConnectivityInterval_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionDuration
   (
      This       : access IConnectivityInterval_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkUsage : aliased constant Windows.IID := (1239060430, 39301, 18727, (191, 91, 7, 43, 92, 101, 248, 217 ));
   
   type INetworkUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BytesSent
   (
      This       : access INetworkUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesReceived
   (
      This       : access INetworkUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionDuration
   (
      This       : access INetworkUsage_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAttributedNetworkUsage : aliased constant Windows.IID := (4150898745, 60578, 17899, (173, 225, 176, 54, 139, 117, 108, 73 ));
   
   type IAttributedNetworkUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BytesSent
   (
      This       : access IAttributedNetworkUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesReceived
   (
      This       : access IAttributedNetworkUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributionId
   (
      This       : access IAttributedNetworkUsage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributionName
   (
      This       : access IAttributedNetworkUsage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AttributionThumbnail
   (
      This       : access IAttributedNetworkUsage_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProviderNetworkUsage : aliased constant Windows.IID := (1590074884, 31025, 18632, (184, 243, 70, 48, 15, 164, 39, 40 ));
   
   type IProviderNetworkUsage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BytesSent
   (
      This       : access IProviderNetworkUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_BytesReceived
   (
      This       : access IProviderNetworkUsage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderId
   (
      This       : access IProviderNetworkUsage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionProfile2 : aliased constant Windows.IID := (3791933765, 19615, 16396, (145, 80, 126, 199, 214, 226, 136, 138 ));
   
   type IConnectionProfile2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsWwanConnectionProfile
   (
      This       : access IConnectionProfile2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsWlanConnectionProfile
   (
      This       : access IConnectionProfile2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_WwanConnectionProfileDetails
   (
      This       : access IConnectionProfile2_Interface
      ; RetVal : access Windows.Networking.Connectivity.IWwanConnectionProfileDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_WlanConnectionProfileDetails
   (
      This       : access IConnectionProfile2_Interface
      ; RetVal : access Windows.Networking.Connectivity.IWlanConnectionProfileDetails
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceProviderGuid
   (
      This       : access IConnectionProfile2_Interface
      ; RetVal : access Windows.Foundation.IReference_Guid -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSignalBars
   (
      This       : access IConnectionProfile2_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDomainConnectivityLevel
   (
      This       : access IConnectionProfile2_Interface
      ; RetVal : access Windows.Networking.Connectivity.DomainConnectivityLevel
   )
   return Windows.HRESULT is abstract;
   
   function GetNetworkUsageAsync
   (
      This       : access IConnectionProfile2_Interface
      ; startTime : Windows.Foundation.DateTime
      ; endTime : Windows.Foundation.DateTime
      ; granularity : Windows.Networking.Connectivity.DataUsageGranularity
      ; states : Windows.Networking.Connectivity.NetworkUsageStates
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConnectivityIntervalsAsync
   (
      This       : access IConnectionProfile2_Interface
      ; startTime : Windows.Foundation.DateTime
      ; endTime : Windows.Foundation.DateTime
      ; states : Windows.Networking.Connectivity.NetworkUsageStates
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionProfile3 : aliased constant Windows.IID := (1468802344, 19673, 16737, (128, 69, 32, 28, 253, 91, 17, 92 ));
   
   type IConnectionProfile3_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAttributedNetworkUsageAsync
   (
      This       : access IConnectionProfile3_Interface
      ; startTime : Windows.Foundation.DateTime
      ; endTime : Windows.Foundation.DateTime
      ; states : Windows.Networking.Connectivity.NetworkUsageStates
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionProfile4 : aliased constant Windows.IID := (2049786573, 33248, 19174, (171, 237, 171, 156, 161, 62, 183, 20 ));
   
   type IConnectionProfile4_Interface is interface and Windows.IInspectable_Interface;
   
   function GetProviderNetworkUsageAsync
   (
      This       : access IConnectionProfile4_Interface
      ; startTime : Windows.Foundation.DateTime
      ; endTime : Windows.Foundation.DateTime
      ; states : Windows.Networking.Connectivity.NetworkUsageStates
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanIdentifierData : aliased constant Windows.IID := (2806940611, 54841, 17854, (163, 106, 196, 228, 174, 175, 109, 155 ));
   
   type ILanIdentifierData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Type
   (
      This       : access ILanIdentifierData_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access ILanIdentifierData_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ILanIdentifier : aliased constant Windows.IID := (1219122090, 4360, 17734, (166, 203, 154, 116, 218, 75, 123, 160 ));
   
   type ILanIdentifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_InfrastructureId
   (
      This       : access ILanIdentifier_Interface
      ; RetVal : access Windows.Networking.Connectivity.ILanIdentifierData
   )
   return Windows.HRESULT is abstract;
   
   function get_PortId
   (
      This       : access ILanIdentifier_Interface
      ; RetVal : access Windows.Networking.Connectivity.ILanIdentifierData
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkAdapterId
   (
      This       : access ILanIdentifier_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkInformationStatics : aliased constant Windows.IID := (1349843025, 38157, 16741, (156, 21, 54, 86, 25, 72, 30, 234 ));
   
   type INetworkInformationStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetConnectionProfiles
   (
      This       : access INetworkInformationStatics_Interface
      ; RetVal : access Windows.Networking.Connectivity.IVectorView_IConnectionProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetInternetConnectionProfile
   (
      This       : access INetworkInformationStatics_Interface
      ; RetVal : access Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   function GetLanIdentifiers
   (
      This       : access INetworkInformationStatics_Interface
      ; RetVal : access Windows.Networking.Connectivity.IVectorView_ILanIdentifier -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetHostNames
   (
      This       : access INetworkInformationStatics_Interface
      ; RetVal : access Windows.Networking.IVectorView_IHostName -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetProxyConfigurationAsync
   (
      This       : access INetworkInformationStatics_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.Networking.Connectivity.IAsyncOperation_IProxyConfiguration -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetSortedEndpointPairs
   (
      This       : access INetworkInformationStatics_Interface
      ; destinationList : Windows.Networking.IIterable_IEndpointPair
      ; sortOptions : Windows.Networking.HostNameSortOptions
      ; RetVal : access Windows.Networking.IVectorView_IEndpointPair -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_NetworkStatusChanged
   (
      This       : access INetworkInformationStatics_Interface
      ; networkStatusHandler : Windows.Networking.Connectivity.NetworkStatusChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_NetworkStatusChanged
   (
      This       : access INetworkInformationStatics_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionProfileFilter : aliased constant Windows.IID := (541883592, 48429, 20109, (164, 179, 69, 94, 195, 55, 56, 138 ));
   
   type IConnectionProfileFilter_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsConnected
   (
      This       : access IConnectionProfileFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsConnected
   (
      This       : access IConnectionProfileFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsWwanConnectionProfile
   (
      This       : access IConnectionProfileFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsWwanConnectionProfile
   (
      This       : access IConnectionProfileFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsWlanConnectionProfile
   (
      This       : access IConnectionProfileFilter_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsWlanConnectionProfile
   (
      This       : access IConnectionProfileFilter_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_NetworkCostType
   (
      This       : access IConnectionProfileFilter_Interface
      ; value : Windows.Networking.Connectivity.NetworkCostType
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkCostType
   (
      This       : access IConnectionProfileFilter_Interface
      ; RetVal : access Windows.Networking.Connectivity.NetworkCostType
   )
   return Windows.HRESULT is abstract;
   
   function put_ServiceProviderGuid
   (
      This       : access IConnectionProfileFilter_Interface
      ; value : Windows.Foundation.IReference_Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_ServiceProviderGuid
   (
      This       : access IConnectionProfileFilter_Interface
      ; RetVal : access Windows.Foundation.IReference_Guid -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionProfileFilter2 : aliased constant Windows.IID := (3439759073, 50172, 20397, (157, 220, 89, 63, 170, 75, 120, 133 ));
   
   type IConnectionProfileFilter2_Interface is interface and Windows.IInspectable_Interface;
   
   function put_IsRoaming
   (
      This       : access IConnectionProfileFilter2_Interface
      ; value : Windows.Foundation.IReference_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsRoaming
   (
      This       : access IConnectionProfileFilter2_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOverDataLimit
   (
      This       : access IConnectionProfileFilter2_Interface
      ; value : Windows.Foundation.IReference_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOverDataLimit
   (
      This       : access IConnectionProfileFilter2_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IsBackgroundDataUsageRestricted
   (
      This       : access IConnectionProfileFilter2_Interface
      ; value : Windows.Foundation.IReference_Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsBackgroundDataUsageRestricted
   (
      This       : access IConnectionProfileFilter2_Interface
      ; RetVal : access Windows.Foundation.IReference_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RawData
   (
      This       : access IConnectionProfileFilter2_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkInformationStatics2 : aliased constant Windows.IID := (1167912212, 10290, 18870, (186, 110, 226, 101, 240, 71, 134, 168 ));
   
   type INetworkInformationStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function FindConnectionProfilesAsync
   (
      This       : access INetworkInformationStatics2_Interface
      ; pProfileFilter : Windows.Networking.Connectivity.IConnectionProfileFilter
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkItem : aliased constant Windows.IID := (29117753, 62944, 17767, (162, 140, 66, 8, 12, 131, 27, 43 ));
   
   type INetworkItem_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkId
   (
      This       : access INetworkItem_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function GetNetworkTypes
   (
      This       : access INetworkItem_Interface
      ; RetVal : access Windows.Networking.Connectivity.NetworkTypes
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkAdapter : aliased constant Windows.IID := (995372547, 21384, 18796, (168, 163, 175, 253, 57, 174, 194, 230 ));
   
   type INetworkAdapter_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OutboundMaxBitsPerSecond
   (
      This       : access INetworkAdapter_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_InboundMaxBitsPerSecond
   (
      This       : access INetworkAdapter_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_IanaInterfaceType
   (
      This       : access INetworkAdapter_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkItem
   (
      This       : access INetworkAdapter_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkItem
   )
   return Windows.HRESULT is abstract;
   
   function get_NetworkAdapterId
   (
      This       : access INetworkAdapter_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function GetConnectedProfileAsync
   (
      This       : access INetworkAdapter_Interface
      ; RetVal : access Windows.Networking.Connectivity.IAsyncOperation_IConnectionProfile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIPInformation : aliased constant Windows.IID := (3629204960, 5007, 18391, (155, 58, 54, 187, 72, 140, 239, 51 ));
   
   type IIPInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_NetworkAdapter
   (
      This       : access IIPInformation_Interface
      ; RetVal : access Windows.Networking.Connectivity.INetworkAdapter
   )
   return Windows.HRESULT is abstract;
   
   function get_PrefixLength
   (
      This       : access IIPInformation_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt8 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IProxyConfiguration : aliased constant Windows.IID := (4013580468, 36868, 19926, (183, 216, 179, 229, 2, 244, 170, 208 ));
   
   type IProxyConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProxyUris
   (
      This       : access IProxyConfiguration_Interface
      ; RetVal : access Windows.Foundation.IVectorView_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CanConnectDirectly
   (
      This       : access IProxyConfiguration_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectionSession : aliased constant Windows.IID := (4287651148, 63547, 16816, (138, 12, 20, 98, 217, 197, 107, 115 ));
   
   type IConnectionSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConnectionProfile
   (
      This       : access IConnectionSession_Interface
      ; RetVal : access Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRoutePolicy : aliased constant Windows.IID := (296469676, 4039, 17124, (135, 66, 86, 153, 35, 177, 202, 17 ));
   
   type IRoutePolicy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ConnectionProfile
   (
      This       : access IRoutePolicy_Interface
      ; RetVal : access Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_HostName
   (
      This       : access IRoutePolicy_Interface
      ; RetVal : access Windows.Networking.IHostName
   )
   return Windows.HRESULT is abstract;
   
   function get_HostNameType
   (
      This       : access IRoutePolicy_Interface
      ; RetVal : access Windows.Networking.DomainNameType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRoutePolicyFactory : aliased constant Windows.IID := (906131763, 41358, 19893, (166, 151, 245, 143, 167, 54, 78, 68 ));
   
   type IRoutePolicyFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateRoutePolicy
   (
      This       : access IRoutePolicyFactory_Interface
      ; connectionProfile : Windows.Networking.Connectivity.IConnectionProfile
      ; hostName : Windows.Networking.IHostName
      ; type_x : Windows.Networking.DomainNameType
      ; RetVal : access Windows.Networking.Connectivity.IRoutePolicy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICellularApnContext : aliased constant Windows.IID := (1873095156, 61437, 17730, (154, 178, 112, 91, 191, 148, 148, 58 ));
   
   type ICellularApnContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProviderId
   (
      This       : access ICellularApnContext_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ProviderId
   (
      This       : access ICellularApnContext_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessPointName
   (
      This       : access ICellularApnContext_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_AccessPointName
   (
      This       : access ICellularApnContext_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserName
   (
      This       : access ICellularApnContext_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UserName
   (
      This       : access ICellularApnContext_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Password
   (
      This       : access ICellularApnContext_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Password
   (
      This       : access ICellularApnContext_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsCompressionEnabled
   (
      This       : access ICellularApnContext_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsCompressionEnabled
   (
      This       : access ICellularApnContext_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationType
   (
      This       : access ICellularApnContext_Interface
      ; RetVal : access Windows.Networking.Connectivity.CellularApnAuthenticationType
   )
   return Windows.HRESULT is abstract;
   
   function put_AuthenticationType
   (
      This       : access ICellularApnContext_Interface
      ; value : Windows.Networking.Connectivity.CellularApnAuthenticationType
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IConnectivityManagerStatics : aliased constant Windows.IID := (1361106097, 20401, 18608, (175, 201, 66, 224, 9, 42, 129, 100 ));
   
   type IConnectivityManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AcquireConnectionAsync
   (
      This       : access IConnectivityManagerStatics_Interface
      ; cellularApnContext : Windows.Networking.Connectivity.ICellularApnContext
      ; RetVal : access Windows.Networking.Connectivity.IAsyncOperation_IConnectionSession -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AddHttpRoutePolicy
   (
      This       : access IConnectivityManagerStatics_Interface
      ; routePolicy : Windows.Networking.Connectivity.IRoutePolicy
   )
   return Windows.HRESULT is abstract;
   
   function RemoveHttpRoutePolicy
   (
      This       : access IConnectivityManagerStatics_Interface
      ; routePolicy : Windows.Networking.Connectivity.IRoutePolicy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkStateChangeEventDetails : aliased constant Windows.IID := (520942387, 55206, 17629, (164, 233, 104, 124, 71, 107, 144, 61 ));
   
   type INetworkStateChangeEventDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasNewInternetConnectionProfile
   (
      This       : access INetworkStateChangeEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNewConnectionCost
   (
      This       : access INetworkStateChangeEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNewNetworkConnectivityLevel
   (
      This       : access INetworkStateChangeEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNewDomainConnectivityLevel
   (
      This       : access INetworkStateChangeEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNewHostNameList
   (
      This       : access INetworkStateChangeEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNewWwanRegistrationState
   (
      This       : access INetworkStateChangeEventDetails_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_INetworkStateChangeEventDetails2 : aliased constant Windows.IID := (3594764520, 12499, 20330, (173, 71, 106, 24, 115, 206, 179, 193 ));
   
   type INetworkStateChangeEventDetails2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HasNewTetheringOperationalState
   (
      This       : access INetworkStateChangeEventDetails2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNewTetheringClientCount
   (
      This       : access INetworkStateChangeEventDetails2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWwanConnectionProfileDetails : aliased constant Windows.IID := (239970558, 33631, 19955, (130, 253, 223, 85, 110, 188, 9, 239 ));
   
   type IWwanConnectionProfileDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HomeProviderId
   (
      This       : access IWwanConnectionProfileDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AccessPointName
   (
      This       : access IWwanConnectionProfileDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetNetworkRegistrationState
   (
      This       : access IWwanConnectionProfileDetails_Interface
      ; RetVal : access Windows.Networking.Connectivity.WwanNetworkRegistrationState
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentDataClass
   (
      This       : access IWwanConnectionProfileDetails_Interface
      ; RetVal : access Windows.Networking.Connectivity.WwanDataClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IConnectionProfile : aliased constant Windows.IID := (2307995442, 41099, 23730, (175, 22, 187, 187, 34, 35, 131, 158 ));
   
   type IIterator_IConnectionProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IConnectionProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IConnectionProfile_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IConnectionProfile_Interface
      ; items : Windows.Networking.Connectivity.IConnectionProfile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IConnectionProfile : aliased constant Windows.IID := (886750969, 34768, 23324, (167, 172, 157, 41, 10, 222, 176, 200 ));
   
   type IIterable_IConnectionProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.IIterator_IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IConnectionProfile : aliased constant Windows.IID := (1840362642, 14418, 24056, (162, 157, 105, 68, 0, 47, 88, 212 ));
   
   type IVectorView_IConnectionProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IConnectionProfile_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IConnectionProfile_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IConnectionProfile_Interface
      ; value : Windows.Networking.Connectivity.IConnectionProfile
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IConnectionProfile_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Connectivity.IConnectionProfile_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_ILanIdentifier : aliased constant Windows.IID := (744304510, 52892, 21075, (160, 244, 1, 229, 189, 193, 25, 136 ));
   
   type IIterator_ILanIdentifier_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_ILanIdentifier_Interface
      ; RetVal : access Windows.Networking.Connectivity.ILanIdentifier
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_ILanIdentifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_ILanIdentifier_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_ILanIdentifier_Interface
      ; items : Windows.Networking.Connectivity.ILanIdentifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_ILanIdentifier : aliased constant Windows.IID := (2899243981, 23954, 23553, (138, 196, 121, 254, 116, 205, 115, 62 ));
   
   type IIterable_ILanIdentifier_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_ILanIdentifier_Interface
      ; RetVal : access Windows.Networking.Connectivity.IIterator_ILanIdentifier
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_ILanIdentifier : aliased constant Windows.IID := (1093165401, 47389, 22326, (173, 139, 225, 111, 207, 138, 206, 208 ));
   
   type IVectorView_ILanIdentifier_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_ILanIdentifier_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Networking.Connectivity.ILanIdentifier
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_ILanIdentifier_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_ILanIdentifier_Interface
      ; value : Windows.Networking.Connectivity.ILanIdentifier
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_ILanIdentifier_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Networking.Connectivity.ILanIdentifier_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IProxyConfiguration : aliased constant Windows.IID := (511070710, 25954, 22983, (154, 243, 135, 86, 99, 110, 238, 226 ));
   
   type IAsyncOperation_IProxyConfiguration_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IProxyConfiguration_Interface
      ; handler : Windows.Networking.Connectivity.AsyncOperationCompletedHandler_IProxyConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IProxyConfiguration_Interface
      ; RetVal : access Windows.Networking.Connectivity.AsyncOperationCompletedHandler_IProxyConfiguration
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IProxyConfiguration_Interface
      ; RetVal : access Windows.Networking.Connectivity.IProxyConfiguration
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IConnectionProfile : aliased constant Windows.IID := (1542789578, 35547, 23221, (171, 184, 255, 27, 190, 93, 45, 232 ));
   
   type IAsyncOperation_IConnectionProfile_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IConnectionProfile_Interface
      ; handler : Windows.Networking.Connectivity.AsyncOperationCompletedHandler_IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.AsyncOperationCompletedHandler_IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IConnectionProfile_Interface
      ; RetVal : access Windows.Networking.Connectivity.IConnectionProfile
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IConnectionSession : aliased constant Windows.IID := (2499568145, 18178, 23844, (129, 191, 23, 12, 167, 129, 137, 149 ));
   
   type IAsyncOperation_IConnectionSession_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IConnectionSession_Interface
      ; handler : Windows.Networking.Connectivity.AsyncOperationCompletedHandler_IConnectionSession
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IConnectionSession_Interface
      ; RetVal : access Windows.Networking.Connectivity.AsyncOperationCompletedHandler_IConnectionSession
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IConnectionSession_Interface
      ; RetVal : access Windows.Networking.Connectivity.IConnectionSession
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_NetworkStatusChangedEventHandler : aliased constant Windows.IID := (1908020287, 22926, 18896, (132, 235, 143, 235, 174, 220, 193, 149 ));
   
   type NetworkStatusChangedEventHandler_Interface(Callback : access procedure (sender : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_NetworkStatusChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access NetworkStatusChangedEventHandler_Interface
      ; sender : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IProxyConfiguration : aliased constant Windows.IID := (56304999, 61369, 23491, (182, 9, 249, 168, 194, 11, 112, 1 ));
   
   type AsyncOperationCompletedHandler_IProxyConfiguration_Interface(Callback : access procedure (asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IProxyConfiguration ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IProxyConfiguration'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IProxyConfiguration_Interface
      ; asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IProxyConfiguration
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IConnectionProfile : aliased constant Windows.IID := (3840985450, 1393, 23028, (169, 169, 175, 172, 62, 97, 202, 160 ));
   
   type AsyncOperationCompletedHandler_IConnectionProfile_Interface(Callback : access procedure (asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IConnectionProfile ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IConnectionProfile'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IConnectionProfile_Interface
      ; asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IConnectionProfile
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IConnectionSession : aliased constant Windows.IID := (1002864856, 40579, 20614, (143, 73, 122, 41, 191, 177, 199, 225 ));
   
   type AsyncOperationCompletedHandler_IConnectionSession_Interface(Callback : access procedure (asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IConnectionSession ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IConnectionSession'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IConnectionSession_Interface
      ; asyncInfo : Windows.Networking.Connectivity.IAsyncOperation_IConnectionSession
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype IPInformation is Windows.Networking.Connectivity.IIPInformation;
   subtype DataPlanUsage is Windows.Networking.Connectivity.IDataPlanUsage;
   subtype ConnectionCost is Windows.Networking.Connectivity.IConnectionCost;
   subtype DataPlanStatus is Windows.Networking.Connectivity.IDataPlanStatus;
   subtype NetworkAdapter is Windows.Networking.Connectivity.INetworkAdapter;
   subtype DataUsage is Windows.Networking.Connectivity.IDataUsage;
   subtype NetworkSecuritySettings is Windows.Networking.Connectivity.INetworkSecuritySettings;
   subtype WlanConnectionProfileDetails is Windows.Networking.Connectivity.IWlanConnectionProfileDetails;
   subtype NetworkUsage is Windows.Networking.Connectivity.INetworkUsage;
   subtype ConnectivityInterval is Windows.Networking.Connectivity.IConnectivityInterval;
   subtype AttributedNetworkUsage is Windows.Networking.Connectivity.IAttributedNetworkUsage;
   subtype ProviderNetworkUsage is Windows.Networking.Connectivity.IProviderNetworkUsage;
   subtype LanIdentifierData is Windows.Networking.Connectivity.ILanIdentifierData;
   subtype ConnectionProfile is Windows.Networking.Connectivity.IConnectionProfile;
   subtype LanIdentifier is Windows.Networking.Connectivity.ILanIdentifier;
   subtype ProxyConfiguration is Windows.Networking.Connectivity.IProxyConfiguration;
   subtype ConnectionProfileFilter is Windows.Networking.Connectivity.IConnectionProfileFilter;
   function CreateConnectionProfileFilter return Windows.Networking.Connectivity.IConnectionProfileFilter;
   
   subtype NetworkItem is Windows.Networking.Connectivity.INetworkItem;
   subtype RoutePolicy is Windows.Networking.Connectivity.IRoutePolicy;
   function CreateRoutePolicy
   (
      connectionProfile : Windows.Networking.Connectivity.IConnectionProfile
      ; hostName : Windows.Networking.IHostName
      ; type_x : Windows.Networking.DomainNameType
   )
   return Windows.Networking.Connectivity.IRoutePolicy;
   
   subtype CellularApnContext is Windows.Networking.Connectivity.ICellularApnContext;
   function CreateCellularApnContext return Windows.Networking.Connectivity.ICellularApnContext;
   
   subtype ConnectionSession is Windows.Networking.Connectivity.IConnectionSession;
   subtype NetworkStateChangeEventDetails is Windows.Networking.Connectivity.INetworkStateChangeEventDetails;
   subtype WwanConnectionProfileDetails is Windows.Networking.Connectivity.IWwanConnectionProfileDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetConnectionProfiles
   return Windows.Networking.Connectivity.IVectorView_IConnectionProfile;
   
   function GetInternetConnectionProfile
   return Windows.Networking.Connectivity.IConnectionProfile;
   
   function GetLanIdentifiers
   return Windows.Networking.Connectivity.IVectorView_ILanIdentifier;
   
   function GetHostNames
   return Windows.Networking.IVectorView_IHostName;
   
   function GetProxyConfigurationAsync
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Networking.Connectivity.IAsyncOperation_IProxyConfiguration;
   
   function GetSortedEndpointPairs
   (
      destinationList : Windows.Networking.IIterable_IEndpointPair
      ; sortOptions : Windows.Networking.HostNameSortOptions
   )
   return Windows.Networking.IVectorView_IEndpointPair;
   
   function add_NetworkStatusChanged
   (
      networkStatusHandler : Windows.Networking.Connectivity.NetworkStatusChangedEventHandler
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_NetworkStatusChanged
   (
      eventCookie : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   function FindConnectionProfilesAsync
   (
      pProfileFilter : Windows.Networking.Connectivity.IConnectionProfileFilter
   )
   return Windows.Address;
   
   function AcquireConnectionAsync
   (
      cellularApnContext : Windows.Networking.Connectivity.ICellularApnContext
   )
   return Windows.Networking.Connectivity.IAsyncOperation_IConnectionSession;
   
   procedure AddHttpRoutePolicy
   (
      routePolicy : Windows.Networking.Connectivity.IRoutePolicy
   )
   ;
   
   procedure RemoveHttpRoutePolicy
   (
      routePolicy : Windows.Networking.Connectivity.IRoutePolicy
   )
   ;
   
end;
