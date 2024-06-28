/-! Scalar autodiff.

From Andrej: A tiny Autograd engine (with a bite! :)). Implements backpropagation (reverse-mode autodiff) over a dynamically built DAG and a small neural networks library on top of it with a PyTorch-like API. Both are tiny, with about 100 and 50 lines of code respectively. The DAG only operates over scalar values, so e.g. we chop up each neuron into all of its individual tiny adds and multiplies. However, this is enough to build up entire deep neural nets doing binary classification. Potentially useful for educational purposes.
-/
-- Define ' notation for derivative function


/-

TODO: stable
TODO: autodidax
-/

abbrev Axes := Array Nat
abbrev Shape := Array Nat

inductive Primitive where
  | add
  | mul
  | neg
  | sin
  | cos
  | reduceSum
  | lessThan
  | greaterThan
  | transpose -- (p : Permutation)
  | broadcast -- (shape: Shape) (axes: Axes)
  deriving Repr, BEq, DecidableEq

def reduce_sum (x : Value) (axis : Option Axes := none) := do
 if axis = none then
    let shape := x.dims.length
   return Value.mk (x.data.sum) (x.grad.broadcast (x.shape.map (λ s => s.prod)))
 else
   return Value.mk (x.data.sum) (x.grad.broadcast (x.shape.map (λ s => s.prod)))


def bind1(prim : Primitive) args kwargs := sorry
