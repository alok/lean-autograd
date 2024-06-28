import Lake
open Lake DSL

package "lean-autograd" where
  -- add package configuration options here

lean_lib «LeanAutograd» where
  -- add library configuration options here

@[default_target]
lean_exe "lean-autograd" where
  root := `Main
