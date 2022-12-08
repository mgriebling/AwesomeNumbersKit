//=----------------------------------------------------------------------------=
// This source file is part of the AwesomeNumbersKit open source project.
//
// Copyright (c) 2022 Oscar Byström Ericsson
// Licensed under Apache License, Version 2.0
//
// See http://www.apache.org/licenses/LICENSE-2.0 for license information.
//=----------------------------------------------------------------------------=

//*============================================================================*
// MARK: * Miscellaneous
//*============================================================================*

extension UInt {
    
    //=------------------------------------------------------------------------=
    // MARK: Accessors
    //=------------------------------------------------------------------------=
        
    @inlinable var mostSignificantBit: Bool {
        self & 1 << (bitWidth - 1) != 0
    }
    
    @inlinable var leastSignificantBit: Bool {
        self & 1 != 0
    }
}
