with Ada.Strings.Unbounded;

use Ada.Strings.Unbounded;

package OAuth.Easy is
   type OAuth_Context is private;

   function Get_Token (Context : OAuth_Context) return Unbounded_String;

   function Get_Token_Secret (Context : OAuth_Context)
     return Unbounded_String;

   procedure Set_Token (Context : in out OAuth_Context;
                        Token   :        String);

   procedure Set_Token_Secret (Context : in out OAuth_Context;
                               Secret  :        String);

   procedure Init (Context         :    out OAuth_Context;
                   Consumer_Key    : in     String;
                   Consumer_Secret : in     String);

   procedure Request_Token (Context      : in out OAuth_Context;
                            URL          : in     String;
                            Method       : in     String);

   procedure Access_Token (Context      : in out OAuth_Context;
                           URL          : in     String;
                           Method       : in     String;
                           Verifier     : in     String;
                           User_Id      :    out Unbounded_String;
                           Name         :    out Unbounded_String);

   procedure As_Header (Context    : in out OAuth_Context;
                        URL        : in     String;
                        Method     : in     String;
                        Parameters : in     OAuth.Parameter_List.List;
                        Header     :    out Unbounded_String);

private
   type OAuth_Context is record
      Key    : Unbounded_String := Null_Unbounded_String;
      Secret : Unbounded_String := Null_Unbounded_String;
      Token  : Unbounded_String := Null_Unbounded_String;
      Token_Secret  : Unbounded_String := Null_Unbounded_String;
      Request_Count : Natural   := 0;
   end record;
end OAuth.Easy;
