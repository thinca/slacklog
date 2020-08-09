Your system doesn't seem to support WinForms correctly. You will
need to set fsi.EventLoop use GUI windows from F# Interactive.
You can set different event loops for MonoMac, Gtk#, WinForms and other
UI toolkits. Drop the --gui argument if no event loop is required.
[Loading /Users/callmekohei/tmp/foo.fsx]


/Users/callmekohei/tmp/foo.fsx(6,6): warning FS0086: The '=' operator should not normally be redefined. To define equality semantics for a type, override the 'Object.Equals' member in the definition of that type.

namespace FSI_0002
  val foo : unit -> unit
  val bar : unit -> unit
  val ( = ) : 'a -> 'b -> int

