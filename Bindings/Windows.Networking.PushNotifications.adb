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
with Windows.Storage.Streams;
with Windows.UI.Notifications;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Networking.PushNotifications is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPushNotificationChannel_Interface
      ; asyncInfo : Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel
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
      This       : access TypedEventHandler_IPushNotificationChannel_add_PushNotificationReceived_Interface
      ; sender : Windows.Networking.PushNotifications.IPushNotificationChannel
      ; args : Windows.Networking.PushNotifications.IPushNotificationReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Networking.PushNotifications.IPushNotificationChannel(sender), Windows.Networking.PushNotifications.IPushNotificationReceivedEventArgs(args));
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
   
   function CreatePushNotificationChannelForApplicationAsync
   return Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.PushNotifications.PushNotificationChannelManager");
      m_Factory     : IPushNotificationChannelManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPushNotificationChannelManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePushNotificationChannelForApplicationAsync(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePushNotificationChannelForApplicationAsyncWithId
   (
      applicationId : Windows.String
   )
   return Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.PushNotifications.PushNotificationChannelManager");
      m_Factory     : IPushNotificationChannelManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPushNotificationChannelManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePushNotificationChannelForApplicationAsyncWithId(applicationId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePushNotificationChannelForSecondaryTileAsync
   (
      tileId : Windows.String
   )
   return Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.PushNotifications.PushNotificationChannelManager");
      m_Factory     : IPushNotificationChannelManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.PushNotifications.IAsyncOperation_IPushNotificationChannel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPushNotificationChannelManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePushNotificationChannelForSecondaryTileAsync(tileId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.PushNotifications.PushNotificationChannelManager");
      m_Factory     : IPushNotificationChannelManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPushNotificationChannelManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefault
   return Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Networking.PushNotifications.PushNotificationChannelManager");
      m_Factory     : IPushNotificationChannelManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Networking.PushNotifications.IPushNotificationChannelManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPushNotificationChannelManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
