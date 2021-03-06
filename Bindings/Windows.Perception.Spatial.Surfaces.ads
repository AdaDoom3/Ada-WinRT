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
limited with Windows.Graphics.DirectX;
limited with Windows.Storage.Streams;
with Windows.Foundation.Numerics;
with Windows; use Windows;
with Windows.Foundation;
with Windows.Foundation.Collections;
--------------------------------------------------------------------------------
package Windows.Perception.Spatial.Surfaces is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_ISpatialSurfaceMesh_Interface;
   type AsyncOperationCompletedHandler_ISpatialSurfaceMesh is access all AsyncOperationCompletedHandler_ISpatialSurfaceMesh_Interface'Class;
   type AsyncOperationCompletedHandler_ISpatialSurfaceMesh_Ptr is access all AsyncOperationCompletedHandler_ISpatialSurfaceMesh;
   type TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged_Interface;
   type TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged is access all TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged_Interface'Class;
   type TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged_Ptr is access all TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type ISpatialSurfaceMeshBuffer_Interface;
   type ISpatialSurfaceMeshBuffer is access all ISpatialSurfaceMeshBuffer_Interface'Class;
   type ISpatialSurfaceMeshBuffer_Ptr is access all ISpatialSurfaceMeshBuffer;
   type ISpatialSurfaceMesh_Interface;
   type ISpatialSurfaceMesh is access all ISpatialSurfaceMesh_Interface'Class;
   type ISpatialSurfaceMesh_Ptr is access all ISpatialSurfaceMesh;
   type ISpatialSurfaceMeshOptionsStatics_Interface;
   type ISpatialSurfaceMeshOptionsStatics is access all ISpatialSurfaceMeshOptionsStatics_Interface'Class;
   type ISpatialSurfaceMeshOptionsStatics_Ptr is access all ISpatialSurfaceMeshOptionsStatics;
   type ISpatialSurfaceMeshOptions_Interface;
   type ISpatialSurfaceMeshOptions is access all ISpatialSurfaceMeshOptions_Interface'Class;
   type ISpatialSurfaceMeshOptions_Ptr is access all ISpatialSurfaceMeshOptions;
   type ISpatialSurfaceInfo_Interface;
   type ISpatialSurfaceInfo is access all ISpatialSurfaceInfo_Interface'Class;
   type ISpatialSurfaceInfo_Ptr is access all ISpatialSurfaceInfo;
   type ISpatialSurfaceObserverStatics_Interface;
   type ISpatialSurfaceObserverStatics is access all ISpatialSurfaceObserverStatics_Interface'Class;
   type ISpatialSurfaceObserverStatics_Ptr is access all ISpatialSurfaceObserverStatics;
   type ISpatialSurfaceObserverStatics2_Interface;
   type ISpatialSurfaceObserverStatics2 is access all ISpatialSurfaceObserverStatics2_Interface'Class;
   type ISpatialSurfaceObserverStatics2_Ptr is access all ISpatialSurfaceObserverStatics2;
   type ISpatialSurfaceObserver_Interface;
   type ISpatialSurfaceObserver is access all ISpatialSurfaceObserver_Interface'Class;
   type ISpatialSurfaceObserver_Ptr is access all ISpatialSurfaceObserver;
   type IAsyncOperation_ISpatialSurfaceMesh_Interface;
   type IAsyncOperation_ISpatialSurfaceMesh is access all IAsyncOperation_ISpatialSurfaceMesh_Interface'Class;
   type IAsyncOperation_ISpatialSurfaceMesh_Ptr is access all IAsyncOperation_ISpatialSurfaceMesh;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceMeshBuffer : aliased constant Windows.IID := (2479839712, 34591, 13304, (152, 178, 3, 209, 1, 69, 143, 111 ));
   
   type ISpatialSurfaceMeshBuffer_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Format
   (
      This       : access ISpatialSurfaceMeshBuffer_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_Stride
   (
      This       : access ISpatialSurfaceMeshBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_ElementCount
   (
      This       : access ISpatialSurfaceMeshBuffer_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_Data
   (
      This       : access ISpatialSurfaceMeshBuffer_Interface
      ; RetVal : access Windows.Storage.Streams.IBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceMesh : aliased constant Windows.IID := (277829593, 57101, 14672, (160, 253, 249, 114, 199, 124, 39, 180 ));
   
   type ISpatialSurfaceMesh_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SurfaceInfo
   (
      This       : access ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Perception.Spatial.Surfaces.ISpatialSurfaceInfo
   )
   return Windows.HRESULT is abstract;
   
   function get_CoordinateSystem
   (
      This       : access ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Perception.Spatial.ISpatialCoordinateSystem
   )
   return Windows.HRESULT is abstract;
   
   function get_TriangleIndices
   (
      This       : access ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_VertexPositions
   (
      This       : access ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshBuffer
   )
   return Windows.HRESULT is abstract;
   
   function get_VertexPositionScale
   (
      This       : access ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Foundation.Numerics.Vector3
   )
   return Windows.HRESULT is abstract;
   
   function get_VertexNormals
   (
      This       : access ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshBuffer
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceMeshOptionsStatics : aliased constant Windows.IID := (2603879103, 38785, 17669, (137, 53, 1, 53, 117, 202, 174, 94 ));
   
   type ISpatialSurfaceMeshOptionsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_SupportedVertexPositionFormats
   (
      This       : access ISpatialSurfaceMeshOptionsStatics_Interface
      ; RetVal : access Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedTriangleIndexFormats
   (
      This       : access ISpatialSurfaceMeshOptionsStatics_Interface
      ; RetVal : access Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SupportedVertexNormalFormats
   (
      This       : access ISpatialSurfaceMeshOptionsStatics_Interface
      ; RetVal : access Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceMeshOptions : aliased constant Windows.IID := (3530923913, 13682, 15661, (161, 13, 95, 238, 147, 148, 170, 55 ));
   
   type ISpatialSurfaceMeshOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function get_VertexPositionFormat
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_VertexPositionFormat
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; value : Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_TriangleIndexFormat
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_TriangleIndexFormat
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; value : Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_VertexNormalFormat
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; RetVal : access Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function put_VertexNormalFormat
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; value : Windows.Graphics.DirectX.DirectXPixelFormat
   )
   return Windows.HRESULT is abstract;
   
   function get_IncludeVertexNormals
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IncludeVertexNormals
   (
      This       : access ISpatialSurfaceMeshOptions_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceInfo : aliased constant Windows.IID := (4176079847, 14775, 14690, (187, 3, 87, 245, 110, 31, 176, 161 ));
   
   type ISpatialSurfaceInfo_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access ISpatialSurfaceInfo_Interface
      ; RetVal : access Windows.Guid
   )
   return Windows.HRESULT is abstract;
   
   function get_UpdateTime
   (
      This       : access ISpatialSurfaceInfo_Interface
      ; RetVal : access Windows.Foundation.DateTime
   )
   return Windows.HRESULT is abstract;
   
   function TryGetBounds
   (
      This       : access ISpatialSurfaceInfo_Interface
      ; coordinateSystem : Windows.Perception.Spatial.ISpatialCoordinateSystem
      ; RetVal : access Windows.Perception.Spatial.IReference_SpatialBoundingOrientedBox -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryComputeLatestMeshAsync
   (
      This       : access ISpatialSurfaceInfo_Interface
      ; maxTrianglesPerCubicMeter : Windows.Double
      ; RetVal : access Windows.Perception.Spatial.Surfaces.IAsyncOperation_ISpatialSurfaceMesh -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryComputeLatestMeshWithOptionsAsync
   (
      This       : access ISpatialSurfaceInfo_Interface
      ; maxTrianglesPerCubicMeter : Windows.Double
      ; options : Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshOptions
      ; RetVal : access Windows.Perception.Spatial.Surfaces.IAsyncOperation_ISpatialSurfaceMesh -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceObserverStatics : aliased constant Windows.IID := (374952429, 8456, 16744, (145, 117, 135, 224, 39, 188, 146, 133 ));
   
   type ISpatialSurfaceObserverStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestAccessAsync
   (
      This       : access ISpatialSurfaceObserverStatics_Interface
      ; RetVal : access Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceObserverStatics2 : aliased constant Windows.IID := (257114721, 50525, 20075, (168, 149, 161, 157, 230, 154, 66, 227 ));
   
   type ISpatialSurfaceObserverStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function IsSupported
   (
      This       : access ISpatialSurfaceObserverStatics2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_ISpatialSurfaceObserver : aliased constant Windows.IID := (280401945, 56778, 13443, (172, 58, 116, 143, 232, 200, 109, 245 ));
   
   type ISpatialSurfaceObserver_Interface is interface and Windows.IInspectable_Interface;
   
   function GetObservedSurfaces
   (
      This       : access ISpatialSurfaceObserver_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function SetBoundingVolume
   (
      This       : access ISpatialSurfaceObserver_Interface
      ; bounds : Windows.Perception.Spatial.ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   function SetBoundingVolumes
   (
      This       : access ISpatialSurfaceObserver_Interface
      ; bounds : Windows.Perception.Spatial.IIterable_ISpatialBoundingVolume
   )
   return Windows.HRESULT is abstract;
   
   function add_ObservedSurfacesChanged
   (
      This       : access ISpatialSurfaceObserver_Interface
      ; handler : TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ObservedSurfacesChanged
   (
      This       : access ISpatialSurfaceObserver_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ISpatialSurfaceMesh : aliased constant Windows.IID := (4120088493, 43169, 24446, (148, 64, 189, 183, 129, 173, 38, 182 ));
   
   type IAsyncOperation_ISpatialSurfaceMesh_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ISpatialSurfaceMesh_Interface
      ; handler : Windows.Perception.Spatial.Surfaces.AsyncOperationCompletedHandler_ISpatialSurfaceMesh
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Perception.Spatial.Surfaces.AsyncOperationCompletedHandler_ISpatialSurfaceMesh
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ISpatialSurfaceMesh_Interface
      ; RetVal : access Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMesh
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ISpatialSurfaceMesh : aliased constant Windows.IID := (1182857206, 17605, 24518, (141, 81, 214, 150, 41, 21, 250, 35 ));
   
   type AsyncOperationCompletedHandler_ISpatialSurfaceMesh_Interface(Callback : access procedure (asyncInfo : Windows.Perception.Spatial.Surfaces.IAsyncOperation_ISpatialSurfaceMesh ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ISpatialSurfaceMesh'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ISpatialSurfaceMesh_Interface
      ; asyncInfo : Windows.Perception.Spatial.Surfaces.IAsyncOperation_ISpatialSurfaceMesh
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged : aliased constant Windows.IID := (2335254346, 30355, 21182, (144, 20, 176, 245, 246, 90, 53, 57 ));
   
   type TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged_Interface(Callback : access procedure (sender : Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_ISpatialSurfaceObserver_add_ObservedSurfacesChanged_Interface
      ; sender : Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype SpatialSurfaceInfo is Windows.Perception.Spatial.Surfaces.ISpatialSurfaceInfo;
   subtype SpatialSurfaceMeshBuffer is Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshBuffer;
   subtype SpatialSurfaceMesh is Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMesh;
   subtype SpatialSurfaceMeshOptions is Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshOptions;
   function CreateSpatialSurfaceMeshOptions return Windows.Perception.Spatial.Surfaces.ISpatialSurfaceMeshOptions;
   
   subtype SpatialSurfaceObserver is Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver;
   function CreateSpatialSurfaceObserver return Windows.Perception.Spatial.Surfaces.ISpatialSurfaceObserver;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function get_SupportedVertexPositionFormats
   return Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat;
   
   function get_SupportedTriangleIndexFormats
   return Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat;
   
   function get_SupportedVertexNormalFormats
   return Windows.Graphics.DirectX.IVectorView_DirectXPixelFormat;
   
   function RequestAccessAsync
   return Windows.Perception.Spatial.IAsyncOperation_SpatialPerceptionAccessStatus;
   
   function IsSupported
   return Windows.Boolean;
   
end;
