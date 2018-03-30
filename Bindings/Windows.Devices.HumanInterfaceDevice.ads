--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Storage;
with Windows.Foundation.Collections;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.HumanInterfaceDevice is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type HidReportType is (
      Input,
      Output,
      Feature
   );
   for HidReportType use (
      Input => 0,
      Output => 1,
      Feature => 2
   );
   for HidReportType'Size use 32;
   
   type HidReportType_Ptr is access HidReportType;
   
   type HidCollectionType is (
      Physical,
      Application,
      Logical,
      Report,
      NamedArray,
      UsageSwitch,
      UsageModifier,
      Other
   );
   for HidCollectionType use (
      Physical => 0,
      Application => 1,
      Logical => 2,
      Report => 3,
      NamedArray => 4,
      UsageSwitch => 5,
      UsageModifier => 6,
      Other => 7
   );
   for HidCollectionType'Size use 32;
   
   type HidCollectionType_Ptr is access HidCollectionType;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IHidDevice_Interface;
   type AsyncOperationCompletedHandler_IHidDevice is access all AsyncOperationCompletedHandler_IHidDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IHidDevice_Ptr is access all AsyncOperationCompletedHandler_IHidDevice;
   type AsyncOperationCompletedHandler_IHidInputReport_Interface;
   type AsyncOperationCompletedHandler_IHidInputReport is access all AsyncOperationCompletedHandler_IHidInputReport_Interface'Class;
   type AsyncOperationCompletedHandler_IHidInputReport_Ptr is access all AsyncOperationCompletedHandler_IHidInputReport;
   type AsyncOperationCompletedHandler_IHidFeatureReport_Interface;
   type AsyncOperationCompletedHandler_IHidFeatureReport is access all AsyncOperationCompletedHandler_IHidFeatureReport_Interface'Class;
   type AsyncOperationCompletedHandler_IHidFeatureReport_Ptr is access all AsyncOperationCompletedHandler_IHidFeatureReport;
   type TypedEventHandler_IHidDevice_add_InputReportReceived_Interface;
   type TypedEventHandler_IHidDevice_add_InputReportReceived is access all TypedEventHandler_IHidDevice_add_InputReportReceived_Interface'Class;
   type TypedEventHandler_IHidDevice_add_InputReportReceived_Ptr is access all TypedEventHandler_IHidDevice_add_InputReportReceived;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHidDeviceStatics_Interface;
   type IHidDeviceStatics is access all IHidDeviceStatics_Interface'Class;
   type IHidDeviceStatics_Ptr is access all IHidDeviceStatics;
   type IHidDevice_Interface;
   type IHidDevice is access all IHidDevice_Interface'Class;
   type IHidDevice_Ptr is access all IHidDevice;
   type IHidBooleanControlDescription_Interface;
   type IHidBooleanControlDescription is access all IHidBooleanControlDescription_Interface'Class;
   type IHidBooleanControlDescription_Ptr is access all IHidBooleanControlDescription;
   type IHidBooleanControlDescription2_Interface;
   type IHidBooleanControlDescription2 is access all IHidBooleanControlDescription2_Interface'Class;
   type IHidBooleanControlDescription2_Ptr is access all IHidBooleanControlDescription2;
   type IHidNumericControlDescription_Interface;
   type IHidNumericControlDescription is access all IHidNumericControlDescription_Interface'Class;
   type IHidNumericControlDescription_Ptr is access all IHidNumericControlDescription;
   type IHidCollection_Interface;
   type IHidCollection is access all IHidCollection_Interface'Class;
   type IHidCollection_Ptr is access all IHidCollection;
   type IHidInputReport_Interface;
   type IHidInputReport is access all IHidInputReport_Interface'Class;
   type IHidInputReport_Ptr is access all IHidInputReport;
   type IHidOutputReport_Interface;
   type IHidOutputReport is access all IHidOutputReport_Interface'Class;
   type IHidOutputReport_Ptr is access all IHidOutputReport;
   type IHidFeatureReport_Interface;
   type IHidFeatureReport is access all IHidFeatureReport_Interface'Class;
   type IHidFeatureReport_Ptr is access all IHidFeatureReport;
   type IHidInputReportReceivedEventArgs_Interface;
   type IHidInputReportReceivedEventArgs is access all IHidInputReportReceivedEventArgs_Interface'Class;
   type IHidInputReportReceivedEventArgs_Ptr is access all IHidInputReportReceivedEventArgs;
   type IHidBooleanControl_Interface;
   type IHidBooleanControl is access all IHidBooleanControl_Interface'Class;
   type IHidBooleanControl_Ptr is access all IHidBooleanControl;
   type IHidNumericControl_Interface;
   type IHidNumericControl is access all IHidNumericControl_Interface'Class;
   type IHidNumericControl_Ptr is access all IHidNumericControl;
   type IAsyncOperation_IHidDevice_Interface;
   type IAsyncOperation_IHidDevice is access all IAsyncOperation_IHidDevice_Interface'Class;
   type IAsyncOperation_IHidDevice_Ptr is access all IAsyncOperation_IHidDevice;
   type IAsyncOperation_IHidInputReport_Interface;
   type IAsyncOperation_IHidInputReport is access all IAsyncOperation_IHidInputReport_Interface'Class;
   type IAsyncOperation_IHidInputReport_Ptr is access all IAsyncOperation_IHidInputReport;
   type IAsyncOperation_IHidFeatureReport_Interface;
   type IAsyncOperation_IHidFeatureReport is access all IAsyncOperation_IHidFeatureReport_Interface'Class;
   type IAsyncOperation_IHidFeatureReport_Ptr is access all IAsyncOperation_IHidFeatureReport;
   type IIterator_IHidBooleanControlDescription_Interface;
   type IIterator_IHidBooleanControlDescription is access all IIterator_IHidBooleanControlDescription_Interface'Class;
   type IIterator_IHidBooleanControlDescription_Ptr is access all IIterator_IHidBooleanControlDescription;
   type IIterable_IHidBooleanControlDescription_Interface;
   type IIterable_IHidBooleanControlDescription is access all IIterable_IHidBooleanControlDescription_Interface'Class;
   type IIterable_IHidBooleanControlDescription_Ptr is access all IIterable_IHidBooleanControlDescription;
   type IVectorView_IHidBooleanControlDescription_Interface;
   type IVectorView_IHidBooleanControlDescription is access all IVectorView_IHidBooleanControlDescription_Interface'Class;
   type IVectorView_IHidBooleanControlDescription_Ptr is access all IVectorView_IHidBooleanControlDescription;
   type IIterator_IHidNumericControlDescription_Interface;
   type IIterator_IHidNumericControlDescription is access all IIterator_IHidNumericControlDescription_Interface'Class;
   type IIterator_IHidNumericControlDescription_Ptr is access all IIterator_IHidNumericControlDescription;
   type IIterable_IHidNumericControlDescription_Interface;
   type IIterable_IHidNumericControlDescription is access all IIterable_IHidNumericControlDescription_Interface'Class;
   type IIterable_IHidNumericControlDescription_Ptr is access all IIterable_IHidNumericControlDescription;
   type IVectorView_IHidNumericControlDescription_Interface;
   type IVectorView_IHidNumericControlDescription is access all IVectorView_IHidNumericControlDescription_Interface'Class;
   type IVectorView_IHidNumericControlDescription_Ptr is access all IVectorView_IHidNumericControlDescription;
   type IIterator_IHidCollection_Interface;
   type IIterator_IHidCollection is access all IIterator_IHidCollection_Interface'Class;
   type IIterator_IHidCollection_Ptr is access all IIterator_IHidCollection;
   type IIterable_IHidCollection_Interface;
   type IIterable_IHidCollection is access all IIterable_IHidCollection_Interface'Class;
   type IIterable_IHidCollection_Ptr is access all IIterable_IHidCollection;
   type IVectorView_IHidCollection_Interface;
   type IVectorView_IHidCollection is access all IVectorView_IHidCollection_Interface'Class;
   type IVectorView_IHidCollection_Ptr is access all IVectorView_IHidCollection;
   type IIterator_IHidBooleanControl_Interface;
   type IIterator_IHidBooleanControl is access all IIterator_IHidBooleanControl_Interface'Class;
   type IIterator_IHidBooleanControl_Ptr is access all IIterator_IHidBooleanControl;
   type IIterable_IHidBooleanControl_Interface;
   type IIterable_IHidBooleanControl is access all IIterable_IHidBooleanControl_Interface'Class;
   type IIterable_IHidBooleanControl_Ptr is access all IIterable_IHidBooleanControl;
   type IVectorView_IHidBooleanControl_Interface;
   type IVectorView_IHidBooleanControl is access all IVectorView_IHidBooleanControl_Interface'Class;
   type IVectorView_IHidBooleanControl_Ptr is access all IVectorView_IHidBooleanControl;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IHidDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IHidDeviceStatics_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelectorVidPid
   (
      This       : access IHidDeviceStatics_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; vendorId : Windows.UInt16
      ; productId : Windows.UInt16
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IHidDeviceStatics_Interface
      ; deviceId : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidDeviceStatics : aliased constant Windows.IID := (2656666084, 38998, 16780, (159, 115, 119, 222, 12, 216, 87, 84 ));
   
   ------------------------------------------------------------------------
   type IHidDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VendorId
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_ProductId
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Version
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsagePage
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsageId
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function GetInputReportAsync
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidInputReport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetInputReportByIdAsync
   (
      This       : access IHidDevice_Interface
      ; reportId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidInputReport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFeatureReportAsync
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidFeatureReport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetFeatureReportByIdAsync
   (
      This       : access IHidDevice_Interface
      ; reportId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidFeatureReport -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateOutputReport
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidOutputReport
   )
   return Windows.HRESULT is abstract;
   
   function CreateOutputReportById
   (
      This       : access IHidDevice_Interface
      ; reportId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidOutputReport
   )
   return Windows.HRESULT is abstract;
   
   function CreateFeatureReport
   (
      This       : access IHidDevice_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
   )
   return Windows.HRESULT is abstract;
   
   function CreateFeatureReportById
   (
      This       : access IHidDevice_Interface
      ; reportId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
   )
   return Windows.HRESULT is abstract;
   
   function SendOutputReportAsync
   (
      This       : access IHidDevice_Interface
      ; outputReport : Windows.Devices.HumanInterfaceDevice.IHidOutputReport
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SendFeatureReportAsync
   (
      This       : access IHidDevice_Interface
      ; featureReport : Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
      ; RetVal : access Windows.Foundation.IAsyncOperation_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControlDescriptions
   (
      This       : access IHidDevice_Interface
      ; reportType : Windows.Devices.HumanInterfaceDevice.HidReportType
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidBooleanControlDescription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControlDescriptions
   (
      This       : access IHidDevice_Interface
      ; reportType : Windows.Devices.HumanInterfaceDevice.HidReportType
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidNumericControlDescription -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_InputReportReceived
   (
      This       : access IHidDevice_Interface
      ; reportHandler : TypedEventHandler_IHidDevice_add_InputReportReceived
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_InputReportReceived
   (
      This       : access IHidDevice_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidDevice : aliased constant Windows.IID := (1602884839, 8704, 17198, (149, 218, 208, 155, 135, 213, 116, 168 ));
   
   ------------------------------------------------------------------------
   type IHidBooleanControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportId
   (
      This       : access IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportType
   (
      This       : access IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.HidReportType
   )
   return Windows.HRESULT is abstract;
   
   function get_UsagePage
   (
      This       : access IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsageId
   (
      This       : access IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentCollections
   (
      This       : access IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidCollection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidBooleanControlDescription : aliased constant Windows.IID := (1637279043, 10712, 18986, (134, 131, 132, 158, 32, 123, 190, 49 ));
   
   ------------------------------------------------------------------------
   type IHidBooleanControlDescription2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsAbsolute
   (
      This       : access IHidBooleanControlDescription2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidBooleanControlDescription2 : aliased constant Windows.IID := (3371094762, 35447, 19510, (170, 0, 95, 240, 68, 157, 62, 115 ));
   
   ------------------------------------------------------------------------
   type IHidNumericControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportId
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportType
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.HidReportType
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportSize
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ReportCount
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsagePage
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsageId
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_LogicalMinimum
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_LogicalMaximum
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalMinimum
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalMaximum
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function get_UnitExponent
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Unit
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsAbsolute
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_HasNull
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ParentCollections
   (
      This       : access IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidCollection -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidNumericControlDescription : aliased constant Windows.IID := (1670209158, 7575, 19573, (146, 127, 95, 245, 139, 160, 94, 50 ));
   
   ------------------------------------------------------------------------
   type IHidCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidCollection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Type
   (
      This       : access IHidCollection_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.HidCollectionType
   )
   return Windows.HRESULT is abstract;
   
   function get_UsagePage
   (
      This       : access IHidCollection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsageId
   (
      This       : access IHidCollection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidCollection : aliased constant Windows.IID := (1904866723, 13041, 18147, (190, 253, 68, 210, 102, 59, 126, 106 ));
   
   ------------------------------------------------------------------------
   type IHidInputReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidInputReport_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IHidInputReport_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_ActivatedBooleanControls
   (
      This       : access IHidInputReport_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidBooleanControl -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TransitionedBooleanControls
   (
      This       : access IHidInputReport_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IVectorView_IHidBooleanControl -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControl
   (
      This       : access IHidInputReport_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControlByDescription
   (
      This       : access IHidInputReport_Interface
      ; controlDescription : Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControl
   (
      This       : access IHidInputReport_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControl
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControlByDescription
   (
      This       : access IHidInputReport_Interface
      ; controlDescription : Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControl
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidInputReport : aliased constant Windows.IID := (3277655632, 63463, 20109, (178, 62, 202, 187, 229, 107, 144, 233 ));
   
   ------------------------------------------------------------------------
   type IHidOutputReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidOutputReport_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IHidOutputReport_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IHidOutputReport_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControl
   (
      This       : access IHidOutputReport_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControlByDescription
   (
      This       : access IHidOutputReport_Interface
      ; controlDescription : Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControl
   (
      This       : access IHidOutputReport_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControl
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControlByDescription
   (
      This       : access IHidOutputReport_Interface
      ; controlDescription : Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControl
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidOutputReport : aliased constant Windows.IID := (1657480516, 51350, 17507, (147, 193, 223, 157, 176, 83, 196, 80 ));
   
   ------------------------------------------------------------------------
   type IHidFeatureReport_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidFeatureReport_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IHidFeatureReport_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IHidFeatureReport_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControl
   (
      This       : access IHidFeatureReport_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function GetBooleanControlByDescription
   (
      This       : access IHidFeatureReport_Interface
      ; controlDescription : Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControl
   (
      This       : access IHidFeatureReport_Interface
      ; usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControl
   )
   return Windows.HRESULT is abstract;
   
   function GetNumericControlByDescription
   (
      This       : access IHidFeatureReport_Interface
      ; controlDescription : Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControl
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidFeatureReport : aliased constant Windows.IID := (2216532857, 23269, 18147, (130, 239, 31, 236, 92, 137, 66, 244 ));
   
   ------------------------------------------------------------------------
   type IHidInputReportReceivedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Report
   (
      This       : access IHidInputReportReceivedEventArgs_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidInputReport
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidInputReportReceivedEventArgs : aliased constant Windows.IID := (1884931531, 22962, 19906, (152, 92, 10, 220, 97, 54, 250, 45 ));
   
   ------------------------------------------------------------------------
   type IHidBooleanControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidBooleanControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsagePage
   (
      This       : access IHidBooleanControl_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsageId
   (
      This       : access IHidBooleanControl_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access IHidBooleanControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsActive
   (
      This       : access IHidBooleanControl_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlDescription
   (
      This       : access IHidBooleanControl_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidBooleanControl : aliased constant Windows.IID := (1380840586, 13973, 16524, (187, 162, 226, 235, 90, 191, 188, 32 ));
   
   ------------------------------------------------------------------------
   type IHidNumericControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IHidNumericControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_IsGrouped
   (
      This       : access IHidNumericControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_UsagePage
   (
      This       : access IHidNumericControl_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_UsageId
   (
      This       : access IHidNumericControl_Interface
      ; RetVal : access Windows.UInt16
   )
   return Windows.HRESULT is abstract;
   
   function get_Value
   (
      This       : access IHidNumericControl_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function put_Value
   (
      This       : access IHidNumericControl_Interface
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_ScaledValue
   (
      This       : access IHidNumericControl_Interface
      ; RetVal : access Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function put_ScaledValue
   (
      This       : access IHidNumericControl_Interface
      ; value : Windows.Int64
   )
   return Windows.HRESULT is abstract;
   
   function get_ControlDescription
   (
      This       : access IHidNumericControl_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
   )
   return Windows.HRESULT is abstract;
   
   IID_IHidNumericControl : aliased constant Windows.IID := (3817476773, 13735, 19317, (137, 200, 251, 31, 40, 177, 8, 35 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IHidDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IHidDevice_Interface
      ; handler : Windows.Devices.HumanInterfaceDevice.AsyncOperationCompletedHandler_IHidDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IHidDevice_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.AsyncOperationCompletedHandler_IHidDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IHidDevice_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IHidDevice : aliased constant Windows.IID := (2808762303, 20855, 21078, (132, 168, 179, 26, 141, 207, 16, 72 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IHidInputReport_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IHidInputReport_Interface
      ; handler : Windows.Devices.HumanInterfaceDevice.AsyncOperationCompletedHandler_IHidInputReport
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IHidInputReport_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.AsyncOperationCompletedHandler_IHidInputReport
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IHidInputReport_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidInputReport
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IHidInputReport : aliased constant Windows.IID := (3017967895, 52552, 22451, (160, 177, 50, 20, 50, 232, 91, 214 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IHidFeatureReport_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IHidFeatureReport_Interface
      ; handler : Windows.Devices.HumanInterfaceDevice.AsyncOperationCompletedHandler_IHidFeatureReport
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IHidFeatureReport_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.AsyncOperationCompletedHandler_IHidFeatureReport
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IHidFeatureReport_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IHidFeatureReport : aliased constant Windows.IID := (3610228473, 17142, 24389, (191, 227, 41, 175, 36, 124, 46, 133 ));
   
   ------------------------------------------------------------------------
   type IIterator_IHidBooleanControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHidBooleanControlDescription_Interface
      ; items : Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IHidBooleanControlDescription : aliased constant Windows.IID := (540148656, 47092, 21549, (176, 208, 156, 170, 31, 181, 93, 127 ));
   
   ------------------------------------------------------------------------
   type IIterable_IHidBooleanControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IIterator_IHidBooleanControlDescription
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IHidBooleanControlDescription : aliased constant Windows.IID := (3506376685, 41302, 22719, (148, 17, 87, 119, 223, 157, 87, 191 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IHidBooleanControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHidBooleanControlDescription_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHidBooleanControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHidBooleanControlDescription_Interface
      ; value : Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHidBooleanControlDescription_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IHidBooleanControlDescription : aliased constant Windows.IID := (2864129926, 60468, 21359, (167, 197, 39, 57, 71, 83, 223, 44 ));
   
   ------------------------------------------------------------------------
   type IIterator_IHidNumericControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHidNumericControlDescription_Interface
      ; items : Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IHidNumericControlDescription : aliased constant Windows.IID := (1387905902, 32149, 23836, (172, 171, 35, 193, 158, 167, 111, 1 ));
   
   ------------------------------------------------------------------------
   type IIterable_IHidNumericControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHidNumericControlDescription_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IIterator_IHidNumericControlDescription
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IHidNumericControlDescription : aliased constant Windows.IID := (2257520141, 57556, 22299, (178, 247, 67, 29, 105, 132, 165, 19 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IHidNumericControlDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHidNumericControlDescription_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHidNumericControlDescription_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHidNumericControlDescription_Interface
      ; value : Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHidNumericControlDescription_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IHidNumericControlDescription : aliased constant Windows.IID := (3761022572, 24842, 20916, (174, 249, 55, 7, 182, 151, 185, 133 ));
   
   ------------------------------------------------------------------------
   type IIterator_IHidCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHidCollection_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHidCollection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHidCollection_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHidCollection_Interface
      ; items : Windows.Devices.HumanInterfaceDevice.IHidCollection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IHidCollection : aliased constant Windows.IID := (3472682608, 51199, 22465, (166, 117, 160, 223, 137, 118, 169, 136 ));
   
   ------------------------------------------------------------------------
   type IIterable_IHidCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHidCollection_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IIterator_IHidCollection
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IHidCollection : aliased constant Windows.IID := (3152730639, 28815, 23390, (160, 23, 92, 100, 255, 185, 107, 105 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IHidCollection_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHidCollection_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidCollection
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHidCollection_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHidCollection_Interface
      ; value : Windows.Devices.HumanInterfaceDevice.IHidCollection
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHidCollection_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.HumanInterfaceDevice.IHidCollection_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IHidCollection : aliased constant Windows.IID := (2532440748, 13455, 23439, (167, 29, 45, 101, 14, 11, 17, 242 ));
   
   ------------------------------------------------------------------------
   type IIterator_IHidBooleanControl_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IHidBooleanControl_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IHidBooleanControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IHidBooleanControl_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IHidBooleanControl_Interface
      ; items : Windows.Devices.HumanInterfaceDevice.IHidBooleanControl_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IHidBooleanControl : aliased constant Windows.IID := (1558068259, 53332, 21462, (171, 241, 65, 231, 51, 121, 180, 114 ));
   
   ------------------------------------------------------------------------
   type IIterable_IHidBooleanControl_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IHidBooleanControl_Interface
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IIterator_IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IHidBooleanControl : aliased constant Windows.IID := (286385541, 23216, 23851, (138, 237, 182, 214, 24, 109, 28, 63 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IHidBooleanControl_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IHidBooleanControl_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IHidBooleanControl_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IHidBooleanControl_Interface
      ; value : Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IHidBooleanControl_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Devices.HumanInterfaceDevice.IHidBooleanControl_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IHidBooleanControl : aliased constant Windows.IID := (239173036, 22810, 24032, (175, 214, 11, 44, 4, 195, 4, 231 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IHidDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IHidDevice_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IHidDevice_Interface
      ; asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IHidDevice : aliased constant Windows.IID := (2968052041, 3254, 21927, (188, 193, 217, 150, 50, 77, 101, 196 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IHidInputReport_Interface(Callback : access procedure (asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidInputReport ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IHidInputReport_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IHidInputReport_Interface
      ; asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidInputReport
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IHidInputReport : aliased constant Windows.IID := (29898608, 939, 21878, (152, 180, 141, 117, 206, 26, 152, 133 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IHidFeatureReport_Interface(Callback : access procedure (asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidFeatureReport ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IHidFeatureReport_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IHidFeatureReport_Interface
      ; asyncInfo : Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidFeatureReport
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IHidFeatureReport : aliased constant Windows.IID := (3680777557, 15638, 22526, (183, 239, 43, 219, 215, 25, 253, 191 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IHidDevice_add_InputReportReceived_Interface(Callback : access procedure (sender : Windows.Devices.HumanInterfaceDevice.IHidDevice ; args : Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IHidDevice_add_InputReportReceived_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHidDevice_add_InputReportReceived_Interface
      ; sender : Windows.Devices.HumanInterfaceDevice.IHidDevice
      ; args : Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IHidDevice_add_InputReportReceived : aliased constant Windows.IID := (837244872, 36714, 21515, (147, 139, 171, 167, 155, 111, 3, 236 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HidDevice is Windows.Devices.HumanInterfaceDevice.IHidDevice;
   subtype HidInputReport is Windows.Devices.HumanInterfaceDevice.IHidInputReport;
   subtype HidFeatureReport is Windows.Devices.HumanInterfaceDevice.IHidFeatureReport;
   subtype HidOutputReport is Windows.Devices.HumanInterfaceDevice.IHidOutputReport;
   subtype HidBooleanControlDescription is Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription;
   subtype HidNumericControlDescription is Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription;
   subtype HidInputReportReceivedEventArgs is Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs;
   subtype HidCollection is Windows.Devices.HumanInterfaceDevice.IHidCollection;
   subtype HidBooleanControl is Windows.Devices.HumanInterfaceDevice.IHidBooleanControl;
   subtype HidNumericControl is Windows.Devices.HumanInterfaceDevice.IHidNumericControl;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDeviceSelector
   (
      usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
   )
   return Windows.String;
   
   function GetDeviceSelectorVidPid
   (
      usagePage : Windows.UInt16
      ; usageId : Windows.UInt16
      ; vendorId : Windows.UInt16
      ; productId : Windows.UInt16
   )
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
      ; accessMode : Windows.Storage.FileAccessMode
   )
   return Windows.Devices.HumanInterfaceDevice.IAsyncOperation_IHidDevice;

end;