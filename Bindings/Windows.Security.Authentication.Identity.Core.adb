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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.Identity.Core is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorOneTimeCodedInfo_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorOneTimeCodedInfo
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
      This       : access AsyncOperationCompletedHandler_MicrosoftAccountMultiFactorServiceResponse_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_MicrosoftAccountMultiFactorServiceResponse
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
      This       : access AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorGetSessionsResult_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorGetSessionsResult
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
      This       : access AsyncOperationCompletedHandler_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo_Interface
      ; asyncInfo : Windows.Security.Authentication.Identity.Core.IAsyncOperation_IMicrosoftAccountMultiFactorUnregisteredAccountsAndSessionInfo
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
   
   function get_Current
   return Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorAuthenticationManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorAuthenticationManager");
      m_Factory     : IMicrosoftAccountMultiFactorAuthenticatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.Identity.Core.IMicrosoftAccountMultiFactorAuthenticationManager;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMicrosoftAccountMultiFactorAuthenticatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Current(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
