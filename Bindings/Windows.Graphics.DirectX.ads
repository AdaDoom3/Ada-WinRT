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
package Windows.Graphics.DirectX is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DirectXAlphaMode is (
      Unspecified,
      Premultiplied,
      Straight,
      Ignore
   );
   for DirectXAlphaMode use (
      Unspecified => 0,
      Premultiplied => 1,
      Straight => 2,
      Ignore => 3
   );
   for DirectXAlphaMode'Size use 32;
   
   type DirectXAlphaMode_Ptr is access DirectXAlphaMode;
   
   type DirectXPixelFormat is (
      Unknown,
      R32G32B32A32Typeless,
      R32G32B32A32Float,
      R32G32B32A32UInt,
      R32G32B32A32Int,
      R32G32B32Typeless,
      R32G32B32Float,
      R32G32B32UInt,
      R32G32B32Int,
      R16G16B16A16Typeless,
      R16G16B16A16Float,
      R16G16B16A16UIntNormalized,
      R16G16B16A16UInt,
      R16G16B16A16IntNormalized,
      R16G16B16A16Int,
      R32G32Typeless,
      R32G32Float,
      R32G32UInt,
      R32G32Int,
      R32G8X24Typeless,
      D32FloatS8X24UInt,
      R32FloatX8X24Typeless,
      X32TypelessG8X24UInt,
      R10G10B10A2Typeless,
      R10G10B10A2UIntNormalized,
      R10G10B10A2UInt,
      R11G11B10Float,
      R8G8B8A8Typeless,
      R8G8B8A8UIntNormalized,
      R8G8B8A8UIntNormalizedSrgb,
      R8G8B8A8UInt,
      R8G8B8A8IntNormalized,
      R8G8B8A8Int,
      R16G16Typeless,
      R16G16Float,
      R16G16UIntNormalized,
      R16G16UInt,
      R16G16IntNormalized,
      R16G16Int,
      R32Typeless,
      D32Float,
      R32Float,
      R32UInt,
      R32Int,
      R24G8Typeless,
      D24UIntNormalizedS8UInt,
      R24UIntNormalizedX8Typeless,
      X24TypelessG8UInt,
      R8G8Typeless,
      R8G8UIntNormalized,
      R8G8UInt,
      R8G8IntNormalized,
      R8G8Int,
      R16Typeless,
      R16Float,
      D16UIntNormalized,
      R16UIntNormalized,
      R16UInt,
      R16IntNormalized,
      R16Int,
      R8Typeless,
      R8UIntNormalized,
      R8UInt,
      R8IntNormalized,
      R8Int,
      A8UIntNormalized,
      R1UIntNormalized,
      R9G9B9E5SharedExponent,
      R8G8B8G8UIntNormalized,
      G8R8G8B8UIntNormalized,
      BC1Typeless,
      BC1UIntNormalized,
      BC1UIntNormalizedSrgb,
      BC2Typeless,
      BC2UIntNormalized,
      BC2UIntNormalizedSrgb,
      BC3Typeless,
      BC3UIntNormalized,
      BC3UIntNormalizedSrgb,
      BC4Typeless,
      BC4UIntNormalized,
      BC4IntNormalized,
      BC5Typeless,
      BC5UIntNormalized,
      BC5IntNormalized,
      B5G6R5UIntNormalized,
      B5G5R5A1UIntNormalized,
      B8G8R8A8UIntNormalized,
      B8G8R8X8UIntNormalized,
      R10G10B10XRBiasA2UIntNormalized,
      B8G8R8A8Typeless,
      B8G8R8A8UIntNormalizedSrgb,
      B8G8R8X8Typeless,
      B8G8R8X8UIntNormalizedSrgb,
      BC6HTypeless,
      BC6H16UnsignedFloat,
      BC6H16Float,
      BC7Typeless,
      BC7UIntNormalized,
      BC7UIntNormalizedSrgb,
      Ayuv,
      Y410,
      Y416,
      NV12,
      P010,
      P016,
      Opaque420,
      Yuy2,
      Y210,
      Y216,
      NV11,
      AI44,
      IA44,
      P8,
      A8P8,
      B4G4R4A4UIntNormalized,
      P208,
      V208,
      V408
   );
   for DirectXPixelFormat use (
      Unknown => 0,
      R32G32B32A32Typeless => 1,
      R32G32B32A32Float => 2,
      R32G32B32A32UInt => 3,
      R32G32B32A32Int => 4,
      R32G32B32Typeless => 5,
      R32G32B32Float => 6,
      R32G32B32UInt => 7,
      R32G32B32Int => 8,
      R16G16B16A16Typeless => 9,
      R16G16B16A16Float => 10,
      R16G16B16A16UIntNormalized => 11,
      R16G16B16A16UInt => 12,
      R16G16B16A16IntNormalized => 13,
      R16G16B16A16Int => 14,
      R32G32Typeless => 15,
      R32G32Float => 16,
      R32G32UInt => 17,
      R32G32Int => 18,
      R32G8X24Typeless => 19,
      D32FloatS8X24UInt => 20,
      R32FloatX8X24Typeless => 21,
      X32TypelessG8X24UInt => 22,
      R10G10B10A2Typeless => 23,
      R10G10B10A2UIntNormalized => 24,
      R10G10B10A2UInt => 25,
      R11G11B10Float => 26,
      R8G8B8A8Typeless => 27,
      R8G8B8A8UIntNormalized => 28,
      R8G8B8A8UIntNormalizedSrgb => 29,
      R8G8B8A8UInt => 30,
      R8G8B8A8IntNormalized => 31,
      R8G8B8A8Int => 32,
      R16G16Typeless => 33,
      R16G16Float => 34,
      R16G16UIntNormalized => 35,
      R16G16UInt => 36,
      R16G16IntNormalized => 37,
      R16G16Int => 38,
      R32Typeless => 39,
      D32Float => 40,
      R32Float => 41,
      R32UInt => 42,
      R32Int => 43,
      R24G8Typeless => 44,
      D24UIntNormalizedS8UInt => 45,
      R24UIntNormalizedX8Typeless => 46,
      X24TypelessG8UInt => 47,
      R8G8Typeless => 48,
      R8G8UIntNormalized => 49,
      R8G8UInt => 50,
      R8G8IntNormalized => 51,
      R8G8Int => 52,
      R16Typeless => 53,
      R16Float => 54,
      D16UIntNormalized => 55,
      R16UIntNormalized => 56,
      R16UInt => 57,
      R16IntNormalized => 58,
      R16Int => 59,
      R8Typeless => 60,
      R8UIntNormalized => 61,
      R8UInt => 62,
      R8IntNormalized => 63,
      R8Int => 64,
      A8UIntNormalized => 65,
      R1UIntNormalized => 66,
      R9G9B9E5SharedExponent => 67,
      R8G8B8G8UIntNormalized => 68,
      G8R8G8B8UIntNormalized => 69,
      BC1Typeless => 70,
      BC1UIntNormalized => 71,
      BC1UIntNormalizedSrgb => 72,
      BC2Typeless => 73,
      BC2UIntNormalized => 74,
      BC2UIntNormalizedSrgb => 75,
      BC3Typeless => 76,
      BC3UIntNormalized => 77,
      BC3UIntNormalizedSrgb => 78,
      BC4Typeless => 79,
      BC4UIntNormalized => 80,
      BC4IntNormalized => 81,
      BC5Typeless => 82,
      BC5UIntNormalized => 83,
      BC5IntNormalized => 84,
      B5G6R5UIntNormalized => 85,
      B5G5R5A1UIntNormalized => 86,
      B8G8R8A8UIntNormalized => 87,
      B8G8R8X8UIntNormalized => 88,
      R10G10B10XRBiasA2UIntNormalized => 89,
      B8G8R8A8Typeless => 90,
      B8G8R8A8UIntNormalizedSrgb => 91,
      B8G8R8X8Typeless => 92,
      B8G8R8X8UIntNormalizedSrgb => 93,
      BC6HTypeless => 94,
      BC6H16UnsignedFloat => 95,
      BC6H16Float => 96,
      BC7Typeless => 97,
      BC7UIntNormalized => 98,
      BC7UIntNormalizedSrgb => 99,
      Ayuv => 100,
      Y410 => 101,
      Y416 => 102,
      NV12 => 103,
      P010 => 104,
      P016 => 105,
      Opaque420 => 106,
      Yuy2 => 107,
      Y210 => 108,
      Y216 => 109,
      NV11 => 110,
      AI44 => 111,
      IA44 => 112,
      P8 => 113,
      A8P8 => 114,
      B4G4R4A4UIntNormalized => 115,
      P208 => 130,
      V208 => 131,
      V408 => 132
   );
   for DirectXPixelFormat'Size use 32;
   
   type DirectXPixelFormat_Ptr is access DirectXPixelFormat;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IIterator_DirectXPixelFormat_Interface;
   type IIterator_DirectXPixelFormat is access all IIterator_DirectXPixelFormat_Interface'Class;
   type IIterator_DirectXPixelFormat_Ptr is access all IIterator_DirectXPixelFormat;
   type IIterable_DirectXPixelFormat_Interface;
   type IIterable_DirectXPixelFormat is access all IIterable_DirectXPixelFormat_Interface'Class;
   type IIterable_DirectXPixelFormat_Ptr is access all IIterable_DirectXPixelFormat;
   type IVectorView_DirectXPixelFormat_Interface;
   type IVectorView_DirectXPixelFormat is access all IVectorView_DirectXPixelFormat_Interface'Class;
   type IVectorView_DirectXPixelFormat_Ptr is access all IVectorView_DirectXPixelFormat;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IIterator_DirectXPixelFormat : aliased constant Windows.IID := (3925959056, 44160, 22592, (143, 88, 255, 67, 76, 123, 41, 7 ));
   
   type IIterator_DirectXPixelFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_DirectXPixelFormat_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_DirectXPixelFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_DirectXPixelFormat_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_DirectXPixelFormat_Interface
      ; items : Windows.Graphics.DirectX.DirectXPixelFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_DirectXPixelFormat : aliased constant Windows.IID := (956887750, 6894, 20777, (185, 166, 42, 110, 1, 217, 80, 126 ));
   
   type IIterable_DirectXPixelFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_DirectXPixelFormat_Interface
      ; RetVal : access Windows.Graphics.DirectX.IIterator_DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_DirectXPixelFormat : aliased constant Windows.IID := (517841346, 3950, 20844, (128, 184, 118, 135, 220, 209, 40, 14 ));
   
   type IVectorView_DirectXPixelFormat_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_DirectXPixelFormat_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_DirectXPixelFormat_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_DirectXPixelFormat_Interface
      ; value : Windows.Graphics.DirectX.DirectXPixelFormat
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_DirectXPixelFormat_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Graphics.DirectX.DirectXPixelFormat_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
