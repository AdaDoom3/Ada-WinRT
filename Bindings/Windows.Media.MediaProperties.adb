--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Storage;
with Windows.Storage.Streams;
with Windows.Media.Core;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.MediaProperties is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IMediaEncodingProfile_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IMediaEncodingProfile or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaEncodingProfile_Interface
      ; asyncInfo : Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile
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
   
   
   function CreateMediaPropertySet return Windows.Media.MediaProperties.IMap_Guid_Object is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaPropertySet");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMap_Guid_Object := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.MediaProperties.IID_IMap_Guid_Object'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAudioEncodingProperties return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.MediaProperties.IID_IAudioEncodingProperties'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateVideoEncodingProperties return Windows.Media.MediaProperties.IVideoEncodingProperties is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.VideoEncodingProperties");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IVideoEncodingProperties := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.MediaProperties.IID_IVideoEncodingProperties'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateImageEncodingProperties return Windows.Media.MediaProperties.IImageEncodingProperties is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.ImageEncodingProperties");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IImageEncodingProperties := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.MediaProperties.IID_IImageEncodingProperties'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateContainerEncodingProperties return Windows.Media.MediaProperties.IContainerEncodingProperties is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.ContainerEncodingProperties");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IContainerEncodingProperties := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.MediaProperties.IID_IContainerEncodingProperties'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMediaEncodingProfile return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.MediaProperties.IID_IMediaEncodingProfile'Access, RetVal'Address);
         RefCount := Instance.Release;
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
   
   
   function CreateAlac
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      m_Factory     : IAudioEncodingPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEncodingPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAlac(sampleRate, channelCount, bitsPerSample, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFlac
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      m_Factory     : IAudioEncodingPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEncodingPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFlac(sampleRate, channelCount, bitsPerSample, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAac
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      m_Factory     : IAudioEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAac(sampleRate, channelCount, bitrate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAacAdts
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      m_Factory     : IAudioEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAacAdts(sampleRate, channelCount, bitrate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMp3
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      m_Factory     : IAudioEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMp3(sampleRate, channelCount, bitrate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePcm
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitsPerSample : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      m_Factory     : IAudioEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePcm(sampleRate, channelCount, bitsPerSample, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWma
   (
      sampleRate : Windows.UInt32
      ; channelCount : Windows.UInt32
      ; bitrate : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IAudioEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.AudioEncodingProperties");
      m_Factory     : IAudioEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAudioEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAudioEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWma(sampleRate, channelCount, bitrate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Aac
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Aac(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AacAdts
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AacAdts(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Ac3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Ac3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AmrNb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AmrNb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AmrWb
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AmrWb(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Argb32
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Argb32(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Asf
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Asf(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Avi
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Avi(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bgra8
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bgra8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Bmp
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Bmp(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Eac3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Eac3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Float
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Float(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Gif
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Gif(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_H263
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_H263(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_H264
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_H264(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_H264Es
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_H264Es(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Hevc
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Hevc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HevcEs
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HevcEs(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Iyuv
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Iyuv(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Jpeg
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Jpeg(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_JpegXr
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_JpegXr(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mjpg
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mjpg(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mpeg
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mpeg(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mpeg1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mpeg1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mpeg2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mpeg2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mp3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mp3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Mpeg4
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Mpeg4(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Nv12
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Nv12(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Pcm
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Pcm(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Png
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Png(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rgb24
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rgb24(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Rgb32
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Rgb32(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Tiff
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Tiff(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wave
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wave(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wma8
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wma8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wma9
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wma9(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wmv3
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wmv3(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Wvc1
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Wvc1(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Yuy2
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Yuy2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Yv12
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Yv12(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Alac
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Alac(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Flac
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Flac(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Vp9
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Vp9(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_L8
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_L8(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_L16
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_L16(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_D16
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingSubtypes");
      m_Factory     : IMediaEncodingSubtypesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingSubtypesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_D16(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ConstrainedBaseline
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ConstrainedBaseline(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Baseline
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Baseline(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Extended
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Extended(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Main
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Main(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_High
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_High(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_High10
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_High10(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_High422
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_High422(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_High444
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_High444(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StereoHigh
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StereoHigh(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MultiviewHigh
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.H264ProfileIds");
      m_Factory     : IH264ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IH264ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MultiviewHigh(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Simple
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.Mpeg2ProfileIds");
      m_Factory     : IMpeg2ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMpeg2ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Simple(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Main_Mpeg2ProfileIds
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.Mpeg2ProfileIds");
      m_Factory     : IMpeg2ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMpeg2ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Main(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SignalNoiseRatioScalable
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.Mpeg2ProfileIds");
      m_Factory     : IMpeg2ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMpeg2ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SignalNoiseRatioScalable(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SpatiallyScalable
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.Mpeg2ProfileIds");
      m_Factory     : IMpeg2ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMpeg2ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SpatiallyScalable(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_High_Mpeg2ProfileIds
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.Mpeg2ProfileIds");
      m_Factory     : IMpeg2ProfileIdsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMpeg2ProfileIdsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_High(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateH264
   return Windows.Media.MediaProperties.IVideoEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.VideoEncodingProperties");
      m_Factory     : IVideoEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IVideoEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateH264(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMpeg2
   return Windows.Media.MediaProperties.IVideoEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.VideoEncodingProperties");
      m_Factory     : IVideoEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IVideoEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMpeg2(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUncompressed
   (
      subtype_x : Windows.String
      ; width : Windows.UInt32
      ; height : Windows.UInt32
   )
   return Windows.Media.MediaProperties.IVideoEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.VideoEncodingProperties");
      m_Factory     : IVideoEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IVideoEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUncompressed(subtype_x, width, height, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateHevc
   return Windows.Media.MediaProperties.IVideoEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.VideoEncodingProperties");
      m_Factory     : IVideoEncodingPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IVideoEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IVideoEncodingPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateHevc(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateJpeg
   return Windows.Media.MediaProperties.IImageEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.ImageEncodingProperties");
      m_Factory     : IImageEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IImageEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IImageEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateJpeg(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePng
   return Windows.Media.MediaProperties.IImageEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.ImageEncodingProperties");
      m_Factory     : IImageEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IImageEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IImageEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreatePng(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateJpegXR
   return Windows.Media.MediaProperties.IImageEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.ImageEncodingProperties");
      m_Factory     : IImageEncodingPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IImageEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IImageEncodingPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateJpegXR(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateUncompressed
   (
      format : Windows.Media.MediaProperties.MediaPixelFormat
   )
   return Windows.Media.MediaProperties.IImageEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.ImageEncodingProperties");
      m_Factory     : IImageEncodingPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IImageEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IImageEncodingPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateUncompressed(format, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateBmp
   return Windows.Media.MediaProperties.IImageEncodingProperties is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.ImageEncodingProperties");
      m_Factory     : IImageEncodingPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IImageEncodingProperties;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IImageEncodingPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateBmp(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateM4a
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateM4a(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMp3
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMp3(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWma
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWma(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMp4
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateMp4(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWmv
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWmv(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStreamAsync
   (
      stream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IAsyncOperation_IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStreamAsync(stream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWav
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWav(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAvi
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAvi(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAlac
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateAlac(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFlac
   (
      quality : Windows.Media.MediaProperties.AudioEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFlac(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateHevc
   (
      quality : Windows.Media.MediaProperties.VideoEncodingQuality
   )
   return Windows.Media.MediaProperties.IMediaEncodingProfile is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.MediaProperties.MediaEncodingProfile");
      m_Factory     : IMediaEncodingProfileStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.MediaProperties.IMediaEncodingProfile;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaEncodingProfileStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateHevc(quality, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;