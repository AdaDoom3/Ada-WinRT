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
with Windows.UI.Xaml;
with Windows.UI.Xaml.Automation.Peers;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.UI.Xaml.Automation is

   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   function CreateInstance
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
   )
   return Windows.UI.Xaml.Automation.IAutomationAnnotation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationAnnotation");
      m_Factory     : Windows.UI.Xaml.Automation.IAutomationAnnotationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationAnnotation := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationAnnotationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateInstance(type_x, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWithElementParameter
   (
      type_x : Windows.UI.Xaml.Automation.AnnotationType
      ; element : Windows.UI.Xaml.IUIElement
   )
   return Windows.UI.Xaml.Automation.IAutomationAnnotation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationAnnotation");
      m_Factory     : Windows.UI.Xaml.Automation.IAutomationAnnotationFactory := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationAnnotation := null;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationAnnotationFactory'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWithElementParameter(type_x, element, RetVal'Access);
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
   
   function get_AnnotationTypeIdProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers");
      m_Factory     : IAnnotationPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnnotationPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AnnotationTypeIdProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AnnotationTypeNameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers");
      m_Factory     : IAnnotationPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnnotationPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AnnotationTypeNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AuthorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers");
      m_Factory     : IAnnotationPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnnotationPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AuthorProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DateTimeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers");
      m_Factory     : IAnnotationPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnnotationPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DateTimeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TargetProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AnnotationPatternIdentifiers");
      m_Factory     : IAnnotationPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAnnotationPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TargetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_PositionInSetProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PositionInSetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SizeOfSetProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SizeOfSetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LevelProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LevelProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AnnotationsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AnnotationsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsPeripheralProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsPeripheralProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsDataValidForFormProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsDataValidForFormProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FullDescriptionProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FullDescriptionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DescribedByProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DescribedByProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FlowsToProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FlowsToProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FlowsFromProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FlowsFromProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ControlledPeersProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ControlledPeersProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CultureProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CultureProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AcceleratorKeyProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AcceleratorKeyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AccessKeyProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccessKeyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AutomationIdProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutomationIdProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BoundingRectangleProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BoundingRectangleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClassNameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClassNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ClickablePointProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ClickablePointProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ControlTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ControlTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HasKeyboardFocusProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HasKeyboardFocusProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HelpTextProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HelpTextProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsContentElementProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsContentElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsControlElementProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsControlElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsEnabledProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsEnabledProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsKeyboardFocusableProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsKeyboardFocusableProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsOffscreenProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsOffscreenProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsPasswordProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsPasswordProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsRequiredForFormProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsRequiredForFormProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ItemStatusProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemStatusProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ItemTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LabeledByProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LabeledByProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocalizedControlTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocalizedControlTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OrientationProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OrientationProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LiveSettingProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LiveSettingProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LandmarkTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LandmarkTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LocalizedLandmarkTypeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationElementIdentifiers");
      m_Factory     : IAutomationElementIdentifiersStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationElementIdentifiersStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocalizedLandmarkTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsPeripheralProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsPeripheralProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsPeripheral
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsPeripheral(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetIsPeripheral
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsPeripheral(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsDataValidForFormProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsDataValidForFormProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsDataValidForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsDataValidForForm(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetIsDataValidForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsDataValidForForm(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_FullDescriptionProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FullDescriptionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFullDescription
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFullDescription(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetFullDescription
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetFullDescription(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_LocalizedControlTypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocalizedControlTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLocalizedControlType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLocalizedControlType(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetLocalizedControlType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetLocalizedControlType(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_DescribedByProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DescribedByProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetDescribedBy
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVector_IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetDescribedBy(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FlowsToProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FlowsToProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFlowsTo
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVector_IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFlowsTo(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FlowsFromProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FlowsFromProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetFlowsFrom
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IDependencyObject is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics5 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVector_IDependencyObject;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics5'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetFlowsFrom(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LandmarkTypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LandmarkTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLandmarkType(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetLandmarkType(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_LocalizedLandmarkTypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LocalizedLandmarkTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLocalizedLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLocalizedLandmarkType(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetLocalizedLandmarkType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics4 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics4'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetLocalizedLandmarkType(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AccessibilityViewProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccessibilityViewProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAccessibilityView
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.Peers.AccessibilityView is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.AccessibilityView;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAccessibilityView(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetAccessibilityView
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AccessibilityView
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAccessibilityView(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ControlledPeersProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ControlledPeersProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetControlledPeers
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IVector_IUIElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IVector_IUIElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetControlledPeers(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CultureProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CultureProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetCulture
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetCulture(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetCulture
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics6 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics6'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetCulture(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AcceleratorKeyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AcceleratorKeyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAcceleratorKey
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAcceleratorKey(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetAcceleratorKey
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAcceleratorKey(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AccessKeyProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AccessKeyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAccessKey
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAccessKey(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetAccessKey
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAccessKey(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AutomationIdProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AutomationIdProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAutomationId
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAutomationId(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetAutomationId
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetAutomationId(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_HelpTextProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HelpTextProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetHelpText
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetHelpText(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetHelpText
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetHelpText(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_IsRequiredForFormProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsRequiredForFormProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetIsRequiredForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetIsRequiredForForm(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetIsRequiredForForm
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Boolean
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetIsRequiredForForm(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ItemStatusProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemStatusProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetItemStatus
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetItemStatus(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetItemStatus
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetItemStatus(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_ItemTypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ItemTypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetItemType
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetItemType(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetItemType
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetItemType(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_LabeledByProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LabeledByProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLabeledBy
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.IUIElement is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IUIElement;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLabeledBy(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetLabeledBy
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.IUIElement
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetLabeledBy(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_NameProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetName
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetName(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetName
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.String
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetName(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_LiveSettingProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LiveSettingProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLiveSetting
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLiveSetting(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetLiveSetting
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetLiveSetting(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_PositionInSetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_PositionInSetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetPositionInSet
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetPositionInSet(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetPositionInSet
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetPositionInSet(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_SizeOfSetProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SizeOfSetProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetSizeOfSet
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetSizeOfSet(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetSizeOfSet
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetSizeOfSet(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_LevelProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LevelProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetLevel
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.Int32 is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Int32;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetLevel(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   procedure SetLevel
   (
      element : Windows.UI.Xaml.IDependencyObject
      ; value : Windows.Int32
   )
   is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.SetLevel(element, value);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
   end;
   
   function get_AnnotationsProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AnnotationsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function GetAnnotations
   (
      element : Windows.UI.Xaml.IDependencyObject
   )
   return Windows.UI.Xaml.Automation.IVector_IAutomationAnnotation is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationProperties");
      m_Factory     : IAutomationPropertiesStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IVector_IAutomationAnnotation;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationPropertiesStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetAnnotations(element, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DockPositionProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.DockPatternIdentifiers");
      m_Factory     : IDockPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDockPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DockPositionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DropEffectProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.DragPatternIdentifiers");
      m_Factory     : IDragPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DropEffectProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DropEffectsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.DragPatternIdentifiers");
      m_Factory     : IDragPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DropEffectsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_GrabbedItemsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.DragPatternIdentifiers");
      m_Factory     : IDragPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_GrabbedItemsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsGrabbedProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.DragPatternIdentifiers");
      m_Factory     : IDragPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDragPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsGrabbedProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DropTargetEffectProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.DropTargetPatternIdentifiers");
      m_Factory     : IDropTargetPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDropTargetPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DropTargetEffectProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DropTargetEffectsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.DropTargetPatternIdentifiers");
      m_Factory     : IDropTargetPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IDropTargetPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DropTargetEffectsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExpandCollapseStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ExpandCollapsePatternIdentifiers");
      m_Factory     : IExpandCollapsePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IExpandCollapsePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExpandCollapseStateProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ColumnProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers");
      m_Factory     : IGridItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ColumnProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ColumnSpanProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers");
      m_Factory     : IGridItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ColumnSpanProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ContainingGridProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers");
      m_Factory     : IGridItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ContainingGridProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RowProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers");
      m_Factory     : IGridItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RowProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RowSpanProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.GridItemPatternIdentifiers");
      m_Factory     : IGridItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RowSpanProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ColumnCountProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.GridPatternIdentifiers");
      m_Factory     : IGridPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ColumnCountProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RowCountProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.GridPatternIdentifiers");
      m_Factory     : IGridPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGridPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RowCountProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CurrentViewProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.MultipleViewPatternIdentifiers");
      m_Factory     : IMultipleViewPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMultipleViewPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CurrentViewProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SupportedViewsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.MultipleViewPatternIdentifiers");
      m_Factory     : IMultipleViewPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IMultipleViewPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SupportedViewsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsReadOnlyProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers");
      m_Factory     : IRangeValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRangeValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsReadOnlyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_LargeChangeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers");
      m_Factory     : IRangeValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRangeValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_LargeChangeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaximumProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers");
      m_Factory     : IRangeValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRangeValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaximumProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinimumProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers");
      m_Factory     : IRangeValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRangeValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinimumProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SmallChangeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers");
      m_Factory     : IRangeValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRangeValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SmallChangeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ValueProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.RangeValuePatternIdentifiers");
      m_Factory     : IRangeValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IRangeValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ValueProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HorizontallyScrollableProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers");
      m_Factory     : IScrollPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HorizontallyScrollableProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HorizontalScrollPercentProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers");
      m_Factory     : IScrollPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HorizontalScrollPercentProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HorizontalViewSizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers");
      m_Factory     : IScrollPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HorizontalViewSizeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_NoScroll
   return Windows.Double is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers");
      m_Factory     : IScrollPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Double;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_NoScroll(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VerticallyScrollableProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers");
      m_Factory     : IScrollPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VerticallyScrollableProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VerticalScrollPercentProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers");
      m_Factory     : IScrollPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VerticalScrollPercentProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_VerticalViewSizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ScrollPatternIdentifiers");
      m_Factory     : IScrollPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IScrollPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_VerticalViewSizeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSelectedProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.SelectionItemPatternIdentifiers");
      m_Factory     : ISelectionItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectionItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSelectedProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SelectionContainerProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.SelectionItemPatternIdentifiers");
      m_Factory     : ISelectionItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectionItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SelectionContainerProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanSelectMultipleProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.SelectionPatternIdentifiers");
      m_Factory     : ISelectionPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectionPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanSelectMultipleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsSelectionRequiredProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.SelectionPatternIdentifiers");
      m_Factory     : ISelectionPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectionPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsSelectionRequiredProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_SelectionProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.SelectionPatternIdentifiers");
      m_Factory     : ISelectionPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISelectionPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_SelectionProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FormulaProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.SpreadsheetItemPatternIdentifiers");
      m_Factory     : ISpreadsheetItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ISpreadsheetItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FormulaProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ExtendedPropertiesProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.StylesPatternIdentifiers");
      m_Factory     : IStylesPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStylesPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ExtendedPropertiesProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FillColorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.StylesPatternIdentifiers");
      m_Factory     : IStylesPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStylesPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FillColorProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FillPatternColorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.StylesPatternIdentifiers");
      m_Factory     : IStylesPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStylesPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FillPatternColorProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_FillPatternStyleProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.StylesPatternIdentifiers");
      m_Factory     : IStylesPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStylesPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_FillPatternStyleProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ShapeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.StylesPatternIdentifiers");
      m_Factory     : IStylesPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStylesPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ShapeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StyleIdProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.StylesPatternIdentifiers");
      m_Factory     : IStylesPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStylesPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StyleIdProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StyleNameProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.StylesPatternIdentifiers");
      m_Factory     : IStylesPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IStylesPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StyleNameProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ColumnHeaderItemsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TableItemPatternIdentifiers");
      m_Factory     : ITableItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITableItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ColumnHeaderItemsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RowHeaderItemsProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TableItemPatternIdentifiers");
      m_Factory     : ITableItemPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITableItemPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RowHeaderItemsProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ColumnHeadersProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TablePatternIdentifiers");
      m_Factory     : ITablePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITablePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ColumnHeadersProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RowHeadersProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TablePatternIdentifiers");
      m_Factory     : ITablePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITablePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RowHeadersProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RowOrColumnMajorProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TablePatternIdentifiers");
      m_Factory     : ITablePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITablePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RowOrColumnMajorProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ToggleStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TogglePatternIdentifiers");
      m_Factory     : ITogglePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITogglePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ToggleStateProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanZoomProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TransformPattern2Identifiers");
      m_Factory     : ITransformPattern2IdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITransformPattern2IdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanZoomProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ZoomLevelProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TransformPattern2Identifiers");
      m_Factory     : ITransformPattern2IdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITransformPattern2IdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ZoomLevelProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MaxZoomProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TransformPattern2Identifiers");
      m_Factory     : ITransformPattern2IdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITransformPattern2IdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MaxZoomProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_MinZoomProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TransformPattern2Identifiers");
      m_Factory     : ITransformPattern2IdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITransformPattern2IdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_MinZoomProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanMoveProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TransformPatternIdentifiers");
      m_Factory     : ITransformPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITransformPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanMoveProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanResizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TransformPatternIdentifiers");
      m_Factory     : ITransformPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITransformPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanResizeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanRotateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.TransformPatternIdentifiers");
      m_Factory     : ITransformPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_ITransformPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanRotateProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsReadOnlyProperty_IValuePatternIdentifiers
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ValuePatternIdentifiers");
      m_Factory     : IValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsReadOnlyProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ValueProperty_IValuePatternIdentifiers
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.ValuePatternIdentifiers");
      m_Factory     : IValuePatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IValuePatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ValueProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanMaximizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.WindowPatternIdentifiers");
      m_Factory     : IWindowPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanMaximizeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_CanMinimizeProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.WindowPatternIdentifiers");
      m_Factory     : IWindowPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_CanMinimizeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsModalProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.WindowPatternIdentifiers");
      m_Factory     : IWindowPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsModalProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsTopmostProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.WindowPatternIdentifiers");
      m_Factory     : IWindowPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsTopmostProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WindowInteractionStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.WindowPatternIdentifiers");
      m_Factory     : IWindowPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WindowInteractionStateProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_WindowVisualStateProperty
   return Windows.UI.Xaml.Automation.IAutomationProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.WindowPatternIdentifiers");
      m_Factory     : IWindowPatternIdentifiersStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.Automation.IAutomationProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IWindowPatternIdentifiersStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_WindowVisualStateProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_TypeProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationAnnotation");
      m_Factory     : IAutomationAnnotationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationAnnotationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_TypeProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ElementProperty
   return Windows.UI.Xaml.IDependencyProperty is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.UI.Xaml.Automation.AutomationAnnotation");
      m_Factory     : IAutomationAnnotationStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.UI.Xaml.IDependencyProperty;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAutomationAnnotationStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ElementProperty(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
