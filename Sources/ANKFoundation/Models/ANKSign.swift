//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * ANK x Sign
//*============================================================================*

/// The sign of a numeric value.
///
/// Bitwise operations assume that `plus` equals `0` and `minus` equals `1`.
///
@frozen public enum ANKSign: CustomStringConvertible, Equatable {
    
    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=
    
    case plus  // 0x00
    case minus // 0x01
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    /// Creates a new instance from the given bit.
    @_transparent public init(_ bit: Bool) {
        self = unsafeBitCast(bit, to: Self.self)
    }
    
    /// Creates a new instance from the given sign.
    @_transparent public init(_ sign: FloatingPointSign) {
        self = unsafeBitCast(sign, to: Self.self)
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Accessors
    //=------------------------------------------------------------------------=
    
    @inlinable public var description: String {
        self == Self.plus ? "+" : "-"
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    /// Forms the opposite sign.
    ///
    /// Use this method to toggle from `plus` to `minus` or from `minus` to `plus`.
    /// 
    @_transparent public mutating func toggle() {
        self = ~self
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Utilities
    //=------------------------------------------------------------------------=
    
    @_transparent public static func ==(lhs: Self, rhs: Self) -> Bool {
        let lhsBitPattern = unsafeBitCast(lhs, to: Bool.self)
        let rhsBitPattern = unsafeBitCast(rhs, to: Bool.self)
        return lhsBitPattern == rhsBitPattern
    }
}

//=----------------------------------------------------------------------------=
// MARK: + Bitwise
//=----------------------------------------------------------------------------=

extension ANKSign {

    //=------------------------------------------------------------------------=
    // MARK: Transformations
    //=------------------------------------------------------------------------=
    
    /// Returns the opposite sign.
    @_transparent public static prefix func ~(x: Self) -> Self {
        Self(!unsafeBitCast(x, to: Bool.self))
    }
    
    /// Forms `minus` if both signs are `minus`, and `plus` otherwise.
    ///
    ///
    /// ```
    /// plus  & plus  // plus
    /// plus  & minus // plus
    /// minus & plus  // plus
    /// minus & minus // minus
    /// ```
    ///
    @_transparent public static func &=(lhs: inout Self, rhs: Self) {
        lhs = lhs & rhs
    }
    
    /// Returns `minus` if both signs are `minus`, and `plus` otherwise.
    ///
    /// ```
    /// plus  & plus  // plus
    /// plus  & minus // plus
    /// minus & plus  // plus
    /// minus & minus // minus
    /// ```
    ///
    @_transparent public static func &(lhs:  Self, rhs:  Self) -> Self {
        let lhsBitPattern = unsafeBitCast(lhs, to: UInt8.self)
        let rhsBitPattern = unsafeBitCast(rhs, to: UInt8.self)
        return unsafeBitCast(lhsBitPattern & rhsBitPattern, to: Self.self)
    }
    
    /// Forms `minus` if at least one sign is `minus`, and `plus` otherwise.
    ///
    /// ```
    /// plus  | plus  // plus
    /// plus  | minus // minus
    /// minus | plus  // minus
    /// minus | minus // minus
    /// ```
    ///
    @_transparent public static func |=(lhs: inout Self, rhs: Self) {
        lhs = lhs | rhs
    }
    
    /// Returns `minus` if at least one sign is `minus`, and `plus` otherwise.
    ///
    /// ```
    /// plus  | plus  // plus
    /// plus  | minus // minus
    /// minus | plus  // minus
    /// minus | minus // minus
    /// ```
    ///
    @_transparent public static func |(lhs:  Self, rhs:  Self) -> Self {
        let lhsBitPattern = unsafeBitCast(lhs, to: UInt8.self)
        let rhsBitPattern = unsafeBitCast(rhs, to: UInt8.self)
        return unsafeBitCast(lhsBitPattern | rhsBitPattern, to: Self.self)
    }
    
    /// Forms `minus` if exactly one sign is `minus`, and `plus` otherwise.
    ///
    /// ```
    /// plus  ^ plus  // plus
    /// plus  ^ minus // minus
    /// minus ^ plus  // minus
    /// minus ^ minus // plus
    /// ```
    ///
    @_transparent public static func ^=(lhs: inout Self, rhs: Self) {
        lhs = lhs ^ rhs
    }
    
    /// Returns `minus` if exactly one sign is `minus`, and `plus` otherwise.
    ///
    /// ```
    /// plus  ^ plus  // plus
    /// plus  ^ minus // minus
    /// minus ^ plus  // minus
    /// minus ^ minus // plus
    /// ```
    ///
    @_transparent public static func ^(lhs:  Self, rhs:  Self) -> Self {
        let lhsBitPattern = unsafeBitCast(lhs, to: UInt8.self)
        let rhsBitPattern = unsafeBitCast(rhs, to: UInt8.self)
        return unsafeBitCast(lhsBitPattern ^ rhsBitPattern, to: Self.self)
    }
}
