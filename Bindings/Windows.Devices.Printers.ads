--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Devices.Printers is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type PrintersContract is null record;
   pragma Convention (C_Pass_By_Copy , PrintersContract);
   
   type PrintersContract_Ptr is access PrintersContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IPrint3DDevice_Interface;
   type AsyncOperationCompletedHandler_IPrint3DDevice is access all AsyncOperationCompletedHandler_IPrint3DDevice_Interface'Class;
   type AsyncOperationCompletedHandler_IPrint3DDevice_Ptr is access all AsyncOperationCompletedHandler_IPrint3DDevice;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPrint3DDeviceStatics_Interface;
   type IPrint3DDeviceStatics is access all IPrint3DDeviceStatics_Interface'Class;
   type IPrint3DDeviceStatics_Ptr is access all IPrint3DDeviceStatics;
   type IPrint3DDevice_Interface;
   type IPrint3DDevice is access all IPrint3DDevice_Interface'Class;
   type IPrint3DDevice_Ptr is access all IPrint3DDevice;
   type IPrintSchema_Interface;
   type IPrintSchema is access all IPrintSchema_Interface'Class;
   type IPrintSchema_Ptr is access all IPrintSchema;
   type IAsyncOperation_IPrint3DDevice_Interface;
   type IAsyncOperation_IPrint3DDevice is access all IAsyncOperation_IPrint3DDevice_Interface'Class;
   type IAsyncOperation_IPrint3DDevice_Ptr is access all IAsyncOperation_IPrint3DDevice;
   
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
   type IPrint3DDeviceStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FromIdAsync
   (
      This       : access IPrint3DDeviceStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Printers.IAsyncOperation_IPrint3DDevice -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetDeviceSelector
   (
      This       : access IPrint3DDeviceStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPrint3DDeviceStatics : aliased constant Windows.IID := (4259537418, 26573, 16823, (163, 68, 81, 80, 161, 253, 117, 181 ));
   
   ------------------------------------------------------------------------
   type IPrint3DDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PrintSchema
   (
      This       : access IPrint3DDevice_Interface
      ; RetVal : access Windows.Devices.Printers.IPrintSchema
   )
   return Windows.HRESULT is abstract;
   
   IID_IPrint3DDevice : aliased constant Windows.IID := (68959513, 38675, 17058, (152, 19, 125, 195, 51, 116, 40, 211 ));
   
   ------------------------------------------------------------------------
   type IPrintSchema_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefaultPrintTicketAsync
   (
      This       : access IPrintSchema_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCapabilitiesAsync
   (
      This       : access IPrintSchema_Interface
      ; constrainTicket : Windows.Storage.Streams.IRandomAccessStreamWithContentType
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function MergeAndValidateWithDefaultPrintTicketAsync
   (
      This       : access IPrintSchema_Interface
      ; deltaTicket : Windows.Storage.Streams.IRandomAccessStreamWithContentType
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamWithContentType -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPrintSchema : aliased constant Windows.IID := (3266937622, 9912, 19451, (129, 56, 159, 150, 44, 34, 163, 91 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IPrint3DDevice_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IPrint3DDevice_Interface
      ; handler : Windows.Devices.Printers.AsyncOperationCompletedHandler_IPrint3DDevice
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IPrint3DDevice_Interface
      ; RetVal : access Windows.Devices.Printers.AsyncOperationCompletedHandler_IPrint3DDevice
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IPrint3DDevice_Interface
      ; RetVal : access Windows.Devices.Printers.IPrint3DDevice
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IPrint3DDevice : aliased constant Windows.IID := (2096908943, 24247, 23287, (188, 159, 120, 167, 228, 7, 205, 46 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IPrint3DDevice_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Printers.IAsyncOperation_IPrint3DDevice ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IPrint3DDevice_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPrint3DDevice_Interface
      ; asyncInfo : Windows.Devices.Printers.IAsyncOperation_IPrint3DDevice
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IPrint3DDevice : aliased constant Windows.IID := (2370507327, 17219, 20885, (187, 201, 185, 158, 149, 110, 5, 127 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Print3DDevice is Windows.Devices.Printers.IPrint3DDevice;
   subtype PrintSchema is Windows.Devices.Printers.IPrintSchema;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Printers.IAsyncOperation_IPrint3DDevice;
   
   function GetDeviceSelector
   return Windows.String;

end;