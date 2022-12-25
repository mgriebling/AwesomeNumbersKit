//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

import ANKFoundation

//*============================================================================*
// MARK: * ANK x Full Width x Complements
//*============================================================================*

extension ANKFullWidth {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @inlinable mutating func formTwosComplement() {
        self.withUnsafeMutableWords { SELF in
            var carry: Bool = true
            for index: Int in SELF.indices {
                var word: UInt = ~SELF[unchecked: index]
                carry = word.addReportingOverflow(UInt(bit: carry))
                SELF[unchecked: index] = word
            }
        }
    }
    
    @inlinable func twosComplement() -> Self {
        var x = self; x.formTwosComplement(); return x
    }
    
    /// - Returns true when `Self.isSigned == true` and `self == min`.
    @inlinable mutating func formTwosComplementReportingOverflow() -> Bool {
        let wasLessThanZero: Bool = self.isLessThanZero
        self.formTwosComplement() // ~self &+ 1
        return wasLessThanZero && self.isLessThanZero
    }
    
    /// - Returns true when `Self.isSigned == true` and `self == min`.
    @inlinable func twosComplementReportingOverflow() -> PVO<Self> {
        var partialValue = self
        let overflow: Bool = partialValue.formTwosComplementReportingOverflow()
        return PVO(partialValue, overflow)
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Utilities
    //=------------------------------------------------------------------------=
    
    @inlinable var magnitude: Magnitude {
        Magnitude(bitPattern: self.isLessThanZero ? self.twosComplement() : self)
    }
}
