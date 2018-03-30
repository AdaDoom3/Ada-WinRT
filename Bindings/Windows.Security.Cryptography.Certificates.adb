--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage.Streams;
with Windows.Networking;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Cryptography.Certificates is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_ICertificateChain_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_ICertificateChain or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_ICertificateChain_Interface
      ; asyncInfo : Windows.Security.Cryptography.Certificates.IAsyncOperation_ICertificateChain
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_SignatureValidationResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_SignatureValidationResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_SignatureValidationResult_Interface
      ; asyncInfo : Windows.Security.Cryptography.Certificates.IAsyncOperation_SignatureValidationResult
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
   
   
   function CreateCertificateExtension return Windows.Security.Cryptography.Certificates.ICertificateExtension is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateExtension");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificateExtension := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_ICertificateExtension'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCertificate
   (
      certBlob : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Certificates.ICertificate is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.Certificate");
      m_Factory     : Windows.Security.Cryptography.Certificates.ICertificateFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificate := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCertificate(certBlob, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateSubjectAlternativeNameInfo return Windows.Security.Cryptography.Certificates.ISubjectAlternativeNameInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.SubjectAlternativeNameInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ISubjectAlternativeNameInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_ISubjectAlternativeNameInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCertificateRequestProperties return Windows.Security.Cryptography.Certificates.ICertificateRequestProperties is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateRequestProperties");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificateRequestProperties := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_ICertificateRequestProperties'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePfxImportParameters return Windows.Security.Cryptography.Certificates.IPfxImportParameters is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.PfxImportParameters");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.IPfxImportParameters := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_IPfxImportParameters'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCertificateQuery return Windows.Security.Cryptography.Certificates.ICertificateQuery is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateQuery");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificateQuery := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_ICertificateQuery'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateChainBuildingParameters return Windows.Security.Cryptography.Certificates.IChainBuildingParameters is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.ChainBuildingParameters");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.IChainBuildingParameters := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_IChainBuildingParameters'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateChainValidationParameters return Windows.Security.Cryptography.Certificates.IChainValidationParameters is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.ChainValidationParameters");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.IChainValidationParameters := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_IChainValidationParameters'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCertificateKeyUsages return Windows.Security.Cryptography.Certificates.ICertificateKeyUsages is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateKeyUsages");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificateKeyUsages := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_ICertificateKeyUsages'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCmsSignerInfo return Windows.Security.Cryptography.Certificates.ICmsSignerInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CmsSignerInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICmsSignerInfo := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Cryptography.Certificates.IID_ICmsSignerInfo'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCmsAttachedSignature
   (
      inputBlob : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Certificates.ICmsAttachedSignature is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CmsAttachedSignature");
      m_Factory     : Windows.Security.Cryptography.Certificates.ICmsAttachedSignatureFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICmsAttachedSignature := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICmsAttachedSignatureFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCmsAttachedSignature(inputBlob, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCmsDetachedSignature
   (
      inputBlob : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Certificates.ICmsDetachedSignature is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CmsDetachedSignature");
      m_Factory     : Windows.Security.Cryptography.Certificates.ICmsDetachedSignatureFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICmsDetachedSignature := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICmsDetachedSignatureFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCmsDetachedSignature(inputBlob, RetVal'Access);
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
   
   
   function ImportPfxDataToKspWithParametersAsync
   (
      pfxData : Windows.String
      ; password : Windows.String
      ; pfxImportParameters : Windows.Security.Cryptography.Certificates.IPfxImportParameters
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager");
      m_Factory     : ICertificateEnrollmentManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateEnrollmentManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ImportPfxDataToKspWithParametersAsync(pfxData, password, pfxImportParameters, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateRequestAsync
   (
      request : Windows.Security.Cryptography.Certificates.ICertificateRequestProperties
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager");
      m_Factory     : ICertificateEnrollmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateEnrollmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateRequestAsync(request, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function InstallCertificateAsync
   (
      certificate : Windows.String
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager");
      m_Factory     : ICertificateEnrollmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateEnrollmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InstallCertificateAsync(certificate, installOption, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ImportPfxDataAsync
   (
      pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager");
      m_Factory     : ICertificateEnrollmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateEnrollmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ImportPfxDataAsync(pfxData, password, exportable, keyProtectionLevel, installOption, friendlyName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UserCertificateEnrollmentManager
   return Windows.Security.Cryptography.Certificates.IUserCertificateEnrollmentManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager");
      m_Factory     : ICertificateEnrollmentManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.IUserCertificateEnrollmentManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateEnrollmentManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UserCertificateEnrollmentManager(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ImportPfxDataToKspAsync
   (
      pfxData : Windows.String
      ; password : Windows.String
      ; exportable : Windows.Security.Cryptography.Certificates.ExportOption
      ; keyProtectionLevel : Windows.Security.Cryptography.Certificates.KeyProtectionLevel
      ; installOption : Windows.Security.Cryptography.Certificates.InstallOptions
      ; friendlyName : Windows.String
      ; keyStorageProvider : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager");
      m_Factory     : ICertificateEnrollmentManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateEnrollmentManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ImportPfxDataToKspAsync(pfxData, password, exportable, keyProtectionLevel, installOption, friendlyName, keyStorageProvider, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DecryptTpmAttestationCredentialAsync
   (
      credential : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAttestationHelper");
      m_Factory     : IKeyAttestationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAttestationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DecryptTpmAttestationCredentialAsync(credential, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetTpmAttestationCredentialId
   (
      credential : Windows.String
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAttestationHelper");
      m_Factory     : IKeyAttestationHelperStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAttestationHelperStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetTpmAttestationCredentialId(credential, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DecryptTpmAttestationCredentialWithContainerNameAsync
   (
      credential : Windows.String
      ; containerName : Windows.String
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAttestationHelper");
      m_Factory     : IKeyAttestationHelperStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAttestationHelperStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DecryptTpmAttestationCredentialWithContainerNameAsync(credential, containerName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetUserStoreByName
   (
      storeName : Windows.String
   )
   return Windows.Security.Cryptography.Certificates.IUserCertificateStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateStores");
      m_Factory     : ICertificateStoresStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.IUserCertificateStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateStoresStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetUserStoreByName(storeName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllAsync
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateStores");
      m_Factory     : ICertificateStoresStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateStoresStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FindAllWithQueryAsync
   (
      query : Windows.Security.Cryptography.Certificates.ICertificateQuery
   )
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateStores");
      m_Factory     : ICertificateStoresStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateStoresStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FindAllWithQueryAsync(query, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TrustedRootCertificationAuthorities
   return Windows.Security.Cryptography.Certificates.ICertificateStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateStores");
      m_Factory     : ICertificateStoresStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificateStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateStoresStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TrustedRootCertificationAuthorities(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IntermediateCertificationAuthorities
   return Windows.Security.Cryptography.Certificates.ICertificateStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateStores");
      m_Factory     : ICertificateStoresStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificateStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateStoresStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IntermediateCertificationAuthorities(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetStoreByName
   (
      storeName : Windows.String
   )
   return Windows.Security.Cryptography.Certificates.ICertificateStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CertificateStores");
      m_Factory     : ICertificateStoresStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Certificates.ICertificateStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICertificateStoresStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetStoreByName(storeName, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Personal
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.StandardCertificateStoreNames");
      m_Factory     : IStandardCertificateStoreNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardCertificateStoreNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Personal(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TrustedRootCertificationAuthorities
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.StandardCertificateStoreNames");
      m_Factory     : IStandardCertificateStoreNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardCertificateStoreNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TrustedRootCertificationAuthorities(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IntermediateCertificationAuthorities
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.StandardCertificateStoreNames");
      m_Factory     : IStandardCertificateStoreNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStandardCertificateStoreNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IntermediateCertificationAuthorities(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rsa
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rsa(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Dsa
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Dsa(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdh256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdh256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdh384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdh384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdh521
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdh521(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdsa256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdsa256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdsa384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdsa384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdsa521
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdsa521(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdsa
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdsa(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ecdh
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyAlgorithmNames");
      m_Factory     : IKeyAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ecdh(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SoftwareKeyStorageProvider
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames");
      m_Factory     : IKeyStorageProviderNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyStorageProviderNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SoftwareKeyStorageProvider(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SmartcardKeyStorageProvider
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames");
      m_Factory     : IKeyStorageProviderNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyStorageProviderNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SmartcardKeyStorageProvider(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PlatformKeyStorageProvider
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames");
      m_Factory     : IKeyStorageProviderNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyStorageProviderNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PlatformKeyStorageProvider(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PassportKeyStorageProvider
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames");
      m_Factory     : IKeyStorageProviderNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyStorageProviderNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PassportKeyStorageProvider(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GenerateSignatureAsync
   (
      data : Windows.Storage.Streams.IBuffer
      ; signers : Windows.Security.Cryptography.Certificates.IIterable_ICmsSignerInfo
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CmsAttachedSignature");
      m_Factory     : ICmsAttachedSignatureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICmsAttachedSignatureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GenerateSignatureAsync(data, signers, certificates, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GenerateSignatureAsync
   (
      data : Windows.Storage.Streams.IInputStream
      ; signers : Windows.Security.Cryptography.Certificates.IIterable_ICmsSignerInfo
      ; certificates : Windows.Security.Cryptography.Certificates.IIterable_ICertificate
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Certificates.CmsDetachedSignature");
      m_Factory     : ICmsDetachedSignatureStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICmsDetachedSignatureStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GenerateSignatureAsync(data, signers, certificates, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;