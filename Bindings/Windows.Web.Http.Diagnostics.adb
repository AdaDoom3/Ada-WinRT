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
with Windows.Web.Http;
with Windows.System.Diagnostics;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.Http.Diagnostics is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestSent_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestSentEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider(sender), Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestSentEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_ResponseReceived_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderResponseReceivedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider(sender), Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderResponseReceivedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IHttpDiagnosticProvider_add_RequestResponseCompleted_Interface
      ; sender : Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider
      ; args : Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider(sender), Windows.Web.Http.Diagnostics.IHttpDiagnosticProviderRequestResponseCompletedEventArgs(args));
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
   
   function CreateFromProcessDiagnosticInfo
   (
      processDiagnosticInfo : Windows.System.Diagnostics.IProcessDiagnosticInfo
   )
   return Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.Diagnostics.HttpDiagnosticProvider");
      m_Factory     : IHttpDiagnosticProviderStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.Diagnostics.IHttpDiagnosticProvider;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpDiagnosticProviderStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromProcessDiagnosticInfo(processDiagnosticInfo, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
