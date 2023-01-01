//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

import ANKFoundation

#warning("TODO................................................................")
//*============================================================================*
// MARK: * ANK x Signed
//*============================================================================*

/// A sign-magnitude add-on integer model.
///
/// **Positive & Negative Zero**
///
/// Zero is signed can have therefore a positive or negative sign. Both
/// representations are `==` to each other and have the same `hashValue`.
/// This design is deliberate and allow you to perform transformations
/// such as `sign.toggle()` when `magnitude.isZero`.
///
/// - use `isLessThanZero` to check if the integer is negative
/// - use `isMoreThanZero` to check if the integer is positive (TODO)
/// - the `-0` integer literal creates a positive zero value because `Swift`
///
@frozen public struct ANKSigned<Magnitude>: Comparable, Hashable where Magnitude: ANKUnsignedInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=
    
    public var sign: ANKSign
    public var magnitude: Magnitude
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    @inlinable public init() {
        self.sign = .plus
        self.magnitude = Magnitude()
    }
    
    @inlinable public init(_ magnitude: Magnitude, as sign: ANKSign) {
        self.sign = sign
        self.magnitude = magnitude
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Accessors
    //=------------------------------------------------------------------------=
    
    /// Always returns `.plus` when `magnitude.isZero`, otherwise returns `sign`.
    @inlinable public var normalizedSign: ANKSign {
        self.magnitude.isZero ? .plus : self.sign
    }
}
