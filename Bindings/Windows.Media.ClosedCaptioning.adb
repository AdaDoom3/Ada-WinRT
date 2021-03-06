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
with Windows.UI;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Media.ClosedCaptioning is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function get_FontColor
   return Windows.Media.ClosedCaptioning.ClosedCaptionColor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionColor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FontColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ComputedFontColor
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ComputedFontColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FontOpacity
   return Windows.Media.ClosedCaptioning.ClosedCaptionOpacity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionOpacity;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FontOpacity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FontSize
   return Windows.Media.ClosedCaptioning.ClosedCaptionSize is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionSize;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FontSize(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FontStyle
   return Windows.Media.ClosedCaptioning.ClosedCaptionStyle is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionStyle;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FontStyle(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FontEffect
   return Windows.Media.ClosedCaptioning.ClosedCaptionEdgeEffect is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionEdgeEffect;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FontEffect(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BackgroundColor
   return Windows.Media.ClosedCaptioning.ClosedCaptionColor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionColor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BackgroundColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ComputedBackgroundColor
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ComputedBackgroundColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BackgroundOpacity
   return Windows.Media.ClosedCaptioning.ClosedCaptionOpacity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionOpacity;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BackgroundOpacity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RegionColor
   return Windows.Media.ClosedCaptioning.ClosedCaptionColor is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionColor;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RegionColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ComputedRegionColor
   return Windows.UI.Color is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Color;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ComputedRegionColor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RegionOpacity
   return Windows.Media.ClosedCaptioning.ClosedCaptionOpacity is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Media.ClosedCaptioning.ClosedCaptionProperties");
      m_Factory     : IClosedCaptionPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Media.ClosedCaptioning.ClosedCaptionOpacity;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IClosedCaptionPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RegionOpacity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
