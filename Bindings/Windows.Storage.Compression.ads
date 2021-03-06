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
limited with Windows.Storage.Streams;
--------------------------------------------------------------------------------
package Windows.Storage.Compression is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type CompressAlgorithm is (
      InvalidAlgorithm,
      NullAlgorithm,
      Mszip,
      Xpress,
      XpressHuff,
      Lzms
   );
   for CompressAlgorithm use (
      InvalidAlgorithm => 0,
      NullAlgorithm => 1,
      Mszip => 2,
      Xpress => 3,
      XpressHuff => 4,
      Lzms => 5
   );
   for CompressAlgorithm'Size use 32;
   
   type CompressAlgorithm_Ptr is access CompressAlgorithm;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ICompressor_Interface;
   type ICompressor is access all ICompressor_Interface'Class;
   type ICompressor_Ptr is access all ICompressor;
   type IDecompressor_Interface;
   type IDecompressor is access all IDecompressor_Interface'Class;
   type IDecompressor_Ptr is access all IDecompressor;
   type ICompressorFactory_Interface;
   type ICompressorFactory is access all ICompressorFactory_Interface'Class;
   type ICompressorFactory_Ptr is access all ICompressorFactory;
   type IDecompressorFactory_Interface;
   type IDecompressorFactory is access all IDecompressorFactory_Interface'Class;
   type IDecompressorFactory_Ptr is access all IDecompressorFactory;
   type IOutputStream_Imported_Interface;
   type IOutputStream_Imported is access all IOutputStream_Imported_Interface'Class;
   type IOutputStream_Imported_Ptr is access all IOutputStream_Imported;
   type IInputStream_Imported_Interface;
   type IInputStream_Imported is access all IInputStream_Imported_Interface'Class;
   type IInputStream_Imported_Ptr is access all IInputStream_Imported;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ICompressor : aliased constant Windows.IID := (180577370, 22444, 20193, (183, 2, 132, 211, 157, 84, 36, 224 ));
   
   type ICompressor_Interface is interface and Windows.IInspectable_Interface;
   
   function FinishAsync
   (
      This       : access ICompressor_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function DetachStream
   (
      This       : access ICompressor_Interface
      ; RetVal : access Windows.Storage.Streams.IOutputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDecompressor : aliased constant Windows.IID := (3095658054, 54922, 19595, (173, 160, 78, 232, 19, 252, 82, 131 ));
   
   type IDecompressor_Interface is interface and Windows.IInspectable_Interface;
   
   function DetachStream
   (
      This       : access IDecompressor_Interface
      ; RetVal : access Windows.Storage.Streams.IInputStream
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ICompressorFactory : aliased constant Windows.IID := (1597871780, 11515, 17452, (168, 186, 215, 209, 27, 3, 157, 160 ));
   
   type ICompressorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateCompressor
   (
      This       : access ICompressorFactory_Interface
      ; underlyingStream : Windows.Storage.Streams.IOutputStream
      ; RetVal : access Windows.Storage.Compression.ICompressor
   )
   return Windows.HRESULT is abstract;
   
   function CreateCompressorEx
   (
      This       : access ICompressorFactory_Interface
      ; underlyingStream : Windows.Storage.Streams.IOutputStream
      ; algorithm : Windows.Storage.Compression.CompressAlgorithm
      ; blockSize : Windows.UInt32
      ; RetVal : access Windows.Storage.Compression.ICompressor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDecompressorFactory : aliased constant Windows.IID := (1396171346, 7586, 17121, (136, 52, 3, 121, 210, 141, 116, 47 ));
   
   type IDecompressorFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateDecompressor
   (
      This       : access IDecompressorFactory_Interface
      ; underlyingStream : Windows.Storage.Streams.IInputStream
      ; RetVal : access Windows.Storage.Compression.IDecompressor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IOutputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function WriteAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FlushAsync
   (
      This       : access IOutputStream_Imported_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   type IInputStream_Imported_Interface is interface and Windows.IInspectable_Interface;
   
   function ReadAsync
   (
      This       : access IInputStream_Imported_Interface
      ; buffer : Windows.Storage.Streams.IBuffer
      ; count : Windows.UInt32
      ; options : Windows.Storage.Streams.InputStreamOptions
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype Compressor is Windows.Storage.Compression.ICompressor;
   function CreateCompressor
   (
      underlyingStream : Windows.Storage.Streams.IOutputStream
   )
   return Windows.Storage.Compression.ICompressor;
   
   function CreateCompressorEx
   (
      underlyingStream : Windows.Storage.Streams.IOutputStream
      ; algorithm : Windows.Storage.Compression.CompressAlgorithm
      ; blockSize : Windows.UInt32
   )
   return Windows.Storage.Compression.ICompressor;
   
   subtype Decompressor is Windows.Storage.Compression.IDecompressor;
   function CreateDecompressor
   (
      underlyingStream : Windows.Storage.Streams.IInputStream
   )
   return Windows.Storage.Compression.IDecompressor;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
