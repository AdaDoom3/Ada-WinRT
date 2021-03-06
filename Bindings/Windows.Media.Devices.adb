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
with Windows.Media.MediaProperties;
with Windows.Media.Capture;
with Windows.Media.Devices.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Devices is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access CallControlEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Devices.ICallControl(sender));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access DialRequestedEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
      ; e : Windows.Media.Devices.IDialRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Devices.ICallControl(sender), Windows.Media.Devices.IDialRequestedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access RedialRequestedEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
      ; e : Windows.Media.Devices.IRedialRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Devices.ICallControl(sender), Windows.Media.Devices.IRedialRequestedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access KeypadPressedEventHandler_Interface
      ; sender : Windows.Media.Devices.ICallControl
      ; e : Windows.Media.Devices.IKeypadPressedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Devices.ICallControl(sender), Windows.Media.Devices.IKeypadPressedEventArgs(e));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged_Interface
      ; sender : Windows.Object
      ; args : Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Media.Devices.IDefaultAudioDeviceChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IModuleCommandResult_Interface
      ; asyncInfo : Windows.Media.Devices.IAsyncOperation_IModuleCommandResult
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
      This       : access TypedEventHandler_IAudioDeviceModulesManager_add_ModuleNotificationReceived_Interface
      ; sender : Windows.Media.Devices.IAudioDeviceModulesManager
      ; args : Windows.Media.Devices.IAudioDeviceModuleNotificationEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Media.Devices.IAudioDeviceModulesManager(sender), Windows.Media.Devices.IAudioDeviceModuleNotificationEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function Create
   (
      deviceId : Windows.String
   )
   return Windows.Media.Devices.IAudioDeviceModulesManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.AudioDeviceModulesManager");
      m_Factory     : Windows.Media.Devices.IAudioDeviceModulesManagerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Devices.IAudioDeviceModulesManager := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioDeviceModulesManagerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateZoomSettings return Windows.Media.Devices.IZoomSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.ZoomSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Devices.IZoomSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Devices.IID_IZoomSettings'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateFocusSettings return Windows.Media.Devices.IFocusSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.FocusSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Devices.IFocusSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Devices.IID_IFocusSettings'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateRegionOfInterest return Windows.Media.Devices.IRegionOfInterest is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.RegionOfInterest");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Devices.IRegionOfInterest) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Devices.IID_IRegionOfInterest'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateAdvancedPhotoCaptureSettings return Windows.Media.Devices.IAdvancedPhotoCaptureSettings is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.AdvancedPhotoCaptureSettings");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Devices.IAdvancedPhotoCaptureSettings) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Devices.IID_IAdvancedPhotoCaptureSettings'Access, RetVal'access);
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
   
   function GetAudioCaptureSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAudioCaptureSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAudioRenderSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAudioRenderSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetVideoCaptureSelector
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetVideoCaptureSelector(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAudioCaptureId
   (
      role : Windows.Media.Devices.AudioDeviceRole
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAudioCaptureId(role, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDefaultAudioRenderId
   (
      role : Windows.Media.Devices.AudioDeviceRole
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefaultAudioRenderId(role, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function add_DefaultAudioCaptureDeviceChanged
   (
      handler : TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioCaptureDeviceChanged
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_DefaultAudioCaptureDeviceChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_DefaultAudioCaptureDeviceChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_DefaultAudioCaptureDeviceChanged(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function add_DefaultAudioRenderDeviceChanged
   (
      handler : TypedEventHandler_IMediaDeviceStatics_add_DefaultAudioRenderDeviceChanged
   )
   return Windows.Foundation.EventRegistrationToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.EventRegistrationToken;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.add_DefaultAudioRenderDeviceChanged(handler, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure remove_DefaultAudioRenderDeviceChanged
   (
      cookie : Windows.Foundation.EventRegistrationToken
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.MediaDevice");
      m_Factory     : IMediaDeviceStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaDeviceStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.remove_DefaultAudioRenderDeviceChanged(cookie);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetDefault
   return Windows.Media.Devices.ICallControl is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.CallControl");
      m_Factory     : ICallControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Devices.ICallControl;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICallControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDefault(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function FromId
   (
      deviceId : Windows.String
   )
   return Windows.Media.Devices.ICallControl is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Devices.CallControl");
      m_Factory     : ICallControlStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Devices.ICallControl;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ICallControlStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.FromId(deviceId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
