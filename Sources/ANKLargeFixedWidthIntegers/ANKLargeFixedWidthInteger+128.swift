//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * ANK x Int128
//*============================================================================*

@frozen public struct ANKInt128: ANKSignedLargeFixedWidthInteger {
    
    public typealias Magnitude = UInt128
        
    public typealias X64 = (UInt64, UInt64)
    
    public typealias X32 = (UInt32, UInt32, UInt32, UInt32)
    
    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=
    
    @usableFromInline var body: ANKFullWidth<Int64, UInt64>
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    @inlinable init(bitPattern: ANKFullWidth<Int64, UInt64>) {
        self.body = bitPattern
    }
}

//*============================================================================*
// MARK: * ANK x UInt128
//*============================================================================*

@frozen public struct ANKUInt128: ANKUnsignedLargeFixedWidthInteger {
    
    public typealias X64 = (UInt64, UInt64)
    
    public typealias X32 = (UInt32, UInt32, UInt32, UInt32)
    
    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=
    
    @usableFromInline var body: ANKFullWidth<UInt64, UInt64>
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    @inlinable init(bitPattern: ANKFullWidth<UInt64, UInt64>) {
        self.body = bitPattern
    }
}
