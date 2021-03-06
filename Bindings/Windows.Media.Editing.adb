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
with Windows.Media.Effects;
with Windows.Storage;
with Windows.Graphics.Imaging;
with Windows.Media.Transcoding;
with Windows.Media.Core;
with Windows.UI;
with Windows.Graphics.DirectX.Direct3D11;
with Windows.Storage.Streams;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.Editing is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IMediaClip_Interface
      ; asyncInfo : Windows.Media.Editing.IAsyncOperation_IMediaClip
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
      This       : access AsyncOperationCompletedHandler_IMediaComposition_Interface
      ; asyncInfo : Windows.Media.Editing.IAsyncOperation_IMediaComposition
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
      This       : access AsyncOperationCompletedHandler_IBackgroundAudioTrack_Interface
      ; asyncInfo : Windows.Media.Editing.IAsyncOperation_IBackgroundAudioTrack
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
   
   function Create
   (
      clip : Windows.Media.Editing.IMediaClip
   )
   return Windows.Media.Editing.IMediaOverlay is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaOverlay");
      m_Factory     : Windows.Media.Editing.IMediaOverlayFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IMediaOverlay := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaOverlayFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(clip, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPositionAndOpacity
   (
      clip : Windows.Media.Editing.IMediaClip
      ; position : Windows.Foundation.Rect
      ; opacity : Windows.Double
   )
   return Windows.Media.Editing.IMediaOverlay is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaOverlay");
      m_Factory     : Windows.Media.Editing.IMediaOverlayFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IMediaOverlay := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaOverlayFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPositionAndOpacity(clip, position, opacity, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateMediaComposition return Windows.Media.Editing.IMediaComposition is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaComposition");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.Media.Editing.IMediaComposition) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Media.Editing.IID_IMediaComposition'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWithCompositorDefinition
   (
      compositorDefinition : Windows.Media.Effects.IVideoCompositorDefinition
   )
   return Windows.Media.Editing.IMediaOverlayLayer is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaOverlayLayer");
      m_Factory     : Windows.Media.Editing.IMediaOverlayLayerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IMediaOverlayLayer := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaOverlayLayerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithCompositorDefinition(compositorDefinition, RetVal'Access);
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
   
   function CreateFromColor
   (
      color : Windows.UI.Color
      ; originalDuration : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Editing.IMediaClip is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaClip");
      m_Factory     : IMediaClipStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IMediaClip;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaClipStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromColor(color, originalDuration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Editing.IAsyncOperation_IMediaClip is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaClip");
      m_Factory     : IMediaClipStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IAsyncOperation_IMediaClip;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaClipStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromImageFileAsync
   (
      file : Windows.Storage.IStorageFile
      ; originalDuration : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Editing.IAsyncOperation_IMediaClip is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaClip");
      m_Factory     : IMediaClipStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IAsyncOperation_IMediaClip;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaClipStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromImageFileAsync(file, originalDuration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromSurface
   (
      surface : Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
      ; originalDuration : Windows.Foundation.TimeSpan
   )
   return Windows.Media.Editing.IMediaClip is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaClip");
      m_Factory     : IMediaClipStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IMediaClip;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaClipStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromSurface(surface, originalDuration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromEmbeddedAudioTrack
   (
      embeddedAudioTrack : Windows.Media.Editing.IEmbeddedAudioTrack
   )
   return Windows.Media.Editing.IBackgroundAudioTrack is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.BackgroundAudioTrack");
      m_Factory     : IBackgroundAudioTrackStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IBackgroundAudioTrack;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundAudioTrackStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromEmbeddedAudioTrack(embeddedAudioTrack, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Editing.IAsyncOperation_IBackgroundAudioTrack is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.BackgroundAudioTrack");
      m_Factory     : IBackgroundAudioTrackStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IAsyncOperation_IBackgroundAudioTrack;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundAudioTrackStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Media.Editing.IAsyncOperation_IMediaComposition is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.Editing.MediaComposition");
      m_Factory     : IMediaCompositionStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.Editing.IAsyncOperation_IMediaComposition;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMediaCompositionStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
