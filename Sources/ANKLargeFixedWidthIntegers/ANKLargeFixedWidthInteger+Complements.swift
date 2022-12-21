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
// MARK: * ANK x Fixed Width Integer x Large x Complements
//*============================================================================*

extension ANKLargeFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_transparent public mutating func formTwosComplement() {
        self.body.formTwosComplement()
    }
    
    @_transparent public func twosComplement() -> Self {
        Self(bitPattern: body.twosComplement())
    }
}

//*============================================================================*
// MARK: * ANK x Fixed Width Integer x Large x Signed x Complements
//*============================================================================*

extension ANKSignedLargeFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_transparent public static prefix func -(x: Self) -> Self {
        Self(bitPattern: -x.body)        
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_transparent public mutating func negateReportingOverflow() -> Bool {
        self.body.negateReportingOverflow()
    }
    
    @_transparent public func negatedReportingOverflow() -> PVO<Self> {
        Self.pvo(body.negatedReportingOverflow())        
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Utilities
    //=------------------------------------------------------------------------=
    
    @_transparent public var magnitude: Magnitude {
        Magnitude(bitPattern: body.magnitude)
    }
}
