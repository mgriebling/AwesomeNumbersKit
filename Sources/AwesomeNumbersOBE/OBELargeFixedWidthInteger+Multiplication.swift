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
// MARK: * OBE x Fixed Width Integer x Large x Multiplication
//*============================================================================*

extension OBELargeFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @inlinable public static func *=(lhs: inout Self, rhs: Self) {
        lhs.body.multiplyAsKaratsuba(by: rhs.body)
    }
    
    @inlinable public static func *(lhs: Self, rhs: Self) -> Self {
        Self(bitPattern: lhs.body.multipliedAsKaratsuba(by: rhs.body))
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @inlinable public mutating func multiplyReportingOverflow(by amount: Self) -> Bool {
        self.body.multiplyReportingOverflowAsKaratsuba(by: amount.body)
    }
    
    @inlinable public func multipliedReportingOverflow(by amount: Self) -> PVO<Self> {
        let (pv, o) = body.multipliedReportingOverflowAsKaratsuba(by: amount.body); return PVO(Self(bitPattern: pv), o)
    }
    
    @inlinable public mutating func multiplyFullWidth(by amount: Self) -> Self {
        let product = body.multipliedFullWidthAsKaratsuba(by: amount.body)
        self = Self(bitPattern: product.low )
        return Self(bitPattern: product.high)
    }
    
    @inlinable public func multipliedFullWidth(by amount: Self) -> HL<Self, Magnitude> {
        let product = body.multipliedFullWidthAsKaratsuba(by: amount.body)
        return HL(Self(bitPattern: product.high), Magnitude(bitPattern: product.low))
    }
}

//*============================================================================*
// MARK: * OBE x Fixed Width Integer x Large x Unsigned x Multiplication
//*============================================================================*

extension OBEUnsignedLargeFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    //=------------------------------------------------------------------------=
    // the compiler should optimize the general case but I am not sure it does
    //=------------------------------------------------------------------------=
    
    @inlinable public mutating func multiplyFullWidth(by amount: Self) -> Self {
        let product = body.multipliedFullWidthAsKaratsubaAsUnsigned(by: amount.body)
        self = Self(bitPattern: product.low )
        return Self(bitPattern: product.high)
    }
    
    @inlinable public func multipliedFullWidth(by amount: Self) -> HL<Self, Magnitude> {
        let product = body.multipliedFullWidthAsKaratsubaAsUnsigned(by: amount.body)
        return HL(Self(bitPattern: product.high), Magnitude(bitPattern: product.low))
    }
}
