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
with Windows.Media.MediaProperties;
with Windows.Media.Capture;
with Windows.Devices.Enumeration;
with Windows.Storage;
with Windows.Media;
with Windows.Media.Render;
with Windows.Media.Effects;
with Windows.Media.Transcoding;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Audio is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ICreateAudioGraphResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioDeviceInputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceInputNodeResult
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioDeviceOutputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioDeviceOutputNodeResult
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioFileInputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileInputNodeResult
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
      This       : access AsyncOperationCompletedHandler_ICreateAudioFileOutputNodeResult_Interface
      ; asyncInfo : Windows.Media.Audio.IAsyncOperation_ICreateAudioFileOutputNodeResult
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
      This       : access TypedEventHandler_IAudioGraph_add_QuantumStarted_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioGraph(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioGraph_add_QuantumProcessed_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioGraph(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioGraph_add_UnrecoverableErrorOccurred_Interface
      ; sender : Windows.Media.Audio.IAudioGraph
      ; args : Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioGraph(sender), Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioFrameInputNode_add_AudioFrameCompleted_Interface
      ; sender : Windows.Media.Audio.IAudioFrameInputNode
      ; args : Windows.Media.Audio.IAudioFrameCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioFrameInputNode(sender), Windows.Media.Audio.IAudioFrameCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioFrameInputNode_add_QuantumStarted_Interface
      ; sender : Windows.Media.Audio.IAudioFrameInputNode
      ; args : Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioFrameInputNode(sender), Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IAudioFileInputNode_add_FileCompleted_Interface
      ; sender : Windows.Media.Audio.IAudioFileInputNode
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Audio.IAudioFileInputNode(sender), args);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      audioRenderCategory : Windows.Media.Render.AudioRenderCategory
   )
   return Windows.Media.Audio.IAudioGraphSettings is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioGraphSettings");
      m_Factory     : Windows.Media.Audio.IAudioGraphSettingsFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioGraphSettings := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioGraphSettingsFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioRenderCategory, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAudioNodeEmitter return Windows.Media.Audio.IAudioNodeEmitter is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitter");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Audio.IAudioNodeEmitter) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Audio.IID_IAudioNodeEmitter'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateAudioNodeListener return Windows.Media.Audio.IAudioNodeListener is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeListener");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Audio.IAudioNodeListener) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Audio.IID_IAudioNodeListener'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IEqualizerEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.EqualizerEffectDefinition");
      m_Factory     : Windows.Media.Audio.IEqualizerEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IEqualizerEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEqualizerEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IReverbEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.ReverbEffectDefinition");
      m_Factory     : Windows.Media.Audio.IReverbEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IReverbEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IReverbEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.IEchoEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.EchoEffectDefinition");
      m_Factory     : Windows.Media.Audio.IEchoEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IEchoEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IEchoEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      audioGraph : Windows.Media.Audio.IAudioGraph
   )
   return Windows.Media.Audio.ILimiterEffectDefinition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.LimiterEffectDefinition");
      m_Factory     : Windows.Media.Audio.ILimiterEffectDefinitionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.ILimiterEffectDefinition := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ILimiterEffectDefinitionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(audioGraph, RetVal'Access);
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
   
   function CreateAsync
   (
      settings : Windows.Media.Audio.IAudioGraphSettings
   )
   return Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioGraph");
      m_Factory     : IAudioGraphStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAsyncOperation_ICreateAudioGraphResult;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioGraphStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAsync(settings, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCone
   (
      innerAngle : Windows.Double
      ; outerAngle : Windows.Double
      ; outerAngleGain : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterShape is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterShape");
      m_Factory     : IAudioNodeEmitterShapeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterShape;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterShapeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCone(innerAngle, outerAngle, outerAngleGain, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateOmnidirectional
   return Windows.Media.Audio.IAudioNodeEmitterShape is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterShape");
      m_Factory     : IAudioNodeEmitterShapeStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterShape;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterShapeStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateOmnidirectional(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateNatural
   (
      minGain : Windows.Double
      ; maxGain : Windows.Double
      ; unityGainDistance : Windows.Double
      ; cutoffDistance : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterDecayModel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterDecayModel");
      m_Factory     : IAudioNodeEmitterDecayModelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterDecayModel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterDecayModelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateNatural(minGain, maxGain, unityGainDistance, cutoffDistance, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateCustom
   (
      minGain : Windows.Double
      ; maxGain : Windows.Double
   )
   return Windows.Media.Audio.IAudioNodeEmitterDecayModel is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Audio.AudioNodeEmitterDecayModel");
      m_Factory     : IAudioNodeEmitterDecayModelStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Audio.IAudioNodeEmitterDecayModel;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioNodeEmitterDecayModelStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateCustom(minGain, maxGain, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
