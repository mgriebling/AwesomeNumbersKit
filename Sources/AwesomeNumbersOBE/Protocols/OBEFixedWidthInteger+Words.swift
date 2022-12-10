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
// MARK: * OBE x Fixed Width Integer x Words
//*============================================================================*

extension OBEFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Accessors
    //=------------------------------------------------------------------------=
    
    @inlinable public var nonzeroBitCount: Int {
        low.nonzeroBitCount + high.nonzeroBitCount
    }
    
    @inlinable public var leadingZeroBitCount: Int {
        high.isZero ? High.bitWidth + low.leadingZeroBitCount : high.leadingZeroBitCount
    }
    
    @inlinable public var trailingZeroBitCount: Int {
        low.isZero ? Low.bitWidth + high.trailingZeroBitCount : low.trailingZeroBitCount
    }
    
    @inlinable public var mostSignificantBit: Bool {
        high.mostSignificantBit
    }
    
    @inlinable public var leastSignificantBit: Bool {
        low.leastSignificantBit
    }
}
