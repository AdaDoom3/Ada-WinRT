--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Security.Credentials;
with Windows.Storage;
with Windows.Storage.Streams;
with Windows.Web;
with Windows.UI.Notifications;
with Windows.ApplicationModel.Background;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.BackgroundTransfer is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IUnconstrainedTransferRequestResult_Interface
      ; asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IDownloadOperation_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IDownloadOperation or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IDownloadOperation_Interface
      ; asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IDownloadOperation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IUploadOperation_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IUploadOperation or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IUploadOperation_Interface
      ; asyncInfo : Windows.Networking.BackgroundTransfer.IAsyncOperation_IUploadOperation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IDownloadOperation3_add_RangesDownloaded or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IDownloadOperation3_add_RangesDownloaded_Interface
      ; sender : Windows.Networking.BackgroundTransfer.IDownloadOperation
      ; args : Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.BackgroundTransfer.IDownloadOperation(sender), Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateBackgroundTransferCompletionGroup return Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundTransferCompletionGroup");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.BackgroundTransfer.IID_IBackgroundTransferCompletionGroup'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBackgroundTransferContentPart return Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundTransferContentPart");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.BackgroundTransfer.IBackgroundTransferContentPart := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.BackgroundTransfer.IID_IBackgroundTransferContentPart'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBackgroundDownloader return Windows.Networking.BackgroundTransfer.IBackgroundDownloader is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundDownloader");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.BackgroundTransfer.IBackgroundDownloader := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Networking.BackgroundTransfer.IID_IBackgroundDownloader'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithCompletionGroup
   (
      completionGroup : Windows.Networking.BackgroundTransfer.IBackgroundTransferCompletionGroup
   )
   return Windows.Networking.BackgroundTransfer.IBackgroundUploader is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundUploader");
      m_Factory     : Windows.Networking.BackgroundTransfer.IBackgroundUploaderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.BackgroundTransfer.IBackgroundUploader := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundUploaderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithCompletionGroup(completionGroup, RetVal'Access);
         RefCount := m_Factory.Release;
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
   
   
   function CreateGroup
   (
      name : Windows.String
   )
   return Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundTransferGroup");
      m_Factory     : IBackgroundTransferGroupStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundTransferGroupStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateGroup(name, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentDownloadsAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundDownloader");
      m_Factory     : IBackgroundDownloaderStaticMethods := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundDownloaderStaticMethods'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentDownloadsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentDownloadsForGroupAsync
   (
      group : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundDownloader");
      m_Factory     : IBackgroundDownloaderStaticMethods := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundDownloaderStaticMethods'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentDownloadsForGroupAsync(group, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestUnconstrainedDownloadsAsync
   (
      operations : Windows.Networking.BackgroundTransfer.IIterable_IDownloadOperation
   )
   return Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundDownloader");
      m_Factory     : IBackgroundDownloaderUserConsent := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundDownloaderUserConsent'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestUnconstrainedDownloadsAsync(operations, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentDownloadsForTransferGroupAsync
   (
      group : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundDownloader");
      m_Factory     : IBackgroundDownloaderStaticMethods2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundDownloaderStaticMethods2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentDownloadsForTransferGroupAsync(group, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentUploadsAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundUploader");
      m_Factory     : IBackgroundUploaderStaticMethods := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundUploaderStaticMethods'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentUploadsAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentUploadsForGroupAsync
   (
      group : Windows.String
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundUploader");
      m_Factory     : IBackgroundUploaderStaticMethods := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundUploaderStaticMethods'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentUploadsForGroupAsync(group, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestUnconstrainedUploadsAsync
   (
      operations : Windows.Networking.BackgroundTransfer.IIterable_IUploadOperation
   )
   return Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundUploader");
      m_Factory     : IBackgroundUploaderUserConsent := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.BackgroundTransfer.IAsyncOperation_IUnconstrainedTransferRequestResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundUploaderUserConsent'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestUnconstrainedUploadsAsync(operations, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCurrentUploadsForTransferGroupAsync
   (
      group : Windows.Networking.BackgroundTransfer.IBackgroundTransferGroup
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundUploader");
      m_Factory     : IBackgroundUploaderStaticMethods2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundUploaderStaticMethods2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCurrentUploadsForTransferGroupAsync(group, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStatus
   (
      hresult : Windows.Int32
   )
   return Windows.Web.WebErrorStatus is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.BackgroundTransferError");
      m_Factory     : IBackgroundTransferErrorStaticMethods := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.WebErrorStatus;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundTransferErrorStaticMethods'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStatus(hresult, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContentUris
   return Windows.Foundation.IVector_IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.ContentPrefetcher");
      m_Factory     : IContentPrefetcher := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IVector_IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentPrefetcher'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContentUris(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_IndirectContentUri
   (
      value : Windows.Foundation.IUriRuntimeClass
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.ContentPrefetcher");
      m_Factory     : IContentPrefetcher := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentPrefetcher'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_IndirectContentUri(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IndirectContentUri
   return Windows.Foundation.IUriRuntimeClass is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.ContentPrefetcher");
      m_Factory     : IContentPrefetcher := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IUriRuntimeClass;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentPrefetcher'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IndirectContentUri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LastSuccessfulPrefetchTime
   return Windows.Foundation.IReference_DateTime is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.BackgroundTransfer.ContentPrefetcher");
      m_Factory     : IContentPrefetcherTime := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IReference_DateTime;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IContentPrefetcherTime'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LastSuccessfulPrefetchTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;