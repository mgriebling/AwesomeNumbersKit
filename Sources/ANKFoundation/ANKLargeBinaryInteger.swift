//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * ANK x Binary Integer x Large
//*============================================================================*

/// A large binary integer with additional requirements and capabilities.
///
/// **Two's Complement Semantics**
///
/// Like `BinaryInteger`, required bitwise operations have two's complement semantics.
///
public protocol ANKLargeBinaryInteger<Digit>: ANKBinaryInteger where Magnitude: ANKUnsignedLargeBinaryInteger {
    
    /// A machine word of some kind.
    associatedtype Digit: ANKBinaryInteger
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    /// Creates a new instance from the given digit.
    @inlinable init(digit: Digit)
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Addition
    //=------------------------------------------------------------------------=
    
    /// Forms the sum of adding `rhs` to `lhs`.
    ///
    /// ```
    /// var a = Int256(1); a += Int(2) // a = Int256(3)
    /// var b = Int256(2); b += Int(3) // b = Int256(5)
    /// var c = Int256(3); c += Int(4) // c = Int256(7)
    /// var d = Int256(4); d += Int(5) // d = Int256(9)
    /// ```
    ///
    @inlinable static func +=(lhs: inout Self, rhs: Digit)

    /// Returns the sum of adding `rhs` to `lhs`.
    ///
    /// ```
    /// Int256(1) + Int(2) // Int256(3)
    /// Int256(2) + Int(3) // Int256(5)
    /// Int256(3) + Int(4) // Int256(7)
    /// Int256(4) + Int(5) // Int256(9)
    /// ```
    ///
    @inlinable static func +(lhs: Self, rhs: Digit) -> Self
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Division
    //=------------------------------------------------------------------------=
    
    /// Forms the quotient of dividing `lhs` by `rhs`.
    ///
    /// ```
    /// var a = Int256( 7); a /= Int( 3) // a = Int256( 2)
    /// var b = Int256( 7); b /= Int(-3) // b = Int256(-2)
    /// var c = Int256(-7); c /= Int( 3) // c = Int256(-2)
    /// var d = Int256(-7); d /= Int(-3) // d = Int256( 2)
    /// ```
    ///
    @inlinable static func /=(lhs: inout Self, rhs: Digit)
    
    /// Returns the quotient of dividing `lhs` by `rhs`.
    ///
    /// ```
    /// Int256( 7) / Int( 3) // Int256( 2)
    /// Int256( 7) / Int(-3) // Int256(-2)
    /// Int256(-7) / Int( 3) // Int256(-2)
    /// Int256(-7) / Int(-3) // Int256( 2)
    /// ```
    ///
    @inlinable static func /(lhs: Self, rhs: Digit) -> Self
    
    /// Forms the remainder of dividing `lhs` by `rhs`.
    ///
    /// ```
    /// var a = Int256( 7); a %= Int( 3) // a = Int256( 1)
    /// var b = Int256( 7); b %= Int(-3) // b = Int256( 1)
    /// var c = Int256(-7); c %= Int( 3) // c = Int256(-1)
    /// var d = Int256(-7); d %= Int(-3) // d = Int256(-1)
    /// ```
    ///
    @inlinable static func %=(lhs: inout Self, rhs: Digit)
    
    /// Returns the remainder of dividing `lhs` by `rhs`.
    ///
    /// ```
    /// Int256( 7) % Int( 3) // Int( 1)
    /// Int256( 7) % Int(-3) // Int( 1)
    /// Int256(-7) % Int( 3) // Int(-1)
    /// Int256(-7) % Int(-3) // Int(-1)
    /// ```
    ///
    @inlinable static func %(lhs: Self, rhs: Digit) -> Digit
    
    /// Forms the quotient of this value divided by the given value, and
    /// returns a value indicating whether overflow occurred. In the case of
    /// overflow, the result is either truncated or, if undefined, this value.
    ///
    /// ```
    /// var a = Int256( 7); a.divideReportingOverflow(by:  3 as Int) // a = Int256( 2); -> false
    /// var b = Int256.min; b.divideReportingOverflow(by:  0 as Int) // b = Int256.min; -> true
    /// var c = Int256.min; c.divideReportingOverflow(by: -1 as Int) // c = Int256.min; -> true
    /// ```
    ///
    @inlinable mutating func divideReportingOverflow(by divisor: Digit) -> Bool
    
    /// Returns the quotient of this value divided by the given value, and
    /// returns a value indicating whether overflow occurred. In the case of
    /// overflow, the result is either truncated or, if undefined, this value.
    ///
    /// ```
    /// Int256( 7).dividedReportingOverflow(by:  3 as Int) // (partialValue: Int256( 2), overflow: false)
    /// Int256.min.dividedReportingOverflow(by:  0 as Int) // (partialValue: Int256.min, overflow: true )
    /// Int256.min.dividedReportingOverflow(by: -1 as Int) // (partialValue: Int256.min, overflow: true )
    /// ```
    ///
    @inlinable func dividedReportingOverflow(by divisor: Digit) -> PVO<Self>
    
    /// Forms the remainder of this value divided by the given value, and
    /// returns a value indicating whether overflow occurred. In the case of
    /// overflow, the result is either the entire remainder or, if undefined,
    /// zero.
    ///
    /// ```
    /// var a = Int256( 7); a.formRemainderReportingOverflow(dividingBy:  3 as Int) // a = Int256(1); -> false
    /// var b = Int256.min; b.formRemainderReportingOverflow(dividingBy:  0 as Int) // b = Int256(0); -> true
    /// var c = Int256.min; c.formRemainderReportingOverflow(dividingBy: -1 as Int) // c = Int256(0); -> true
    /// ```
    ///
    @inlinable mutating func formRemainderReportingOverflow(dividingBy divisor: Digit) -> Bool
    
    /// Returns the remainder of this value divided by the given value, and
    /// returns a value indicating whether overflow occurred. In the case of
    /// overflow, the result is either the entire remainder or, if undefined,
    /// zero.
    ///
    /// ```
    /// Int256( 7).remainderReportingOverflow(dividingBy:  3 as Int) // (partialValue: Int(1), overflow: false)
    /// Int256.min.remainderReportingOverflow(dividingBy:  0 as Int) // (partialValue: Int(0), overflow: true )
    /// Int256.min.remainderReportingOverflow(dividingBy: -1 as Int) // (partialValue: Int(0), overflow: true )
    /// ```
    ///
    @inlinable func remainderReportingOverflow(dividingBy divisor: Digit) -> PVO<Digit>
    
    /// Returns the quotient and remainder of this value divided by the given value.
    ///
    /// ```
    /// Int256( 7).quotientAndRemainder(dividingBy:  3 as Int) // (quotient: Int256( 2), remainder: Int( 1))
    /// Int256( 7).quotientAndRemainder(dividingBy: -3 as Int) // (quotient: Int256(-2), remainder: Int( 1))
    /// Int256(-7).quotientAndRemainder(dividingBy:  3 as Int) // (quotient: Int256(-2), remainder: Int(-1))
    /// Int256(-7).quotientAndRemainder(dividingBy: -3 as Int) // (quotient: Int256( 2), remainder: Int(-1))
    /// ```
    ///
    @inlinable func quotientAndRemainder(dividingBy divisor: Digit) -> QR<Self, Digit>
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Multiplication
    //=------------------------------------------------------------------------=
    
    /// Forms the product of multiplying `lhs` by `rhs`.
    ///
    /// ```
    /// var a = Int256(1); a *= Int(2) // a = Int256( 2)
    /// var b = Int256(2); b *= Int(3) // b = Int256( 6)
    /// var c = Int256(3); c *= Int(4) // c = Int256(12)
    /// var d = Int256(4); d *= Int(5) // d = Int256(20)
    /// ```
    ///
    @inlinable static func *=(lhs: inout Self, rhs: Digit)
    
    /// Returns the product of multiplying `lhs` by `rhs`.
    ///
    /// ```
    /// Int256(1) * Int(2) // Int256( 2)
    /// Int256(2) * Int(3) // Int256( 6)
    /// Int256(3) * Int(4) // Int256(12)
    /// Int256(4) * Int(5) // Int256(20)
    /// ```
    ///
    @inlinable static func *(lhs: Self, rhs: Digit) -> Self
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations x Subtraction
    //=------------------------------------------------------------------------=
    
    /// Forms the difference of subtracting `rhs` from `lhs`.
    ///
    /// ```
    /// var a = Int256(3); a -= Int(2) // a = Int256(1)
    /// var b = Int256(5); b -= Int(3) // b = Int256(2)
    /// var c = Int256(7); c -= Int(4) // c = Int256(3)
    /// var d = Int256(9); d -= Int(5) // d = Int256(4)
    /// ```
    ///
    @inlinable static func -=(lhs: inout Self, rhs: Digit)

    /// Returns the difference of subtracting `rhs` from `lhs`.
    ///
    /// ```
    /// Int256(3) - Int(2) // Int256(1)
    /// Int256(5) - Int(3) // Int256(2)
    /// Int256(7) - Int(4) // Int256(3)
    /// Int256(9) - Int(5) // Int256(4)
    /// ```
    ///
    @inlinable static func -(lhs: Self, rhs: Digit) -> Self
}

//=----------------------------------------------------------------------------=
// MARK: + Details where Digit == Self
//=----------------------------------------------------------------------------=

extension ANKLargeBinaryInteger where Digit == Self {
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    @_transparent public init(digit: Digit) { self = digit }
}

//*============================================================================*
// MARK: * ANK x Binary Integer x Large x Signed
//*============================================================================*

public protocol ANKSignedLargeBinaryInteger<Digit>: ANKLargeBinaryInteger,
ANKSignedInteger where Digit: ANKSignedInteger { }

//*============================================================================*
// MARK: * ANK x Binary Integer x Large x Unsigned
//*============================================================================*

public protocol ANKUnsignedLargeBinaryInteger<Digit>: ANKLargeBinaryInteger,
ANKUnsignedInteger where Digit: ANKUnsignedInteger, Digit.Magnitude == Digit { }

//*============================================================================*
// MARK: * ANK x Binary Integer x Large x Digit != Self
//*============================================================================*

public protocol ANKLargeBinaryIntegerWhereDigitIsNotSelf<Digit>: ANKLargeBinaryInteger { }
