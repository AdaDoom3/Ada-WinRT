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
with Windows.System;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Security.Authentication.OnlineId is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOnlineIdSystemTicketResult_Interface
      ; asyncInfo : Windows.Security.Authentication.OnlineId.IAsyncOperation_IOnlineIdSystemTicketResult
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
   
   function CreateOnlineIdServiceTicketRequest
   (
      service : Windows.String
      ; policy : Windows.String
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdServiceTicketRequest");
      m_Factory     : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdServiceTicketRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateOnlineIdServiceTicketRequest(service, policy, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateOnlineIdServiceTicketRequestAdvanced
   (
      service : Windows.String
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdServiceTicketRequest");
      m_Factory     : Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequestFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdServiceTicketRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdServiceTicketRequestFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateOnlineIdServiceTicketRequestAdvanced(service, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateOnlineIdAuthenticator return Windows.Security.Authentication.OnlineId.IOnlineIdAuthenticator is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdAuthenticator");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Security.Authentication.OnlineId.IOnlineIdAuthenticator) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Security.Authentication.OnlineId.IID_IOnlineIdAuthenticator'Access, RetVal'access);
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
   
   function get_Default
   return Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdSystemAuthenticator");
      m_Factory     : IOnlineIdSystemAuthenticatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdSystemAuthenticatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Default(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Security.Authentication.OnlineId.OnlineIdSystemAuthenticator");
      m_Factory     : IOnlineIdSystemAuthenticatorStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Security.Authentication.OnlineId.IOnlineIdSystemAuthenticatorForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IOnlineIdSystemAuthenticatorStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
