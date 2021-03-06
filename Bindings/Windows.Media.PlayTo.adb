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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.PlayTo is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_PlayRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_PauseRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_SourceChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.ISourceChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), Windows.Media.PlayTo.ISourceChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_PlaybackRateChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.IPlaybackRateChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), Windows.Media.PlayTo.IPlaybackRateChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_CurrentTimeChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.ICurrentTimeChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), Windows.Media.PlayTo.ICurrentTimeChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_MuteChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.IMuteChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), Windows.Media.PlayTo.IMuteChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_VolumeChangeRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Media.PlayTo.IVolumeChangeRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), Windows.Media.PlayTo.IVolumeChangeRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_TimeUpdateRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToReceiver_add_StopRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToReceiver
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToReceiver(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToConnection_add_StateChanged_Interface
      ; sender : Windows.Media.PlayTo.IPlayToConnection
      ; args : Windows.Media.PlayTo.IPlayToConnectionStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToConnection(sender), Windows.Media.PlayTo.IPlayToConnectionStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToConnection_add_Transferred_Interface
      ; sender : Windows.Media.PlayTo.IPlayToConnection
      ; args : Windows.Media.PlayTo.IPlayToConnectionTransferredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToConnection(sender), Windows.Media.PlayTo.IPlayToConnectionTransferredEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToConnection_add_Error_Interface
      ; sender : Windows.Media.PlayTo.IPlayToConnection
      ; args : Windows.Media.PlayTo.IPlayToConnectionErrorEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToConnection(sender), Windows.Media.PlayTo.IPlayToConnectionErrorEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToManager_add_SourceRequested_Interface
      ; sender : Windows.Media.PlayTo.IPlayToManager
      ; args : Windows.Media.PlayTo.IPlayToSourceRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToManager(sender), Windows.Media.PlayTo.IPlayToSourceRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPlayToManager_add_SourceSelected_Interface
      ; sender : Windows.Media.PlayTo.IPlayToManager
      ; args : Windows.Media.PlayTo.IPlayToSourceSelectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.PlayTo.IPlayToManager(sender), Windows.Media.PlayTo.IPlayToSourceSelectedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreatePlayToReceiver return Windows.Media.PlayTo.IPlayToReceiver is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.PlayTo.PlayToReceiver");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.PlayTo.IPlayToReceiver) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.PlayTo.IID_IPlayToReceiver'Access, RetVal'access);
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
   
end;
