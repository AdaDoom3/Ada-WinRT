--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Store.LicenseManagement is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type LicenseRefreshOption is (
      RunningLicenses,
      AllLicenses
   );
   for LicenseRefreshOption use (
      RunningLicenses => 0,
      AllLicenses => 1
   );
   for LicenseRefreshOption'Size use 32;
   
   type LicenseRefreshOption_Ptr is access LicenseRefreshOption;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ILicenseSatisfactionResult_Interface;
   type AsyncOperationCompletedHandler_ILicenseSatisfactionResult is access all AsyncOperationCompletedHandler_ILicenseSatisfactionResult_Interface'Class;
   type AsyncOperationCompletedHandler_ILicenseSatisfactionResult_Ptr is access all AsyncOperationCompletedHandler_ILicenseSatisfactionResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ILicenseSatisfactionResult_Interface;
   type ILicenseSatisfactionResult is access all ILicenseSatisfactionResult_Interface'Class;
   type ILicenseSatisfactionResult_Ptr is access all ILicenseSatisfactionResult;
   type ILicenseSatisfactionInfo_Interface;
   type ILicenseSatisfactionInfo is access all ILicenseSatisfactionInfo_Interface'Class;
   type ILicenseSatisfactionInfo_Ptr is access all ILicenseSatisfactionInfo;
   type ILicenseManagerStatics_Interface;
   type ILicenseManagerStatics is access all ILicenseManagerStatics_Interface'Class;
   type ILicenseManagerStatics_Ptr is access all ILicenseManagerStatics;
   type ILicenseManagerStatics2_Interface;
   type ILicenseManagerStatics2 is access all ILicenseManagerStatics2_Interface'Class;
   type ILicenseManagerStatics2_Ptr is access all ILicenseManagerStatics2;
   type IAsyncOperation_ILicenseSatisfactionResult_Interface;
   type IAsyncOperation_ILicenseSatisfactionResult is access all IAsyncOperation_ILicenseSatisfactionResult_Interface'Class;
   type IAsyncOperation_ILicenseSatisfactionResult_Ptr is access all IAsyncOperation_ILicenseSatisfactionResult;
   
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
   type ILicenseSatisfactionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_LicenseSatisfactionInfos
   (
      This       : access ILicenseSatisfactionResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access ILicenseSatisfactionResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_ILicenseSatisfactionResult : aliased constant Windows.IID := (1013403507, 15495, 20193, (130, 1, 244, 40, 53, 155, 211, 175 ));
   
   ------------------------------------------------------------------------
   type ILicenseSatisfactionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SatisfiedByDevice
   (
      This       : access ILicenseSatisfactionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SatisfiedByOpenLicense
   (
      This       : access ILicenseSatisfactionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SatisfiedByTrial
   (
      This       : access ILicenseSatisfactionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SatisfiedByPass
   (
      This       : access ILicenseSatisfactionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SatisfiedByInstallMedia
   (
      This       : access ILicenseSatisfactionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SatisfiedBySignedInUser
   (
      This       : access ILicenseSatisfactionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSatisfied
   (
      This       : access ILicenseSatisfactionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_ILicenseSatisfactionInfo : aliased constant Windows.IID := (1019981967, 56113, 18645, (131, 132, 250, 23, 200, 20, 116, 226 ));
   
   ------------------------------------------------------------------------
   type ILicenseManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AddLicenseAsync
   (
      This       : access ILicenseManagerStatics_Interface
      ; license : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetSatisfactionInfosAsync
   (
      This       : access ILicenseManagerStatics_Interface
      ; contentIds : Windows.Foundation.Collections.IIterable_String
      ; keyIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.ApplicationModel.Store.LicenseManagement.IAsyncOperation_ILicenseSatisfactionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_ILicenseManagerStatics : aliased constant Windows.IID := (3047963360, 55879, 20256, (154, 35, 9, 24, 44, 148, 118, 255 ));
   
   ------------------------------------------------------------------------
   type ILicenseManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function RefreshLicensesAsync
   (
      This       : access ILicenseManagerStatics2_Interface
      ; refreshOption : Windows.ApplicationModel.Store.LicenseManagement.LicenseRefreshOption
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_ILicenseManagerStatics2 : aliased constant Windows.IID := (2871968891, 8057, 17536, (184, 126, 44, 73, 158, 96, 27, 163 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ILicenseSatisfactionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ILicenseSatisfactionResult_Interface
      ; handler : Windows.ApplicationModel.Store.LicenseManagement.AsyncOperationCompletedHandler_ILicenseSatisfactionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ILicenseSatisfactionResult_Interface
      ; RetVal : access Windows.ApplicationModel.Store.LicenseManagement.AsyncOperationCompletedHandler_ILicenseSatisfactionResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ILicenseSatisfactionResult_Interface
      ; RetVal : access Windows.ApplicationModel.Store.LicenseManagement.ILicenseSatisfactionResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ILicenseSatisfactionResult : aliased constant Windows.IID := (3091495881, 43512, 22631, (139, 48, 205, 52, 114, 14, 220, 49 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ILicenseSatisfactionResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.Store.LicenseManagement.IAsyncOperation_ILicenseSatisfactionResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ILicenseSatisfactionResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ILicenseSatisfactionResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Store.LicenseManagement.IAsyncOperation_ILicenseSatisfactionResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ILicenseSatisfactionResult : aliased constant Windows.IID := (2473493617, 9519, 21305, (137, 195, 148, 40, 65, 32, 134, 202 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype LicenseSatisfactionInfo is Windows.ApplicationModel.Store.LicenseManagement.ILicenseSatisfactionInfo;
   subtype LicenseSatisfactionResult is Windows.ApplicationModel.Store.LicenseManagement.ILicenseSatisfactionResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function RefreshLicensesAsync
   (
      refreshOption : Windows.ApplicationModel.Store.LicenseManagement.LicenseRefreshOption
   )
   return Windows.Foundation.IAsyncAction;
   
   function AddLicenseAsync
   (
      license : Windows.Storage.Streams.IBuffer
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetSatisfactionInfosAsync
   (
      contentIds : Windows.Foundation.Collections.IIterable_String
      ; keyIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Store.LicenseManagement.IAsyncOperation_ILicenseSatisfactionResult;

end;