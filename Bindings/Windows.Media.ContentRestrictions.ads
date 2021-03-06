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
limited with Windows.Storage.Streams;
with Windows.Foundation.Collections;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Media.ContentRestrictions is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type RatedContentCategory is (
      General,
      Application,
      Game,
      Movie,
      Television,
      Music
   );
   for RatedContentCategory use (
      General => 0,
      Application => 1,
      Game => 2,
      Movie => 3,
      Television => 4,
      Music => 5
   );
   for RatedContentCategory'Size use 32;
   
   type RatedContentCategory_Ptr is access RatedContentCategory;
   
   type ContentAccessRestrictionLevel is (
      Allow,
      Warn,
      Block,
      Hide
   );
   for ContentAccessRestrictionLevel use (
      Allow => 0,
      Warn => 1,
      Block => 2,
      Hide => 3
   );
   for ContentAccessRestrictionLevel'Size use 32;
   
   type ContentAccessRestrictionLevel_Ptr is access ContentAccessRestrictionLevel;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy_Interface;
   type AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy is access all AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy_Interface'Class;
   type AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy_Ptr is access all AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy;
   type AsyncOperationCompletedHandler_ContentAccessRestrictionLevel_Interface;
   type AsyncOperationCompletedHandler_ContentAccessRestrictionLevel is access all AsyncOperationCompletedHandler_ContentAccessRestrictionLevel_Interface'Class;
   type AsyncOperationCompletedHandler_ContentAccessRestrictionLevel_Ptr is access all AsyncOperationCompletedHandler_ContentAccessRestrictionLevel;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IRatedContentDescription_Interface;
   type IRatedContentDescription is access all IRatedContentDescription_Interface'Class;
   type IRatedContentDescription_Ptr is access all IRatedContentDescription;
   type IRatedContentDescriptionFactory_Interface;
   type IRatedContentDescriptionFactory is access all IRatedContentDescriptionFactory_Interface'Class;
   type IRatedContentDescriptionFactory_Ptr is access all IRatedContentDescriptionFactory;
   type IContentRestrictionsBrowsePolicy_Interface;
   type IContentRestrictionsBrowsePolicy is access all IContentRestrictionsBrowsePolicy_Interface'Class;
   type IContentRestrictionsBrowsePolicy_Ptr is access all IContentRestrictionsBrowsePolicy;
   type IRatedContentRestrictions_Interface;
   type IRatedContentRestrictions is access all IRatedContentRestrictions_Interface'Class;
   type IRatedContentRestrictions_Ptr is access all IRatedContentRestrictions;
   type IRatedContentRestrictionsFactory_Interface;
   type IRatedContentRestrictionsFactory is access all IRatedContentRestrictionsFactory_Interface'Class;
   type IRatedContentRestrictionsFactory_Ptr is access all IRatedContentRestrictionsFactory;
   type IAsyncOperation_IContentRestrictionsBrowsePolicy_Interface;
   type IAsyncOperation_IContentRestrictionsBrowsePolicy is access all IAsyncOperation_IContentRestrictionsBrowsePolicy_Interface'Class;
   type IAsyncOperation_IContentRestrictionsBrowsePolicy_Ptr is access all IAsyncOperation_IContentRestrictionsBrowsePolicy;
   type IAsyncOperation_ContentAccessRestrictionLevel_Interface;
   type IAsyncOperation_ContentAccessRestrictionLevel is access all IAsyncOperation_ContentAccessRestrictionLevel_Interface'Class;
   type IAsyncOperation_ContentAccessRestrictionLevel_Ptr is access all IAsyncOperation_ContentAccessRestrictionLevel;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IRatedContentDescription : aliased constant Windows.IID := (1766352607, 26290, 19907, (150, 177, 240, 144, 238, 222, 226, 85 ));
   
   type IRatedContentDescription_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IRatedContentDescription_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Id
   (
      This       : access IRatedContentDescription_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Title
   (
      This       : access IRatedContentDescription_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Title
   (
      This       : access IRatedContentDescription_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Image
   (
      This       : access IRatedContentDescription_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function put_Image
   (
      This       : access IRatedContentDescription_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_Category
   (
      This       : access IRatedContentDescription_Interface
      ; RetVal : access Windows.Media.ContentRestrictions.RatedContentCategory
   )
   return Windows.HRESULT is abstract;
   
   function put_Category
   (
      This       : access IRatedContentDescription_Interface
      ; value : Windows.Media.ContentRestrictions.RatedContentCategory
   )
   return Windows.HRESULT is abstract;
   
   function get_Ratings
   (
      This       : access IRatedContentDescription_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_Ratings
   (
      This       : access IRatedContentDescription_Interface
      ; value : Windows.Foundation.Collections.IVector_String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRatedContentDescriptionFactory : aliased constant Windows.IID := (775479138, 39824, 20390, (137, 193, 75, 141, 47, 251, 53, 115 ));
   
   type IRatedContentDescriptionFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IRatedContentDescriptionFactory_Interface
      ; id : Windows.String
      ; title : Windows.String
      ; category : Windows.Media.ContentRestrictions.RatedContentCategory
      ; RetVal : access Windows.Media.ContentRestrictions.IRatedContentDescription
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IContentRestrictionsBrowsePolicy : aliased constant Windows.IID := (2348888996, 17454, 17946, (135, 87, 250, 210, 245, 189, 55, 228 ));
   
   type IContentRestrictionsBrowsePolicy_Interface is interface and Windows.IInspectable_Interface;
   
   function get_GeographicRegion
   (
      This       : access IContentRestrictionsBrowsePolicy_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxBrowsableAgeRating
   (
      This       : access IContentRestrictionsBrowsePolicy_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_PreferredAgeRating
   (
      This       : access IContentRestrictionsBrowsePolicy_Interface
      ; RetVal : access Windows.Foundation.IReference_UInt32 -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRatedContentRestrictions : aliased constant Windows.IID := (1065296843, 47623, 17409, (164, 157, 139, 146, 34, 32, 87, 35 ));
   
   type IRatedContentRestrictions_Interface is interface and Windows.IInspectable_Interface;
   
   function GetBrowsePolicyAsync
   (
      This       : access IRatedContentRestrictions_Interface
      ; RetVal : access Windows.Media.ContentRestrictions.IAsyncOperation_IContentRestrictionsBrowsePolicy -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetRestrictionLevelAsync
   (
      This       : access IRatedContentRestrictions_Interface
      ; RatedContentDescription : Windows.Media.ContentRestrictions.IRatedContentDescription
      ; RetVal : access Windows.Media.ContentRestrictions.IAsyncOperation_ContentAccessRestrictionLevel -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function RequestContentAccessAsync
   (
      This       : access IRatedContentRestrictions_Interface
      ; RatedContentDescription : Windows.Media.ContentRestrictions.IRatedContentDescription
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_RestrictionsChanged
   (
      This       : access IRatedContentRestrictions_Interface
      ; handler : Windows.Foundation.EventHandler_Object
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_RestrictionsChanged
   (
      This       : access IRatedContentRestrictions_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IRatedContentRestrictionsFactory : aliased constant Windows.IID := (4216007062, 50109, 18704, (150, 25, 151, 207, 208, 105, 77, 86 ));
   
   type IRatedContentRestrictionsFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithMaxAgeRating
   (
      This       : access IRatedContentRestrictionsFactory_Interface
      ; maxAgeRating : Windows.UInt32
      ; RetVal : access Windows.Media.ContentRestrictions.IRatedContentRestrictions
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IContentRestrictionsBrowsePolicy : aliased constant Windows.IID := (2922617266, 51157, 24347, (159, 185, 248, 189, 129, 233, 249, 190 ));
   
   type IAsyncOperation_IContentRestrictionsBrowsePolicy_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IContentRestrictionsBrowsePolicy_Interface
      ; handler : Windows.Media.ContentRestrictions.AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IContentRestrictionsBrowsePolicy_Interface
      ; RetVal : access Windows.Media.ContentRestrictions.AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IContentRestrictionsBrowsePolicy_Interface
      ; RetVal : access Windows.Media.ContentRestrictions.IContentRestrictionsBrowsePolicy
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ContentAccessRestrictionLevel : aliased constant Windows.IID := (2248933753, 48641, 21613, (169, 206, 89, 86, 70, 76, 152, 171 ));
   
   type IAsyncOperation_ContentAccessRestrictionLevel_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ContentAccessRestrictionLevel_Interface
      ; handler : Windows.Media.ContentRestrictions.AsyncOperationCompletedHandler_ContentAccessRestrictionLevel
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ContentAccessRestrictionLevel_Interface
      ; RetVal : access Windows.Media.ContentRestrictions.AsyncOperationCompletedHandler_ContentAccessRestrictionLevel
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ContentAccessRestrictionLevel_Interface
      ; RetVal : access Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy : aliased constant Windows.IID := (1924012566, 50949, 21735, (177, 196, 252, 5, 160, 224, 122, 119 ));
   
   type AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy_Interface(Callback : access procedure (asyncInfo : Windows.Media.ContentRestrictions.IAsyncOperation_IContentRestrictionsBrowsePolicy ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IContentRestrictionsBrowsePolicy_Interface
      ; asyncInfo : Windows.Media.ContentRestrictions.IAsyncOperation_IContentRestrictionsBrowsePolicy
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ContentAccessRestrictionLevel : aliased constant Windows.IID := (3479289437, 16579, 21636, (132, 106, 63, 130, 184, 186, 87, 56 ));
   
   type AsyncOperationCompletedHandler_ContentAccessRestrictionLevel_Interface(Callback : access procedure (asyncInfo : Windows.Media.ContentRestrictions.IAsyncOperation_ContentAccessRestrictionLevel ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ContentAccessRestrictionLevel'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ContentAccessRestrictionLevel_Interface
      ; asyncInfo : Windows.Media.ContentRestrictions.IAsyncOperation_ContentAccessRestrictionLevel
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype RatedContentDescription is Windows.Media.ContentRestrictions.IRatedContentDescription;
   function Create
   (
      id : Windows.String
      ; title : Windows.String
      ; category : Windows.Media.ContentRestrictions.RatedContentCategory
   )
   return Windows.Media.ContentRestrictions.IRatedContentDescription;
   
   subtype ContentRestrictionsBrowsePolicy is Windows.Media.ContentRestrictions.IContentRestrictionsBrowsePolicy;
   subtype RatedContentRestrictions is Windows.Media.ContentRestrictions.IRatedContentRestrictions;
   function CreateWithMaxAgeRating
   (
      maxAgeRating : Windows.UInt32
   )
   return Windows.Media.ContentRestrictions.IRatedContentRestrictions;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
