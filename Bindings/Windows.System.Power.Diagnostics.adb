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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.System.Power.Diagnostics is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function get_DeviceSpecificConversionFactor
   return Windows.Double is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Power.Diagnostics.BackgroundEnergyDiagnostics");
      m_Factory     : IBackgroundEnergyDiagnosticsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Double;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundEnergyDiagnosticsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeviceSpecificConversionFactor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ComputeTotalEnergyUsage
   return Windows.UInt64 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Power.Diagnostics.BackgroundEnergyDiagnostics");
      m_Factory     : IBackgroundEnergyDiagnosticsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt64;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundEnergyDiagnosticsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ComputeTotalEnergyUsage(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ResetTotalEnergyUsage
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Power.Diagnostics.BackgroundEnergyDiagnostics");
      m_Factory     : IBackgroundEnergyDiagnosticsStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IBackgroundEnergyDiagnosticsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ResetTotalEnergyUsage;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_DeviceSpecificConversionFactor_ForegroundEnergyDiagnostics
   return Windows.Double is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Power.Diagnostics.ForegroundEnergyDiagnostics");
      m_Factory     : IForegroundEnergyDiagnosticsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Double;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IForegroundEnergyDiagnosticsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DeviceSpecificConversionFactor(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ComputeTotalEnergyUsage_ForegroundEnergyDiagnostics
   return Windows.UInt64 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Power.Diagnostics.ForegroundEnergyDiagnostics");
      m_Factory     : IForegroundEnergyDiagnosticsStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UInt64;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IForegroundEnergyDiagnosticsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ComputeTotalEnergyUsage(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure ResetTotalEnergyUsage_ForegroundEnergyDiagnostics
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.System.Power.Diagnostics.ForegroundEnergyDiagnostics");
      m_Factory     : IForegroundEnergyDiagnosticsStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IForegroundEnergyDiagnosticsStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ResetTotalEnergyUsage;
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
end;
