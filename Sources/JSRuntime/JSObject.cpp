#include "include/JSObject.h"

#include <JavaScriptCore/JSContextRef.h>
#include <JavaScriptCore/JSStringRef.h>
#include <JavaScriptCore/JSObjectRef.h>

#include <stdexcept>
#include <cassert>

JSObject::JSObject() {} // : _value(NULL), _context(NULL) {}

JSObject::JSObject(const JSContext& context) {}

void _retainJSObject(JSObject * _Nonnull obj) {
    // TODO
}

void _releaseJSObject(JSObject * _Nonnull obj) {
    // TODO
}
