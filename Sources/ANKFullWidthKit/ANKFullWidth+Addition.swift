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
// MARK: * ANK x Full Width x Addition
//*============================================================================*

extension ANKFullWidth {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @inlinable public mutating func addReportingOverflow(_ amount: Self) -> Bool {
        let a: Bool = self.low .addReportingOverflow(amount.low )
        let b: Bool = self.high.addReportingOverflow(amount.high)
        let c: Bool = a && self.high.addReportingOverflow(1 as Digit)
        return b || c
    }
    
    @inlinable public func addingReportingOverflow(_ amount: Self) -> PVO<Self> {
        var partialValue = self
        let overflow: Bool = partialValue.addReportingOverflow(amount)
        return PVO(partialValue, overflow)
    }
}
