#pragma once

#include <swift/bridging>
#include "JSContext.h"

#include <JavaScriptCore/JSContextRef.h>

class JSObject;

void _retainJSObject(JSObject* _Nonnull obj);
void _releaseJSObject(JSObject* _Nonnull obj);

// This is exposed to Swift as a struct reference type, so it can't be subclassed. I would like to allow implementation on the Swift side possibly with Macros. 
// How should that work? Could be with a struct in Swift that gets added using generics to C++ side?
// Can this be added as a swiftui view?
class JSObject {
public:
	// Make a new object from context
	JSObject();

    JSObject(const JSContext& context);

protected:
	//JSObjectRef _value = NULL;
	//JSContext _context = NULL;

}; SWIFT_SHARED_REFERENCE(_retainJSObject, _releaseJSObject);
