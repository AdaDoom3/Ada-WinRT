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
with Windows.Foundation;
package Windows.Devices.Background is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDeviceUseDetails_Interface;
   type IDeviceUseDetails is access all IDeviceUseDetails_Interface'Class;
   type IDeviceUseDetails_Ptr is access all IDeviceUseDetails;
   type IDeviceServicingDetails_Interface;
   type IDeviceServicingDetails is access all IDeviceServicingDetails_Interface'Class;
   type IDeviceServicingDetails_Ptr is access all IDeviceServicingDetails;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDeviceUseDetails : aliased constant Windows.IID := (2102808897, 21886, 16724, (185, 148, 228, 247, 161, 31, 179, 35 ));
   
   type IDeviceUseDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IDeviceUseDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Arguments
   (
      This       : access IDeviceUseDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceServicingDetails : aliased constant Windows.IID := (1252781609, 9028, 19140, (133, 39, 74, 142, 246, 144, 86, 69 ));
   
   type IDeviceServicingDetails_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IDeviceServicingDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Arguments
   (
      This       : access IDeviceServicingDetails_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ExpectedDuration
   (
      This       : access IDeviceServicingDetails_Interface
      ; RetVal : access Windows.Foundation.TimeSpan
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DeviceUseDetails is Windows.Devices.Background.IDeviceUseDetails;
   subtype DeviceServicingDetails is Windows.Devices.Background.IDeviceServicingDetails;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
