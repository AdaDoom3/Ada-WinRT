--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.SocialInfo.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ISocialFeedUpdater_Interface;
   type AsyncOperationCompletedHandler_ISocialFeedUpdater is access all AsyncOperationCompletedHandler_ISocialFeedUpdater_Interface'Class;
   type AsyncOperationCompletedHandler_ISocialFeedUpdater_Ptr is access all AsyncOperationCompletedHandler_ISocialFeedUpdater;
   type AsyncOperationCompletedHandler_ISocialDashboardItemUpdater_Interface;
   type AsyncOperationCompletedHandler_ISocialDashboardItemUpdater is access all AsyncOperationCompletedHandler_ISocialDashboardItemUpdater_Interface'Class;
   type AsyncOperationCompletedHandler_ISocialDashboardItemUpdater_Ptr is access all AsyncOperationCompletedHandler_ISocialDashboardItemUpdater;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISocialFeedUpdater_Interface;
   type ISocialFeedUpdater is access all ISocialFeedUpdater_Interface'Class;
   type ISocialFeedUpdater_Ptr is access all ISocialFeedUpdater;
   type ISocialDashboardItemUpdater_Interface;
   type ISocialDashboardItemUpdater is access all ISocialDashboardItemUpdater_Interface'Class;
   type ISocialDashboardItemUpdater_Ptr is access all ISocialDashboardItemUpdater;
   type ISocialInfoProviderManagerStatics_Interface;
   type ISocialInfoProviderManagerStatics is access all ISocialInfoProviderManagerStatics_Interface'Class;
   type ISocialInfoProviderManagerStatics_Ptr is access all ISocialInfoProviderManagerStatics;
   type IAsyncOperation_ISocialFeedUpdater_Interface;
   type IAsyncOperation_ISocialFeedUpdater is access all IAsyncOperation_ISocialFeedUpdater_Interface'Class;
   type IAsyncOperation_ISocialFeedUpdater_Ptr is access all IAsyncOperation_ISocialFeedUpdater;
   type IAsyncOperation_ISocialDashboardItemUpdater_Interface;
   type IAsyncOperation_ISocialDashboardItemUpdater is access all IAsyncOperation_ISocialDashboardItemUpdater_Interface'Class;
   type IAsyncOperation_ISocialDashboardItemUpdater_Ptr is access all IAsyncOperation_ISocialDashboardItemUpdater;
   
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
   type ISocialFeedUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OwnerRemoteId
   (
      This       : access ISocialFeedUpdater_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Kind
   (
      This       : access ISocialFeedUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.SocialFeedKind
   )
   return Windows.HRESULT is abstract;
   
   function get_Items
   (
      This       : access ISocialFeedUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.IVector_ISocialFeedItem -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CommitAsync
   (
      This       : access ISocialFeedUpdater_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_ISocialFeedUpdater : aliased constant Windows.IID := (2047609511, 60809, 19413, (168, 217, 21, 244, 217, 134, 28, 16 ));
   
   ------------------------------------------------------------------------
   type ISocialDashboardItemUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function get_OwnerRemoteId
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Content
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialFeedContent
   )
   return Windows.HRESULT is abstract;
   
   function get_Timestamp
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_Timestamp
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; value : Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function put_Thumbnail
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; value : Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function get_Thumbnail
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.ISocialItemThumbnail
   )
   return Windows.HRESULT is abstract;
   
   function CommitAsync
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function get_TargetUri
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_TargetUri
   (
      This       : access ISocialDashboardItemUpdater_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   IID_ISocialDashboardItemUpdater : aliased constant Windows.IID := (1021222345, 18432, 18125, (134, 155, 25, 115, 236, 104, 91, 222 ));
   
   ------------------------------------------------------------------------
   type ISocialInfoProviderManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateSocialFeedUpdaterAsync
   (
      This       : access ISocialInfoProviderManagerStatics_Interface
      ; kind : Windows.ApplicationModel.SocialInfo.SocialFeedKind
      ; mode : Windows.ApplicationModel.SocialInfo.SocialFeedUpdateMode
      ; ownerRemoteId : Windows.String
      ; RetVal : access Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialFeedUpdater -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateDashboardItemUpdaterAsync
   (
      This       : access ISocialInfoProviderManagerStatics_Interface
      ; ownerRemoteId : Windows.String
      ; RetVal : access Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialDashboardItemUpdater -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function UpdateBadgeCountValue
   (
      This       : access ISocialInfoProviderManagerStatics_Interface
      ; itemRemoteId : Windows.String
      ; newCount : Windows.Int32
   )
   return Windows.HRESULT is abstract;
   
   function ReportNewContentAvailable
   (
      This       : access ISocialInfoProviderManagerStatics_Interface
      ; contactRemoteId : Windows.String
      ; kind : Windows.ApplicationModel.SocialInfo.SocialFeedKind
   )
   return Windows.HRESULT is abstract;
   
   function ProvisionAsync
   (
      This       : access ISocialInfoProviderManagerStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DeprovisionAsync
   (
      This       : access ISocialInfoProviderManagerStatics_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_ISocialInfoProviderManagerStatics : aliased constant Windows.IID := (461956395, 30599, 18646, (170, 18, 216, 232, 244, 122, 184, 90 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISocialFeedUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISocialFeedUpdater_Interface
      ; handler : Windows.ApplicationModel.SocialInfo.Provider.AsyncOperationCompletedHandler_ISocialFeedUpdater
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISocialFeedUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.Provider.AsyncOperationCompletedHandler_ISocialFeedUpdater
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISocialFeedUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.Provider.ISocialFeedUpdater
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISocialFeedUpdater : aliased constant Windows.IID := (1325026729, 50518, 23028, (157, 153, 231, 128, 28, 91, 15, 69 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_ISocialDashboardItemUpdater_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISocialDashboardItemUpdater_Interface
      ; handler : Windows.ApplicationModel.SocialInfo.Provider.AsyncOperationCompletedHandler_ISocialDashboardItemUpdater
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.Provider.AsyncOperationCompletedHandler_ISocialDashboardItemUpdater
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISocialDashboardItemUpdater_Interface
      ; RetVal : access Windows.ApplicationModel.SocialInfo.Provider.ISocialDashboardItemUpdater
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_ISocialDashboardItemUpdater : aliased constant Windows.IID := (2344397220, 42236, 24546, (182, 177, 14, 90, 117, 208, 91, 7 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISocialFeedUpdater_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialFeedUpdater ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISocialFeedUpdater_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISocialFeedUpdater_Interface
      ; asyncInfo : Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialFeedUpdater
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISocialFeedUpdater : aliased constant Windows.IID := (186807412, 32960, 24371, (159, 249, 35, 68, 3, 171, 214, 250 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_ISocialDashboardItemUpdater_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialDashboardItemUpdater ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_ISocialDashboardItemUpdater_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISocialDashboardItemUpdater_Interface
      ; asyncInfo : Windows.ApplicationModel.SocialInfo.Provider.IAsyncOperation_ISocialDashboardItemUpdater
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_ISocialDashboardItemUpdater : aliased constant Windows.IID := (869259690, 27708, 20703, (187, 200, 52, 194, 42, 14, 91, 107 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SocialFeedUpdater is Windows.ApplicationModel.SocialInfo.Provider.ISocialFeedUpdater;
   subtype SocialDashboardItemUpdater is Windows.ApplicationModel.SocialInfo.Provider.ISocialDashboardItemUpdater;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   

end;