//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * Pnt
//*============================================================================*

@frozen @usableFromInline struct Pnt<Integer: OBEFixedWidthInteger>: OBEFixedWidthIntegerPointer {

    //=------------------------------------------------------------------------=
    // MARK: State
    //=------------------------------------------------------------------------=
    
    @usableFromInline let _base: UnsafePointer<UInt>
    
    //=------------------------------------------------------------------------=
    // MARK: Initializers
    //=------------------------------------------------------------------------=
    
    @inlinable init(_ INTEGER: UnsafePointer<Integer>) {
        self._base = UnsafeRawPointer(INTEGER).assumingMemoryBound(to: UInt.self)
    }
    
    //=------------------------------------------------------------------------=
    // MARK: Accessors
    //=------------------------------------------------------------------------=
    
    @usableFromInline subscript(index: Int) -> UInt {
        @_transparent _read {
            precondition(indices.contains(index))
            yield _base[index]
        }
    }
}
