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
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Payments is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access PaymentRequestChangedHandler_Interface
      ; paymentRequest : Windows.ApplicationModel.Payments.IPaymentRequest
      ; args : Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Payments.IPaymentRequest(paymentRequest), Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentRequestChangedResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestChangedResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentRequestSubmitResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentRequestSubmitResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPaymentCanMakePaymentResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Payments.IAsyncOperation_IPaymentCanMakePaymentResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreatePaymentMerchantInfo return Windows.ApplicationModel.Payments.IPaymentMerchantInfo is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentMerchantInfo");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Payments.IPaymentMerchantInfo) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Payments.IID_IPaymentMerchantInfo'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreatePaymentDetails return Windows.ApplicationModel.Payments.IPaymentDetails is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentDetails");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Payments.IPaymentDetails) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Payments.IID_IPaymentDetails'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
   )
   return Windows.ApplicationModel.Payments.IPaymentMethodData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentMethodData");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentMethodDataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentMethodData := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentMethodDataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(supportedMethodIds, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithJsonData
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; jsonData : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentMethodData is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentMethodData");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentMethodDataFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentMethodData := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentMethodDataFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithJsonData(supportedMethodIds, jsonData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePaymentOptions return Windows.ApplicationModel.Payments.IPaymentOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Payments.IPaymentOptions) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Payments.IID_IPaymentOptions'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function CreateWithMerchantInfoOptionsAndId
   (
      details : Windows.ApplicationModel.Payments.IPaymentDetails
      ; methodData : Windows.ApplicationModel.Payments.IIterable_IPaymentMethodData
      ; merchantInfo : Windows.ApplicationModel.Payments.IPaymentMerchantInfo
      ; options : Windows.ApplicationModel.Payments.IPaymentOptions
      ; id : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentRequest is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentRequest");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentRequestFactory2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentRequest := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentRequestFactory2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithMerchantInfoOptionsAndId(details, methodData, merchantInfo, options, id, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      paymentMethodId : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentToken");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentTokenFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentToken := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentTokenFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(paymentMethodId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithJsonDetails
   (
      paymentMethodId : Windows.String
      ; jsonDetails : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentToken is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentToken");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentTokenFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentToken := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentTokenFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithJsonDetails(paymentMethodId, jsonDetails, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.ApplicationModel.Payments.IPaymentShippingOption is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentShippingOption");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentShippingOptionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentShippingOption := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentShippingOptionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(label, amount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithSelected
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; selected : Windows.Boolean
   )
   return Windows.ApplicationModel.Payments.IPaymentShippingOption is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentShippingOption");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentShippingOptionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentShippingOption := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentShippingOptionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSelected(label, amount, selected, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithSelectedAndTag
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
      ; selected : Windows.Boolean
      ; tag : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentShippingOption is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentShippingOption");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentShippingOptionFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentShippingOption := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentShippingOptionFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithSelectedAndTag(label, amount, selected, tag, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePaymentAddress return Windows.ApplicationModel.Payments.IPaymentAddress is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentAddress");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Payments.IPaymentAddress) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Payments.IID_IPaymentAddress'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   function Create
   (
      label : Windows.String
      ; amount : Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
   )
   return Windows.ApplicationModel.Payments.IPaymentItem is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentItem");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentItemFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentItem := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentItemFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(label, amount, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
   )
   return Windows.ApplicationModel.Payments.IPaymentDetailsModifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentDetailsModifier");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentDetailsModifierFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentDetailsModifier := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentDetailsModifierFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(supportedMethodIds, total, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAdditionalDisplayItems
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; additionalDisplayItems : Windows.ApplicationModel.Payments.IIterable_IPaymentItem
   )
   return Windows.ApplicationModel.Payments.IPaymentDetailsModifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentDetailsModifier");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentDetailsModifierFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentDetailsModifier := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentDetailsModifierFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAdditionalDisplayItems(supportedMethodIds, total, additionalDisplayItems, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithAdditionalDisplayItemsAndJsonData
   (
      supportedMethodIds : Windows.Foundation.Collections.IIterable_String
      ; total : Windows.ApplicationModel.Payments.IPaymentItem
      ; additionalDisplayItems : Windows.ApplicationModel.Payments.IIterable_IPaymentItem
      ; jsonData : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentDetailsModifier is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentDetailsModifier");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentDetailsModifierFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentDetailsModifier := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentDetailsModifierFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithAdditionalDisplayItemsAndJsonData(supportedMethodIds, total, additionalDisplayItems, jsonData, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      value : Windows.String
      ; currency : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentCurrencyAmount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentCurrencyAmount");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentCurrencyAmountFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentCurrencyAmount := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentCurrencyAmountFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(value, currency, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithCurrencySystem
   (
      value : Windows.String
      ; currency : Windows.String
      ; currencySystem : Windows.String
   )
   return Windows.ApplicationModel.Payments.IPaymentCurrencyAmount is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentCurrencyAmount");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentCurrencyAmountFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentCurrencyAmount := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentCurrencyAmountFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithCurrencySystem(value, currency, currencySystem, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      changeAcceptedByMerchant : Windows.Boolean
   )
   return Windows.ApplicationModel.Payments.IPaymentRequestChangedResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentRequestChangedResult");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentRequestChangedResultFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentRequestChangedResult := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentRequestChangedResultFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(changeAcceptedByMerchant, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithPaymentDetails
   (
      changeAcceptedByMerchant : Windows.Boolean
      ; updatedPaymentDetails : Windows.ApplicationModel.Payments.IPaymentDetails
   )
   return Windows.ApplicationModel.Payments.IPaymentRequestChangedResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentRequestChangedResult");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentRequestChangedResultFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentRequestChangedResult := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentRequestChangedResultFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithPaymentDetails(changeAcceptedByMerchant, updatedPaymentDetails, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function Create
   (
      value : Windows.ApplicationModel.Payments.PaymentCanMakePaymentResultStatus
   )
   return Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentCanMakePaymentResult");
      m_Factory     : Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResultFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPaymentCanMakePaymentResultFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.Create(value, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreatePaymentMediator return Windows.ApplicationModel.Payments.IPaymentMediator is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Payments.PaymentMediator");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased IUnknown := null;
      function Convert is new Ada.Unchecked_Conversion(IUnknown , Windows.ApplicationModel.Payments.IPaymentMediator) with inline;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Payments.IID_IPaymentMediator'Access, RetVal'access);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return Convert(RetVal);
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
end;
