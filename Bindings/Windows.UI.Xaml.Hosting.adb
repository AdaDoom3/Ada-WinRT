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
with Windows.UI.Composition;
with Windows.UI.Xaml;
with Windows.UI.Xaml.Controls;
with Windows.UI.Xaml.Controls.Primitives;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Hosting is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IDesignerAppManager_add_DesignerAppExited_Interface
      ; sender : Windows.UI.Xaml.Hosting.IDesignerAppManager
      ; args : Windows.UI.Xaml.Hosting.IDesignerAppExitedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.UI.Xaml.Hosting.IDesignerAppManager(sender), Windows.UI.Xaml.Hosting.IDesignerAppExitedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDesignerAppView_Interface
      ; asyncInfo : Windows.UI.Xaml.Hosting.IAsyncOperation_IDesignerAppView
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
      appUserModelId : Windows.String
   )
   return Windows.UI.Xaml.Hosting.IDesignerAppManager is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.DesignerAppManager");
      m_Factory     : Windows.UI.Xaml.Hosting.IDesignerAppManagerFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Hosting.IDesignerAppManager := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDesignerAppManagerFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(appUserModelId, RetVal'Access);
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
   
   function GetElementVisual
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.IVisual is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.IVisual;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetElementVisual(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetElementChildVisual
   (
      element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.IVisual is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.IVisual;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetElementChildVisual(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetElementChildVisual
   (
      element : Windows.UI.Xaml.IUIElement
      ; visual : Windows.UI.Composition.IVisual
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetElementChildVisual(element, visual);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetScrollViewerManipulationPropertySet
   (
      scrollViewer : Windows.UI.Xaml.Controls.IScrollViewer
   )
   return Windows.UI.Composition.ICompositionPropertySet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.ICompositionPropertySet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetScrollViewerManipulationPropertySet(scrollViewer, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetImplicitShowAnimation
   (
      element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetImplicitShowAnimation(element, animation);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetImplicitHideAnimation
   (
      element : Windows.UI.Xaml.IUIElement
      ; animation : Windows.UI.Composition.ICompositionAnimationBase
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetImplicitHideAnimation(element, animation);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetIsTranslationEnabled
   (
      element : Windows.UI.Xaml.IUIElement
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsTranslationEnabled(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetPointerPositionPropertySet
   (
      targetElement : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Composition.ICompositionPropertySet is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.ElementCompositionPreview");
      m_Factory     : IElementCompositionPreviewStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Composition.ICompositionPropertySet;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IElementCompositionPreviewStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPointerPositionPropertySet(targetElement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CompleteTimelinesAutomatically
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CompleteTimelinesAutomatically(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure put_CompleteTimelinesAutomatically
   (
      value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.put_CompleteTimelinesAutomatically(value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure SetHost
   (
      host : Windows.UI.Xaml.Hosting.IXamlUIPresenterHost
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetHost(host);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   procedure NotifyWindowSizeChanged
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.NotifyWindowSizeChanged;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function GetFlyoutPlacementTargetInfo
   (
      placementTarget : Windows.UI.Xaml.IFrameworkElement
      ; preferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; targetPreferredPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : access Windows.Boolean
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFlyoutPlacementTargetInfo(placementTarget, preferredPlacement, targetPreferredPlacement, allowFallbacks, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFlyoutPlacement
   (
      placementTargetBounds : Windows.Foundation.Rect
      ; controlSize : Windows.Foundation.Size
      ; minControlSize : Windows.Foundation.Size
      ; containerRect : Windows.Foundation.Rect
      ; targetPreferredPlacement : Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
      ; allowFallbacks : Windows.Boolean
      ; chosenPlacement : access Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
   )
   return Windows.Foundation.Rect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Hosting.XamlUIPresenter");
      m_Factory     : IXamlUIPresenterStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Rect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IXamlUIPresenterStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFlyoutPlacement(placementTargetBounds, controlSize, minControlSize, containerRect, targetPreferredPlacement, allowFallbacks, chosenPlacement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
