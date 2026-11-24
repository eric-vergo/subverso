/-
Copyright (c) 2026 Lean FRO LLC. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Eric Vergo, Claude (Anthropic)
-/
module
public import Lean.Util.Path

public section

open Lean

namespace SubVerso.Module

/--
Finds the source file of the module `mod` in the source search path `sp`: the file `mod` names
under the first root of `sp` that contains it.

`SearchPath.findModuleWithExt` instead settles on the first root that has a directory or file
named after the first component of `mod`, and reports nothing when the module is not there. Two
roots can both have such a directory: a package may require another package from a directory
that encloses it, and on a case-insensitive file system a directory `Docs` of one root is the same
as a directory `docs` of another. Whenever the first such root contains the module, both lookups
give the same file.
-/
def findModuleSource? (sp : SearchPath) (mod : Name) : IO (Option System.FilePath) := do
  for root in sp do
    let path := modToFilePath root mod "lean"
    if ← path.pathExists then
      return some path
  return none

end SubVerso.Module
