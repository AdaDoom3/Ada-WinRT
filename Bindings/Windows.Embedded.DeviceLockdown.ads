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
with Windows.Foundation.Collections;
with Windows; use Windows;
with Windows.Foundation;
package Windows.Embedded.DeviceLockdown is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type DeviceLockdownContract is null record;
   pragma Convention (C_Pass_By_Copy , DeviceLockdownContract);
   
   type DeviceLockdownContract_Ptr is access DeviceLockdownContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDeviceLockdownProfileInformation_Interface;
   type IDeviceLockdownProfileInformation is access all IDeviceLockdownProfileInformation_Interface'Class;
   type IDeviceLockdownProfileInformation_Ptr is access all IDeviceLockdownProfileInformation;
   type IDeviceLockdownProfileStatics_Interface;
   type IDeviceLockdownProfileStatics is access all IDeviceLockdownProfileStatics_Interface'Class;
   type IDeviceLockdownProfileStatics_Ptr is access all IDeviceLockdownProfileStatics;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDeviceLockdownProfileInformation : aliased constant Windows.IID := (2038489422, 17841, 19094, (146, 252, 98, 117, 107, 115, 150, 120 ));
   
   type IDeviceLockdownProfileInformation_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Name
   (
      This       : access IDeviceLockdownProfileInformation_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDeviceLockdownProfileStatics : aliased constant Windows.IID := (1647274341, 63912, 16801, (166, 145, 136, 205, 128, 199, 160, 105 ));
   
   type IDeviceLockdownProfileStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetSupportedLockdownProfiles
   (
      This       : access IDeviceLockdownProfileStatics_Interface
      ; RetVal : access Windows.Foundation.Collections.IVectorView_Guid -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetCurrentLockdownProfile
   (
      This       : access IDeviceLockdownProfileStatics_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function ApplyLockdownProfileAsync
   (
      This       : access IDeviceLockdownProfileStatics_Interface
      ; profileID : Windows.Guid
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function GetLockdownProfileInformation
   (
      This       : access IDeviceLockdownProfileStatics_Interface
      ; profileID : Windows.Guid
      ; RetVal : access Windows.Embedded.DeviceLockdown.IDeviceLockdownProfileInformation
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DeviceLockdownProfileInformation is Windows.Embedded.DeviceLockdown.IDeviceLockdownProfileInformation;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetSupportedLockdownProfiles
   return Windows.Foundation.Collections.IVectorView_Guid;
   
   function GetCurrentLockdownProfile
   return Windows.Guid;
   
   function ApplyLockdownProfileAsync
   (
      profileID : Windows.Guid
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetLockdownProfileInformation
   (
      profileID : Windows.Guid
   )
   return Windows.Embedded.DeviceLockdown.IDeviceLockdownProfileInformation;
   
end;
