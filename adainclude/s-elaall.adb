------------------------------------------------------------------------------

package body System.Elaboration_Allocators is

   Elaboration_In_Progress : Boolean;
   pragma Atomic (Elaboration_In_Progress);
   --  Flag to show if elaboration is active. We don't attempt to initialize
   --  this because we want to be sure it gets reset if we are in a multiple
   --  elaboration situation of some kind. Make it atomic to prevent race
   --  conditions of any kind (not clearly necessary, but harmless!)

   ------------------------------
   -- Check_Standard_Allocator --
   ------------------------------

   procedure Check_Standard_Allocator is
   begin
      if not Elaboration_In_Progress then
         raise Program_Error with
           "standard allocator after elaboration is complete is not allowed "
           & "(No_Standard_Allocators_After_Elaboration restriction active)";
      end if;
   end Check_Standard_Allocator;

   -----------------------------
   -- Mark_End_Of_Elaboration --
   -----------------------------

   procedure Mark_End_Of_Elaboration is
   begin
      Elaboration_In_Progress := False;
   end Mark_End_Of_Elaboration;

   -------------------------------
   -- Mark_Start_Of_Elaboration --
   -------------------------------

   procedure Mark_Start_Of_Elaboration is
   begin
      Elaboration_In_Progress := True;
   end Mark_Start_Of_Elaboration;

end System.Elaboration_Allocators;
