--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Web.Http;
with Windows; use Windows;
limited with Windows.System;
limited with Windows.ApplicationModel;
--------------------------------------------------------------------------------
package Windows.Services.Store is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type StorePurchaseStatus is (
      Succeeded,
      AlreadyPurchased,
      NotPurchased,
      NetworkError,
      ServerError
   );
   for StorePurchaseStatus use (
      Succeeded => 0,
      AlreadyPurchased => 1,
      NotPurchased => 2,
      NetworkError => 3,
      ServerError => 4
   );
   for StorePurchaseStatus'Size use 32;
   
   type StorePurchaseStatus_Ptr is access StorePurchaseStatus;
   
   type StoreConsumableStatus is (
      Succeeded,
      InsufficentQuantity,
      NetworkError,
      ServerError
   );
   for StoreConsumableStatus use (
      Succeeded => 0,
      InsufficentQuantity => 1,
      NetworkError => 2,
      ServerError => 3
   );
   for StoreConsumableStatus'Size use 32;
   
   type StoreConsumableStatus_Ptr is access StoreConsumableStatus;
   
   type StoreDurationUnit is (
      Minute,
      Hour,
      Day,
      Week,
      Month,
      Year
   );
   for StoreDurationUnit use (
      Minute => 0,
      Hour => 1,
      Day => 2,
      Week => 3,
      Month => 4,
      Year => 5
   );
   for StoreDurationUnit'Size use 32;
   
   type StoreDurationUnit_Ptr is access StoreDurationUnit;
   
   type StorePackageUpdateState is (
      Pending,
      Downloading,
      Deploying,
      Completed,
      Canceled,
      OtherError,
      ErrorLowBattery,
      ErrorWiFiRecommended,
      ErrorWiFiRequired
   );
   for StorePackageUpdateState use (
      Pending => 0,
      Downloading => 1,
      Deploying => 2,
      Completed => 3,
      Canceled => 4,
      OtherError => 5,
      ErrorLowBattery => 6,
      ErrorWiFiRecommended => 7,
      ErrorWiFiRequired => 8
   );
   for StorePackageUpdateState'Size use 32;
   
   type StorePackageUpdateState_Ptr is access StorePackageUpdateState;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type StoreContract is null record;
   pragma Convention (C_Pass_By_Copy , StoreContract);
   
   type StoreContract_Ptr is access StoreContract;
   
   type StorePackageUpdateStatus is record
      PackageFamilyName : Windows.String;
      PackageDownloadSizeInBytes : Windows.UInt64;
      PackageBytesDownloaded : Windows.UInt64;
      PackageDownloadProgress : Windows.Double;
      TotalDownloadProgress : Windows.Double;
      PackageUpdateState : Windows.Services.Store.StorePackageUpdateState;
   end record;
   pragma Convention (C_Pass_By_Copy , StorePackageUpdateStatus);
   
   type StorePackageUpdateStatus_Ptr is access StorePackageUpdateStatus;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IStoreProductPagedQueryResult_Interface;
   type AsyncOperationCompletedHandler_IStoreProductPagedQueryResult is access all AsyncOperationCompletedHandler_IStoreProductPagedQueryResult_Interface'Class;
   type AsyncOperationCompletedHandler_IStoreProductPagedQueryResult_Ptr is access all AsyncOperationCompletedHandler_IStoreProductPagedQueryResult;
   type AsyncOperationCompletedHandler_IStorePurchaseResult_Interface;
   type AsyncOperationCompletedHandler_IStorePurchaseResult is access all AsyncOperationCompletedHandler_IStorePurchaseResult_Interface'Class;
   type AsyncOperationCompletedHandler_IStorePurchaseResult_Ptr is access all AsyncOperationCompletedHandler_IStorePurchaseResult;
   type AsyncOperationCompletedHandler_IStoreSendRequestResult_Interface;
   type AsyncOperationCompletedHandler_IStoreSendRequestResult is access all AsyncOperationCompletedHandler_IStoreSendRequestResult_Interface'Class;
   type AsyncOperationCompletedHandler_IStoreSendRequestResult_Ptr is access all AsyncOperationCompletedHandler_IStoreSendRequestResult;
   type TypedEventHandler_IStoreContext_add_OfflineLicensesChanged_Interface;
   type TypedEventHandler_IStoreContext_add_OfflineLicensesChanged is access all TypedEventHandler_IStoreContext_add_OfflineLicensesChanged_Interface'Class;
   type TypedEventHandler_IStoreContext_add_OfflineLicensesChanged_Ptr is access all TypedEventHandler_IStoreContext_add_OfflineLicensesChanged;
   type AsyncOperationCompletedHandler_IStoreAppLicense_Interface;
   type AsyncOperationCompletedHandler_IStoreAppLicense is access all AsyncOperationCompletedHandler_IStoreAppLicense_Interface'Class;
   type AsyncOperationCompletedHandler_IStoreAppLicense_Ptr is access all AsyncOperationCompletedHandler_IStoreAppLicense;
   type AsyncOperationCompletedHandler_IStoreProductResult_Interface;
   type AsyncOperationCompletedHandler_IStoreProductResult is access all AsyncOperationCompletedHandler_IStoreProductResult_Interface'Class;
   type AsyncOperationCompletedHandler_IStoreProductResult_Ptr is access all AsyncOperationCompletedHandler_IStoreProductResult;
   type AsyncOperationCompletedHandler_IStoreProductQueryResult_Interface;
   type AsyncOperationCompletedHandler_IStoreProductQueryResult is access all AsyncOperationCompletedHandler_IStoreProductQueryResult_Interface'Class;
   type AsyncOperationCompletedHandler_IStoreProductQueryResult_Ptr is access all AsyncOperationCompletedHandler_IStoreProductQueryResult;
   type AsyncOperationCompletedHandler_IStoreConsumableResult_Interface;
   type AsyncOperationCompletedHandler_IStoreConsumableResult is access all AsyncOperationCompletedHandler_IStoreConsumableResult_Interface'Class;
   type AsyncOperationCompletedHandler_IStoreConsumableResult_Ptr is access all AsyncOperationCompletedHandler_IStoreConsumableResult;
   type AsyncOperationCompletedHandler_IStoreAcquireLicenseResult_Interface;
   type AsyncOperationCompletedHandler_IStoreAcquireLicenseResult is access all AsyncOperationCompletedHandler_IStoreAcquireLicenseResult_Interface'Class;
   type AsyncOperationCompletedHandler_IStoreAcquireLicenseResult_Ptr is access all AsyncOperationCompletedHandler_IStoreAcquireLicenseResult;
   type TypedEventHandler_IStorePackageLicense_add_LicenseLost_Interface;
   type TypedEventHandler_IStorePackageLicense_add_LicenseLost is access all TypedEventHandler_IStorePackageLicense_add_LicenseLost_Interface'Class;
   type TypedEventHandler_IStorePackageLicense_add_LicenseLost_Ptr is access all TypedEventHandler_IStorePackageLicense_add_LicenseLost;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IStoreProductPagedQueryResult_Interface;
   type IStoreProductPagedQueryResult is access all IStoreProductPagedQueryResult_Interface'Class;
   type IStoreProductPagedQueryResult_Ptr is access all IStoreProductPagedQueryResult;
   type IStoreProductQueryResult_Interface;
   type IStoreProductQueryResult is access all IStoreProductQueryResult_Interface'Class;
   type IStoreProductQueryResult_Ptr is access all IStoreProductQueryResult;
   type IStoreProductResult_Interface;
   type IStoreProductResult is access all IStoreProductResult_Interface'Class;
   type IStoreProductResult_Ptr is access all IStoreProductResult;
   type IStorePurchaseProperties_Interface;
   type IStorePurchaseProperties is access all IStorePurchaseProperties_Interface'Class;
   type IStorePurchaseProperties_Ptr is access all IStorePurchaseProperties;
   type IStorePurchasePropertiesFactory_Interface;
   type IStorePurchasePropertiesFactory is access all IStorePurchasePropertiesFactory_Interface'Class;
   type IStorePurchasePropertiesFactory_Ptr is access all IStorePurchasePropertiesFactory;
   type IStoreCollectionData_Interface;
   type IStoreCollectionData is access all IStoreCollectionData_Interface'Class;
   type IStoreCollectionData_Ptr is access all IStoreCollectionData;
   type IStoreLicense_Interface;
   type IStoreLicense is access all IStoreLicense_Interface'Class;
   type IStoreLicense_Ptr is access all IStoreLicense;
   type IStoreAppLicense_Interface;
   type IStoreAppLicense is access all IStoreAppLicense_Interface'Class;
   type IStoreAppLicense_Ptr is access all IStoreAppLicense;
   type IStoreSendRequestResult_Interface;
   type IStoreSendRequestResult is access all IStoreSendRequestResult_Interface'Class;
   type IStoreSendRequestResult_Ptr is access all IStoreSendRequestResult;
   type IStoreSendRequestResult2_Interface;
   type IStoreSendRequestResult2 is access all IStoreSendRequestResult2_Interface'Class;
   type IStoreSendRequestResult2_Ptr is access all IStoreSendRequestResult2;
   type IStoreProduct_Interface;
   type IStoreProduct is access all IStoreProduct_Interface'Class;
   type IStoreProduct_Ptr is access all IStoreProduct;
   type IStoreImage_Interface;
   type IStoreImage is access all IStoreImage_Interface'Class;
   type IStoreImage_Ptr is access all IStoreImage;
   type IStoreVideo_Interface;
   type IStoreVideo is access all IStoreVideo_Interface'Class;
   type IStoreVideo_Ptr is access all IStoreVideo;
   type IStoreSku_Interface;
   type IStoreSku is access all IStoreSku_Interface'Class;
   type IStoreSku_Ptr is access all IStoreSku;
   type IStoreAvailability_Interface;
   type IStoreAvailability is access all IStoreAvailability_Interface'Class;
   type IStoreAvailability_Ptr is access all IStoreAvailability;
   type IStorePrice_Interface;
   type IStorePrice is access all IStorePrice_Interface'Class;
   type IStorePrice_Ptr is access all IStorePrice;
   type IStoreSubscriptionInfo_Interface;
   type IStoreSubscriptionInfo is access all IStoreSubscriptionInfo_Interface'Class;
   type IStoreSubscriptionInfo_Ptr is access all IStoreSubscriptionInfo;
   type IStoreConsumableResult_Interface;
   type IStoreConsumableResult is access all IStoreConsumableResult_Interface'Class;
   type IStoreConsumableResult_Ptr is access all IStoreConsumableResult;
   type IStorePurchaseResult_Interface;
   type IStorePurchaseResult is access all IStorePurchaseResult_Interface'Class;
   type IStorePurchaseResult_Ptr is access all IStorePurchaseResult;
   type IStoreContextStatics_Interface;
   type IStoreContextStatics is access all IStoreContextStatics_Interface'Class;
   type IStoreContextStatics_Ptr is access all IStoreContextStatics;
   type IStoreRequestHelperStatics_Interface;
   type IStoreRequestHelperStatics is access all IStoreRequestHelperStatics_Interface'Class;
   type IStoreRequestHelperStatics_Ptr is access all IStoreRequestHelperStatics;
   type IStoreContext_Interface;
   type IStoreContext is access all IStoreContext_Interface'Class;
   type IStoreContext_Ptr is access all IStoreContext;
   type IStoreContext2_Interface;
   type IStoreContext2 is access all IStoreContext2_Interface'Class;
   type IStoreContext2_Ptr is access all IStoreContext2;
   type IStorePackageUpdate_Interface;
   type IStorePackageUpdate is access all IStorePackageUpdate_Interface'Class;
   type IStorePackageUpdate_Ptr is access all IStorePackageUpdate;
   type IStorePackageUpdateResult_Interface;
   type IStorePackageUpdateResult is access all IStorePackageUpdateResult_Interface'Class;
   type IStorePackageUpdateResult_Ptr is access all IStorePackageUpdateResult;
   type IStoreAcquireLicenseResult_Interface;
   type IStoreAcquireLicenseResult is access all IStoreAcquireLicenseResult_Interface'Class;
   type IStoreAcquireLicenseResult_Ptr is access all IStoreAcquireLicenseResult;
   type IStorePackageLicense_Interface;
   type IStorePackageLicense is access all IStorePackageLicense_Interface'Class;
   type IStorePackageLicense_Ptr is access all IStorePackageLicense;
   type IAsyncOperation_IStoreProductPagedQueryResult_Interface;
   type IAsyncOperation_IStoreProductPagedQueryResult is access all IAsyncOperation_IStoreProductPagedQueryResult_Interface'Class;
   type IAsyncOperation_IStoreProductPagedQueryResult_Ptr is access all IAsyncOperation_IStoreProductPagedQueryResult;
   type IIterator_IStoreImage_Interface;
   type IIterator_IStoreImage is access all IIterator_IStoreImage_Interface'Class;
   type IIterator_IStoreImage_Ptr is access all IIterator_IStoreImage;
   type IIterable_IStoreImage_Interface;
   type IIterable_IStoreImage is access all IIterable_IStoreImage_Interface'Class;
   type IIterable_IStoreImage_Ptr is access all IIterable_IStoreImage;
   type IVectorView_IStoreImage_Interface;
   type IVectorView_IStoreImage is access all IVectorView_IStoreImage_Interface'Class;
   type IVectorView_IStoreImage_Ptr is access all IVectorView_IStoreImage;
   type IIterator_IStoreVideo_Interface;
   type IIterator_IStoreVideo is access all IIterator_IStoreVideo_Interface'Class;
   type IIterator_IStoreVideo_Ptr is access all IIterator_IStoreVideo;
   type IIterable_IStoreVideo_Interface;
   type IIterable_IStoreVideo is access all IIterable_IStoreVideo_Interface'Class;
   type IIterable_IStoreVideo_Ptr is access all IIterable_IStoreVideo;
   type IVectorView_IStoreVideo_Interface;
   type IVectorView_IStoreVideo is access all IVectorView_IStoreVideo_Interface'Class;
   type IVectorView_IStoreVideo_Ptr is access all IVectorView_IStoreVideo;
   type IIterator_IStoreSku_Interface;
   type IIterator_IStoreSku is access all IIterator_IStoreSku_Interface'Class;
   type IIterator_IStoreSku_Ptr is access all IIterator_IStoreSku;
   type IIterable_IStoreSku_Interface;
   type IIterable_IStoreSku is access all IIterable_IStoreSku_Interface'Class;
   type IIterable_IStoreSku_Ptr is access all IIterable_IStoreSku;
   type IVectorView_IStoreSku_Interface;
   type IVectorView_IStoreSku is access all IVectorView_IStoreSku_Interface'Class;
   type IVectorView_IStoreSku_Ptr is access all IVectorView_IStoreSku;
   type IAsyncOperation_IStorePurchaseResult_Interface;
   type IAsyncOperation_IStorePurchaseResult is access all IAsyncOperation_IStorePurchaseResult_Interface'Class;
   type IAsyncOperation_IStorePurchaseResult_Ptr is access all IAsyncOperation_IStorePurchaseResult;
   type IIterator_IStoreAvailability_Interface;
   type IIterator_IStoreAvailability is access all IIterator_IStoreAvailability_Interface'Class;
   type IIterator_IStoreAvailability_Ptr is access all IIterator_IStoreAvailability;
   type IIterable_IStoreAvailability_Interface;
   type IIterable_IStoreAvailability is access all IIterable_IStoreAvailability_Interface'Class;
   type IIterable_IStoreAvailability_Ptr is access all IIterable_IStoreAvailability;
   type IVectorView_IStoreAvailability_Interface;
   type IVectorView_IStoreAvailability is access all IVectorView_IStoreAvailability_Interface'Class;
   type IVectorView_IStoreAvailability_Ptr is access all IVectorView_IStoreAvailability;
   type IAsyncOperation_IStoreSendRequestResult_Interface;
   type IAsyncOperation_IStoreSendRequestResult is access all IAsyncOperation_IStoreSendRequestResult_Interface'Class;
   type IAsyncOperation_IStoreSendRequestResult_Ptr is access all IAsyncOperation_IStoreSendRequestResult;
   type IAsyncOperation_IStoreAppLicense_Interface;
   type IAsyncOperation_IStoreAppLicense is access all IAsyncOperation_IStoreAppLicense_Interface'Class;
   type IAsyncOperation_IStoreAppLicense_Ptr is access all IAsyncOperation_IStoreAppLicense;
   type IAsyncOperation_IStoreProductResult_Interface;
   type IAsyncOperation_IStoreProductResult is access all IAsyncOperation_IStoreProductResult_Interface'Class;
   type IAsyncOperation_IStoreProductResult_Ptr is access all IAsyncOperation_IStoreProductResult;
   type IAsyncOperation_IStoreProductQueryResult_Interface;
   type IAsyncOperation_IStoreProductQueryResult is access all IAsyncOperation_IStoreProductQueryResult_Interface'Class;
   type IAsyncOperation_IStoreProductQueryResult_Ptr is access all IAsyncOperation_IStoreProductQueryResult;
   type IAsyncOperation_IStoreConsumableResult_Interface;
   type IAsyncOperation_IStoreConsumableResult is access all IAsyncOperation_IStoreConsumableResult_Interface'Class;
   type IAsyncOperation_IStoreConsumableResult_Ptr is access all IAsyncOperation_IStoreConsumableResult;
   type IAsyncOperation_IStoreAcquireLicenseResult_Interface;
   type IAsyncOperation_IStoreAcquireLicenseResult is access all IAsyncOperation_IStoreAcquireLicenseResult_Interface'Class;
   type IAsyncOperation_IStoreAcquireLicenseResult_Ptr is access all IAsyncOperation_IStoreAcquireLicenseResult;
   type IIterator_IStorePackageUpdate_Interface;
   type IIterator_IStorePackageUpdate is access all IIterator_IStorePackageUpdate_Interface'Class;
   type IIterator_IStorePackageUpdate_Ptr is access all IIterator_IStorePackageUpdate;
   type IIterable_IStorePackageUpdate_Interface;
   type IIterable_IStorePackageUpdate is access all IIterable_IStorePackageUpdate_Interface'Class;
   type IIterable_IStorePackageUpdate_Ptr is access all IIterable_IStorePackageUpdate;
   type IIterator_StorePackageUpdateStatus_Interface;
   type IIterator_StorePackageUpdateStatus is access all IIterator_StorePackageUpdateStatus_Interface'Class;
   type IIterator_StorePackageUpdateStatus_Ptr is access all IIterator_StorePackageUpdateStatus;
   type IIterable_StorePackageUpdateStatus_Interface;
   type IIterable_StorePackageUpdateStatus is access all IIterable_StorePackageUpdateStatus_Interface'Class;
   type IIterable_StorePackageUpdateStatus_Ptr is access all IIterable_StorePackageUpdateStatus;
   type IVectorView_StorePackageUpdateStatus_Interface;
   type IVectorView_StorePackageUpdateStatus is access all IVectorView_StorePackageUpdateStatus_Interface'Class;
   type IVectorView_StorePackageUpdateStatus_Ptr is access all IVectorView_StorePackageUpdateStatus;
   
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
   type IStoreProductPagedQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Products
   (
      This       : access IStoreProductPagedQueryResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_HasMoreResults
   (
      This       : access IStoreProductPagedQueryResult_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IStoreProductPagedQueryResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   function GetNextAsync
   (
      This       : access IStoreProductPagedQueryResult_Interface
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductPagedQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreProductPagedQueryResult : aliased constant Windows.IID := (3374782661, 19925, 18537, (164, 98, 236, 198, 135, 46, 67, 197 ));
   
   ------------------------------------------------------------------------
   type IStoreProductQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Products
   (
      This       : access IStoreProductQueryResult_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IStoreProductQueryResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreProductQueryResult : aliased constant Windows.IID := (3624265413, 54358, 20470, (128, 73, 144, 118, 213, 22, 95, 115 ));
   
   ------------------------------------------------------------------------
   type IStoreProductResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Product
   (
      This       : access IStoreProductResult_Interface
      ; RetVal : access Windows.Services.Store.IStoreProduct
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IStoreProductResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreProductResult : aliased constant Windows.IID := (3077001075, 15495, 20193, (130, 1, 244, 40, 53, 155, 211, 175 ));
   
   ------------------------------------------------------------------------
   type IStorePurchaseProperties_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IStorePurchaseProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Name
   (
      This       : access IStorePurchaseProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedJsonData
   (
      This       : access IStorePurchaseProperties_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ExtendedJsonData
   (
      This       : access IStorePurchaseProperties_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorePurchaseProperties : aliased constant Windows.IID := (2204268787, 65415, 17252, (165, 180, 253, 33, 83, 235, 228, 59 ));
   
   ------------------------------------------------------------------------
   type IStorePurchasePropertiesFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IStorePurchasePropertiesFactory_Interface
      ; name : Windows.String
      ; RetVal : access Windows.Services.Store.IStorePurchaseProperties
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorePurchasePropertiesFactory : aliased constant Windows.IID := (2808673694, 65277, 18591, (154, 23, 34, 165, 147, 230, 139, 157 ));
   
   ------------------------------------------------------------------------
   type IStoreCollectionData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsTrial
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CampaignId
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DeveloperOfferId
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AcquiredDate
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_StartDate
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_EndDate
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_TrialTimeRemaining
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedJsonData
   (
      This       : access IStoreCollectionData_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreCollectionData : aliased constant Windows.IID := (2326053811, 23475, 17434, (42, 180, 77, 171, 115, 213, 206, 103 ));
   
   ------------------------------------------------------------------------
   type IStoreLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SkuStoreId
   (
      This       : access IStoreLicense_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access IStoreLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IStoreLicense_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedJsonData
   (
      This       : access IStoreLicense_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_InAppOfferToken
   (
      This       : access IStoreLicense_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreLicense : aliased constant Windows.IID := (651990393, 19535, 20272, (188, 137, 100, 159, 96, 227, 96, 85 ));
   
   ------------------------------------------------------------------------
   type IStoreAppLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SkuStoreId
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsActive
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTrial
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpirationDate
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedJsonData
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AddOnLicenses
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_TrialTimeRemaining
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTrialOwnedByThisUser
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TrialUniqueId
   (
      This       : access IStoreAppLicense_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreAppLicense : aliased constant Windows.IID := (4085905886, 29632, 17870, (155, 171, 178, 254, 62, 94, 175, 211 ));
   
   ------------------------------------------------------------------------
   type IStoreSendRequestResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Response
   (
      This       : access IStoreSendRequestResult_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IStoreSendRequestResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreSendRequestResult : aliased constant Windows.IID := (3342515808, 33394, 17666, (138, 105, 110, 117, 21, 58, 66, 153 ));
   
   ------------------------------------------------------------------------
   type IStoreSendRequestResult2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HttpStatusCode
   (
      This       : access IStoreSendRequestResult2_Interface
      ; RetVal : access Windows.Web.Http.HttpStatusCode
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreSendRequestResult2 : aliased constant Windows.IID := (687941999, 49328, 18896, (142, 141, 170, 148, 10, 249, 193, 11 ));
   
   ------------------------------------------------------------------------
   type IStoreProduct_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StoreId
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ProductKind
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HasDigitalDownload
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Keywords
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Images
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Services.Store.IVectorView_IStoreImage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Videos
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Services.Store.IVectorView_IStoreVideo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Skus
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Services.Store.IVectorView_IStoreSku -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInUserCollection
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Price
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Services.Store.IStorePrice
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedJsonData
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_LinkUri
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function GetIsAnySkuInstalledAsync
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseAsync
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseWithPurchasePropertiesAsync
   (
      This       : access IStoreProduct_Interface
      ; storePurchaseProperties : Windows.Services.Store.IStorePurchaseProperties
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_InAppOfferToken
   (
      This       : access IStoreProduct_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreProduct : aliased constant Windows.IID := (839789650, 55136, 17674, (164, 43, 103, 209, 233, 1, 172, 144 ));
   
   ------------------------------------------------------------------------
   type IStoreImage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IStoreImage_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ImagePurposeTag
   (
      This       : access IStoreImage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IStoreImage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IStoreImage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Caption
   (
      This       : access IStoreImage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreImage : aliased constant Windows.IID := (136303176, 44468, 19300, (169, 147, 120, 71, 137, 146, 110, 213 ));
   
   ------------------------------------------------------------------------
   type IStoreVideo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IStoreVideo_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_VideoPurposeTag
   (
      This       : access IStoreVideo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Width
   (
      This       : access IStoreVideo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Height
   (
      This       : access IStoreVideo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Caption
   (
      This       : access IStoreVideo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PreviewImage
   (
      This       : access IStoreVideo_Interface
      ; RetVal : access Windows.Services.Store.IStoreImage
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreVideo : aliased constant Windows.IID := (4067209604, 28510, 19906, (136, 108, 60, 99, 8, 60, 47, 148 ));
   
   ------------------------------------------------------------------------
   type IStoreSku_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StoreId
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Language
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsTrial
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_CustomDeveloperData
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Images
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IVectorView_IStoreImage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Videos
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IVectorView_IStoreVideo -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Availabilities
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IVectorView_IStoreAvailability -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Price
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IStorePrice
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedJsonData
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsInUserCollection
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_BundledSkus
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_CollectionData
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IStoreCollectionData
   )
   return Windows.HRESULT is abstract;
   
   function GetIsInstalledAsync
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseAsync
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseWithPurchasePropertiesAsync
   (
      This       : access IStoreSku_Interface
      ; storePurchaseProperties : Windows.Services.Store.IStorePurchaseProperties
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_IsSubscription
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SubscriptionInfo
   (
      This       : access IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IStoreSubscriptionInfo
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreSku : aliased constant Windows.IID := (964587349, 17472, 20227, (134, 60, 145, 243, 254, 200, 61, 121 ));
   
   ------------------------------------------------------------------------
   type IStoreAvailability_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StoreId
   (
      This       : access IStoreAvailability_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EndDate
   (
      This       : access IStoreAvailability_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_Price
   (
      This       : access IStoreAvailability_Interface
      ; RetVal : access Windows.Services.Store.IStorePrice
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedJsonData
   (
      This       : access IStoreAvailability_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseAsync
   (
      This       : access IStoreAvailability_Interface
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseWithPurchasePropertiesAsync
   (
      This       : access IStoreAvailability_Interface
      ; storePurchaseProperties : Windows.Services.Store.IStorePurchaseProperties
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreAvailability : aliased constant Windows.IID := (4194698021, 4093, 17555, (173, 67, 241, 249, 145, 143, 105, 250 ));
   
   ------------------------------------------------------------------------
   type IStorePrice_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FormattedBasePrice
   (
      This       : access IStorePrice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FormattedPrice
   (
      This       : access IStorePrice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOnSale
   (
      This       : access IStorePrice_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_SaleEndDate
   (
      This       : access IStorePrice_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function get_CurrencyCode
   (
      This       : access IStorePrice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_FormattedRecurrencePrice
   (
      This       : access IStorePrice_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorePrice : aliased constant Windows.IID := (1438291140, 5617, 16508, (143, 6, 0, 99, 128, 244, 223, 11 ));
   
   ------------------------------------------------------------------------
   type IStoreSubscriptionInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BillingPeriod
   (
      This       : access IStoreSubscriptionInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_BillingPeriodUnit
   (
      This       : access IStoreSubscriptionInfo_Interface
      ; RetVal : access Windows.Services.Store.StoreDurationUnit
   )
   return Windows.HRESULT is abstract;
   
   function get_HasTrialPeriod
   (
      This       : access IStoreSubscriptionInfo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_TrialPeriod
   (
      This       : access IStoreSubscriptionInfo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_TrialPeriodUnit
   (
      This       : access IStoreSubscriptionInfo_Interface
      ; RetVal : access Windows.Services.Store.StoreDurationUnit
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreSubscriptionInfo : aliased constant Windows.IID := (1099528042, 1369, 17324, (169, 198, 58, 176, 1, 31, 184, 235 ));
   
   ------------------------------------------------------------------------
   type IStoreConsumableResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IStoreConsumableResult_Interface
      ; RetVal : access Windows.Services.Store.StoreConsumableStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_TrackingId
   (
      This       : access IStoreConsumableResult_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_BalanceRemaining
   (
      This       : access IStoreConsumableResult_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IStoreConsumableResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreConsumableResult : aliased constant Windows.IID := (3932007282, 27136, 16466, (190, 91, 191, 218, 180, 67, 51, 82 ));
   
   ------------------------------------------------------------------------
   type IStorePurchaseResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IStorePurchaseResult_Interface
      ; RetVal : access Windows.Services.Store.StorePurchaseStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IStorePurchaseResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorePurchaseResult : aliased constant Windows.IID := (2916255058, 63850, 17981, (167, 187, 194, 11, 79, 202, 105, 82 ));
   
   ------------------------------------------------------------------------
   type IStoreContextStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDefault
   (
      This       : access IStoreContextStatics_Interface
      ; RetVal : access Windows.Services.Store.IStoreContext
   )
   return Windows.HRESULT is abstract;
   
   function GetForUser
   (
      This       : access IStoreContextStatics_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.Services.Store.IStoreContext
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreContextStatics : aliased constant Windows.IID := (2617699935, 5568, 20082, (147, 48, 214, 25, 28, 235, 209, 156 ));
   
   ------------------------------------------------------------------------
   type IStoreRequestHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function SendRequestAsync
   (
      This       : access IStoreRequestHelperStatics_Interface
      ; context : Windows.Services.Store.IStoreContext
      ; requestKind : Windows.UInt32
      ; parametersAsJson : Windows.String
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreSendRequestResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreRequestHelperStatics : aliased constant Windows.IID := (1827005945, 41161, 19244, (150, 166, 161, 113, 198, 48, 3, 141 ));
   
   ------------------------------------------------------------------------
   type IStoreContext_Interface is interface and Windows.IInspectable_Interface;
   
   function get_User
   (
      This       : access IStoreContext_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   function add_OfflineLicensesChanged
   (
      This       : access IStoreContext_Interface
      ; handler : TypedEventHandler_IStoreContext_add_OfflineLicensesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OfflineLicensesChanged
   (
      This       : access IStoreContext_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function GetCustomerPurchaseIdAsync
   (
      This       : access IStoreContext_Interface
      ; serviceTicket : Windows.String
      ; publisherUserId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCustomerCollectionsIdAsync
   (
      This       : access IStoreContext_Interface
      ; serviceTicket : Windows.String
      ; publisherUserId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppLicenseAsync
   (
      This       : access IStoreContext_Interface
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreAppLicense -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStoreProductForCurrentAppAsync
   (
      This       : access IStoreContext_Interface
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStoreProductsAsync
   (
      This       : access IStoreContext_Interface
      ; productKinds : Windows.Foundation.Collections.IIterable_String
      ; storeIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAssociatedStoreProductsAsync
   (
      This       : access IStoreContext_Interface
      ; productKinds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAssociatedStoreProductsWithPagingAsync
   (
      This       : access IStoreContext_Interface
      ; productKinds : Windows.Foundation.Collections.IIterable_String
      ; maxItemsToRetrievePerPage : Windows.UInt32
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductPagedQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetUserCollectionAsync
   (
      This       : access IStoreContext_Interface
      ; productKinds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetUserCollectionWithPagingAsync
   (
      This       : access IStoreContext_Interface
      ; productKinds : Windows.Foundation.Collections.IIterable_String
      ; maxItemsToRetrievePerPage : Windows.UInt32
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductPagedQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ReportConsumableFulfillmentAsync
   (
      This       : access IStoreContext_Interface
      ; productStoreId : Windows.String
      ; quantity : Windows.UInt32
      ; trackingId : Windows.Guid
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreConsumableResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetConsumableBalanceRemainingAsync
   (
      This       : access IStoreContext_Interface
      ; productStoreId : Windows.String
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreConsumableResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function AcquireStoreLicenseForOptionalPackageAsync
   (
      This       : access IStoreContext_Interface
      ; optionalPackage : Windows.ApplicationModel.IPackage
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreAcquireLicenseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseAsync
   (
      This       : access IStoreContext_Interface
      ; storeId : Windows.String
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestPurchaseWithPurchasePropertiesAsync
   (
      This       : access IStoreContext_Interface
      ; storeId : Windows.String
      ; storePurchaseProperties : Windows.Services.Store.IStorePurchaseProperties
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStorePurchaseResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAppAndOptionalStorePackageUpdatesAsync
   (
      This       : access IStoreContext_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDownloadStorePackageUpdatesAsync
   (
      This       : access IStoreContext_Interface
      ; storePackageUpdates : Windows.Services.Store.IIterable_IStorePackageUpdate
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDownloadAndInstallStorePackageUpdatesAsync
   (
      This       : access IStoreContext_Interface
      ; storePackageUpdates : Windows.Services.Store.IIterable_IStorePackageUpdate
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestDownloadAndInstallStorePackagesAsync
   (
      This       : access IStoreContext_Interface
      ; storeIds : Windows.Foundation.Collections.IIterable_String
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreContext : aliased constant Windows.IID := (2895689406, 62717, 18706, (186, 189, 80, 53, 229, 232, 188, 171 ));
   
   ------------------------------------------------------------------------
   type IStoreContext2_Interface is interface and Windows.IInspectable_Interface;
   
   function FindStoreProductForPackageAsync
   (
      This       : access IStoreContext2_Interface
      ; productKinds : Windows.Foundation.Collections.IIterable_String
      ; package_x : Windows.ApplicationModel.IPackage
      ; RetVal : access Windows.Services.Store.IAsyncOperation_IStoreProductResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreContext2 : aliased constant Windows.IID := (414995674, 31705, 17708, (145, 22, 59, 189, 6, 255, 198, 58 ));
   
   ------------------------------------------------------------------------
   type IStorePackageUpdate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Package
   (
      This       : access IStorePackageUpdate_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Mandatory
   (
      This       : access IStorePackageUpdate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorePackageUpdate : aliased constant Windows.IID := (336568656, 15551, 18997, (185, 31, 72, 39, 28, 49, 176, 114 ));
   
   ------------------------------------------------------------------------
   type IStorePackageUpdateResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OverallState
   (
      This       : access IStorePackageUpdateResult_Interface
      ; RetVal : access Windows.Services.Store.StorePackageUpdateState
   )
   return Windows.HRESULT is abstract;
   
   function get_StorePackageUpdateStatuses
   (
      This       : access IStorePackageUpdateResult_Interface
      ; RetVal : access Windows.Services.Store.IVectorView_StorePackageUpdateStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorePackageUpdateResult : aliased constant Windows.IID := (3885056749, 25081, 18579, (180, 254, 207, 25, 22, 3, 175, 123 ));
   
   ------------------------------------------------------------------------
   type IStoreAcquireLicenseResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_StorePackageLicense
   (
      This       : access IStoreAcquireLicenseResult_Interface
      ; RetVal : access Windows.Services.Store.IStorePackageLicense
   )
   return Windows.HRESULT is abstract;
   
   function get_ExtendedError
   (
      This       : access IStoreAcquireLicenseResult_Interface
      ; RetVal : access Windows.Foundation.HResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IStoreAcquireLicenseResult : aliased constant Windows.IID := (4225209453, 61504, 19635, (154, 57, 41, 188, 236, 219, 226, 45 ));
   
   ------------------------------------------------------------------------
   type IStorePackageLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function add_LicenseLost
   (
      This       : access IStorePackageLicense_Interface
      ; handler : TypedEventHandler_IStorePackageLicense_add_LicenseLost
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_LicenseLost
   (
      This       : access IStorePackageLicense_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function get_Package
   (
      This       : access IStorePackageLicense_Interface
      ; RetVal : access Windows.ApplicationModel.IPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_IsValid
   (
      This       : access IStorePackageLicense_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ReleaseLicense
   (
      This       : access IStorePackageLicense_Interface
   )
   return Windows.HRESULT is abstract;
   
   IID_IStorePackageLicense : aliased constant Windows.IID := (205936404, 5345, 18803, (189, 20, 247, 119, 36, 39, 30, 153 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStoreProductPagedQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStoreProductPagedQueryResult_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStoreProductPagedQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStoreProductPagedQueryResult_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStoreProductPagedQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStoreProductPagedQueryResult_Interface
      ; RetVal : access Windows.Services.Store.IStoreProductPagedQueryResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStoreProductPagedQueryResult : aliased constant Windows.IID := (813295579, 7076, 23454, (133, 106, 101, 118, 191, 127, 156, 138 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStoreImage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStoreImage_Interface
      ; RetVal : access Windows.Services.Store.IStoreImage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStoreImage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStoreImage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStoreImage_Interface
      ; items : Windows.Services.Store.IStoreImage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStoreImage : aliased constant Windows.IID := (4225791734, 50130, 24055, (131, 159, 1, 42, 192, 249, 81, 197 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStoreImage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStoreImage_Interface
      ; RetVal : access Windows.Services.Store.IIterator_IStoreImage
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStoreImage : aliased constant Windows.IID := (3000659432, 44373, 22222, (135, 84, 44, 150, 244, 254, 28, 46 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStoreImage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStoreImage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Store.IStoreImage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStoreImage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStoreImage_Interface
      ; value : Windows.Services.Store.IStoreImage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStoreImage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Store.IStoreImage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStoreImage : aliased constant Windows.IID := (2115824334, 33469, 23987, (143, 53, 155, 240, 200, 142, 248, 57 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStoreVideo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStoreVideo_Interface
      ; RetVal : access Windows.Services.Store.IStoreVideo
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStoreVideo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStoreVideo_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStoreVideo_Interface
      ; items : Windows.Services.Store.IStoreVideo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStoreVideo : aliased constant Windows.IID := (2444277076, 42295, 24098, (179, 159, 106, 147, 93, 11, 239, 69 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStoreVideo_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStoreVideo_Interface
      ; RetVal : access Windows.Services.Store.IIterator_IStoreVideo
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStoreVideo : aliased constant Windows.IID := (1186882020, 29043, 22110, (174, 213, 74, 33, 82, 241, 206, 105 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStoreVideo_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStoreVideo_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Store.IStoreVideo
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStoreVideo_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStoreVideo_Interface
      ; value : Windows.Services.Store.IStoreVideo
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStoreVideo_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Store.IStoreVideo_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStoreVideo : aliased constant Windows.IID := (1848769701, 4510, 22425, (165, 27, 205, 106, 221, 236, 216, 112 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStoreSku_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IStoreSku
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStoreSku_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStoreSku_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStoreSku_Interface
      ; items : Windows.Services.Store.IStoreSku_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStoreSku : aliased constant Windows.IID := (912055954, 32739, 22997, (184, 248, 143, 5, 172, 245, 9, 71 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStoreSku_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStoreSku_Interface
      ; RetVal : access Windows.Services.Store.IIterator_IStoreSku
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStoreSku : aliased constant Windows.IID := (1378694383, 19290, 23364, (160, 70, 122, 22, 5, 29, 1, 30 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStoreSku_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStoreSku_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Store.IStoreSku
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStoreSku_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStoreSku_Interface
      ; value : Windows.Services.Store.IStoreSku
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStoreSku_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Store.IStoreSku_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStoreSku : aliased constant Windows.IID := (1081886099, 1597, 23707, (184, 224, 148, 159, 225, 56, 121, 99 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStorePurchaseResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStorePurchaseResult_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStorePurchaseResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStorePurchaseResult_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStorePurchaseResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStorePurchaseResult_Interface
      ; RetVal : access Windows.Services.Store.IStorePurchaseResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStorePurchaseResult : aliased constant Windows.IID := (869846064, 30965, 24449, (170, 45, 164, 250, 42, 59, 28, 104 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStoreAvailability_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStoreAvailability_Interface
      ; RetVal : access Windows.Services.Store.IStoreAvailability
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStoreAvailability_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStoreAvailability_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStoreAvailability_Interface
      ; items : Windows.Services.Store.IStoreAvailability_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStoreAvailability : aliased constant Windows.IID := (1347493067, 2206, 23411, (187, 74, 77, 30, 247, 123, 143, 15 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStoreAvailability_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStoreAvailability_Interface
      ; RetVal : access Windows.Services.Store.IIterator_IStoreAvailability
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStoreAvailability : aliased constant Windows.IID := (3314409888, 9694, 22411, (187, 105, 224, 162, 109, 103, 178, 3 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IStoreAvailability_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IStoreAvailability_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Store.IStoreAvailability
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IStoreAvailability_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IStoreAvailability_Interface
      ; value : Windows.Services.Store.IStoreAvailability
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IStoreAvailability_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Store.IStoreAvailability_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IStoreAvailability : aliased constant Windows.IID := (31848273, 35920, 21195, (171, 194, 233, 134, 36, 2, 199, 138 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStoreSendRequestResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStoreSendRequestResult_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStoreSendRequestResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStoreSendRequestResult_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStoreSendRequestResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStoreSendRequestResult_Interface
      ; RetVal : access Windows.Services.Store.IStoreSendRequestResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStoreSendRequestResult : aliased constant Windows.IID := (718143464, 9628, 24238, (147, 193, 19, 162, 60, 116, 223, 238 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStoreAppLicense_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStoreAppLicense_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStoreAppLicense
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStoreAppLicense_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStoreAppLicense
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStoreAppLicense_Interface
      ; RetVal : access Windows.Services.Store.IStoreAppLicense
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStoreAppLicense : aliased constant Windows.IID := (946222859, 44998, 23809, (132, 194, 69, 116, 98, 141, 229, 57 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStoreProductResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStoreProductResult_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStoreProductResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStoreProductResult_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStoreProductResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStoreProductResult_Interface
      ; RetVal : access Windows.Services.Store.IStoreProductResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStoreProductResult : aliased constant Windows.IID := (2657216619, 27387, 20654, (175, 193, 197, 159, 84, 81, 8, 221 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStoreProductQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStoreProductQueryResult_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStoreProductQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStoreProductQueryResult_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStoreProductQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStoreProductQueryResult_Interface
      ; RetVal : access Windows.Services.Store.IStoreProductQueryResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStoreProductQueryResult : aliased constant Windows.IID := (2526668731, 59935, 24067, (148, 57, 200, 14, 105, 119, 183, 17 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStoreConsumableResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStoreConsumableResult_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStoreConsumableResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStoreConsumableResult_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStoreConsumableResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStoreConsumableResult_Interface
      ; RetVal : access Windows.Services.Store.IStoreConsumableResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStoreConsumableResult : aliased constant Windows.IID := (2268875131, 50167, 22103, (185, 33, 62, 88, 206, 72, 238, 80 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IStoreAcquireLicenseResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IStoreAcquireLicenseResult_Interface
      ; handler : Windows.Services.Store.AsyncOperationCompletedHandler_IStoreAcquireLicenseResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IStoreAcquireLicenseResult_Interface
      ; RetVal : access Windows.Services.Store.AsyncOperationCompletedHandler_IStoreAcquireLicenseResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IStoreAcquireLicenseResult_Interface
      ; RetVal : access Windows.Services.Store.IStoreAcquireLicenseResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IStoreAcquireLicenseResult : aliased constant Windows.IID := (3714860805, 42860, 21134, (153, 165, 205, 209, 49, 151, 212, 207 ));
   
   ------------------------------------------------------------------------
   type IIterator_IStorePackageUpdate_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IStorePackageUpdate_Interface
      ; RetVal : access Windows.Services.Store.IStorePackageUpdate
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IStorePackageUpdate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IStorePackageUpdate_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IStorePackageUpdate_Interface
      ; items : Windows.Services.Store.IStorePackageUpdate_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IStorePackageUpdate : aliased constant Windows.IID := (3076380539, 34762, 22870, (137, 2, 132, 233, 255, 201, 125, 131 ));
   
   ------------------------------------------------------------------------
   type IIterable_IStorePackageUpdate_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IStorePackageUpdate_Interface
      ; RetVal : access Windows.Services.Store.IIterator_IStorePackageUpdate
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IStorePackageUpdate : aliased constant Windows.IID := (1795648593, 33950, 24261, (174, 213, 155, 5, 133, 89, 25, 2 ));
   
   ------------------------------------------------------------------------
   type IIterator_StorePackageUpdateStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_StorePackageUpdateStatus_Interface
      ; RetVal : access Windows.Services.Store.StorePackageUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_StorePackageUpdateStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_StorePackageUpdateStatus_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_StorePackageUpdateStatus_Interface
      ; items : Windows.Services.Store.StorePackageUpdateStatus_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_StorePackageUpdateStatus : aliased constant Windows.IID := (1635899471, 63281, 22456, (154, 107, 138, 18, 252, 213, 141, 4 ));
   
   ------------------------------------------------------------------------
   type IIterable_StorePackageUpdateStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_StorePackageUpdateStatus_Interface
      ; RetVal : access Windows.Services.Store.IIterator_StorePackageUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_StorePackageUpdateStatus : aliased constant Windows.IID := (1619206691, 32436, 23767, (131, 64, 245, 7, 113, 115, 211, 100 ));
   
   ------------------------------------------------------------------------
   type IVectorView_StorePackageUpdateStatus_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_StorePackageUpdateStatus_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Store.StorePackageUpdateStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_StorePackageUpdateStatus_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_StorePackageUpdateStatus_Interface
      ; value : Windows.Services.Store.StorePackageUpdateStatus
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_StorePackageUpdateStatus_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Store.StorePackageUpdateStatus_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_StorePackageUpdateStatus : aliased constant Windows.IID := (1759703094, 18818, 21987, (140, 15, 155, 244, 230, 154, 164, 90 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStoreProductPagedQueryResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreProductPagedQueryResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStoreProductPagedQueryResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStoreProductPagedQueryResult_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreProductPagedQueryResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStoreProductPagedQueryResult : aliased constant Windows.IID := (3884331551, 46993, 24120, (139, 196, 152, 203, 40, 125, 16, 133 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStorePurchaseResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStorePurchaseResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStorePurchaseResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStorePurchaseResult_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStorePurchaseResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStorePurchaseResult : aliased constant Windows.IID := (496994798, 12238, 21734, (160, 169, 82, 208, 12, 82, 204, 58 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStoreSendRequestResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreSendRequestResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStoreSendRequestResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStoreSendRequestResult_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreSendRequestResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStoreSendRequestResult : aliased constant Windows.IID := (2013311651, 48060, 23057, (140, 53, 210, 189, 229, 72, 158, 129 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IStoreContext_add_OfflineLicensesChanged_Interface(Callback : access procedure (sender : Windows.Services.Store.IStoreContext ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IStoreContext_add_OfflineLicensesChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStoreContext_add_OfflineLicensesChanged_Interface
      ; sender : Windows.Services.Store.IStoreContext
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IStoreContext_add_OfflineLicensesChanged : aliased constant Windows.IID := (3584035527, 2093, 21628, (160, 75, 37, 64, 193, 205, 233, 122 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStoreAppLicense_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreAppLicense ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStoreAppLicense_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStoreAppLicense_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreAppLicense
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStoreAppLicense : aliased constant Windows.IID := (3472825865, 58630, 20653, (169, 8, 82, 3, 140, 37, 101, 82 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStoreProductResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreProductResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStoreProductResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStoreProductResult_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreProductResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStoreProductResult : aliased constant Windows.IID := (3952339254, 54549, 21524, (157, 21, 240, 80, 192, 184, 245, 33 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStoreProductQueryResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreProductQueryResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStoreProductQueryResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStoreProductQueryResult_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreProductQueryResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStoreProductQueryResult : aliased constant Windows.IID := (49587244, 1112, 22742, (146, 60, 180, 75, 168, 239, 34, 34 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStoreConsumableResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreConsumableResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStoreConsumableResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStoreConsumableResult_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreConsumableResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStoreConsumableResult : aliased constant Windows.IID := (1059828088, 15438, 22253, (134, 165, 173, 19, 121, 124, 251, 253 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IStoreAcquireLicenseResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreAcquireLicenseResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IStoreAcquireLicenseResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IStoreAcquireLicenseResult_Interface
      ; asyncInfo : Windows.Services.Store.IAsyncOperation_IStoreAcquireLicenseResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IStoreAcquireLicenseResult : aliased constant Windows.IID := (1770506620, 11289, 24388, (181, 172, 55, 57, 63, 60, 26, 74 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IStorePackageLicense_add_LicenseLost_Interface(Callback : access procedure (sender : Windows.Services.Store.IStorePackageLicense ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IStorePackageLicense_add_LicenseLost_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IStorePackageLicense_add_LicenseLost_Interface
      ; sender : Windows.Services.Store.IStorePackageLicense
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IStorePackageLicense_add_LicenseLost : aliased constant Windows.IID := (1817826871, 10608, 24420, (149, 17, 211, 154, 194, 69, 188, 148 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype StoreProduct is Windows.Services.Store.IStoreProduct;
   subtype StoreProductPagedQueryResult is Windows.Services.Store.IStoreProductPagedQueryResult;
   subtype StorePurchaseProperties is Windows.Services.Store.IStorePurchaseProperties;
   
   function CreateStorePurchaseProperties return Windows.Services.Store.IStorePurchaseProperties;
   
   subtype StoreLicense is Windows.Services.Store.IStoreLicense;
   subtype StoreImage is Windows.Services.Store.IStoreImage;
   subtype StoreVideo is Windows.Services.Store.IStoreVideo;
   subtype StoreSku is Windows.Services.Store.IStoreSku;
   subtype StorePrice is Windows.Services.Store.IStorePrice;
   subtype StorePurchaseResult is Windows.Services.Store.IStorePurchaseResult;
   subtype StoreAvailability is Windows.Services.Store.IStoreAvailability;
   subtype StoreCollectionData is Windows.Services.Store.IStoreCollectionData;
   subtype StoreSubscriptionInfo is Windows.Services.Store.IStoreSubscriptionInfo;
   subtype StoreContext is Windows.Services.Store.IStoreContext;
   subtype StoreSendRequestResult is Windows.Services.Store.IStoreSendRequestResult;
   subtype StoreAppLicense is Windows.Services.Store.IStoreAppLicense;
   subtype StoreProductResult is Windows.Services.Store.IStoreProductResult;
   subtype StoreProductQueryResult is Windows.Services.Store.IStoreProductQueryResult;
   subtype StoreConsumableResult is Windows.Services.Store.IStoreConsumableResult;
   subtype StoreAcquireLicenseResult is Windows.Services.Store.IStoreAcquireLicenseResult;
   subtype StorePackageUpdate is Windows.Services.Store.IStorePackageUpdate;
   subtype StorePackageUpdateResult is Windows.Services.Store.IStorePackageUpdateResult;
   subtype StorePackageLicense is Windows.Services.Store.IStorePackageLicense;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function GetDefault
   return Windows.Services.Store.IStoreContext;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Services.Store.IStoreContext;
   
   function SendRequestAsync
   (
      context : Windows.Services.Store.IStoreContext
      ; requestKind : Windows.UInt32
      ; parametersAsJson : Windows.String
   )
   return Windows.Services.Store.IAsyncOperation_IStoreSendRequestResult;

end;