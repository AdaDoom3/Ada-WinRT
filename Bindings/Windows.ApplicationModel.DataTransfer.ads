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
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.UI;
limited with Windows.Storage;
limited with Windows.Security.EnterpriseData;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.DataTransfer is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DataPackageOperation is (
      None,
      Copy,
      Move,
      Link
   );
   for DataPackageOperation use (
      None => 0,
      Copy => 1,
      Move => 2,
      Link => 4
   );
   for DataPackageOperation'Size use 32;
   
   type DataPackageOperation_Ptr is access DataPackageOperation;
   
   type ShareUITheme is (
      Default,
      Light,
      Dark
   );
   for ShareUITheme use (
      Default => 0,
      Light => 1,
      Dark => 2
   );
   for ShareUITheme'Size use 32;
   
   type ShareUITheme_Ptr is access ShareUITheme;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type DataProviderHandler_Interface;
   type DataProviderHandler is access all DataProviderHandler_Interface'Class;
   type DataProviderHandler_Ptr is access all DataProviderHandler;
   type ShareProviderHandler_Interface;
   type ShareProviderHandler is access all ShareProviderHandler_Interface'Class;
   type ShareProviderHandler_Ptr is access all ShareProviderHandler;
   type TypedEventHandler_IDataPackage_add_OperationCompleted_Interface;
   type TypedEventHandler_IDataPackage_add_OperationCompleted is access all TypedEventHandler_IDataPackage_add_OperationCompleted_Interface'Class;
   type TypedEventHandler_IDataPackage_add_OperationCompleted_Ptr is access all TypedEventHandler_IDataPackage_add_OperationCompleted;
   type TypedEventHandler_IDataPackage_add_Destroyed_Interface;
   type TypedEventHandler_IDataPackage_add_Destroyed is access all TypedEventHandler_IDataPackage_add_Destroyed_Interface'Class;
   type TypedEventHandler_IDataPackage_add_Destroyed_Ptr is access all TypedEventHandler_IDataPackage_add_Destroyed;
   type TypedEventHandler_IDataPackage3_add_ShareCompleted_Interface;
   type TypedEventHandler_IDataPackage3_add_ShareCompleted is access all TypedEventHandler_IDataPackage3_add_ShareCompleted_Interface'Class;
   type TypedEventHandler_IDataPackage3_add_ShareCompleted_Ptr is access all TypedEventHandler_IDataPackage3_add_ShareCompleted;
   type AsyncOperationCompletedHandler_DataPackageOperation_Interface;
   type AsyncOperationCompletedHandler_DataPackageOperation is access all AsyncOperationCompletedHandler_DataPackageOperation_Interface'Class;
   type AsyncOperationCompletedHandler_DataPackageOperation_Ptr is access all AsyncOperationCompletedHandler_DataPackageOperation;
   type TypedEventHandler_IDataTransferManager_add_DataRequested_Interface;
   type TypedEventHandler_IDataTransferManager_add_DataRequested is access all TypedEventHandler_IDataTransferManager_add_DataRequested_Interface'Class;
   type TypedEventHandler_IDataTransferManager_add_DataRequested_Ptr is access all TypedEventHandler_IDataTransferManager_add_DataRequested;
   type TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen_Interface;
   type TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen is access all TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen_Interface'Class;
   type TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen_Ptr is access all TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen;
   type TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested_Interface;
   type TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested is access all TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested_Interface'Class;
   type TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested_Ptr is access all TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested;
   type AsyncOperationCompletedHandler_IDataPackage_Interface;
   type AsyncOperationCompletedHandler_IDataPackage is access all AsyncOperationCompletedHandler_IDataPackage_Interface'Class;
   type AsyncOperationCompletedHandler_IDataPackage_Ptr is access all AsyncOperationCompletedHandler_IDataPackage;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IStandardDataFormatsStatics_Interface;
   type IStandardDataFormatsStatics is access all IStandardDataFormatsStatics_Interface'Class;
   type IStandardDataFormatsStatics_Ptr is access all IStandardDataFormatsStatics;
   type IStandardDataFormatsStatics2_Interface;
   type IStandardDataFormatsStatics2 is access all IStandardDataFormatsStatics2_Interface'Class;
   type IStandardDataFormatsStatics2_Ptr is access all IStandardDataFormatsStatics2;
   type IDataPackagePropertySetView_Interface;
   type IDataPackagePropertySetView is access all IDataPackagePropertySetView_Interface'Class;
   type IDataPackagePropertySetView_Ptr is access all IDataPackagePropertySetView;
   type IDataPackagePropertySetView2_Interface;
   type IDataPackagePropertySetView2 is access all IDataPackagePropertySetView2_Interface'Class;
   type IDataPackagePropertySetView2_Ptr is access all IDataPackagePropertySetView2;
   type IDataPackagePropertySetView3_Interface;
   type IDataPackagePropertySetView3 is access all IDataPackagePropertySetView3_Interface'Class;
   type IDataPackagePropertySetView3_Ptr is access all IDataPackagePropertySetView3;
   type IDataPackagePropertySet_Interface;
   type IDataPackagePropertySet is access all IDataPackagePropertySet_Interface'Class;
   type IDataPackagePropertySet_Ptr is access all IDataPackagePropertySet;
   type IDataPackagePropertySet2_Interface;
   type IDataPackagePropertySet2 is access all IDataPackagePropertySet2_Interface'Class;
   type IDataPackagePropertySet2_Ptr is access all IDataPackagePropertySet2;
   type IDataPackagePropertySet3_Interface;
   type IDataPackagePropertySet3 is access all IDataPackagePropertySet3_Interface'Class;
   type IDataPackagePropertySet3_Ptr is access all IDataPackagePropertySet3;
   type IMapView_String_Object_Interface;
   type IMapView_String_Object is access all IMapView_String_Object_Interface'Class;
   type IMapView_String_Object_Ptr is access all IMapView_String_Object;
   type IIterable_IKeyValuePair_Interface;
   type IIterable_IKeyValuePair is access all IIterable_IKeyValuePair_Interface'Class;
   type IIterable_IKeyValuePair_Ptr is access all IIterable_IKeyValuePair;
   type IMap_String_Object_Interface;
   type IMap_String_Object is access all IMap_String_Object_Interface'Class;
   type IMap_String_Object_Ptr is access all IMap_String_Object;
   type IDataProviderDeferral_Interface;
   type IDataProviderDeferral is access all IDataProviderDeferral_Interface'Class;
   type IDataProviderDeferral_Ptr is access all IDataProviderDeferral;
   type IDataProviderRequest_Interface;
   type IDataProviderRequest is access all IDataProviderRequest_Interface'Class;
   type IDataProviderRequest_Ptr is access all IDataProviderRequest;
   type IOperationCompletedEventArgs_Interface;
   type IOperationCompletedEventArgs is access all IOperationCompletedEventArgs_Interface'Class;
   type IOperationCompletedEventArgs_Ptr is access all IOperationCompletedEventArgs;
   type IOperationCompletedEventArgs2_Interface;
   type IOperationCompletedEventArgs2 is access all IOperationCompletedEventArgs2_Interface'Class;
   type IOperationCompletedEventArgs2_Ptr is access all IOperationCompletedEventArgs2;
   type IShareProvider_Interface;
   type IShareProvider is access all IShareProvider_Interface'Class;
   type IShareProvider_Ptr is access all IShareProvider;
   type IShareProviderFactory_Interface;
   type IShareProviderFactory is access all IShareProviderFactory_Interface'Class;
   type IShareProviderFactory_Ptr is access all IShareProviderFactory;
   type IShareProviderOperation_Interface;
   type IShareProviderOperation is access all IShareProviderOperation_Interface'Class;
   type IShareProviderOperation_Ptr is access all IShareProviderOperation;
   type IShareTargetInfo_Interface;
   type IShareTargetInfo is access all IShareTargetInfo_Interface'Class;
   type IShareTargetInfo_Ptr is access all IShareTargetInfo;
   type IShareCompletedEventArgs_Interface;
   type IShareCompletedEventArgs is access all IShareCompletedEventArgs_Interface'Class;
   type IShareCompletedEventArgs_Ptr is access all IShareCompletedEventArgs;
   type IDataPackageView_Interface;
   type IDataPackageView is access all IDataPackageView_Interface'Class;
   type IDataPackageView_Ptr is access all IDataPackageView;
   type IDataPackageView2_Interface;
   type IDataPackageView2 is access all IDataPackageView2_Interface'Class;
   type IDataPackageView2_Ptr is access all IDataPackageView2;
   type IDataPackageView3_Interface;
   type IDataPackageView3 is access all IDataPackageView3_Interface'Class;
   type IDataPackageView3_Ptr is access all IDataPackageView3;
   type IDataPackageView4_Interface;
   type IDataPackageView4 is access all IDataPackageView4_Interface'Class;
   type IDataPackageView4_Ptr is access all IDataPackageView4;
   type IDataPackage_Interface;
   type IDataPackage is access all IDataPackage_Interface'Class;
   type IDataPackage_Ptr is access all IDataPackage;
   type IDataPackage2_Interface;
   type IDataPackage2 is access all IDataPackage2_Interface'Class;
   type IDataPackage2_Ptr is access all IDataPackage2;
   type IDataPackage3_Interface;
   type IDataPackage3 is access all IDataPackage3_Interface'Class;
   type IDataPackage3_Ptr is access all IDataPackage3;
   type IHtmlFormatHelperStatics_Interface;
   type IHtmlFormatHelperStatics is access all IHtmlFormatHelperStatics_Interface'Class;
   type IHtmlFormatHelperStatics_Ptr is access all IHtmlFormatHelperStatics;
   type IClipboardStatics_Interface;
   type IClipboardStatics is access all IClipboardStatics_Interface'Class;
   type IClipboardStatics_Ptr is access all IClipboardStatics;
   type IShareUIOptions_Interface;
   type IShareUIOptions is access all IShareUIOptions_Interface'Class;
   type IShareUIOptions_Ptr is access all IShareUIOptions;
   type IDataRequestDeferral_Interface;
   type IDataRequestDeferral is access all IDataRequestDeferral_Interface'Class;
   type IDataRequestDeferral_Ptr is access all IDataRequestDeferral;
   type IDataRequest_Interface;
   type IDataRequest is access all IDataRequest_Interface'Class;
   type IDataRequest_Ptr is access all IDataRequest;
   type IDataRequestedEventArgs_Interface;
   type IDataRequestedEventArgs is access all IDataRequestedEventArgs_Interface'Class;
   type IDataRequestedEventArgs_Ptr is access all IDataRequestedEventArgs;
   type IShareProvidersRequestedEventArgs_Interface;
   type IShareProvidersRequestedEventArgs is access all IShareProvidersRequestedEventArgs_Interface'Class;
   type IShareProvidersRequestedEventArgs_Ptr is access all IShareProvidersRequestedEventArgs;
   type ITargetApplicationChosenEventArgs_Interface;
   type ITargetApplicationChosenEventArgs is access all ITargetApplicationChosenEventArgs_Interface'Class;
   type ITargetApplicationChosenEventArgs_Ptr is access all ITargetApplicationChosenEventArgs;
   type IDataTransferManager_Interface;
   type IDataTransferManager is access all IDataTransferManager_Interface'Class;
   type IDataTransferManager_Ptr is access all IDataTransferManager;
   type IDataTransferManager2_Interface;
   type IDataTransferManager2 is access all IDataTransferManager2_Interface'Class;
   type IDataTransferManager2_Ptr is access all IDataTransferManager2;
   type IDataTransferManagerStatics_Interface;
   type IDataTransferManagerStatics is access all IDataTransferManagerStatics_Interface'Class;
   type IDataTransferManagerStatics_Ptr is access all IDataTransferManagerStatics;
   type IDataTransferManagerStatics2_Interface;
   type IDataTransferManagerStatics2 is access all IDataTransferManagerStatics2_Interface'Class;
   type IDataTransferManagerStatics2_Ptr is access all IDataTransferManagerStatics2;
   type IDataTransferManagerStatics3_Interface;
   type IDataTransferManagerStatics3 is access all IDataTransferManagerStatics3_Interface'Class;
   type IDataTransferManagerStatics3_Ptr is access all IDataTransferManagerStatics3;
   type ISharedStorageAccessManagerStatics_Interface;
   type ISharedStorageAccessManagerStatics is access all ISharedStorageAccessManagerStatics_Interface'Class;
   type ISharedStorageAccessManagerStatics_Ptr is access all ISharedStorageAccessManagerStatics;
   type IAsyncOperation_DataPackageOperation_Interface;
   type IAsyncOperation_DataPackageOperation is access all IAsyncOperation_DataPackageOperation_Interface'Class;
   type IAsyncOperation_DataPackageOperation_Ptr is access all IAsyncOperation_DataPackageOperation;
   type IIterator_IShareProvider_Interface;
   type IIterator_IShareProvider is access all IIterator_IShareProvider_Interface'Class;
   type IIterator_IShareProvider_Ptr is access all IIterator_IShareProvider;
   type IIterable_IShareProvider_Interface;
   type IIterable_IShareProvider is access all IIterable_IShareProvider_Interface'Class;
   type IIterable_IShareProvider_Ptr is access all IIterable_IShareProvider;
   type IVectorView_IShareProvider_Interface;
   type IVectorView_IShareProvider is access all IVectorView_IShareProvider_Interface'Class;
   type IVectorView_IShareProvider_Ptr is access all IVectorView_IShareProvider;
   type IVector_IShareProvider_Interface;
   type IVector_IShareProvider is access all IVector_IShareProvider_Interface'Class;
   type IVector_IShareProvider_Ptr is access all IVector_IShareProvider;
   type IAsyncOperation_IDataPackage_Interface;
   type IAsyncOperation_IDataPackage is access all IAsyncOperation_IDataPackage_Interface'Class;
   type IAsyncOperation_IDataPackage_Ptr is access all IAsyncOperation_IDataPackage;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IStandardDataFormatsStatics : aliased constant Windows.IID := (2127987105, 43136, 16585, (180, 237, 11, 238, 30, 21, 245, 73 ));
   
   type IStandardDataFormatsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access IStandardDataFormatsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Uri
   (
      This       : access IStandardDataFormatsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Html
   (
      This       : access IStandardDataFormatsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rtf
   (
      This       : access IStandardDataFormatsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Bitmap
   (
      This       : access IStandardDataFormatsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_StorageItems
   (
      This       : access IStandardDataFormatsStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IStandardDataFormatsStatics2 : aliased constant Windows.IID := (1117934836, 40310, 17128, (134, 27, 71, 194, 93, 208, 207, 113 ));
   
   type IStandardDataFormatsStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_WebLink
   (
      This       : access IStandardDataFormatsStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationLink
   (
      This       : access IStandardDataFormatsStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackagePropertySetView : aliased constant Windows.IID := (3108826113, 3098, 19543, (190, 85, 117, 208, 18, 137, 115, 93 ));
   
   type IDataPackagePropertySetView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IDataPackagePropertySetView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IDataPackagePropertySetView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IDataPackagePropertySetView_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_FileTypes
   (
      This       : access IDataPackagePropertySetView_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationName
   (
      This       : access IDataPackagePropertySetView_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationListingUri
   (
      This       : access IDataPackagePropertySetView_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackagePropertySetView2 : aliased constant Windows.IID := (1616138395, 36542, 20459, (156, 30, 117, 230, 157, 229, 75, 132 ));
   
   type IDataPackagePropertySetView2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_PackageFamilyName
   (
      This       : access IDataPackagePropertySetView2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentSourceWebLink
   (
      This       : access IDataPackagePropertySetView2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentSourceApplicationLink
   (
      This       : access IDataPackagePropertySetView2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_Square30x30Logo
   (
      This       : access IDataPackagePropertySetView2_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_LogoBackgroundColor
   (
      This       : access IDataPackagePropertySetView2_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackagePropertySetView3 : aliased constant Windows.IID := (3681963237, 53620, 18780, (132, 252, 26, 81, 246, 171, 69, 215 ));
   
   type IDataPackagePropertySetView3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnterpriseId
   (
      This       : access IDataPackagePropertySetView3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackagePropertySet : aliased constant Windows.IID := (3441202155, 19532, 17466, (168, 211, 245, 194, 65, 233, 22, 137 ));
   
   type IDataPackagePropertySet_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IDataPackagePropertySet_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IDataPackagePropertySet_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IDataPackagePropertySet_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IDataPackagePropertySet_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access IDataPackagePropertySet_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access IDataPackagePropertySet_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_FileTypes
   (
      This       : access IDataPackagePropertySet_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationName
   (
      This       : access IDataPackagePropertySet_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_ApplicationName
   (
      This       : access IDataPackagePropertySet_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ApplicationListingUri
   (
      This       : access IDataPackagePropertySet_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ApplicationListingUri
   (
      This       : access IDataPackagePropertySet_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackagePropertySet2 : aliased constant Windows.IID := (3947912522, 38912, 18090, (177, 129, 123, 111, 15, 43, 145, 154 ));
   
   type IDataPackagePropertySet2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ContentSourceWebLink
   (
      This       : access IDataPackagePropertySet2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentSourceWebLink
   (
      This       : access IDataPackagePropertySet2_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_ContentSourceApplicationLink
   (
      This       : access IDataPackagePropertySet2_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_ContentSourceApplicationLink
   (
      This       : access IDataPackagePropertySet2_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageFamilyName
   (
      This       : access IDataPackagePropertySet2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PackageFamilyName
   (
      This       : access IDataPackagePropertySet2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Square30x30Logo
   (
      This       : access IDataPackagePropertySet2_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Square30x30Logo
   (
      This       : access IDataPackagePropertySet2_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_LogoBackgroundColor
   (
      This       : access IDataPackagePropertySet2_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_LogoBackgroundColor
   (
      This       : access IDataPackagePropertySet2_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackagePropertySet3 : aliased constant Windows.IID := (2659712411, 20997, 16411, (135, 74, 69, 86, 83, 189, 57, 232 ));
   
   type IDataPackagePropertySet3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnterpriseId
   (
      This       : access IDataPackagePropertySet3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_EnterpriseId
   (
      This       : access IDataPackagePropertySet3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMapView_String_Object : aliased constant Windows.IID := (3145224234, 63389, 21754, (146, 201, 144, 197, 3, 159, 223, 126 ));
   
   type IMapView_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMapView_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMapView_String_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMapView_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Split
   (
      This       : access IMapView_String_Object_Interface
      ; first : access Windows.Object
      ; second : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IKeyValuePair : aliased constant Windows.IID := (0, 0, 0, (0, 0, 0, 0, 0, 0, 0, 0 ));
   
   type IIterable_IKeyValuePair_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IKeyValuePair_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMap_String_Object : aliased constant Windows.IID := (453850480, 2167, 24258, (138, 44, 59, 149, 57, 80, 106, 202 ));
   
   type IMap_String_Object_Interface is interface and Windows.IInspectable_Interface;
   
   function Lookup
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HasKey
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IMap_String_Object_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function Insert
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
      ; value : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Remove
   (
      This       : access IMap_String_Object_Interface
      ; key : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IMap_String_Object_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataProviderDeferral : aliased constant Windows.IID := (3268354931, 11558, 17369, (182, 157, 220, 184, 109, 3, 246, 218 ));
   
   type IDataProviderDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IDataProviderDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataProviderRequest : aliased constant Windows.IID := (3954995543, 54216, 18394, (172, 222, 248, 35, 136, 213, 247, 22 ));
   
   type IDataProviderRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_FormatId
   (
      This       : access IDataProviderRequest_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access IDataProviderRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IDataProviderRequest_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataProviderDeferral
   )
   return Windows.HRESULT is abstract;
   
   function SetData
   (
      This       : access IDataProviderRequest_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOperationCompletedEventArgs : aliased constant Windows.IID := (3887018653, 1309, 20395, (177, 169, 71, 253, 119, 247, 10, 65 ));
   
   type IOperationCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Operation
   (
      This       : access IOperationCompletedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IOperationCompletedEventArgs2 : aliased constant Windows.IID := (2240782451, 7705, 16645, (178, 247, 200, 71, 136, 8, 213, 98 ));
   
   type IOperationCompletedEventArgs2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AcceptedFormatId
   (
      This       : access IOperationCompletedEventArgs2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareProvider : aliased constant Windows.IID := (799793190, 17470, 19674, (175, 37, 141, 129, 7, 14, 253, 128 ));
   
   type IShareProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Title
   (
      This       : access IShareProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayIcon
   (
      This       : access IShareProvider_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IShareProvider_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_Tag
   (
      This       : access IShareProvider_Interface
      ; RetVal : access Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function put_Tag
   (
      This       : access IShareProvider_Interface
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareProviderFactory : aliased constant Windows.IID := (388634444, 59294, 20333, (176, 125, 18, 143, 70, 158, 2, 150 ));
   
   type IShareProviderFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IShareProviderFactory_Interface
      ; title : Windows.String
      ; displayIcon : Windows.Storage.Streams.IRandomAccessStreamReference
      ; backgroundColor : Windows.UI.Color
      ; handler : Windows.ApplicationModel.DataTransfer.ShareProviderHandler
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareProviderOperation : aliased constant Windows.IID := (432994615, 54325, 16761, (182, 175, 20, 224, 73, 43, 105, 246 ));
   
   type IShareProviderOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IShareProviderOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackageView
   )
   return Windows.HRESULT is abstract;
   
   function get_Provider
   (
      This       : access IShareProviderOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function ReportCompleted
   (
      This       : access IShareProviderOperation_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareTargetInfo : aliased constant Windows.IID := (945546759, 50920, 16660, (178, 148, 40, 243, 187, 111, 153, 4 ));
   
   type IShareTargetInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AppUserModelId
   (
      This       : access IShareTargetInfo_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ShareProvider
   (
      This       : access IShareTargetInfo_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareCompletedEventArgs : aliased constant Windows.IID := (1165280322, 63763, 20320, (157, 247, 204, 64, 96, 171, 25, 22 ));
   
   type IShareCompletedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ShareTarget
   (
      This       : access IShareCompletedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IShareTargetInfo
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackageView : aliased constant Windows.IID := (2072249457, 22784, 19845, (169, 11, 16, 203, 133, 254, 53, 82 ));
   
   type IDataPackageView_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Properties
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedOperation
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function ReportOperationCompleted
   (
      This       : access IDataPackageView_Interface
      ; value : Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_AvailableFormats
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Contains
   (
      This       : access IDataPackageView_Interface
      ; formatId : Windows.String
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetDataAsync
   (
      This       : access IDataPackageView_Interface
      ; formatId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_Object -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetTextAsync
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCustomTextAsync
   (
      This       : access IDataPackageView_Interface
      ; formatId : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetUriAsync
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetHtmlFormatAsync
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetResourceMapAsync
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRtfAsync
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetBitmapAsync
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IRandomAccessStreamReference -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetStorageItemsAsync
   (
      This       : access IDataPackageView_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackageView2 : aliased constant Windows.IID := (1089256085, 9296, 19485, (182, 180, 237, 69, 70, 61, 238, 156 ));
   
   type IDataPackageView2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetApplicationLinkAsync
   (
      This       : access IDataPackageView2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetWebLinkAsync
   (
      This       : access IDataPackageView2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_IUriRuntimeClass -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackageView3 : aliased constant Windows.IID := (3547820456, 56749, 17032, (132, 40, 209, 202, 227, 148, 18, 139 ));
   
   type IDataPackageView3_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessAsync
   (
      This       : access IDataPackageView3_Interface
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestAccessWithEnterpriseIdAsync
   (
      This       : access IDataPackageView3_Interface
      ; enterpriseId : Windows.String
      ; RetVal : access Windows.Security.EnterpriseData.IAsyncOperation_ProtectionPolicyEvaluationResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UnlockAndAssumeEnterpriseIdentity
   (
      This       : access IDataPackageView3_Interface
      ; RetVal : access Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackageView4 : aliased constant Windows.IID := (3756617503, 57410, 17459, (160, 159, 38, 214, 255, 218, 139, 133 ));
   
   type IDataPackageView4_Interface is interface and Windows.IInspectable_Interface;
   
   function SetAcceptedFormatId
   (
      This       : access IDataPackageView4_Interface
      ; formatId : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackage : aliased constant Windows.IID := (1642853831, 61418, 17222, (149, 84, 152, 29, 126, 25, 143, 254 ));
   
   type IDataPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetView
   (
      This       : access IDataPackage_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackageView
   )
   return Windows.HRESULT is abstract;
   
   function get_Properties
   (
      This       : access IDataPackage_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet
   )
   return Windows.HRESULT is abstract;
   
   function get_RequestedOperation
   (
      This       : access IDataPackage_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function put_RequestedOperation
   (
      This       : access IDataPackage_Interface
      ; value : Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function add_OperationCompleted
   (
      This       : access IDataPackage_Interface
      ; handler : TypedEventHandler_IDataPackage_add_OperationCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_OperationCompleted
   (
      This       : access IDataPackage_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_Destroyed
   (
      This       : access IDataPackage_Interface
      ; handler : TypedEventHandler_IDataPackage_add_Destroyed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Destroyed
   (
      This       : access IDataPackage_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function SetData
   (
      This       : access IDataPackage_Interface
      ; formatId : Windows.String
      ; value : Windows.Object
   )
   return Windows.HRESULT is abstract;
   
   function SetDataProvider
   (
      This       : access IDataPackage_Interface
      ; formatId : Windows.String
      ; delayRenderer : Windows.ApplicationModel.DataTransfer.DataProviderHandler
   )
   return Windows.HRESULT is abstract;
   
   function SetText
   (
      This       : access IDataPackage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetUri
   (
      This       : access IDataPackage_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function SetHtmlFormat
   (
      This       : access IDataPackage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ResourceMap
   (
      This       : access IDataPackage_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetRtf
   (
      This       : access IDataPackage_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SetBitmap
   (
      This       : access IDataPackage_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function SetStorageItemsReadOnly
   (
      This       : access IDataPackage_Interface
      ; value : Windows.Storage.IIterable_IStorageItem
   )
   return Windows.HRESULT is abstract;
   
   function SetStorageItems
   (
      This       : access IDataPackage_Interface
      ; value : Windows.Storage.IIterable_IStorageItem
      ; readOnly : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackage2 : aliased constant Windows.IID := (68952041, 9225, 17889, (165, 56, 76, 83, 238, 238, 4, 167 ));
   
   type IDataPackage2_Interface is interface and Windows.IInspectable_Interface;
   
   function SetApplicationLink
   (
      This       : access IDataPackage2_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function SetWebLink
   (
      This       : access IDataPackage2_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataPackage3 : aliased constant Windows.IID := (2297634653, 30843, 19762, (150, 90, 169, 131, 129, 5, 160, 86 ));
   
   type IDataPackage3_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ShareCompleted
   (
      This       : access IDataPackage3_Interface
      ; handler : TypedEventHandler_IDataPackage3_add_ShareCompleted
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ShareCompleted
   (
      This       : access IDataPackage3_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHtmlFormatHelperStatics : aliased constant Windows.IID := (3794696009, 56688, 17519, (174, 252, 97, 206, 229, 159, 101, 94 ));
   
   type IHtmlFormatHelperStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetStaticFragment
   (
      This       : access IHtmlFormatHelperStatics_Interface
      ; htmlFormat : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CreateHtmlFormat
   (
      This       : access IHtmlFormatHelperStatics_Interface
      ; htmlFragment : Windows.String
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IClipboardStatics : aliased constant Windows.IID := (3324502673, 13538, 18787, (142, 237, 147, 203, 176, 234, 61, 112 ));
   
   type IClipboardStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetContent
   (
      This       : access IClipboardStatics_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackageView
   )
   return Windows.HRESULT is abstract;
   
   function SetContent
   (
      This       : access IClipboardStatics_Interface
      ; content : Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function Flush
   (
      This       : access IClipboardStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IClipboardStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_ContentChanged
   (
      This       : access IClipboardStatics_Interface
      ; changeHandler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ContentChanged
   (
      This       : access IClipboardStatics_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareUIOptions : aliased constant Windows.IID := (1929022080, 13359, 19856, (149, 81, 42, 224, 78, 55, 104, 12 ));
   
   type IShareUIOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Theme
   (
      This       : access IShareUIOptions_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.ShareUITheme
   )
   return Windows.HRESULT is abstract;
   
   function put_Theme
   (
      This       : access IShareUIOptions_Interface
      ; value : Windows.ApplicationModel.DataTransfer.ShareUITheme
   )
   return Windows.HRESULT is abstract;
   
   function get_SelectionRect
   (
      This       : access IShareUIOptions_Interface
      ; RetVal : access Windows.Foundation.IReference_Rect -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_SelectionRect
   (
      This       : access IShareUIOptions_Interface
      ; value : Windows.Foundation.IReference_Rect
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataRequestDeferral : aliased constant Windows.IID := (1841608863, 902, 16995, (135, 193, 237, 125, 206, 48, 137, 14 ));
   
   type IDataRequestDeferral_Interface is interface and Windows.IInspectable_Interface;
   
   function Complete
   (
      This       : access IDataRequestDeferral_Interface
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataRequest : aliased constant Windows.IID := (1128377915, 64530, 20051, (140, 2, 172, 113, 76, 65, 90, 39 ));
   
   type IDataRequest_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Data
   (
      This       : access IDataRequest_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function put_Data
   (
      This       : access IDataRequest_Interface
      ; value : Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Deadline
   (
      This       : access IDataRequest_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function FailWithDisplayText
   (
      This       : access IDataRequest_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IDataRequest_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataRequestDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataRequestedEventArgs : aliased constant Windows.IID := (3414927367, 27333, 17353, (138, 197, 155, 162, 50, 22, 49, 130 ));
   
   type IDataRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Request
   (
      This       : access IDataRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataRequest
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IShareProvidersRequestedEventArgs : aliased constant Windows.IID := (4169724758, 41976, 20430, (133, 228, 136, 38, 230, 59, 231, 153 ));
   
   type IShareProvidersRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Providers
   (
      This       : access IShareProvidersRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IVector_IShareProvider -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access IShareProvidersRequestedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackageView
   )
   return Windows.HRESULT is abstract;
   
   function GetDeferral
   (
      This       : access IShareProvidersRequestedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ITargetApplicationChosenEventArgs : aliased constant Windows.IID := (3396319404, 10631, 20195, (156, 84, 216, 175, 188, 184, 108, 29 ));
   
   type ITargetApplicationChosenEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ApplicationName
   (
      This       : access ITargetApplicationChosenEventArgs_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTransferManager : aliased constant Windows.IID := (2781539995, 34568, 18897, (141, 54, 103, 210, 90, 141, 160, 12 ));
   
   type IDataTransferManager_Interface is interface and Windows.IInspectable_Interface;
   
   function add_DataRequested
   (
      This       : access IDataTransferManager_Interface
      ; eventHandler : TypedEventHandler_IDataTransferManager_add_DataRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_DataRequested
   (
      This       : access IDataTransferManager_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_TargetApplicationChosen
   (
      This       : access IDataTransferManager_Interface
      ; eventHandler : TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_TargetApplicationChosen
   (
      This       : access IDataTransferManager_Interface
      ; eventCookie : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTransferManager2 : aliased constant Windows.IID := (816741745, 35752, 19458, (142, 63, 221, 178, 59, 56, 135, 21 ));
   
   type IDataTransferManager2_Interface is interface and Windows.IInspectable_Interface;
   
   function add_ShareProvidersRequested
   (
      This       : access IDataTransferManager2_Interface
      ; handler : TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ShareProvidersRequested
   (
      This       : access IDataTransferManager2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTransferManagerStatics : aliased constant Windows.IID := (2849636778, 57358, 19710, (170, 68, 45, 217, 50, 220, 163, 216 ));
   
   type IDataTransferManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowShareUI
   (
      This       : access IDataTransferManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetForCurrentView
   (
      This       : access IDataTransferManagerStatics_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataTransferManager
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTransferManagerStatics2 : aliased constant Windows.IID := (3310273260, 40855, 19811, (152, 104, 57, 94, 39, 26, 216, 245 ));
   
   type IDataTransferManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access IDataTransferManagerStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDataTransferManagerStatics3 : aliased constant Windows.IID := (92558451, 27778, 20316, (172, 35, 98, 228, 88, 54, 31, 172 ));
   
   type IDataTransferManagerStatics3_Interface is interface and Windows.IInspectable_Interface;
   
   function ShowShareUIWithOptions
   (
      This       : access IDataTransferManagerStatics3_Interface
      ; options : Windows.ApplicationModel.DataTransfer.IShareUIOptions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISharedStorageAccessManagerStatics : aliased constant Windows.IID := (3323144922, 13489, 18505, (189, 95, 208, 159, 238, 49, 88, 197 ));
   
   type ISharedStorageAccessManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function AddFile
   (
      This       : access ISharedStorageAccessManagerStatics_Interface
      ; file : Windows.Storage.IStorageFile
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function RedeemTokenForFileAsync
   (
      This       : access ISharedStorageAccessManagerStatics_Interface
      ; token : Windows.String
      ; RetVal : access Windows.Storage.IAsyncOperation_IStorageFile -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RemoveFile
   (
      This       : access ISharedStorageAccessManagerStatics_Interface
      ; token : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_DataPackageOperation : aliased constant Windows.IID := (2342039209, 25840, 22130, (179, 14, 223, 217, 194, 228, 246, 254 ));
   
   type IAsyncOperation_DataPackageOperation_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_DataPackageOperation_Interface
      ; handler : Windows.ApplicationModel.DataTransfer.AsyncOperationCompletedHandler_DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_DataPackageOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.AsyncOperationCompletedHandler_DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_DataPackageOperation_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.DataPackageOperation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IShareProvider : aliased constant Windows.IID := (2288997954, 59897, 22331, (146, 19, 88, 64, 181, 6, 43, 64 ));
   
   type IIterator_IShareProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IShareProvider_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IShareProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IShareProvider_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IShareProvider_Interface
      ; items : Windows.ApplicationModel.DataTransfer.IShareProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IShareProvider : aliased constant Windows.IID := (151237144, 23725, 21478, (154, 33, 111, 75, 49, 196, 164, 9 ));
   
   type IIterable_IShareProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IShareProvider_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IIterator_IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IShareProvider : aliased constant Windows.IID := (2489661346, 37676, 23415, (171, 54, 183, 6, 80, 240, 188, 213 ));
   
   type IVectorView_IShareProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IShareProvider_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IShareProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IShareProvider_Interface
      ; value : Windows.ApplicationModel.DataTransfer.IShareProvider
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IShareProvider_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.DataTransfer.IShareProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IShareProvider : aliased constant Windows.IID := (2707978341, 12770, 21814, (151, 236, 41, 34, 105, 167, 128, 70 ));
   
   type IVector_IShareProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IShareProvider_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IShareProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IShareProvider_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IVectorView_IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IShareProvider_Interface
      ; value : Windows.ApplicationModel.DataTransfer.IShareProvider
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IShareProvider_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IShareProvider_Interface
      ; index : Windows.UInt32
      ; value : Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IShareProvider_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IShareProvider_Interface
      ; value : Windows.ApplicationModel.DataTransfer.IShareProvider
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IShareProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IShareProvider_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IShareProvider_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.ApplicationModel.DataTransfer.IShareProvider_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IShareProvider_Interface
      ; items : Windows.ApplicationModel.DataTransfer.IShareProvider_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDataPackage : aliased constant Windows.IID := (2708417799, 60115, 21476, (148, 144, 117, 189, 186, 235, 122, 91 ));
   
   type IAsyncOperation_IDataPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDataPackage_Interface
      ; handler : Windows.ApplicationModel.DataTransfer.AsyncOperationCompletedHandler_IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDataPackage_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.AsyncOperationCompletedHandler_IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDataPackage_Interface
      ; RetVal : access Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_DataProviderHandler : aliased constant Windows.IID := (3891058464, 62196, 18989, (146, 14, 23, 10, 47, 72, 42, 39 ));
   
   type DataProviderHandler_Interface(Callback : access procedure (request : Windows.ApplicationModel.DataTransfer.IDataProviderRequest)) is new Windows.IMulticastDelegate_Interface(IID_DataProviderHandler'access) with null record;
   function Invoke
   (
      This       : access DataProviderHandler_Interface
      ; request : Windows.ApplicationModel.DataTransfer.IDataProviderRequest
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_ShareProviderHandler : aliased constant Windows.IID := (3891911098, 57786, 20045, (189, 101, 212, 56, 69, 211, 33, 47 ));
   
   type ShareProviderHandler_Interface(Callback : access procedure (operation : Windows.ApplicationModel.DataTransfer.IShareProviderOperation)) is new Windows.IMulticastDelegate_Interface(IID_ShareProviderHandler'access) with null record;
   function Invoke
   (
      This       : access ShareProviderHandler_Interface
      ; operation : Windows.ApplicationModel.DataTransfer.IShareProviderOperation
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDataPackage_add_OperationCompleted : aliased constant Windows.IID := (3712528236, 61338, 22987, (179, 38, 87, 217, 226, 65, 31, 33 ));
   
   type TypedEventHandler_IDataPackage_add_OperationCompleted_Interface(Callback : access procedure (sender : Windows.ApplicationModel.DataTransfer.IDataPackage ; args : Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDataPackage_add_OperationCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDataPackage_add_OperationCompleted_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataPackage
      ; args : Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDataPackage_add_Destroyed : aliased constant Windows.IID := (3243684035, 7356, 23716, (144, 28, 98, 197, 168, 202, 92, 181 ));
   
   type TypedEventHandler_IDataPackage_add_Destroyed_Interface(Callback : access procedure (sender : Windows.ApplicationModel.DataTransfer.IDataPackage ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDataPackage_add_Destroyed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDataPackage_add_Destroyed_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataPackage
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDataPackage3_add_ShareCompleted : aliased constant Windows.IID := (4176994890, 22270, 22751, (188, 21, 35, 101, 174, 192, 57, 102 ));
   
   type TypedEventHandler_IDataPackage3_add_ShareCompleted_Interface(Callback : access procedure (sender : Windows.ApplicationModel.DataTransfer.IDataPackage ; args : Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDataPackage3_add_ShareCompleted'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDataPackage3_add_ShareCompleted_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataPackage
      ; args : Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_DataPackageOperation : aliased constant Windows.IID := (2916228422, 6111, 23107, (166, 133, 50, 98, 252, 232, 70, 67 ));
   
   type AsyncOperationCompletedHandler_DataPackageOperation_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_DataPackageOperation'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DataPackageOperation_Interface
      ; asyncInfo : Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDataTransferManager_add_DataRequested : aliased constant Windows.IID := (3966737608, 18128, 24078, (180, 210, 125, 119, 115, 174, 55, 160 ));
   
   type TypedEventHandler_IDataTransferManager_add_DataRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager ; args : Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDataTransferManager_add_DataRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDataTransferManager_add_DataRequested_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager
      ; args : Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen : aliased constant Windows.IID := (3299613602, 30801, 23108, (188, 141, 61, 124, 113, 63, 31, 65 ));
   
   type TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen_Interface(Callback : access procedure (sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager ; args : Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager
      ; args : Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested : aliased constant Windows.IID := (343812192, 29591, 22575, (128, 219, 184, 104, 83, 131, 169, 55 ));
   
   type TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested_Interface(Callback : access procedure (sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager ; args : Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager
      ; args : Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDataPackage : aliased constant Windows.IID := (2839165849, 59718, 22478, (170, 217, 194, 61, 19, 140, 53, 62 ));
   
   type AsyncOperationCompletedHandler_IDataPackage_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.DataTransfer.IAsyncOperation_IDataPackage ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDataPackage'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDataPackage_Interface
      ; asyncInfo : Windows.ApplicationModel.DataTransfer.IAsyncOperation_IDataPackage
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DataPackagePropertySetView is Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView;
   subtype DataPackagePropertySet is Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet;
   subtype DataProviderDeferral is Windows.ApplicationModel.DataTransfer.IDataProviderDeferral;
   subtype DataProviderRequest is Windows.ApplicationModel.DataTransfer.IDataProviderRequest;
   subtype OperationCompletedEventArgs is Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs;
   subtype ShareProviderOperation is Windows.ApplicationModel.DataTransfer.IShareProviderOperation;
   subtype ShareProvider is Windows.ApplicationModel.DataTransfer.IShareProvider;
   function Create
   (
      title : Windows.String
      ; displayIcon : Windows.Storage.Streams.IRandomAccessStreamReference
      ; backgroundColor : Windows.UI.Color
      ; handler : Windows.ApplicationModel.DataTransfer.ShareProviderHandler
   )
   return Windows.ApplicationModel.DataTransfer.IShareProvider;
   
   subtype DataPackageView is Windows.ApplicationModel.DataTransfer.IDataPackageView;
   subtype ShareTargetInfo is Windows.ApplicationModel.DataTransfer.IShareTargetInfo;
   subtype ShareCompletedEventArgs is Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs;
   subtype DataPackage is Windows.ApplicationModel.DataTransfer.IDataPackage;
   function CreateDataPackage return Windows.ApplicationModel.DataTransfer.IDataPackage;
   
   subtype ShareUIOptions is Windows.ApplicationModel.DataTransfer.IShareUIOptions;
   function CreateShareUIOptions return Windows.ApplicationModel.DataTransfer.IShareUIOptions;
   
   subtype DataRequestDeferral is Windows.ApplicationModel.DataTransfer.IDataRequestDeferral;
   subtype DataRequest is Windows.ApplicationModel.DataTransfer.IDataRequest;
   subtype DataRequestedEventArgs is Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs;
   subtype ShareProvidersRequestedEventArgs is Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs;
   subtype TargetApplicationChosenEventArgs is Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs;
   subtype DataTransferManager is Windows.ApplicationModel.DataTransfer.IDataTransferManager;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_Text
   return Windows.String;
   
   function get_Uri
   return Windows.String;
   
   function get_Html
   return Windows.String;
   
   function get_Rtf
   return Windows.String;
   
   function get_Bitmap
   return Windows.String;
   
   function get_StorageItems
   return Windows.String;
   
   function get_WebLink
   return Windows.String;
   
   function get_ApplicationLink
   return Windows.String;
   
   function GetStaticFragment
   (
      htmlFormat : Windows.String
   )
   return Windows.String;
   
   function CreateHtmlFormat
   (
      htmlFragment : Windows.String
   )
   return Windows.String;
   
   function GetContent
   return Windows.ApplicationModel.DataTransfer.IDataPackageView;
   
   procedure SetContent
   (
      content : Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   ;
   
   procedure Flush
   ;
   
   procedure Clear
   ;
   
   function add_ContentChanged
   (
      changeHandler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken;
   
   procedure remove_ContentChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   ;
   
   procedure ShowShareUIWithOptions
   (
      options : Windows.ApplicationModel.DataTransfer.IShareUIOptions
   )
   ;
   
   procedure ShowShareUI
   ;
   
   function GetForCurrentView
   return Windows.ApplicationModel.DataTransfer.IDataTransferManager;
   
   function IsSupported
   return Windows.Boolean;
   
   function AddFile
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.String;
   
   function RedeemTokenForFileAsync
   (
      token : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile;
   
   procedure RemoveFile
   (
      token : Windows.String
   )
   ;
   
end;
