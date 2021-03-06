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
package Windows.ApplicationModel.ExtendedExecution is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type ExtendedExecutionReason is (
      Unspecified,
      LocationTracking,
      SavingData
   );
   for ExtendedExecutionReason use (
      Unspecified => 0,
      LocationTracking => 1,
      SavingData => 2
   );
   for ExtendedExecutionReason'Size use 32;
   
   type ExtendedExecutionReason_Ptr is access ExtendedExecutionReason;
   
   type ExtendedExecutionResult is (
      Allowed,
      Denied
   );
   for ExtendedExecutionResult use (
      Allowed => 0,
      Denied => 1
   );
   for ExtendedExecutionResult'Size use 32;
   
   type ExtendedExecutionResult_Ptr is access ExtendedExecutionResult;
   
   type ExtendedExecutionRevokedReason is (
      Resumed,
      SystemPolicy
   );
   for ExtendedExecutionRevokedReason use (
      Resumed => 0,
      SystemPolicy => 1
   );
   for ExtendedExecutionRevokedReason'Size use 32;
   
   type ExtendedExecutionRevokedReason_Ptr is access ExtendedExecutionRevokedReason;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IExtendedExecutionSession_add_Revoked_Interface;
   type TypedEventHandler_IExtendedExecutionSession_add_Revoked is access all TypedEventHandler_IExtendedExecutionSession_add_Revoked_Interface'Class;
   type TypedEventHandler_IExtendedExecutionSession_add_Revoked_Ptr is access all TypedEventHandler_IExtendedExecutionSession_add_Revoked;
   type AsyncOperationCompletedHandler_ExtendedExecutionResult_Interface;
   type AsyncOperationCompletedHandler_ExtendedExecutionResult is access all AsyncOperationCompletedHandler_ExtendedExecutionResult_Interface'Class;
   type AsyncOperationCompletedHandler_ExtendedExecutionResult_Ptr is access all AsyncOperationCompletedHandler_ExtendedExecutionResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IExtendedExecutionRevokedEventArgs_Interface;
   type IExtendedExecutionRevokedEventArgs is access all IExtendedExecutionRevokedEventArgs_Interface'Class;
   type IExtendedExecutionRevokedEventArgs_Ptr is access all IExtendedExecutionRevokedEventArgs;
   type IExtendedExecutionSession_Interface;
   type IExtendedExecutionSession is access all IExtendedExecutionSession_Interface'Class;
   type IExtendedExecutionSession_Ptr is access all IExtendedExecutionSession;
   type IAsyncOperation_ExtendedExecutionResult_Interface;
   type IAsyncOperation_ExtendedExecutionResult is access all IAsyncOperation_ExtendedExecutionResult_Interface'Class;
   type IAsyncOperation_ExtendedExecutionResult_Ptr is access all IAsyncOperation_ExtendedExecutionResult;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IExtendedExecutionRevokedEventArgs : aliased constant Windows.IID := (3216809750, 25525, 19467, (170, 214, 130, 138, 245, 55, 62, 195 ));
   
   type IExtendedExecutionRevokedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IExtendedExecutionRevokedEventArgs_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionRevokedReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IExtendedExecutionSession : aliased constant Windows.IID := (2945485357, 4491, 18673, (147, 8, 12, 79, 196, 30, 32, 15 ));
   
   type IExtendedExecutionSession_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IExtendedExecutionSession_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionReason
   )
   return Windows.HRESULT is abstract;
   
   function put_Reason
   (
      This       : access IExtendedExecutionSession_Interface
      ; value : Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionReason
   )
   return Windows.HRESULT is abstract;
   
   function get_Description
   (
      This       : access IExtendedExecutionSession_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Description
   (
      This       : access IExtendedExecutionSession_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PercentProgress
   (
      This       : access IExtendedExecutionSession_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function put_PercentProgress
   (
      This       : access IExtendedExecutionSession_Interface
      ; value : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function add_Revoked
   (
      This       : access IExtendedExecutionSession_Interface
      ; handler : TypedEventHandler_IExtendedExecutionSession_add_Revoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_Revoked
   (
      This       : access IExtendedExecutionSession_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RequestExtensionAsync
   (
      This       : access IExtendedExecutionSession_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.IAsyncOperation_ExtendedExecutionResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_ExtendedExecutionResult : aliased constant Windows.IID := (498801609, 27863, 22855, (140, 209, 41, 99, 43, 90, 169, 80 ));
   
   type IAsyncOperation_ExtendedExecutionResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_ExtendedExecutionResult_Interface
      ; handler : Windows.ApplicationModel.ExtendedExecution.AsyncOperationCompletedHandler_ExtendedExecutionResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_ExtendedExecutionResult_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.AsyncOperationCompletedHandler_ExtendedExecutionResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_ExtendedExecutionResult_Interface
      ; RetVal : access Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IExtendedExecutionSession_add_Revoked : aliased constant Windows.IID := (3067514268, 38214, 20659, (138, 246, 156, 152, 90, 55, 43, 168 ));
   
   type TypedEventHandler_IExtendedExecutionSession_add_Revoked_Interface(Callback : access procedure (sender : Windows.Object ; args : Windows.ApplicationModel.ExtendedExecution.IExtendedExecutionRevokedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IExtendedExecutionSession_add_Revoked'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IExtendedExecutionSession_add_Revoked_Interface
      ; sender : Windows.Object
      ; args : Windows.ApplicationModel.ExtendedExecution.IExtendedExecutionRevokedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_ExtendedExecutionResult : aliased constant Windows.IID := (2268879994, 50744, 23091, (155, 3, 33, 92, 114, 71, 22, 99 ));
   
   type AsyncOperationCompletedHandler_ExtendedExecutionResult_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.ExtendedExecution.IAsyncOperation_ExtendedExecutionResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_ExtendedExecutionResult'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_ExtendedExecutionResult_Interface
      ; asyncInfo : Windows.ApplicationModel.ExtendedExecution.IAsyncOperation_ExtendedExecutionResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype ExtendedExecutionRevokedEventArgs is Windows.ApplicationModel.ExtendedExecution.IExtendedExecutionRevokedEventArgs;
   subtype ExtendedExecutionSession is Windows.ApplicationModel.ExtendedExecution.IExtendedExecutionSession;
   function CreateExtendedExecutionSession return Windows.ApplicationModel.ExtendedExecution.IExtendedExecutionSession;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;
