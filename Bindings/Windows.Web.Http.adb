--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Web.Http.Filters;
with Windows.Web.Http.Headers;
with Windows.Storage.Streams;
with Windows.Security.Cryptography.Certificates;
with Windows.Networking.Sockets;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.Http is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function Create
   (
      method : Windows.Web.Http.IHttpMethod
      ; uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.Web.Http.IHttpRequestMessage is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpRequestMessage");
      m_Factory     : Windows.Web.Http.IHttpRequestMessageFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpRequestMessage := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpRequestMessageFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(method, uri, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateHttpResponseMessage return Windows.Web.Http.IHttpResponseMessage is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpResponseMessage");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpResponseMessage := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Http.IID_IHttpResponseMessage'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateHttpClient return Windows.Web.Http.IHttpClient is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpClient");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpClient := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Web.Http.IID_IHttpClient'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      name : Windows.String
      ; domain : Windows.String
      ; path : Windows.String
   )
   return Windows.Web.Http.IHttpCookie is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpCookie");
      m_Factory     : Windows.Web.Http.IHttpCookieFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpCookie := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpCookieFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(name, domain, path, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      method : Windows.String
   )
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : Windows.Web.Http.IHttpMethodFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(method, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromString
   (
      content : Windows.String
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpStringContent");
      m_Factory     : Windows.Web.Http.IHttpStringContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpStringContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromString(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStringWithEncoding
   (
      content : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpStringContent");
      m_Factory     : Windows.Web.Http.IHttpStringContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpStringContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStringWithEncoding(content, encoding, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromStringWithEncodingAndMediaType
   (
      content : Windows.String
      ; encoding : Windows.Storage.Streams.UnicodeEncoding
      ; mediaType : Windows.String
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpStringContent");
      m_Factory     : Windows.Web.Http.IHttpStringContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpStringContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromStringWithEncodingAndMediaType(content, encoding, mediaType, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromBuffer
   (
      content : Windows.Storage.Streams.IBuffer
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpBufferContent");
      m_Factory     : Windows.Web.Http.IHttpBufferContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpBufferContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromBuffer(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromBufferWithOffset
   (
      content : Windows.Storage.Streams.IBuffer
      ; offset : Windows.UInt32
      ; count : Windows.UInt32
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpBufferContent");
      m_Factory     : Windows.Web.Http.IHttpBufferContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpBufferContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromBufferWithOffset(content, offset, count, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFromInputStream
   (
      content : Windows.Storage.Streams.IInputStream
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpStreamContent");
      m_Factory     : Windows.Web.Http.IHttpStreamContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpStreamContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateFromInputStream(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      content : Windows.Address
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpFormUrlEncodedContent");
      m_Factory     : Windows.Web.Http.IHttpFormUrlEncodedContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpFormUrlEncodedContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(content, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithSubtype
   (
      subtype_x : Windows.String
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMultipartContent");
      m_Factory     : Windows.Web.Http.IHttpMultipartContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMultipartContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSubtype(subtype_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithSubtypeAndBoundary
   (
      subtype_x : Windows.String
      ; boundary : Windows.String
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMultipartContent");
      m_Factory     : Windows.Web.Http.IHttpMultipartContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMultipartContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSubtypeAndBoundary(subtype_x, boundary, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithBoundary
   (
      boundary : Windows.String
   )
   return Windows.Web.Http.IHttpContent is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMultipartFormDataContent");
      m_Factory     : Windows.Web.Http.IHttpMultipartFormDataContentFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpContent := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMultipartFormDataContentFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithBoundary(boundary, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function get_Delete
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : IHttpMethodStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Delete(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Get
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : IHttpMethodStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Get(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Head
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : IHttpMethodStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Head(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Options
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : IHttpMethodStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Options(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Patch
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : IHttpMethodStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Patch(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Post
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : IHttpMethodStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Post(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Put
   return Windows.Web.Http.IHttpMethod is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Web.Http.HttpMethod");
      m_Factory     : IHttpMethodStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Web.Http.IHttpMethod;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IHttpMethodStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Put(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;