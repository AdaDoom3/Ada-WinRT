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
with Windows.Graphics.Printing;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Graphics.Printing.OptionDetails is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTaskOptionDetails_add_OptionChanged_Interface
      ; sender : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails
      ; args : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails(sender), Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionChangedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IPrintTaskOptionDetails_add_BeginValidation_Interface
      ; sender : Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails(sender), args);
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
   
   function GetFromPrintTaskOptions
   (
      printTaskOptions : Windows.Graphics.Printing.IPrintTaskOptionsCore
   )
   return Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Graphics.Printing.OptionDetails.PrintTaskOptionDetails");
      m_Factory     : IPrintTaskOptionDetailsStatic := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Graphics.Printing.OptionDetails.IPrintTaskOptionDetails;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPrintTaskOptionDetailsStatic'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFromPrintTaskOptions(printTaskOptions, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
