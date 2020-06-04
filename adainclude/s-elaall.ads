------------------------------------------------------------------------------

--  This package provides the interfaces for proper handling of restriction
--  No_Standard_Allocators_After_Elaboration. It is used only by programs
--  which use this restriction.

package System.Elaboration_Allocators is
   pragma Preelaborate;

   procedure Mark_Start_Of_Elaboration;
   --  Called right at the start of main elaboration if the program activates
   --  restriction No_Standard_Allocators_After_Elaboration. We don't want to
   --  rely on the normal elaboration mechanism for marking this event, since
   --  that would require us to be sure to elaborate this first, which would
   --  be awkward, and it is convenient to have this package be Preelaborate.

   procedure Mark_End_Of_Elaboration;
   --  Called when main elaboration is complete if the program has activated
   --  restriction No_Standard_Allocators_After_Elaboration. This is the point
   --  beyond which any standard allocator use will violate the restriction.

   procedure Check_Standard_Allocator;
   --  Called as part of every allocator in a program for which the restriction
   --  No_Standard_Allocators_After_Elaboration is active. This will raise an
   --  exception (Program_Error with an appropriate message) if it is called
   --  after the call to Mark_End_Of_Elaboration.

end System.Elaboration_Allocators;
