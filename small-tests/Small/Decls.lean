-- Declarations whose sources the tests look up by name with `Module.findDecl?`, after extraction.
namespace Decls

/-- A point. -/
structure Point where
  x : Nat
  y : Nat

class HasNorm (α : Type) where
  norm : α → Nat

instance instNormPoint : HasNorm Point := ⟨fun p => p.x + p.y⟩

section
variable (n : Nat)

theorem add_zero' : n + 0 = n := rfl
end

mutual
  def isEven : Nat → Bool
    | 0 => true
    | n + 1 => isOdd n
  def isOdd : Nat → Bool
    | 0 => false
    | n + 1 => isEven n
end

def withAux (n : Nat) : Nat := go n
where
  go : Nat → Nat
    | 0 => 0
    | k + 1 => go k

end Decls
