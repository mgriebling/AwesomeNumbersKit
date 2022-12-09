//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * OBE x Fixed Width Integer x Magnitude x Signed
//*============================================================================*

extension OBESignedFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Utilities
    //=------------------------------------------------------------------------=
    
    @inlinable public var magnitude: Magnitude {
        let isLessThanZero = isLessThanZero
        let bitPattern = Magnitude(bitPattern: self)
        return isLessThanZero ? bitPattern.twosComplement() : bitPattern
    }
}
