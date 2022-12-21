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
// MARK: * ANK x Fixed Width Integer x Large x Addition
//*============================================================================*

extension ANKLargeFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_transparent public static func +=(lhs: inout Self, rhs: Self) {
        lhs.body += rhs.body
    }
    
    @_transparent public static func +(lhs: Self, rhs: Self) -> Self {
        Self(bitPattern: lhs.body + rhs.body)
    }
    
    @_transparent public static func &+=(lhs: inout Self, rhs: Self) {
        lhs.body &+= rhs.body
    }
    
    @_transparent public static func &+(lhs: Self, rhs: Self) -> Self {
        Self(bitPattern: lhs.body &+ rhs.body)
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_transparent public mutating func addReportingOverflow(_ amount: Self) -> Bool {
        self.body.addReportingOverflow(amount.body)
    }
    
    @_transparent public func addingReportingOverflow(_ amount: Self) -> PVO<Self> {
        let (pv, o) = self.body.addingReportingOverflow(amount.body); return (Self(bitPattern: pv), o)
    }
}

//*============================================================================*
// MARK: * ANK x Fixed Width Integer x Large x Addition x Digit
//*============================================================================*

extension ANKLargeFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_transparent public static func +=(lhs: inout Self, rhs: Digit) {
        lhs.body += rhs
    }
    
    @_transparent public static func +(lhs: Self, rhs: Digit) -> Self {
        Self(bitPattern: lhs.body + rhs)
    }
    
    @_transparent public static func &+=(lhs: inout Self, rhs: Digit) {
        lhs.body &+= rhs
    }
    
    @_transparent public static func &+(lhs: Self, rhs: Digit) -> Self {
        Self(bitPattern: lhs.body &+ rhs)
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_transparent public mutating func addReportingOverflow(_ amount: Digit) -> Bool {
        self.body.addReportingOverflow(amount)
    }
    
    @_transparent public func addingReportingOverflow(_ amount: Digit) -> PVO<Self> {
        let (pv, o) = self.body.addingReportingOverflow(amount); return (Self(bitPattern: pv), o)
    }
}
