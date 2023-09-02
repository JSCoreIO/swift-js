/*
 *  Some or all of the documentation comments contained in this source 
 *  file is copied from the WebKit project and is thus provided under 
 *  the following copyright and terms:
 *
 *  Copyright (C) 2013 Apple Inc. All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *  THIS SOFTWARE IS PROVIDED BY APPLE INC. ``AS IS'' AND ANY
 *  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *  PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL APPLE INC. OR
 *  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 *  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 *  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

import JavaScriptCore

// public struct JSValue {
//     public let context: JSContext
//     public let ref: JavaScriptCore.JSValueRef

//     public init(context: JSContext, ref: JavaScriptCore.JSValueRef) {
//         self.context = context
//         self.ref = ref
//     }

//     /// Converts a JavaScript value to object and returns the resulting object.
//     @inlinable public func toObject() throws -> JSValue { 
//         var exception: JavaScriptCore.JSValueRef?
//         let obj = JSValueToObject(context.ref, ref, &exception)!
//         if let exception {
//             throw JSError(JSValue(context: context, ref: exception))
//         }
//         return JSValue(context: context, ref: obj)
//     }

//     // TODO: Other conversion functions.

//     /// Protects a JavaScript value from garbage collection.
//     ///
//     /// Use this method when you want to store a ``JSValue`` in a global or on the heap, where the garbage collector will not be able to discover your reference to it.
//     /// 
//     /// A value may be protected multiple times and must be unprotected an equal number of times before becoming eligible for garbage collection.
//     @inlinable public func protect() { JSValueProtect(context.ref, ref) }

//     /// Unprotects a JavaScript value from garbage collection.
//     /// 
//     /// A value may be protected multiple times and must be unprotected an equal number of times before becoming eligible for garbage collection.
//     @inlinable public func unprotect() { JSValueUnprotect(context.ref, ref) }

//     /// `true` if the type of value is the undefined type, otherwise `false`.
//     @inlinable public var isUndefined: Bool { JSValueIsUndefined(context.ref, ref) }

//     /// `true` if the type of value is the null type, otherwise `false`.
//     @inlinable public var isNull: Bool { JSValueIsNull(context.ref, ref) }

//     /// `true` if value is a Boolean, otherwise `false`.
//     @inlinable public var isBoolean: Bool { JSValueIsBoolean(context.ref, ref) }
    
//     /// `true` if the type of value is the number type, otherwise `false`.
//     @inlinable public var isNumber: Bool { JSValueIsNumber(context.ref, ref) }

//     /// `true` if the type of value is the string type, otherwise `false`.
//     @inlinable public var isString: Bool { JSValueIsString(context.ref, ref) }

//     /// `true` if the type of value is the symbol type, otherwise `false`.
//     @inlinable public var isSymbol: Bool { JSValueIsSymbol(context.ref, ref) }

//     /// `true` if the type of value is the object type, otherwise `false`.
//     @inlinable public var isObject: Bool { JSValueIsObject(context.ref, ref) }

//     /// Tests whether a JavaScript value is an object with a specified class in its class chain.
//     /// 
//     /// - parameter type: The ``JSClass`` to test against.
//     /// - returns: `true` if value is an object and has `type` in its class chain, otherwise `false`.
//     @inlinable public func isObject(ofType type: JSClass) -> Bool {
//         JSValueIsObjectOfClass(context.ref, ref, type.ref)
//     }

//     /// `true` if value is an array, otherwise `false`.
//     @inlinable public var isArray: Bool { JSValueIsArray(context.ref, ref) }

//     /// `true` if value is a date, otherwise `false`.
//     @inlinable public var isDate: Bool { JSValueIsDate(context.ref, ref) }

//     // TODO: JSValueGetTypedArrayType

// }

// /// The type of a ``JSValue``.
// public enum JSType: UInt32 {
//     /// A JavaScript `undefined` value.
//     case undefined = 0 // kJSTypeUndefined
//     /// A JavaScript `null` value.
//     case null = 1 // kJSTypeNull
//     /// A JavaScript `bool` value.
//     case boolean = 2 // kJSTypeBoolean
//     /// A JavaScript `number` value.
//     case number = 3 // kJSTypeNumber
//     /// A JavaScript `string` value.
//     case string = 4 // kJSTypeString
//     /// A JavaScript `object` value.
//     case object = 5 // kJSTypeObject
//     /// A JavaScript `symbol` value.
//     case symbol = 6 // kJSTypeSymbol
// }

// /// The type of a JavaScript typed array.
// public enum JSTypedArrayType: UInt32 {
//     case i8 = 0 // kJSTypedArrayTypeInt8Array
//     case i16 = 1 // kJSTypedArrayTypeInt16Array
//     case i32 = 2 // kJSTypedArrayTypeInt32Array
//     case u8 = 3 // kJSTypedArrayTypeUint8Array
//     case u8Clamped = 4 // kJSTypedArrayTypeUint8ClampedArray
//     case u16 = 5 // kJSTypedArrayTypeUint16Array
//     case u32 = 6 // kJSTypedArrayTypeUint32Array
//     case f32 = 7 // kJSTypedArrayTypeFloat32Array
//     case f64 = 8 // kJSTypedArrayTypeFloat64Array
//     case buffer = 9 // kJSTypedArrayTypeArrayBuffer
//     case none = 10 // kJSTypedArrayTypeNone           // TODO: What is this? Empty?
//     case i64 = 11 // kJSTypedArrayTypeBigInt64Array
//     case u64 = 12 // kJSTypedArrayTypeBigUint64Array
// }

// /// Tests whether two values are equal, as compared by the JavaScript `==` operator.
// /// 
// /// - parameter lhs: The first value to test.
// /// - parameter rhs: The second value to test.
// /// - returns: `true` if the two values are equal, `false` if they are not equal.
// @inlinable public func ==(lhs: JSValue, rhs: JSValue) throws -> Bool {
//     var exception: JavaScriptCore.JSValueRef?
//     let result = JSValueIsEqual(lhs.context.ref, lhs.ref, rhs.ref, &exception)
//     if let exception {
//         throw JSError(JSValue(context: lhs.context, ref: exception))
//     }
//     return result
// }

// /// Tests whether two values are strict equal, as compared by the JavaScript `===` operator.
// ///
// /// - parameter lhs: The first value to test.
// /// - parameter rhs: The second value to test.
// /// - returns: `true` if the two values are strict equal, `false` if they are not equal.
// @inlinable public func ===(lhs: JSValue, rhs: JSValue) -> Bool {
//     JSValueIsStrictEqual(lhs.context.ref, lhs.ref, rhs.ref)
// }

// // TODO: Move this
// public struct JSError: Error {
//     public let value: JSValue
//     public init(_ value: JSValue) {
//         self.value = value    
//     }
// }
