//import JavaScriptCore
import SwiftJSC

let a = 17
let b = 25

let (result, code) = #stringify(a + b)

print("The value \(result) was produced by the code \"\(code)\"")

/*
let context = JSContext()
let sumValue = context?.evaluateScript("1 + 2 + 3")
if let sum = sumValue?.toInt32() {
    print("\(sum)")
}
*/
//JavaScript.JS