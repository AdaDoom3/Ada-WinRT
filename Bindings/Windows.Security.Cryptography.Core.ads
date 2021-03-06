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
with Windows.Foundation;
limited with Windows.Security.Cryptography.Certificates;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Security.Cryptography.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CryptographicPrivateKeyBlobType is (
      Pkcs8RawPrivateKeyInfo,
      Pkcs1RsaPrivateKey,
      BCryptPrivateKey,
      Capi1PrivateKey,
      BCryptEccFullPrivateKey
   );
   for CryptographicPrivateKeyBlobType use (
      Pkcs8RawPrivateKeyInfo => 0,
      Pkcs1RsaPrivateKey => 1,
      BCryptPrivateKey => 2,
      Capi1PrivateKey => 3,
      BCryptEccFullPrivateKey => 4
   );
   for CryptographicPrivateKeyBlobType'Size use 32;
   
   type CryptographicPrivateKeyBlobType_Ptr is access CryptographicPrivateKeyBlobType;
   
   type CryptographicPublicKeyBlobType is (
      X509SubjectPublicKeyInfo,
      Pkcs1RsaPublicKey,
      BCryptPublicKey,
      Capi1PublicKey,
      BCryptEccFullPublicKey
   );
   for CryptographicPublicKeyBlobType use (
      X509SubjectPublicKeyInfo => 0,
      Pkcs1RsaPublicKey => 1,
      BCryptPublicKey => 2,
      Capi1PublicKey => 3,
      BCryptEccFullPublicKey => 4
   );
   for CryptographicPublicKeyBlobType'Size use 32;
   
   type CryptographicPublicKeyBlobType_Ptr is access CryptographicPublicKeyBlobType;
   
   type Capi1KdfTargetAlgorithm is (
      NotAes,
      Aes
   );
   for Capi1KdfTargetAlgorithm use (
      NotAes => 0,
      Aes => 1
   );
   for Capi1KdfTargetAlgorithm'Size use 32;
   
   type Capi1KdfTargetAlgorithm_Ptr is access Capi1KdfTargetAlgorithm;
   
   type CryptographicPadding is (
      None,
      RsaOaep,
      RsaPkcs1V15,
      RsaPss
   );
   for CryptographicPadding use (
      None => 0,
      RsaOaep => 1,
      RsaPkcs1V15 => 2,
      RsaPss => 3
   );
   for CryptographicPadding'Size use 32;
   
   type CryptographicPadding_Ptr is access CryptographicPadding;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ICryptographicKey_Interface;
   type AsyncOperationCompletedHandler_ICryptographicKey is access all AsyncOperationCompletedHandler_ICryptographicKey_Interface'Class;
   type AsyncOperationCompletedHandler_ICryptographicKey_Ptr is access all AsyncOperationCompletedHandler_ICryptographicKey;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IKeyDerivationParameters_Interface;
   type IKeyDerivationParameters is access all IKeyDerivationParameters_Interface'Class;
   type IKeyDerivationParameters_Ptr is access all IKeyDerivationParameters;
   type IKeyDerivationParameters2_Interface;
   type IKeyDerivationParameters2 is access all IKeyDerivationParameters2_Interface'Class;
   type IKeyDerivationParameters2_Ptr is access all IKeyDerivationParameters2;
   type IKeyDerivationParametersStatics_Interface;
   type IKeyDerivationParametersStatics is access all IKeyDerivationParametersStatics_Interface'Class;
   type IKeyDerivationParametersStatics_Ptr is access all IKeyDerivationParametersStatics;
   type IKeyDerivationParametersStatics2_Interface;
   type IKeyDerivationParametersStatics2 is access all IKeyDerivationParametersStatics2_Interface'Class;
   type IKeyDerivationParametersStatics2_Ptr is access all IKeyDerivationParametersStatics2;
   type ICryptographicKey_Interface;
   type ICryptographicKey is access all ICryptographicKey_Interface'Class;
   type ICryptographicKey_Ptr is access all ICryptographicKey;
   type IHashComputation_Interface;
   type IHashComputation is access all IHashComputation_Interface'Class;
   type IHashComputation_Ptr is access all IHashComputation;
   type IHashAlgorithmProvider_Interface;
   type IHashAlgorithmProvider is access all IHashAlgorithmProvider_Interface'Class;
   type IHashAlgorithmProvider_Ptr is access all IHashAlgorithmProvider;
   type IMacAlgorithmProvider_Interface;
   type IMacAlgorithmProvider is access all IMacAlgorithmProvider_Interface'Class;
   type IMacAlgorithmProvider_Ptr is access all IMacAlgorithmProvider;
   type IMacAlgorithmProvider2_Interface;
   type IMacAlgorithmProvider2 is access all IMacAlgorithmProvider2_Interface'Class;
   type IMacAlgorithmProvider2_Ptr is access all IMacAlgorithmProvider2;
   type IKeyDerivationAlgorithmProvider_Interface;
   type IKeyDerivationAlgorithmProvider is access all IKeyDerivationAlgorithmProvider_Interface'Class;
   type IKeyDerivationAlgorithmProvider_Ptr is access all IKeyDerivationAlgorithmProvider;
   type ISymmetricKeyAlgorithmProvider_Interface;
   type ISymmetricKeyAlgorithmProvider is access all ISymmetricKeyAlgorithmProvider_Interface'Class;
   type ISymmetricKeyAlgorithmProvider_Ptr is access all ISymmetricKeyAlgorithmProvider;
   type IAsymmetricKeyAlgorithmProvider_Interface;
   type IAsymmetricKeyAlgorithmProvider is access all IAsymmetricKeyAlgorithmProvider_Interface'Class;
   type IAsymmetricKeyAlgorithmProvider_Ptr is access all IAsymmetricKeyAlgorithmProvider;
   type IAsymmetricKeyAlgorithmProvider2_Interface;
   type IAsymmetricKeyAlgorithmProvider2 is access all IAsymmetricKeyAlgorithmProvider2_Interface'Class;
   type IAsymmetricKeyAlgorithmProvider2_Ptr is access all IAsymmetricKeyAlgorithmProvider2;
   type IPersistedKeyProviderStatics_Interface;
   type IPersistedKeyProviderStatics is access all IPersistedKeyProviderStatics_Interface'Class;
   type IPersistedKeyProviderStatics_Ptr is access all IPersistedKeyProviderStatics;
   type IEncryptedAndAuthenticatedData_Interface;
   type IEncryptedAndAuthenticatedData is access all IEncryptedAndAuthenticatedData_Interface'Class;
   type IEncryptedAndAuthenticatedData_Ptr is access all IEncryptedAndAuthenticatedData;
   type ICryptographicEngineStatics_Interface;
   type ICryptographicEngineStatics is access all ICryptographicEngineStatics_Interface'Class;
   type ICryptographicEngineStatics_Ptr is access all ICryptographicEngineStatics;
   type ICryptographicEngineStatics2_Interface;
   type ICryptographicEngineStatics2 is access all ICryptographicEngineStatics2_Interface'Class;
   type ICryptographicEngineStatics2_Ptr is access all ICryptographicEngineStatics2;
   type IHashAlgorithmProviderStatics_Interface;
   type IHashAlgorithmProviderStatics is access all IHashAlgorithmProviderStatics_Interface'Class;
   type IHashAlgorithmProviderStatics_Ptr is access all IHashAlgorithmProviderStatics;
   type IMacAlgorithmProviderStatics_Interface;
   type IMacAlgorithmProviderStatics is access all IMacAlgorithmProviderStatics_Interface'Class;
   type IMacAlgorithmProviderStatics_Ptr is access all IMacAlgorithmProviderStatics;
   type IKeyDerivationAlgorithmProviderStatics_Interface;
   type IKeyDerivationAlgorithmProviderStatics is access all IKeyDerivationAlgorithmProviderStatics_Interface'Class;
   type IKeyDerivationAlgorithmProviderStatics_Ptr is access all IKeyDerivationAlgorithmProviderStatics;
   type ISymmetricKeyAlgorithmProviderStatics_Interface;
   type ISymmetricKeyAlgorithmProviderStatics is access all ISymmetricKeyAlgorithmProviderStatics_Interface'Class;
   type ISymmetricKeyAlgorithmProviderStatics_Ptr is access all ISymmetricKeyAlgorithmProviderStatics;
   type IAsymmetricKeyAlgorithmProviderStatics_Interface;
   type IAsymmetricKeyAlgorithmProviderStatics is access all IAsymmetricKeyAlgorithmProviderStatics_Interface'Class;
   type IAsymmetricKeyAlgorithmProviderStatics_Ptr is access all IAsymmetricKeyAlgorithmProviderStatics;
   type IHashAlgorithmNamesStatics_Interface;
   type IHashAlgorithmNamesStatics is access all IHashAlgorithmNamesStatics_Interface'Class;
   type IHashAlgorithmNamesStatics_Ptr is access all IHashAlgorithmNamesStatics;
   type IMacAlgorithmNamesStatics_Interface;
   type IMacAlgorithmNamesStatics is access all IMacAlgorithmNamesStatics_Interface'Class;
   type IMacAlgorithmNamesStatics_Ptr is access all IMacAlgorithmNamesStatics;
   type ISymmetricAlgorithmNamesStatics_Interface;
   type ISymmetricAlgorithmNamesStatics is access all ISymmetricAlgorithmNamesStatics_Interface'Class;
   type ISymmetricAlgorithmNamesStatics_Ptr is access all ISymmetricAlgorithmNamesStatics;
   type IAsymmetricAlgorithmNamesStatics_Interface;
   type IAsymmetricAlgorithmNamesStatics is access all IAsymmetricAlgorithmNamesStatics_Interface'Class;
   type IAsymmetricAlgorithmNamesStatics_Ptr is access all IAsymmetricAlgorithmNamesStatics;
   type IAsymmetricAlgorithmNamesStatics2_Interface;
   type IAsymmetricAlgorithmNamesStatics2 is access all IAsymmetricAlgorithmNamesStatics2_Interface'Class;
   type IAsymmetricAlgorithmNamesStatics2_Ptr is access all IAsymmetricAlgorithmNamesStatics2;
   type IEccCurveNamesStatics_Interface;
   type IEccCurveNamesStatics is access all IEccCurveNamesStatics_Interface'Class;
   type IEccCurveNamesStatics_Ptr is access all IEccCurveNamesStatics;
   type IKeyDerivationAlgorithmNamesStatics_Interface;
   type IKeyDerivationAlgorithmNamesStatics is access all IKeyDerivationAlgorithmNamesStatics_Interface'Class;
   type IKeyDerivationAlgorithmNamesStatics_Ptr is access all IKeyDerivationAlgorithmNamesStatics;
   type IKeyDerivationAlgorithmNamesStatics2_Interface;
   type IKeyDerivationAlgorithmNamesStatics2 is access all IKeyDerivationAlgorithmNamesStatics2_Interface'Class;
   type IKeyDerivationAlgorithmNamesStatics2_Ptr is access all IKeyDerivationAlgorithmNamesStatics2;
   type IAsyncOperation_ICryptographicKey_Interface;
   type IAsyncOperation_ICryptographicKey is access all IAsyncOperation_ICryptographicKey_Interface'Class;
   type IAsyncOperation_ICryptographicKey_Ptr is access all IAsyncOperation_ICryptographicKey;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationParameters : aliased constant Windows.IID := (2079349095, 1147, 19084, (150, 74, 70, 159, 253, 85, 34, 226 ));
   
   type IKeyDerivationParameters_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KdfGenericBinary
   (
      This       : access IKeyDerivationParameters_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function put_KdfGenericBinary
   (
      This       : access IKeyDerivationParameters_Interface
      ; value : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_IterationCount
   (
      This       : access IKeyDerivationParameters_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationParameters2 : aliased constant Windows.IID := (3443615441, 16766, 20300, (182, 102, 192, 216, 121, 243, 248, 224 ));
   
   type IKeyDerivationParameters2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Capi1KdfTargetAlgorithm
   (
      This       : access IKeyDerivationParameters2_Interface
      ; RetVal : access Windows.Security.Cryptography.Core.Capi1KdfTargetAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   function put_Capi1KdfTargetAlgorithm
   (
      This       : access IKeyDerivationParameters2_Interface
      ; value : Windows.Security.Cryptography.Core.Capi1KdfTargetAlgorithm
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationParametersStatics : aliased constant Windows.IID := (3935707070, 62335, 16710, (157, 254, 164, 86, 241, 115, 95, 75 ));
   
   type IKeyDerivationParametersStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function BuildForPbkdf2
   (
      This       : access IKeyDerivationParametersStatics_Interface
      ; pbkdf2Salt : Windows.Storage.Streams.IBuffer
      ; iterationCount : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Core.IKeyDerivationParameters
   )
   return Windows.HRESULT is abstract;
   
   function BuildForSP800108
   (
      This       : access IKeyDerivationParametersStatics_Interface
      ; label : Windows.Storage.Streams.IBuffer
      ; context : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.IKeyDerivationParameters
   )
   return Windows.HRESULT is abstract;
   
   function BuildForSP80056a
   (
      This       : access IKeyDerivationParametersStatics_Interface
      ; algorithmId : Windows.Storage.Streams.IBuffer
      ; partyUInfo : Windows.Storage.Streams.IBuffer
      ; partyVInfo : Windows.Storage.Streams.IBuffer
      ; suppPubInfo : Windows.Storage.Streams.IBuffer
      ; suppPrivInfo : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.IKeyDerivationParameters
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationParametersStatics2 : aliased constant Windows.IID := (2776120789, 22755, 20219, (178, 131, 161, 101, 49, 38, 225, 190 ));
   
   type IKeyDerivationParametersStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function BuildForCapi1Kdf
   (
      This       : access IKeyDerivationParametersStatics2_Interface
      ; capi1KdfTargetAlgorithm : Windows.Security.Cryptography.Core.Capi1KdfTargetAlgorithm
      ; RetVal : access Windows.Security.Cryptography.Core.IKeyDerivationParameters
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICryptographicKey : aliased constant Windows.IID := (3978967920, 36475, 16393, (132, 1, 255, 209, 166, 46, 235, 39 ));
   
   type ICryptographicKey_Interface is interface and Windows.IInspectable_Interface;
   
   function get_KeySize
   (
      This       : access ICryptographicKey_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ExportDefaultPrivateKeyBlobType
   (
      This       : access ICryptographicKey_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function ExportPrivateKeyWithBlobType
   (
      This       : access ICryptographicKey_Interface
      ; BlobType : Windows.Security.Cryptography.Core.CryptographicPrivateKeyBlobType
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function ExportDefaultPublicKeyBlobType
   (
      This       : access ICryptographicKey_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function ExportPublicKeyWithBlobType
   (
      This       : access ICryptographicKey_Interface
      ; BlobType : Windows.Security.Cryptography.Core.CryptographicPublicKeyBlobType
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHashComputation : aliased constant Windows.IID := (1493488054, 44337, 17923, (163, 164, 177, 189, 169, 142, 37, 98 ));
   
   type IHashComputation_Interface is interface and Windows.IInspectable_Interface;
   
   function Append
   (
      This       : access IHashComputation_Interface
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function GetValueAndReset
   (
      This       : access IHashComputation_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHashAlgorithmProvider : aliased constant Windows.IID := (3197841536, 45763, 16939, (188, 225, 236, 144, 239, 181, 215, 181 ));
   
   type IHashAlgorithmProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlgorithmName
   (
      This       : access IHashAlgorithmProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HashLength
   (
      This       : access IHashAlgorithmProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function HashData
   (
      This       : access IHashAlgorithmProvider_Interface
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function CreateHash
   (
      This       : access IHashAlgorithmProvider_Interface
      ; RetVal : access Windows.Security.Cryptography.Core.IHashComputation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMacAlgorithmProvider : aliased constant Windows.IID := (1245693379, 7357, 16846, (160, 146, 170, 11, 197, 210, 210, 245 ));
   
   type IMacAlgorithmProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlgorithmName
   (
      This       : access IMacAlgorithmProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MacLength
   (
      This       : access IMacAlgorithmProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function CreateKey
   (
      This       : access IMacAlgorithmProvider_Interface
      ; keyMaterial : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMacAlgorithmProvider2 : aliased constant Windows.IID := (1839409685, 55601, 17133, (142, 126, 195, 1, 202, 238, 17, 156 ));
   
   type IMacAlgorithmProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateHash
   (
      This       : access IMacAlgorithmProvider2_Interface
      ; keyMaterial : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.IHashComputation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationAlgorithmProvider : aliased constant Windows.IID := (3791366203, 18033, 17335, (145, 88, 118, 58, 170, 152, 182, 191 ));
   
   type IKeyDerivationAlgorithmProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlgorithmName
   (
      This       : access IKeyDerivationAlgorithmProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CreateKey
   (
      This       : access IKeyDerivationAlgorithmProvider_Interface
      ; keyMaterial : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISymmetricKeyAlgorithmProvider : aliased constant Windows.IID := (1031686707, 15312, 18690, (138, 200, 71, 13, 80, 210, 19, 118 ));
   
   type ISymmetricKeyAlgorithmProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlgorithmName
   (
      This       : access ISymmetricKeyAlgorithmProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BlockLength
   (
      This       : access ISymmetricKeyAlgorithmProvider_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function CreateSymmetricKey
   (
      This       : access ISymmetricKeyAlgorithmProvider_Interface
      ; keyMaterial : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsymmetricKeyAlgorithmProvider : aliased constant Windows.IID := (3906142007, 25177, 20104, (183, 224, 148, 25, 31, 222, 105, 158 ));
   
   type IAsymmetricKeyAlgorithmProvider_Interface is interface and Windows.IInspectable_Interface;
   
   function get_AlgorithmName
   (
      This       : access IAsymmetricKeyAlgorithmProvider_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function CreateKeyPair
   (
      This       : access IAsymmetricKeyAlgorithmProvider_Interface
      ; keySize : Windows.UInt32
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   function ImportDefaultPrivateKeyBlob
   (
      This       : access IAsymmetricKeyAlgorithmProvider_Interface
      ; keyBlob : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   function ImportKeyPairWithBlobType
   (
      This       : access IAsymmetricKeyAlgorithmProvider_Interface
      ; keyBlob : Windows.Storage.Streams.IBuffer
      ; BlobType : Windows.Security.Cryptography.Core.CryptographicPrivateKeyBlobType
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   function ImportDefaultPublicKeyBlob
   (
      This       : access IAsymmetricKeyAlgorithmProvider_Interface
      ; keyBlob : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   function ImportPublicKeyWithBlobType
   (
      This       : access IAsymmetricKeyAlgorithmProvider_Interface
      ; keyBlob : Windows.Storage.Streams.IBuffer
      ; BlobType : Windows.Security.Cryptography.Core.CryptographicPublicKeyBlobType
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsymmetricKeyAlgorithmProvider2 : aliased constant Windows.IID := (1311910526, 31821, 18839, (172, 79, 27, 132, 139, 54, 48, 110 ));
   
   type IAsymmetricKeyAlgorithmProvider2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateKeyPairWithCurveName
   (
      This       : access IAsymmetricKeyAlgorithmProvider2_Interface
      ; curveName : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   function CreateKeyPairWithCurveParameters
   (
      This       : access IAsymmetricKeyAlgorithmProvider2_Interface
      ; parameters : Windows.UInt8_Ptr
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IPersistedKeyProviderStatics : aliased constant Windows.IID := (1999063060, 55764, 19701, (182, 104, 224, 69, 125, 243, 8, 148 ));
   
   type IPersistedKeyProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenKeyPairFromCertificateAsync
   (
      This       : access IPersistedKeyProviderStatics_Interface
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; hashAlgorithmName : Windows.String
      ; padding : Windows.Security.Cryptography.Core.CryptographicPadding
      ; RetVal : access Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function OpenPublicKeyFromCertificate
   (
      This       : access IPersistedKeyProviderStatics_Interface
      ; certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; hashAlgorithmName : Windows.String
      ; padding : Windows.Security.Cryptography.Core.CryptographicPadding
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEncryptedAndAuthenticatedData : aliased constant Windows.IID := (1873031143, 7883, 19200, (190, 165, 96, 184, 63, 134, 47, 23 ));
   
   type IEncryptedAndAuthenticatedData_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EncryptedData
   (
      This       : access IEncryptedAndAuthenticatedData_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_AuthenticationTag
   (
      This       : access IEncryptedAndAuthenticatedData_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICryptographicEngineStatics : aliased constant Windows.IID := (2682914361, 28663, 19589, (160, 149, 149, 235, 49, 113, 94, 185 ));
   
   type ICryptographicEngineStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function Encrypt
   (
      This       : access ICryptographicEngineStatics_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function Decrypt
   (
      This       : access ICryptographicEngineStatics_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function EncryptAndAuthenticate
   (
      This       : access ICryptographicEngineStatics_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; nonce : Windows.Storage.Streams.IBuffer
      ; authenticatedData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Security.Cryptography.Core.IEncryptedAndAuthenticatedData
   )
   return Windows.HRESULT is abstract;
   
   function DecryptAndAuthenticate
   (
      This       : access ICryptographicEngineStatics_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; nonce : Windows.Storage.Streams.IBuffer
      ; authenticationTag : Windows.Storage.Streams.IBuffer
      ; authenticatedData : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function Sign
   (
      This       : access ICryptographicEngineStatics_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function VerifySignature
   (
      This       : access ICryptographicEngineStatics_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; signature : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function DeriveKeyMaterial
   (
      This       : access ICryptographicEngineStatics_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; parameters : Windows.Security.Cryptography.Core.IKeyDerivationParameters
      ; desiredKeySize : Windows.UInt32
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICryptographicEngineStatics2 : aliased constant Windows.IID := (1733904638, 57247, 16785, (146, 199, 108, 230, 245, 132, 32, 224 ));
   
   type ICryptographicEngineStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function SignHashedData
   (
      This       : access ICryptographicEngineStatics2_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   function VerifySignatureWithHashInput
   (
      This       : access ICryptographicEngineStatics2_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; signature : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function DecryptAsync
   (
      This       : access ICryptographicEngineStatics2_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SignAsync
   (
      This       : access ICryptographicEngineStatics2_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SignHashedDataAsync
   (
      This       : access ICryptographicEngineStatics2_Interface
      ; key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Storage.Streams.IAsyncOperation_IBuffer -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHashAlgorithmProviderStatics : aliased constant Windows.IID := (2678888257, 23748, 17206, (174, 56, 98, 18, 183, 90, 145, 90 ));
   
   type IHashAlgorithmProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenAlgorithm
   (
      This       : access IHashAlgorithmProviderStatics_Interface
      ; algorithm : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Core.IHashAlgorithmProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMacAlgorithmProviderStatics : aliased constant Windows.IID := (3384656199, 52343, 19952, (158, 78, 185, 33, 224, 128, 100, 76 ));
   
   type IMacAlgorithmProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenAlgorithm
   (
      This       : access IMacAlgorithmProviderStatics_Interface
      ; algorithm : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Core.IMacAlgorithmProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationAlgorithmProviderStatics : aliased constant Windows.IID := (170002810, 2588, 17467, (148, 24, 185, 73, 138, 235, 22, 3 ));
   
   type IKeyDerivationAlgorithmProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenAlgorithm
   (
      This       : access IKeyDerivationAlgorithmProviderStatics_Interface
      ; algorithm : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Core.IKeyDerivationAlgorithmProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISymmetricKeyAlgorithmProviderStatics : aliased constant Windows.IID := (2369463078, 7991, 18719, (182, 14, 245, 67, 27, 38, 180, 131 ));
   
   type ISymmetricKeyAlgorithmProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenAlgorithm
   (
      This       : access ISymmetricKeyAlgorithmProviderStatics_Interface
      ; algorithm : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Core.ISymmetricKeyAlgorithmProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsymmetricKeyAlgorithmProviderStatics : aliased constant Windows.IID := (1113316888, 42995, 18342, (168, 210, 196, 141, 96, 51, 166, 92 ));
   
   type IAsymmetricKeyAlgorithmProviderStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function OpenAlgorithm
   (
      This       : access IAsymmetricKeyAlgorithmProviderStatics_Interface
      ; algorithm : Windows.String
      ; RetVal : access Windows.Security.Cryptography.Core.IAsymmetricKeyAlgorithmProvider
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IHashAlgorithmNamesStatics : aliased constant Windows.IID := (1801323798, 56982, 20234, (141, 87, 220, 201, 218, 227, 108, 118 ));
   
   type IHashAlgorithmNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Md5
   (
      This       : access IHashAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sha1
   (
      This       : access IHashAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sha256
   (
      This       : access IHashAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sha384
   (
      This       : access IHashAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sha512
   (
      This       : access IHashAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IMacAlgorithmNamesStatics : aliased constant Windows.IID := (1094788728, 64286, 17316, (137, 94, 169, 2, 110, 67, 144, 163 ));
   
   type IMacAlgorithmNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_HmacMd5
   (
      This       : access IMacAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HmacSha1
   (
      This       : access IMacAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HmacSha256
   (
      This       : access IMacAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HmacSha384
   (
      This       : access IMacAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_HmacSha512
   (
      This       : access IMacAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AesCmac
   (
      This       : access IMacAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISymmetricAlgorithmNamesStatics : aliased constant Windows.IID := (1752199803, 51606, 20142, (132, 215, 121, 178, 174, 183, 59, 156 ));
   
   type ISymmetricAlgorithmNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DesCbc
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DesEcb
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TripleDesCbc
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TripleDesEcb
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rc2Cbc
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rc2Ecb
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AesCbc
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AesEcb
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AesGcm
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AesCcm
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AesCbcPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AesEcbPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DesCbcPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DesEcbPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TripleDesCbcPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_TripleDesEcbPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rc2CbcPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rc2EcbPkcs7
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Rc4
   (
      This       : access ISymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsymmetricAlgorithmNamesStatics : aliased constant Windows.IID := (3405184228, 26560, 18090, (132, 249, 117, 46, 119, 68, 159, 155 ));
   
   type IAsymmetricAlgorithmNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_RsaPkcs1
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaOaepSha1
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaOaepSha256
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaOaepSha384
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaOaepSha512
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EcdsaP256Sha256
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EcdsaP384Sha384
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EcdsaP521Sha512
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DsaSha1
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DsaSha256
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPkcs1Sha1
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPkcs1Sha256
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPkcs1Sha384
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPkcs1Sha512
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPssSha1
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPssSha256
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPssSha384
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_RsaSignPssSha512
   (
      This       : access IAsymmetricAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsymmetricAlgorithmNamesStatics2 : aliased constant Windows.IID := (4047618262, 19455, 20259, (186, 102, 96, 69, 177, 55, 213, 223 ));
   
   type IAsymmetricAlgorithmNamesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EcdsaSha256
   (
      This       : access IAsymmetricAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EcdsaSha384
   (
      This       : access IAsymmetricAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EcdsaSha512
   (
      This       : access IAsymmetricAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IEccCurveNamesStatics : aliased constant Windows.IID := (3019870988, 44779, 16542, (183, 212, 155, 149, 41, 90, 174, 207 ));
   
   type IEccCurveNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_BrainpoolP160r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP160t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP192r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP192t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP224r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP224t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP256r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP256t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP320r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP320t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP384r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP384t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP512r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_BrainpoolP512t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Curve25519
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Ec192wapi
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NistP192
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NistP224
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NistP256
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NistP384
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NistP521
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NumsP256t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NumsP384t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_NumsP512t1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP160k1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP160r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP160r2
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP192k1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP192r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP224k1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP224r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP256k1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP256r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP384r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_SecP521r1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wtls7
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wtls9
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Wtls12
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_X962P192v1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_X962P192v2
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_X962P192v3
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_X962P239v1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_X962P239v2
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_X962P239v3
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_X962P256v1
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_AllEccCurveNames
   (
      This       : access IEccCurveNamesStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationAlgorithmNamesStatics : aliased constant Windows.IID := (2070820414, 38098, 18233, (165, 123, 2, 46, 12, 58, 64, 42 ));
   
   type IKeyDerivationAlgorithmNamesStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Pbkdf2Md5
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Pbkdf2Sha1
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Pbkdf2Sha256
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Pbkdf2Sha384
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Pbkdf2Sha512
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp800108CtrHmacMd5
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp800108CtrHmacSha1
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp800108CtrHmacSha256
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp800108CtrHmacSha384
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp800108CtrHmacSha512
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp80056aConcatMd5
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp80056aConcatSha1
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp80056aConcatSha256
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp80056aConcatSha384
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Sp80056aConcatSha512
   (
      This       : access IKeyDerivationAlgorithmNamesStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IKeyDerivationAlgorithmNamesStatics2 : aliased constant Windows.IID := (1469398955, 24644, 18031, (151, 244, 51, 123, 120, 8, 56, 77 ));
   
   type IKeyDerivationAlgorithmNamesStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CapiKdfMd5
   (
      This       : access IKeyDerivationAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CapiKdfSha1
   (
      This       : access IKeyDerivationAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CapiKdfSha256
   (
      This       : access IKeyDerivationAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CapiKdfSha384
   (
      This       : access IKeyDerivationAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CapiKdfSha512
   (
      This       : access IKeyDerivationAlgorithmNamesStatics2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ICryptographicKey : aliased constant Windows.IID := (2177530011, 39135, 23658, (149, 49, 150, 98, 56, 227, 231, 174 ));
   
   type IAsyncOperation_ICryptographicKey_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ICryptographicKey_Interface
      ; handler : Windows.Security.Cryptography.Core.AsyncOperationCompletedHandler_ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ICryptographicKey_Interface
      ; RetVal : access Windows.Security.Cryptography.Core.AsyncOperationCompletedHandler_ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ICryptographicKey_Interface
      ; RetVal : access Windows.Security.Cryptography.Core.ICryptographicKey
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ICryptographicKey : aliased constant Windows.IID := (80364408, 62868, 24038, (165, 85, 48, 79, 98, 203, 79, 175 ));
   
   type AsyncOperationCompletedHandler_ICryptographicKey_Interface(Callback : access procedure (asyncInfo : Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ICryptographicKey'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICryptographicKey_Interface
      ; asyncInfo : Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype KeyDerivationParameters is Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   subtype CryptographicKey is Windows.Security.Cryptography.Core.ICryptographicKey;
   subtype CryptographicHash is Windows.Security.Cryptography.Core.IHashComputation;
   subtype EncryptedAndAuthenticatedData is Windows.Security.Cryptography.Core.IEncryptedAndAuthenticatedData;
   subtype HashAlgorithmProvider is Windows.Security.Cryptography.Core.IHashAlgorithmProvider;
   subtype MacAlgorithmProvider is Windows.Security.Cryptography.Core.IMacAlgorithmProvider;
   subtype KeyDerivationAlgorithmProvider is Windows.Security.Cryptography.Core.IKeyDerivationAlgorithmProvider;
   subtype SymmetricKeyAlgorithmProvider is Windows.Security.Cryptography.Core.ISymmetricKeyAlgorithmProvider;
   subtype AsymmetricKeyAlgorithmProvider is Windows.Security.Cryptography.Core.IAsymmetricKeyAlgorithmProvider;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function BuildForCapi1Kdf
   (
      capi1KdfTargetAlgorithm : Windows.Security.Cryptography.Core.Capi1KdfTargetAlgorithm
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   
   function BuildForPbkdf2
   (
      pbkdf2Salt : Windows.Storage.Streams.IBuffer
      ; iterationCount : Windows.UInt32
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   
   function BuildForSP800108
   (
      label : Windows.Storage.Streams.IBuffer
      ; context : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   
   function BuildForSP80056a
   (
      algorithmId : Windows.Storage.Streams.IBuffer
      ; partyUInfo : Windows.Storage.Streams.IBuffer
      ; partyVInfo : Windows.Storage.Streams.IBuffer
      ; suppPubInfo : Windows.Storage.Streams.IBuffer
      ; suppPrivInfo : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   
   function OpenKeyPairFromCertificateAsync
   (
      certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; hashAlgorithmName : Windows.String
      ; padding : Windows.Security.Cryptography.Core.CryptographicPadding
   )
   return Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey;
   
   function OpenPublicKeyFromCertificate
   (
      certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; hashAlgorithmName : Windows.String
      ; padding : Windows.Security.Cryptography.Core.CryptographicPadding
   )
   return Windows.Security.Cryptography.Core.ICryptographicKey;
   
   function Encrypt
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer;
   
   function Decrypt
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer;
   
   function EncryptAndAuthenticate
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; nonce : Windows.Storage.Streams.IBuffer
      ; authenticatedData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Core.IEncryptedAndAuthenticatedData;
   
   function DecryptAndAuthenticate
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; nonce : Windows.Storage.Streams.IBuffer
      ; authenticationTag : Windows.Storage.Streams.IBuffer
      ; authenticatedData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer;
   
   function Sign
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer;
   
   function VerifySignature
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; signature : Windows.Storage.Streams.IBuffer
   )
   return Windows.Boolean;
   
   function DeriveKeyMaterial
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; parameters : Windows.Security.Cryptography.Core.IKeyDerivationParameters
      ; desiredKeySize : Windows.UInt32
   )
   return Windows.Storage.Streams.IBuffer;
   
   function SignHashedData
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer;
   
   function VerifySignatureWithHashInput
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; signature : Windows.Storage.Streams.IBuffer
   )
   return Windows.Boolean;
   
   function DecryptAsync
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer;
   
   function SignAsync
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer;
   
   function SignHashedDataAsync
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IHashAlgorithmProvider;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IMacAlgorithmProvider;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationAlgorithmProvider;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.ISymmetricKeyAlgorithmProvider;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IAsymmetricKeyAlgorithmProvider;
   
   function get_Md5
   return Windows.String;
   
   function get_Sha1
   return Windows.String;
   
   function get_Sha256
   return Windows.String;
   
   function get_Sha384
   return Windows.String;
   
   function get_Sha512
   return Windows.String;
   
   function get_HmacMd5
   return Windows.String;
   
   function get_HmacSha1
   return Windows.String;
   
   function get_HmacSha256
   return Windows.String;
   
   function get_HmacSha384
   return Windows.String;
   
   function get_HmacSha512
   return Windows.String;
   
   function get_AesCmac
   return Windows.String;
   
   function get_DesCbc
   return Windows.String;
   
   function get_DesEcb
   return Windows.String;
   
   function get_TripleDesCbc
   return Windows.String;
   
   function get_TripleDesEcb
   return Windows.String;
   
   function get_Rc2Cbc
   return Windows.String;
   
   function get_Rc2Ecb
   return Windows.String;
   
   function get_AesCbc
   return Windows.String;
   
   function get_AesEcb
   return Windows.String;
   
   function get_AesGcm
   return Windows.String;
   
   function get_AesCcm
   return Windows.String;
   
   function get_AesCbcPkcs7
   return Windows.String;
   
   function get_AesEcbPkcs7
   return Windows.String;
   
   function get_DesCbcPkcs7
   return Windows.String;
   
   function get_DesEcbPkcs7
   return Windows.String;
   
   function get_TripleDesCbcPkcs7
   return Windows.String;
   
   function get_TripleDesEcbPkcs7
   return Windows.String;
   
   function get_Rc2CbcPkcs7
   return Windows.String;
   
   function get_Rc2EcbPkcs7
   return Windows.String;
   
   function get_Rc4
   return Windows.String;
   
   function get_EcdsaSha256
   return Windows.String;
   
   function get_EcdsaSha384
   return Windows.String;
   
   function get_EcdsaSha512
   return Windows.String;
   
   function get_RsaPkcs1
   return Windows.String;
   
   function get_RsaOaepSha1
   return Windows.String;
   
   function get_RsaOaepSha256
   return Windows.String;
   
   function get_RsaOaepSha384
   return Windows.String;
   
   function get_RsaOaepSha512
   return Windows.String;
   
   function get_EcdsaP256Sha256
   return Windows.String;
   
   function get_EcdsaP384Sha384
   return Windows.String;
   
   function get_EcdsaP521Sha512
   return Windows.String;
   
   function get_DsaSha1
   return Windows.String;
   
   function get_DsaSha256
   return Windows.String;
   
   function get_RsaSignPkcs1Sha1
   return Windows.String;
   
   function get_RsaSignPkcs1Sha256
   return Windows.String;
   
   function get_RsaSignPkcs1Sha384
   return Windows.String;
   
   function get_RsaSignPkcs1Sha512
   return Windows.String;
   
   function get_RsaSignPssSha1
   return Windows.String;
   
   function get_RsaSignPssSha256
   return Windows.String;
   
   function get_RsaSignPssSha384
   return Windows.String;
   
   function get_RsaSignPssSha512
   return Windows.String;
   
   function get_BrainpoolP160r1
   return Windows.String;
   
   function get_BrainpoolP160t1
   return Windows.String;
   
   function get_BrainpoolP192r1
   return Windows.String;
   
   function get_BrainpoolP192t1
   return Windows.String;
   
   function get_BrainpoolP224r1
   return Windows.String;
   
   function get_BrainpoolP224t1
   return Windows.String;
   
   function get_BrainpoolP256r1
   return Windows.String;
   
   function get_BrainpoolP256t1
   return Windows.String;
   
   function get_BrainpoolP320r1
   return Windows.String;
   
   function get_BrainpoolP320t1
   return Windows.String;
   
   function get_BrainpoolP384r1
   return Windows.String;
   
   function get_BrainpoolP384t1
   return Windows.String;
   
   function get_BrainpoolP512r1
   return Windows.String;
   
   function get_BrainpoolP512t1
   return Windows.String;
   
   function get_Curve25519
   return Windows.String;
   
   function get_Ec192wapi
   return Windows.String;
   
   function get_NistP192
   return Windows.String;
   
   function get_NistP224
   return Windows.String;
   
   function get_NistP256
   return Windows.String;
   
   function get_NistP384
   return Windows.String;
   
   function get_NistP521
   return Windows.String;
   
   function get_NumsP256t1
   return Windows.String;
   
   function get_NumsP384t1
   return Windows.String;
   
   function get_NumsP512t1
   return Windows.String;
   
   function get_SecP160k1
   return Windows.String;
   
   function get_SecP160r1
   return Windows.String;
   
   function get_SecP160r2
   return Windows.String;
   
   function get_SecP192k1
   return Windows.String;
   
   function get_SecP192r1
   return Windows.String;
   
   function get_SecP224k1
   return Windows.String;
   
   function get_SecP224r1
   return Windows.String;
   
   function get_SecP256k1
   return Windows.String;
   
   function get_SecP256r1
   return Windows.String;
   
   function get_SecP384r1
   return Windows.String;
   
   function get_SecP521r1
   return Windows.String;
   
   function get_Wtls7
   return Windows.String;
   
   function get_Wtls9
   return Windows.String;
   
   function get_Wtls12
   return Windows.String;
   
   function get_X962P192v1
   return Windows.String;
   
   function get_X962P192v2
   return Windows.String;
   
   function get_X962P192v3
   return Windows.String;
   
   function get_X962P239v1
   return Windows.String;
   
   function get_X962P239v2
   return Windows.String;
   
   function get_X962P239v3
   return Windows.String;
   
   function get_X962P256v1
   return Windows.String;
   
   function get_AllEccCurveNames
   return Windows.Foundation.Collections.IVectorView_String;
   
   function get_CapiKdfMd5
   return Windows.String;
   
   function get_CapiKdfSha1
   return Windows.String;
   
   function get_CapiKdfSha256
   return Windows.String;
   
   function get_CapiKdfSha384
   return Windows.String;
   
   function get_CapiKdfSha512
   return Windows.String;
   
   function get_Pbkdf2Md5
   return Windows.String;
   
   function get_Pbkdf2Sha1
   return Windows.String;
   
   function get_Pbkdf2Sha256
   return Windows.String;
   
   function get_Pbkdf2Sha384
   return Windows.String;
   
   function get_Pbkdf2Sha512
   return Windows.String;
   
   function get_Sp800108CtrHmacMd5
   return Windows.String;
   
   function get_Sp800108CtrHmacSha1
   return Windows.String;
   
   function get_Sp800108CtrHmacSha256
   return Windows.String;
   
   function get_Sp800108CtrHmacSha384
   return Windows.String;
   
   function get_Sp800108CtrHmacSha512
   return Windows.String;
   
   function get_Sp80056aConcatMd5
   return Windows.String;
   
   function get_Sp80056aConcatSha1
   return Windows.String;
   
   function get_Sp80056aConcatSha256
   return Windows.String;
   
   function get_Sp80056aConcatSha384
   return Windows.String;
   
   function get_Sp80056aConcatSha512
   return Windows.String;
   
end;
