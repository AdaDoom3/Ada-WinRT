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
with Windows; use Windows;
with Windows.Foundation.Collections;
limited with Windows.System.Diagnostics;
--------------------------------------------------------------------------------
package Windows.Web.Http.Diagnostics is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HttpDiagnosticRequestInitiator is (
      ParsedElement,
      Script,
      Image,
      Link,
      Style,
      XmlHttpRequest,
      Media,
      HtmlDownload,
      Prefetch,
      Other,
      CrossOriginPreFlight,
      Fetch,
      Beacon
   );
   for HttpDiagnosticRequestInitiator use (
      ParsedElement => 0,
      Script => 1,
      Image => 2,
      Link => 3,
      Style => 4,
      XmlHttpRequest => 5,
      Media => 6,
      HtmlDownload => 7,
      Prefetch => 8,
      Other => 9,
      CrossOriginPreFlight => 10,
      Fetch => 11,
      Beacon => 12
   );
   for HttpDiagnosticRequestInitiator'Size use 32;
   
   type HttpDiagnosticRequestInitiator_Ptr is access HttpDiagnosticRequestInitiator;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type HttpDiagnosticsContract is null record;
   pragma Convention (C_Pass_By_Copy , HttpDiagnosticsContract);
   
   type HttpDiagnosticsContract_Ptr is access HttpDiagnosticsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Interface;
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent is access all TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Interface'Class;
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Ptr is access all TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent;
   type TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Interface;
   type TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived is access all TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Interface'Class;
   type TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Ptr is access all TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived;
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Interface;
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted is access all TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Interface'Class;
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Ptr is access all TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHttpDiagnosticSourceLocation_Interface;
   type IHttpDiagnosticSourceLocation is access all IHttpDiagnosticSourceLocation_Interface'Class;
   type IHttpDiagnosticSourceLocation_Ptr is access all IHttpDiagnosticSourceLocation;
   type IHttpDiagnosticProviderRequestSentEventArgs_Interface;
   type IHttpDiagnosticProviderRequestSentEventArgs is access all IHttpDiagnosticProviderRequestSentEventArgs_Interface'Class;
   type IHttpDiagnosticProviderRequestSentEventArgs_Ptr is access all IHttpDiagnosticProviderRequestSentEventArgs;
   type IHttpDiagnosticProviderResponseReceivedEventArgs_Interface;
   type IHttpDiagnosticProviderResponseReceivedEventArgs is access all IHttpDiagnosticProviderResponseReceivedEventArgs_Interface'Class;
   type IHttpDiagnosticProviderResponseReceivedEventArgs_Ptr is access all IHttpDiagnosticProviderResponseReceivedEventArgs;
   type IHttpDiagnosticProviderRequestResponseTimestamps_Interface;
   type IHttpDiagnosticProviderRequestResponseTimestamps is access all IHttpDiagnosticProviderRequestResponseTimestamps_Interface'Class;
   type IHttpDiagnosticProviderRequestResponseTimestamps_Ptr is access all IHttpDiagnosticProviderRequestResponseTimestamps;
   type IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface;
   type IHttpDiagnosticProviderRequestResponseCompletedEventArgs is access all IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface'Class;
   type IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Ptr is access all IHttpDiagnosticProviderRequestResponseCompletedEventArgs;
   type IHttpDiagnosticProviderStatics_Interface;
   type IHttpDiagnosticProviderStatics is access all IHttpDiagnosticProviderStatics_Interface'Class;
   type IHttpDiagnosticProviderStatics_Ptr is access all IHttpDiagnosticProviderStatics;
   type IHttpDiagnosticProvider_Interface;
   type IHttpDiagnosticProvider is access all IHttpDiagnosticProvider_Interface'Class;
   type IHttpDiagnosticProvider_Ptr is access all IHttpDiagnosticProvider;
   type IIterator_IHttpDiagnosticSourceLocation_Interface;
   type IIterator_IHttpDiagnosticSourceLocation is access all IIterator_IHttpDiagnosticSourceLocation_Interface'Class;
   type IIterator_IHttpDiagnosticSourceLocation_Ptr is access all IIterator_IHttpDiagnosticSourceLocation;
   type IIterable_IHttpDiagnosticSourceLocation_Interface;
   type IIterable_IHttpDiagnosticSourceLocation is access all IIterable_IHttpDiagnosticSourceLocation_Interface'Class;
   type IIterable_IHttpDiagnosticSourceLocation_Ptr is access all IIterable_IHttpDiagnosticSourceLocation;
   type IVectorView_IHttpDiagnosticSourceLocation_Interface;
   type IVectorView_IHttpDiagnosticSourceLocation is access all IVectorView_IHttpDiagnosticSourceLocation_Interface'Class;
   type IVectorView_IHttpDiagnosticSourceLocation_Ptr is access all IVectorView_IHttpDiagnosticSourceLocation;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IHttpDiagnosticSourceLocation : aliased constant Windows.IID := (1420415584, 34912, 16959, (182, 250, 215, 119, 22, 246, 71, 167 ));
   
   type IHttpDiagnosticSourceLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SourceUri
   (
      This       : access IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_LineNumber
   (
      This       : access IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function get_ColumnNumber
   (
      This       : access IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDiagnosticProviderRequestSentEventArgs : aliased constant Windows.IID := (1062311632, 19487, 20158, (165, 122, 6, 147, 7, 113, 197, 13 ));
   
   type IHttpDiagnosticProviderRequestSentEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IHttpDiagnosticProviderRequestSentEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivityId
   (
      This       : access IHttpDiagnosticProviderRequestSentEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IHttpDiagnosticProviderRequestSentEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpRequestMessage
   )
   return Windows.HRESULT is abstract;
   
   function get_ProcessId
   (
      This       : access IHttpDiagnosticProviderRequestSentEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ThreadId
   (
      This       : access IHttpDiagnosticProviderRequestSentEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Initiator
   (
      This       : access IHttpDiagnosticProviderRequestSentEventArgs_Interface
      ; RetVal : access Windows.Web.Http.Diagnostics.HttpDiagnosticRequestInitiator
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceLocations
   (
      This       : access IHttpDiagnosticProviderRequestSentEventArgs_Interface
      ; RetVal : access Windows.Web.Http.Diagnostics.IVectorView_IHttpDiagnosticSourceLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDiagnosticProviderResponseReceivedEventArgs : aliased constant Windows.IID := (2694993516, 43871, 19814, (187, 45, 8, 76, 244, 22, 53, 208 ));
   
   type IHttpDiagnosticProviderResponseReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Timestamp
   (
      This       : access IHttpDiagnosticProviderResponseReceivedEventArgs_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivityId
   (
      This       : access IHttpDiagnosticProviderResponseReceivedEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Message
   (
      This       : access IHttpDiagnosticProviderResponseReceivedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.IHttpResponseMessage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDiagnosticProviderRequestResponseTimestamps : aliased constant Windows.IID := (3769622032, 21967, 19457, (145, 212, 162, 5, 87, 216, 73, 240 ));
   
   type IHttpDiagnosticProviderRequestResponseTimestamps_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CacheCheckedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionInitiatedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_NameResolvedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SslNegotiatedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionCompletedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestSentTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestCompletedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseReceivedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ResponseCompletedTimestamp
   (
      This       : access IHttpDiagnosticProviderRequestResponseTimestamps_Interface
      ; RetVal : access Windows.Foundation.IReference_DateTime -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDiagnosticProviderRequestResponseCompletedEventArgs : aliased constant Windows.IID := (1935644910, 38134, 17714, (178, 110, 97, 225, 177, 228, 239, 212 ));
   
   type IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ActivityId
   (
      This       : access IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamps
   (
      This       : access IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseTimestamps
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedUri
   (
      This       : access IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ProcessId
   (
      This       : access IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ThreadId
   (
      This       : access IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Initiator
   (
      This       : access IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.Diagnostics.HttpDiagnosticRequestInitiator
   )
   return Windows.HRESULT is abstract;
   
   function get_SourceLocations
   (
      This       : access IHttpDiagnosticProviderRequestResponseCompletedEventArgs_Interface
      ; RetVal : access Windows.Web.Http.Diagnostics.IVectorView_IHttpDiagnosticSourceLocation -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDiagnosticProviderStatics : aliased constant Windows.IID := (1535266497, 27244, 18380, (175, 236, 30, 134, 188, 38, 5, 59 ));
   
   type IHttpDiagnosticProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateFromProcessDiagnosticInfo
   (
      This       : access IHttpDiagnosticProviderStatics_Interface
      ; processDiagnosticInfo : Windows.System.Diagnostics.IProcessDiagnosticInfo
      ; RetVal : access Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHttpDiagnosticProvider : aliased constant Windows.IID := (3179353345, 41046, 19769, (177, 116, 131, 59, 123, 3, 176, 44 ));
   
   type IHttpDiagnosticProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function Start
   (
      This       : access IHttpDiagnosticProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Stop
   (
      This       : access IHttpDiagnosticProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_RequestSent
   (
      This       : access IHttpDiagnosticProvider_Interface
      ; handler : TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RequestSent
   (
      This       : access IHttpDiagnosticProvider_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_ResponseReceived
   (
      This       : access IHttpDiagnosticProvider_Interface
      ; handler : TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ResponseReceived
   (
      This       : access IHttpDiagnosticProvider_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_RequestResponseCompleted
   (
      This       : access IHttpDiagnosticProvider_Interface
      ; handler : TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RequestResponseCompleted
   (
      This       : access IHttpDiagnosticProvider_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IHttpDiagnosticSourceLocation : aliased constant Windows.IID := (2155572948, 24386, 20889, (178, 49, 96, 204, 226, 199, 105, 64 ));
   
   type IIterator_IHttpDiagnosticSourceLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.Web.Http.Diagnostics.IHttpDiagnosticSourceLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHttpDiagnosticSourceLocation_Interface
      ; items : Windows.Web.Http.Diagnostics.IHttpDiagnosticSourceLocation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IHttpDiagnosticSourceLocation : aliased constant Windows.IID := (1116129818, 42181, 23272, (157, 169, 91, 250, 36, 118, 142, 34 ));
   
   type IIterable_IHttpDiagnosticSourceLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.Web.Http.Diagnostics.IIterator_IHttpDiagnosticSourceLocation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IHttpDiagnosticSourceLocation : aliased constant Windows.IID := (3920570323, 33000, 23295, (167, 229, 27, 34, 23, 135, 240, 150 ));
   
   type IVectorView_IHttpDiagnosticSourceLocation_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHttpDiagnosticSourceLocation_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Web.Http.Diagnostics.IHttpDiagnosticSourceLocation
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHttpDiagnosticSourceLocation_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHttpDiagnosticSourceLocation_Interface
      ; value : Windows.Web.Http.Diagnostics.IHttpDiagnosticSourceLocation
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHttpDiagnosticSourceLocation_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Web.Http.Diagnostics.IHttpDiagnosticSourceLocation_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent : aliased constant Windows.IID := (4175495969, 18365, 21098, (169, 178, 59, 241, 47, 114, 95, 139 ));
   
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Interface(Callback : access procedure (sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestSentEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestSentEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived : aliased constant Windows.IID := (787421254, 33142, 21167, (141, 43, 224, 201, 50, 81, 46, 159 ));
   
   type TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Interface(Callback : access procedure (sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderResponseReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderResponseReceivedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted : aliased constant Windows.IID := (578923811, 40077, 23938, (155, 32, 188, 241, 87, 176, 79, 217 ));
   
   type TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Interface(Callback : access procedure (sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HttpDiagnosticSourceLocation is Windows.Web.Http.Diagnostics.IHttpDiagnosticSourceLocation;
   subtype HttpDiagnosticProviderRequestSentEventArgs is Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestSentEventArgs;
   subtype HttpDiagnosticProviderResponseReceivedEventArgs is Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderResponseReceivedEventArgs;
   subtype HttpDiagnosticProviderRequestResponseTimestamps is Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseTimestamps;
   subtype HttpDiagnosticProviderRequestResponseCompletedEventArgs is Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseCompletedEventArgs;
   subtype HttpDiagnosticProvider is Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function CreateFromProcessDiagnosticInfo
   (
      processDiagnosticInfo : Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider;
   
end;
