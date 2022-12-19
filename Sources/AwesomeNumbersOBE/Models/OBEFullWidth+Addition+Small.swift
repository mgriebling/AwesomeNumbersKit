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
// MARK: * OBE x Full Width x Signed x Addition x Small
//*============================================================================*

extension OBEFullWidth where Self: SignedInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @inlinable mutating func addReportingOverflow(_ amount: Int) -> Bool {
        let lhsWasLessThanZero =   self.isLessThanZero
        let rhsWasLessThanZero = amount.isLessThanZero
        //=--------------------------------------=
        //
        //=--------------------------------------=
        self.withUnsafeMutableWords { LHS in
            var index = LHS.startIndex
            var carry = LHS[index].addReportingOverflow(UInt(bitPattern: amount))
            LHS.formIndex(after: &index)
            //=----------------------------------=
            //
            //=----------------------------------=
            if  carry == rhsWasLessThanZero { return }
            let predicate = carry
            let increment = carry ? 1 : ~0 as UInt // +1 vs -1

            while index != LHS.endIndex && carry == predicate {
                carry = LHS[index].addReportingOverflow(increment)
                LHS.formIndex(after: &index)
            }
        }
        //=--------------------------------------=
        //
        //=--------------------------------------=
        return lhsWasLessThanZero == rhsWasLessThanZero && lhsWasLessThanZero != isLessThanZero
    }
    
    @inlinable func addingReportingOverflow(_ amount: Int) -> PVO<Self> {
        var pv = self; let o = pv.addReportingOverflow(amount); return (pv, o)
    }
}


//*============================================================================*
// MARK: * OBE x Full Width x Unsigned x Addition x Small
//*============================================================================*

extension OBEFullWidth where Self: UnsignedInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @inlinable mutating func addReportingOverflow(_ amount: UInt) -> Bool {
        self.withUnsafeMutableWords { LHS in
            var index = LHS.startIndex
            var carry = LHS[index].addReportingOverflow(amount)
            LHS.formIndex(after: &index)
            
            while carry && index != LHS.endIndex {
                carry = LHS[index].addReportingOverflow(1 as UInt)
                LHS.formIndex(after: &index)
            }
            
            return carry
        }
    }
    
    @inlinable func addingReportingOverflow(_ amount: UInt) -> PVO<Self> {
        var pv = self; let o = pv.addReportingOverflow(amount); return (pv, o)
    }
}
