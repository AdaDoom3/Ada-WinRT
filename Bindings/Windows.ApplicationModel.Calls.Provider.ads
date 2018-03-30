--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Storage;
with Windows; use Windows;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.Calls.Provider is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IPhoneCallOrigin_Interface;
   type IPhoneCallOrigin is access all IPhoneCallOrigin_Interface'Class;
   type IPhoneCallOrigin_Ptr is access all IPhoneCallOrigin;
   type IPhoneCallOrigin2_Interface;
   type IPhoneCallOrigin2 is access all IPhoneCallOrigin2_Interface'Class;
   type IPhoneCallOrigin2_Ptr is access all IPhoneCallOrigin2;
   type IPhoneCallOrigin3_Interface;
   type IPhoneCallOrigin3 is access all IPhoneCallOrigin3_Interface'Class;
   type IPhoneCallOrigin3_Ptr is access all IPhoneCallOrigin3;
   type IPhoneCallOriginManagerStatics_Interface;
   type IPhoneCallOriginManagerStatics is access all IPhoneCallOriginManagerStatics_Interface'Class;
   type IPhoneCallOriginManagerStatics_Ptr is access all IPhoneCallOriginManagerStatics;
   type IPhoneCallOriginManagerStatics2_Interface;
   type IPhoneCallOriginManagerStatics2 is access all IPhoneCallOriginManagerStatics2_Interface'Class;
   type IPhoneCallOriginManagerStatics2_Ptr is access all IPhoneCallOriginManagerStatics2;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IPhoneCallOrigin_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Category
   (
      This       : access IPhoneCallOrigin_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Category
   (
      This       : access IPhoneCallOrigin_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_CategoryDescription
   (
      This       : access IPhoneCallOrigin_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_CategoryDescription
   (
      This       : access IPhoneCallOrigin_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_Location
   (
      This       : access IPhoneCallOrigin_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Location
   (
      This       : access IPhoneCallOrigin_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallOrigin : aliased constant Windows.IID := (543241337, 3833, 17492, (135, 28, 175, 182, 106, 20, 182, 165 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallOrigin2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayName
   (
      This       : access IPhoneCallOrigin2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IPhoneCallOrigin2_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallOrigin2 : aliased constant Windows.IID := (80210304, 39618, 18280, (181, 54, 182, 141, 164, 149, 125, 2 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallOrigin3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DisplayPicture
   (
      This       : access IPhoneCallOrigin3_Interface
      ; RetVal : access Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayPicture
   (
      This       : access IPhoneCallOrigin3_Interface
      ; value : Windows.Storage.IStorageFile
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallOrigin3 : aliased constant Windows.IID := (1228083124, 53671, 17314, (174, 238, 192, 123, 109, 186, 240, 104 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallOriginManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsCurrentAppActiveCallOriginApp
   (
      This       : access IPhoneCallOriginManagerStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function ShowPhoneCallOriginSettingsUI
   (
      This       : access IPhoneCallOriginManagerStatics_Interface
   )
   return Windows.HRESULT is abstract;
   
   function SetCallOrigin
   (
      This       : access IPhoneCallOriginManagerStatics_Interface
      ; requestId : Windows.Guid
      ; callOrigin : Windows.ApplicationModel.Calls.Provider.IPhoneCallOrigin
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallOriginManagerStatics : aliased constant Windows.IID := (3439090186, 39671, 24905, (57, 208, 224, 118, 252, 206, 19, 149 ));
   
   ------------------------------------------------------------------------
   type IPhoneCallOriginManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestSetAsActiveCallOriginAppAsync
   (
      This       : access IPhoneCallOriginManagerStatics2_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_Boolean -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IPhoneCallOriginManagerStatics2 : aliased constant Windows.IID := (2348019263, 16628, 17280, (140, 124, 174, 162, 201, 184, 221, 122 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype PhoneCallOrigin is Windows.ApplicationModel.Calls.Provider.IPhoneCallOrigin;
   
   function CreatePhoneCallOrigin return Windows.ApplicationModel.Calls.Provider.IPhoneCallOrigin;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_IsCurrentAppActiveCallOriginApp
   return Windows.Boolean;
   
   procedure ShowPhoneCallOriginSettingsUI
   ;
   
   procedure SetCallOrigin
   (
      requestId : Windows.Guid
      ; callOrigin : Windows.ApplicationModel.Calls.Provider.IPhoneCallOrigin
   )
   ;
   
   function RequestSetAsActiveCallOriginAppAsync
   return Windows.Foundation.IAsyncOperation_Boolean;

end;