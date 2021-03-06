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
with Windows.Media;
with Windows.Storage.Streams;
with Windows.Media.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.SpeechSynthesis is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpeechSynthesisStream_Interface
      ; asyncInfo : Windows.Media.SpeechSynthesis.IAsyncOperation_ISpeechSynthesisStream
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
   
   function CreateSpeechSynthesizer return Windows.Media.SpeechSynthesis.ISpeechSynthesizer is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.SpeechSynthesis.ISpeechSynthesizer) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.SpeechSynthesis.IID_ISpeechSynthesizer'Access, RetVal'access);
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
   
   function get_AllVoices
   return Windows.Media.SpeechSynthesis.IVectorView_IVoiceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      m_Factory     : IInstalledVoicesStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechSynthesis.IVectorView_IVoiceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInstalledVoicesStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllVoices(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DefaultVoice
   return Windows.Media.SpeechSynthesis.IVoiceInformation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      m_Factory     : IInstalledVoicesStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechSynthesis.IVoiceInformation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInstalledVoicesStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DefaultVoice(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetDefaultVoiceAsync
   (
      voice : Windows.Media.SpeechSynthesis.IVoiceInformation
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechSynthesis.SpeechSynthesizer");
      m_Factory     : IInstalledVoicesStatic2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IInstalledVoicesStatic2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetDefaultVoiceAsync(voice, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
