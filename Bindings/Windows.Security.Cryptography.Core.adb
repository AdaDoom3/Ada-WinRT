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
with Windows.Security.Cryptography.Certificates;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Cryptography.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICryptographicKey_Interface
      ; asyncInfo : Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey
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
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function BuildForCapi1Kdf
   (
      capi1KdfTargetAlgorithm : Windows.Security.Cryptography.Core.Capi1KdfTargetAlgorithm
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationParameters");
      m_Factory     : IKeyDerivationParametersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationParametersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.BuildForCapi1Kdf(capi1KdfTargetAlgorithm, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function BuildForPbkdf2
   (
      pbkdf2Salt : Windows.Storage.Streams.IBuffer
      ; iterationCount : Windows.UInt32
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationParameters");
      m_Factory     : IKeyDerivationParametersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationParametersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.BuildForPbkdf2(pbkdf2Salt, iterationCount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function BuildForSP800108
   (
      label : Windows.Storage.Streams.IBuffer
      ; context : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationParameters");
      m_Factory     : IKeyDerivationParametersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationParametersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.BuildForSP800108(label, context, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function BuildForSP80056a
   (
      algorithmId : Windows.Storage.Streams.IBuffer
      ; partyUInfo : Windows.Storage.Streams.IBuffer
      ; partyVInfo : Windows.Storage.Streams.IBuffer
      ; suppPubInfo : Windows.Storage.Streams.IBuffer
      ; suppPrivInfo : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationParameters is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationParameters");
      m_Factory     : IKeyDerivationParametersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IKeyDerivationParameters;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationParametersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.BuildForSP80056a(algorithmId, partyUInfo, partyVInfo, suppPubInfo, suppPrivInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenKeyPairFromCertificateAsync
   (
      certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; hashAlgorithmName : Windows.String
      ; padding : Windows.Security.Cryptography.Core.CryptographicPadding
   )
   return Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.PersistedKeyProvider");
      m_Factory     : IPersistedKeyProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IAsyncOperation_ICryptographicKey;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPersistedKeyProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenKeyPairFromCertificateAsync(certificate, hashAlgorithmName, padding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenPublicKeyFromCertificate
   (
      certificate : Windows.Security.Cryptography.Certificates.ICertificate
      ; hashAlgorithmName : Windows.String
      ; padding : Windows.Security.Cryptography.Core.CryptographicPadding
   )
   return Windows.Security.Cryptography.Core.ICryptographicKey is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.PersistedKeyProvider");
      m_Factory     : IPersistedKeyProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.ICryptographicKey;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPersistedKeyProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenPublicKeyFromCertificate(certificate, hashAlgorithmName, padding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Encrypt
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Encrypt(key, data, iv, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Decrypt
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Decrypt(key, data, iv, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function EncryptAndAuthenticate
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; nonce : Windows.Storage.Streams.IBuffer
      ; authenticatedData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Security.Cryptography.Core.IEncryptedAndAuthenticatedData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IEncryptedAndAuthenticatedData;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.EncryptAndAuthenticate(key, data, nonce, authenticatedData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DecryptAndAuthenticate
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; nonce : Windows.Storage.Streams.IBuffer
      ; authenticationTag : Windows.Storage.Streams.IBuffer
      ; authenticatedData : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DecryptAndAuthenticate(key, data, nonce, authenticationTag, authenticatedData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Sign
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Sign(key, data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function VerifySignature
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; signature : Windows.Storage.Streams.IBuffer
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.VerifySignature(key, data, signature, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DeriveKeyMaterial
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; parameters : Windows.Security.Cryptography.Core.IKeyDerivationParameters
      ; desiredKeySize : Windows.UInt32
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DeriveKeyMaterial(key, parameters, desiredKeySize, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SignHashedData
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SignHashedData(key, data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function VerifySignatureWithHashInput
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; signature : Windows.Storage.Streams.IBuffer
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.VerifySignatureWithHashInput(key, data, signature, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function DecryptAsync
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
      ; iv : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.DecryptAsync(key, data, iv, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SignAsync
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SignAsync(key, data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function SignHashedDataAsync
   (
      key : Windows.Security.Cryptography.Core.ICryptographicKey
      ; data : Windows.Storage.Streams.IBuffer
   )
   return Windows.Storage.Streams.IAsyncOperation_IBuffer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.CryptographicEngine");
      m_Factory     : ICryptographicEngineStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Storage.Streams.IAsyncOperation_IBuffer;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICryptographicEngineStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SignHashedDataAsync(key, data, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IHashAlgorithmProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.HashAlgorithmProvider");
      m_Factory     : IHashAlgorithmProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IHashAlgorithmProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHashAlgorithmProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenAlgorithm(algorithm, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IMacAlgorithmProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.MacAlgorithmProvider");
      m_Factory     : IMacAlgorithmProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IMacAlgorithmProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMacAlgorithmProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenAlgorithm(algorithm, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IKeyDerivationAlgorithmProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmProvider");
      m_Factory     : IKeyDerivationAlgorithmProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IKeyDerivationAlgorithmProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenAlgorithm(algorithm, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.ISymmetricKeyAlgorithmProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricKeyAlgorithmProvider");
      m_Factory     : ISymmetricKeyAlgorithmProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.ISymmetricKeyAlgorithmProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricKeyAlgorithmProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenAlgorithm(algorithm, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function OpenAlgorithm
   (
      algorithm : Windows.String
   )
   return Windows.Security.Cryptography.Core.IAsymmetricKeyAlgorithmProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricKeyAlgorithmProvider");
      m_Factory     : IAsymmetricKeyAlgorithmProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Cryptography.Core.IAsymmetricKeyAlgorithmProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricKeyAlgorithmProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.OpenAlgorithm(algorithm, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Md5
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.HashAlgorithmNames");
      m_Factory     : IHashAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHashAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Md5(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.HashAlgorithmNames");
      m_Factory     : IHashAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHashAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.HashAlgorithmNames");
      m_Factory     : IHashAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHashAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.HashAlgorithmNames");
      m_Factory     : IHashAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHashAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.HashAlgorithmNames");
      m_Factory     : IHashAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHashAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HmacMd5
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.MacAlgorithmNames");
      m_Factory     : IMacAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMacAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HmacMd5(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HmacSha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.MacAlgorithmNames");
      m_Factory     : IMacAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMacAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HmacSha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HmacSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.MacAlgorithmNames");
      m_Factory     : IMacAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMacAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HmacSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HmacSha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.MacAlgorithmNames");
      m_Factory     : IMacAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMacAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HmacSha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HmacSha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.MacAlgorithmNames");
      m_Factory     : IMacAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMacAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HmacSha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AesCmac
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.MacAlgorithmNames");
      m_Factory     : IMacAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMacAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AesCmac(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DesCbc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DesCbc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DesEcb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DesEcb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TripleDesCbc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TripleDesCbc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TripleDesEcb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TripleDesEcb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rc2Cbc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rc2Cbc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rc2Ecb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rc2Ecb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AesCbc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AesCbc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AesEcb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AesEcb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AesGcm
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AesGcm(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AesCcm
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AesCcm(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AesCbcPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AesCbcPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AesEcbPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AesEcbPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DesCbcPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DesCbcPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DesEcbPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DesEcbPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TripleDesCbcPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TripleDesCbcPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TripleDesEcbPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TripleDesEcbPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rc2CbcPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rc2CbcPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rc2EcbPkcs7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rc2EcbPkcs7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rc4
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames");
      m_Factory     : ISymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rc4(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EcdsaSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EcdsaSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EcdsaSha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EcdsaSha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EcdsaSha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EcdsaSha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaPkcs1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaPkcs1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaOaepSha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaOaepSha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaOaepSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaOaepSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaOaepSha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaOaepSha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaOaepSha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaOaepSha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EcdsaP256Sha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EcdsaP256Sha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EcdsaP384Sha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EcdsaP384Sha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_EcdsaP521Sha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_EcdsaP521Sha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DsaSha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DsaSha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DsaSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DsaSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPkcs1Sha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPkcs1Sha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPkcs1Sha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPkcs1Sha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPkcs1Sha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPkcs1Sha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPkcs1Sha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPkcs1Sha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPssSha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPssSha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPssSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPssSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPssSha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPssSha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RsaSignPssSha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames");
      m_Factory     : IAsymmetricAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAsymmetricAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RsaSignPssSha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP160r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP160r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP160t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP160t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP192r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP192r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP192t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP192t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP224r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP224r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP224t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP224t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP256r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP256r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP256t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP256t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP320r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP320r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP320t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP320t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP384r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP384r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP384t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP384t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP512r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP512r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BrainpoolP512t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BrainpoolP512t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Curve25519
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Curve25519(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ec192wapi
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ec192wapi(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NistP192
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NistP192(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NistP224
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NistP224(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NistP256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NistP256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NistP384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NistP384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NistP521
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NistP521(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NumsP256t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NumsP256t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NumsP384t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NumsP384t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NumsP512t1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NumsP512t1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP160k1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP160k1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP160r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP160r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP160r2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP160r2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP192k1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP192k1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP192r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP192r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP224k1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP224k1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP224r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP224r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP256k1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP256k1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP256r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP256r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP384r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP384r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SecP521r1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SecP521r1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wtls7
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wtls7(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wtls9
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wtls9(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wtls12
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wtls12(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_X962P192v1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_X962P192v1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_X962P192v2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_X962P192v2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_X962P192v3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_X962P192v3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_X962P239v1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_X962P239v1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_X962P239v2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_X962P239v2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_X962P239v3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_X962P239v3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_X962P256v1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_X962P256v1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllEccCurveNames
   return Windows.Foundation.Collections.IVectorView_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.EccCurveNames");
      m_Factory     : IEccCurveNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVectorView_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEccCurveNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllEccCurveNames(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CapiKdfMd5
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CapiKdfMd5(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CapiKdfSha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CapiKdfSha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CapiKdfSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CapiKdfSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CapiKdfSha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CapiKdfSha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CapiKdfSha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CapiKdfSha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pbkdf2Md5
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pbkdf2Md5(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pbkdf2Sha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pbkdf2Sha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pbkdf2Sha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pbkdf2Sha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pbkdf2Sha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pbkdf2Sha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pbkdf2Sha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pbkdf2Sha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp800108CtrHmacMd5
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp800108CtrHmacMd5(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp800108CtrHmacSha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp800108CtrHmacSha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp800108CtrHmacSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp800108CtrHmacSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp800108CtrHmacSha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp800108CtrHmacSha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp800108CtrHmacSha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp800108CtrHmacSha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp80056aConcatMd5
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp80056aConcatMd5(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp80056aConcatSha1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp80056aConcatSha1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp80056aConcatSha256
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp80056aConcatSha256(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp80056aConcatSha384
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp80056aConcatSha384(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sp80056aConcatSha512
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames");
      m_Factory     : IKeyDerivationAlgorithmNamesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IKeyDerivationAlgorithmNamesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sp80056aConcatSha512(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
