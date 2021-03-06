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
with Windows.UI;
with Windows.Storage;
with Windows.Security.EnterpriseData;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.DataTransfer is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access DataProviderHandler_Interface
      ; request : Windows.ApplicationModel.DataTransfer.IDataProviderRequest
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IDataProviderRequest(request));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access ShareProviderHandler_Interface
      ; operation : Windows.ApplicationModel.DataTransfer.IShareProviderOperation
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IShareProviderOperation(operation));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDataPackage_add_OperationCompleted_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataPackage
      ; args : Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IDataPackage(sender), Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDataPackage_add_Destroyed_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataPackage
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IDataPackage(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDataPackage3_add_ShareCompleted_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataPackage
      ; args : Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IDataPackage(sender), Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_DataPackageOperation_Interface
      ; asyncInfo : Windows.ApplicationModel.DataTransfer.IAsyncOperation_DataPackageOperation
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDataTransferManager_add_DataRequested_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager
      ; args : Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IDataTransferManager(sender), Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDataTransferManager_add_TargetApplicationChosen_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager
      ; args : Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IDataTransferManager(sender), Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IDataTransferManager2_add_ShareProvidersRequested_Interface
      ; sender : Windows.ApplicationModel.DataTransfer.IDataTransferManager
      ; args : Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.DataTransfer.IDataTransferManager(sender), Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDataPackage_Interface
      ; asyncInfo : Windows.ApplicationModel.DataTransfer.IAsyncOperation_IDataPackage
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      title : Windows.String
      ; displayIcon : Windows.Storage.Streams.IRandomAccessStreamReference
      ; backgroundColor : Windows.UI.Color
      ; handler : Windows.ApplicationModel.DataTransfer.ShareProviderHandler
   )
   return Windows.ApplicationModel.DataTransfer.IShareProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.ShareProvider");
      m_Factory     : Windows.ApplicationModel.DataTransfer.IShareProviderFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.DataTransfer.IShareProvider := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IShareProviderFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(title, displayIcon, backgroundColor, handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateDataPackage return Windows.ApplicationModel.DataTransfer.IDataPackage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.DataPackage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.DataTransfer.IDataPackage) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.DataTransfer.IID_IDataPackage'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateShareUIOptions return Windows.ApplicationModel.DataTransfer.IShareUIOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.ShareUIOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.DataTransfer.IShareUIOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.DataTransfer.IID_IShareUIOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function get_Text
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Text(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Uri
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Uri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Html
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Html(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rtf
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rtf(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bitmap
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bitmap(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StorageItems
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StorageItems(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WebLink
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WebLink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ApplicationLink
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.StandardDataFormats");
      m_Factory     : IStandardDataFormatsStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardDataFormatsStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ApplicationLink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStaticFragment
   (
      htmlFormat : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.HtmlFormatHelper");
      m_Factory     : IHtmlFormatHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHtmlFormatHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStaticFragment(htmlFormat, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateHtmlFormat
   (
      htmlFragment : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.HtmlFormatHelper");
      m_Factory     : IHtmlFormatHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHtmlFormatHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateHtmlFormat(htmlFragment, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetContent
   return Windows.ApplicationModel.DataTransfer.IDataPackageView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.Clipboard");
      m_Factory     : IClipboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.DataTransfer.IDataPackageView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClipboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetContent(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetContent
   (
      content : Windows.ApplicationModel.DataTransfer.IDataPackage
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.Clipboard");
      m_Factory     : IClipboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClipboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetContent(content);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure Flush
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.Clipboard");
      m_Factory     : IClipboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClipboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Flush;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure Clear
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.Clipboard");
      m_Factory     : IClipboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClipboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Clear;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_ContentChanged
   (
      changeHandler : Windows.Foundation.EventHandler_Object
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.Clipboard");
      m_Factory     : IClipboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClipboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_ContentChanged(changeHandler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_ContentChanged
   (
      token : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.Clipboard");
      m_Factory     : IClipboardStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClipboardStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_ContentChanged(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ShowShareUIWithOptions
   (
      options : Windows.ApplicationModel.DataTransfer.IShareUIOptions
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.DataTransferManager");
      m_Factory     : IDataTransferManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTransferManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowShareUIWithOptions(options);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure ShowShareUI
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.DataTransferManager");
      m_Factory     : IDataTransferManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTransferManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowShareUI;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetForCurrentView
   return Windows.ApplicationModel.DataTransfer.IDataTransferManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.DataTransferManager");
      m_Factory     : IDataTransferManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.DataTransfer.IDataTransferManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTransferManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function IsSupported
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.DataTransferManager");
      m_Factory     : IDataTransferManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDataTransferManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.IsSupported(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function AddFile
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.SharedStorageAccessManager");
      m_Factory     : ISharedStorageAccessManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISharedStorageAccessManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.AddFile(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RedeemTokenForFileAsync
   (
      token : Windows.String
   )
   return Windows.Storage.IAsyncOperation_IStorageFile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.SharedStorageAccessManager");
      m_Factory     : ISharedStorageAccessManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.IAsyncOperation_IStorageFile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISharedStorageAccessManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RedeemTokenForFileAsync(token, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure RemoveFile
   (
      token : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.DataTransfer.SharedStorageAccessManager");
      m_Factory     : ISharedStorageAccessManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISharedStorageAccessManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RemoveFile(token);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
end;
