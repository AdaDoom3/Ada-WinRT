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
with Windows.Storage;
with Windows.Globalization;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.SpeechRecognition is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpeechRecognitionCompilationResult_Interface
      ; asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionCompilationResult
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
      This       : access AsyncOperationCompletedHandler_ISpeechRecognitionResult_Interface
      ; asyncInfo : Windows.Media.SpeechRecognition.IAsyncOperation_ISpeechRecognitionResult
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
      This       : access TypedEventHandler_ISpeechRecognizer_add_RecognitionQualityDegrading_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionQualityDegradingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechRecognizer(sender), Windows.Media.SpeechRecognition.ISpeechRecognitionQualityDegradingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechRecognizer_add_StateChanged_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognizerStateChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechRecognizer(sender), Windows.Media.SpeechRecognition.ISpeechRecognizerStateChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechRecognizer2_add_HypothesisGenerated_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechRecognizer
      ; args : Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesisGeneratedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechRecognizer(sender), Windows.Media.SpeechRecognition.ISpeechRecognitionHypothesisGeneratedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_Completed_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession
      ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession(sender), Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_ISpeechContinuousRecognitionSession_add_ResultGenerated_Interface
      ; sender : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession
      ; args : Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionResultGeneratedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionSession(sender), Windows.Media.SpeechRecognition.ISpeechContinuousRecognitionResultGeneratedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionTopicConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionTopicConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(scenario, topicHint, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTag
   (
      scenario : Windows.Media.SpeechRecognition.SpeechRecognitionScenario
      ; topicHint : Windows.String
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionTopicConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionTopicConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionTopicConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTag(scenario, topicHint, tag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      commands : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionListConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionListConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(commands, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTag
   (
      commands : Windows.Foundation.Collections.IIterable_String
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionListConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionListConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionListConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTag(commands, tag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionGrammarFileConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionGrammarFileConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithTag
   (
      file : Windows.Storage.IStorageFile
      ; tag : Windows.String
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognitionGrammarFileConstraint");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraintFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognitionGrammarFileConstraint := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognitionGrammarFileConstraintFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithTag(file, tag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      language : Windows.Globalization.ILanguage
   )
   return Windows.Media.SpeechRecognition.ISpeechRecognizer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : Windows.Media.SpeechRecognition.ISpeechRecognizerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.SpeechRecognition.ISpeechRecognizer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(language, RetVal'Access);
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
   
   function get_SystemSpeechLanguage
   return Windows.Globalization.ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.ILanguage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SystemSpeechLanguage(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedTopicLanguages
   return Windows.Globalization.IVectorView_ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.IVectorView_ILanguage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedTopicLanguages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedGrammarLanguages
   return Windows.Globalization.IVectorView_ILanguage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Globalization.IVectorView_ILanguage;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedGrammarLanguages(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function TrySetSystemSpeechLanguageAsync
   (
      speechLanguage : Windows.Globalization.ILanguage
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.SpeechRecognizer");
      m_Factory     : ISpeechRecognizerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpeechRecognizerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.TrySetSystemSpeechLanguageAsync(speechLanguage, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function InstallCommandSetsFromStorageFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.VoiceCommandManager");
      m_Factory     : IVoiceCommandManager := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandManager'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.InstallCommandSetsFromStorageFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_InstalledCommandSets
   return Windows.Address is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.SpeechRecognition.VoiceCommandManager");
      m_Factory     : IVoiceCommandManager := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Address;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVoiceCommandManager'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_InstalledCommandSets(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
