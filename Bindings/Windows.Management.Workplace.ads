--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
package Windows.Management.Workplace is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type MessagingSyncPolicy is (
      Disallowed,
      Allowed,
      Required
   );
   for MessagingSyncPolicy use (
      Disallowed => 0,
      Allowed => 1,
      Required => 2
   );
   for MessagingSyncPolicy'Size use 32;
   
   type MessagingSyncPolicy_Ptr is access MessagingSyncPolicy;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type WorkplaceSettingsContract is null record;
   pragma Convention (C_Pass_By_Copy , WorkplaceSettingsContract);
   
   type WorkplaceSettingsContract_Ptr is access WorkplaceSettingsContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IMdmAllowPolicyStatics_Interface;
   type IMdmAllowPolicyStatics is access all IMdmAllowPolicyStatics_Interface'Class;
   type IMdmAllowPolicyStatics_Ptr is access all IMdmAllowPolicyStatics;
   type IMdmPolicyStatics2_Interface;
   type IMdmPolicyStatics2 is access all IMdmPolicyStatics2_Interface'Class;
   type IMdmPolicyStatics2_Ptr is access all IMdmPolicyStatics2;
   type IWorkplaceSettingsStatics_Interface;
   type IWorkplaceSettingsStatics is access all IWorkplaceSettingsStatics_Interface'Class;
   type IWorkplaceSettingsStatics_Ptr is access all IWorkplaceSettingsStatics;
   
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
   type IMdmAllowPolicyStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function IsBrowserAllowed
   (
      This       : access IMdmAllowPolicyStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsCameraAllowed
   (
      This       : access IMdmAllowPolicyStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsMicrosoftAccountAllowed
   (
      This       : access IMdmAllowPolicyStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function IsStoreAllowed
   (
      This       : access IMdmAllowPolicyStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IMdmAllowPolicyStatics : aliased constant Windows.IID := (3281455591, 29724, 16882, (164, 182, 49, 76, 49, 80, 37, 134 ));
   
   ------------------------------------------------------------------------
   type IMdmPolicyStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetMessagingSyncPolicy
   (
      This       : access IMdmPolicyStatics2_Interface
      ; RetVal : access Windows.Management.Workplace.MessagingSyncPolicy
   )
   return Windows.HRESULT is abstract;
   
   IID_IMdmPolicyStatics2 : aliased constant Windows.IID := (3382474022, 980, 18937, (169, 147, 67, 239, 204, 210, 101, 196 ));
   
   ------------------------------------------------------------------------
   type IWorkplaceSettingsStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsMicrosoftAccountOptional
   (
      This       : access IWorkplaceSettingsStatics_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IWorkplaceSettingsStatics : aliased constant Windows.IID := (3831984125, 11666, 19464, (186, 212, 246, 89, 11, 84, 166, 211 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function IsBrowserAllowed
   return Windows.Boolean;
   
   function IsCameraAllowed
   return Windows.Boolean;
   
   function IsMicrosoftAccountAllowed
   return Windows.Boolean;
   
   function IsStoreAllowed
   return Windows.Boolean;
   
   function GetMessagingSyncPolicy
   return Windows.Management.Workplace.MessagingSyncPolicy;
   
   function get_IsMicrosoftAccountOptional
   return Windows.Boolean;

end;