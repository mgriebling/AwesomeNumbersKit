//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * Awesome x Fixed Width Integer x Large
//*============================================================================*

/// A large fixed-width integer with additional requirements and capabilities.
///
/// ```
/// self.bitWidth / UInt.bitWidth >= 1
/// self.bitWidth % UInt.bitWidth == 0
/// ```
/// 
public protocol AwesomeLargeFixedWidthInteger<Digit>: AwesomeFixedWidthInteger,
AwesomeLargeBinaryInteger where Magnitude: AwesomeUnsignedLargeFixedWidthInteger,
Digit: AwesomeFixedWidthInteger {
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    @inlinable init(repeating word: UInt)
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Addition
    //=------------------------------------------------------------------------=

    @inlinable static func &+=(lhs: inout Self, rhs: Digit)

    @inlinable static func &+(lhs: Self, rhs: Digit) -> Self
    
    @inlinable mutating func addReportingOverflow(_ amount: Digit) -> Bool
    
    @inlinable func addingReportingOverflow(_ amount: Digit) -> PVO<Self>
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Division
    //=------------------------------------------------------------------------=
    
    @inlinable func quotientAndRemainder(dividingBy divisor: Digit) -> QR<Self, Digit>
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Multiplication
    //=------------------------------------------------------------------------=
    
    @inlinable mutating func multiplyReportingOverflow(by amount: Digit) -> Bool
    
    @inlinable func multipliedReportingOverflow(by amount: Digit) -> PVO<Self>
    
    @inlinable mutating func multiplyFullWidth(by amount: Digit) -> Digit
    
    @inlinable func multipliedFullWidth(by amount: Digit) -> HL<Digit, Magnitude>
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Subtraction
    //=------------------------------------------------------------------------=

    @inlinable static func &-=(lhs: inout Self, rhs: Digit)
    
    @inlinable static func &-(lhs: Self, rhs: Digit) -> Self

    @inlinable mutating func subtractReportingOverflow(_ amount: Digit) -> Bool

    @inlinable func subtractingReportingOverflow(_ amount: Digit) -> PVO<Self>
}

//*============================================================================*
// MARK: * Awesome x Fixed Width Integer x Large x Signed
//*============================================================================*

public protocol AwesomeSignedLargeFixedWidthInteger<Digit>: AwesomeLargeFixedWidthInteger,
AwesomeSignedFixedWidthInteger, AwesomeSignedLargeBinaryInteger where Digit: AwesomeSignedFixedWidthInteger { }

//*============================================================================*
// MARK: * Awesome x Fixed Width Integer x Large x Unsigned
//*============================================================================*

public protocol AwesomeUnsignedLargeFixedWidthInteger<Digit>: AwesomeLargeFixedWidthInteger,
AwesomeUnsignedFixedWidthInteger, AwesomeUnsignedLargeBinaryInteger where Digit: AwesomeUnsignedFixedWidthInteger { }
