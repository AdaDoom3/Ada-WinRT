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
with Windows.Foundation.Numerics;
package Windows.Perception.People is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IHeadPose_Interface;
   type IHeadPose is access all IHeadPose_Interface'Class;
   type IHeadPose_Ptr is access all IHeadPose;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IHeadPose : aliased constant Windows.IID := (2136655269, 18907, 14239, (148, 41, 50, 162, 250, 243, 79, 166 ));
   
   type IHeadPose_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Position
   (
      This       : access IHeadPose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_ForwardDirection
   (
      This       : access IHeadPose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_UpDirection
   (
      This       : access IHeadPose_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype HeadPose is Windows.Perception.People.IHeadPose;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
