![image](https://github.com/christopherbiscardi/purescript/blob/official/logo.png?raw=true)


# Purescript

PureScript is a small strongly typed programming language that
compiles to JavaScript.

# Language

## DSLs

PureScript’s expressive type system and lightweight syntax make it
simple to define [domain-specific languages][dsl], which can be used to solve
problems like templating the DOM. Bindings also exist for libraries
such as React and Angular.js.

```purescript
import Data.DOM.Free

doc :: Element
doc = div [ _class := "image" ] $ do
  elem $ img [ src := "logo.jpg"
             , width  := 100
             , height := 200
             ]
  text "Functional programming for the web!"
```

## Generative Testing

PureScript provides a form of ad-hoc polymorphism in the form of type
classes, inspired by Haskell. Type classes are used in the QuickCheck
and StrongCheck libraries to support [generative testing][quickcheck], which
separates test definitions from the generation of test cases.


```purescript
import Test.QuickCheck

main = do
  quickCheck $ \xs ys ->
    isSorted $ merge (sort xs) (sort ys)
  quickCheck $ \xs ys ->
    xs `isSubarrayOf` merge xs ys
```

## Higher Order Functions

Higher-order functions allow the developer to write fluent, expressive
code. Here, higher-order functions are being used to capture some
common patterns when [working with HTML5 canvas][hof], such as saving
and restoring the context and drawing closed paths.

```purescript
import Control.Apply

import Graphics.Canvas (getCanvasElementById, getContext2D)
import Graphics.Canvas.Free

closed path = beginPath *> path <* closePath

filled shape = shape <* fill

withContext shape = save *> shape <* restore

scene :: Graphics Unit
scene = withContext do
  setFillStyle "#FF0000"

  filled $ closed do
    moveTo 0 0
    lineTo 50 0
    lineTo 25 50

main = do
  canvas <- getCanvasElementById "canvas"
  context <- getContext2D canvas

  runGraphics context scene
```

# Contents

## PureScript Image
* psc
* psc-make
* psc-docs
* psci
* [bower][http://bower.io/]
* [pulp][https://github.com/bodil/pulp]

## Node Base Image
* [node][http://nodejs.org/]
* [npm][https://www.npmjs.com/]

# More Info

* [Wiki][wiki]
* [Book][book]
* [24 Days of PureScript, 2014][days]
* [Recommended Libraries][libs]
* [Testing JS with PureScript][testjs]

[dsl]: https://leanpub.com/purescript/read#leanpub-auto-domain-specific-languages
[quickcheck]: https://leanpub.com/purescript/read#leanpub-auto-generative-testing
[wiki]: https://github.com/purescript/purescript/wiki
[book]: https://leanpub.com/purescript/read
[days]: https://gist.github.com/paf31/8e9177b20ee920480fbc
[libs]: https://github.com/purescript/purescript/wiki/Recommended-Libraries
[testjs]: https://github.com/purescript/purescript/wiki/Test-your-Javascript-with-QuickCheck
[hof]: https://leanpub.com/purescript/read#leanpub-auto-canvas-graphics
