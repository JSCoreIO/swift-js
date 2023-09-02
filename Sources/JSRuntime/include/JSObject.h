#pragma once

#include <swift/bridging>
#include "JSContext.h"

#include <JavaScriptCore/JSContextRef.h>

class JSObject;

void _retainJSObject(JSObject* _Nonnull obj);
void _releaseJSObject(JSObject* _Nonnull obj);

class JSObject {
public:
	// Make a new object from context
	JSObject();

    JSObject(const JSContext& context);

protected:
	//JSObjectRef _value = NULL;
	//JSContext _context = NULL;

}; SWIFT_SHARED_REFERENCE(_retainJSObject, _releaseJSObject);
