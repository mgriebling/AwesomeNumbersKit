//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

import AwesomeNumbersKit

//*============================================================================*
// MARK: * OBE x Full Width x Bitwise
//*============================================================================*

extension OBEFullWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @inlinable static prefix func ~(x: Self) -> Self {
        Self(descending:(~x.high, ~x.low))
    }
    
    @inlinable static func &=(lhs: inout Self, rhs: Self) {
        lhs.low &= rhs.low; lhs.high &= rhs.high
    }
    
    @inlinable static func &(lhs: Self, rhs: Self) -> Self {
        var lhs = lhs; lhs &= rhs; return lhs
    }
    
    @inlinable static func |=(lhs: inout Self, rhs: Self) {
        lhs.low |= rhs.low; lhs.high |= rhs.high
    }
    
    @inlinable static func |(lhs: Self, rhs: Self) -> Self {
        var lhs = lhs; lhs |= rhs; return lhs
    }
    
    @inlinable static func ^=(lhs: inout Self, rhs: Self) {
        lhs.low ^= rhs.low; lhs.high ^= rhs.high
    }
    
    @inlinable static func ^(lhs: Self, rhs: Self) -> Self {
        var lhs = lhs; lhs ^= rhs; return lhs
    }
}
