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
// MARK: * ANK x Signed x Large x Division
//*============================================================================*

extension ANKSigned where Magnitude: ANKLargeBinaryInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_disfavoredOverload @_transparent public static func /=(lhs: inout Self, rhs: Digit) {
        lhs = lhs / rhs
    }
    
    @_disfavoredOverload @_transparent public static func /(lhs: Self, rhs: Digit) -> Self {
        lhs.quotientAndRemainder(dividingBy: rhs).quotient
    }
    
    @_disfavoredOverload @_transparent public static func %=(lhs: inout Self, rhs: Digit) {
        lhs = Self(digit: lhs % rhs)
    }
    
    @_disfavoredOverload @_transparent public static func %(lhs: Self, rhs: Digit) -> Digit {
        lhs.quotientAndRemainder(dividingBy: rhs).remainder
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_disfavoredOverload @inlinable public mutating func divideReportingOverflow(by divisor: Digit) -> Bool {
        let pvo: PVO<Self> = self.dividedReportingOverflow(by: divisor)
        self = pvo.partialValue; return pvo.overflow
    }
    
    @_disfavoredOverload @inlinable public func dividedReportingOverflow(by divisor: Digit) -> PVO<Self> {
        divisor.isZero ? PVO(self,  true) : PVO(self / divisor, false)
    }
    
    @_disfavoredOverload @inlinable public mutating func formRemainderReportingOverflow(dividingBy divisor: Digit) -> Bool {
        let pvo: PVO<Digit> = self.remainderReportingOverflow(dividingBy: divisor)
        self = Self(digit: pvo.partialValue); return pvo.overflow
    }
    
    @_disfavoredOverload @inlinable public func remainderReportingOverflow(dividingBy divisor: Digit) -> PVO<Digit> {
        divisor.isZero ? PVO(Digit(), true) : PVO(self % divisor, false)
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    @_disfavoredOverload @inlinable public func quotientAndRemainder(dividingBy divisor: Digit) -> QR<Self, Digit> {
        let qr: QR<Magnitude, Magnitude.Digit> = self.magnitude.quotientAndRemainder(dividingBy: divisor.magnitude)
        return  QR(Self(qr.quotient, as: self.sign ^ divisor.sign), Digit(qr.remainder, as: self.sign))
    }
}
