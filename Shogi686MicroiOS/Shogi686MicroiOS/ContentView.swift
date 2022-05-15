//
//  ContentView.swift
//  Shogi686MicroiOS
//
//  Created by Masatoshi Hidaka on 2022/05/11.
//

import SwiftUI

var _cb: (String) -> Void = {_ in}
func registerCallback(cb: @escaping (String) -> Void) {
    _cb = cb
}
func globalCallback(messagePtr: UnsafePointer<CChar>?) -> Void {
    let messageString = (CFStringCreateWithCString(kCFAllocatorDefault, messagePtr, kCFStringEncodingASCII) ?? "" as CFString) as String
    _cb(messageString)
}

struct ContentView: View {
    @State var usiServerIpAddress = "127.0.0.1"
    @State var usiServerPort = "8090"
    @State var lastMessage = ""

    var body: some View {
        TextField("USI IP", text: $usiServerIpAddress).keyboardType(.asciiCapable).disableAutocorrection(true).frame(width: 200.0, height: 20.0)
        TextField("USI Port", text: $usiServerPort).keyboardType(.asciiCapable).disableAutocorrection(true).frame(width: 200.0, height: 20.0)
        Button(action: {
            let server_ip_nss = usiServerIpAddress as NSString
            let server_ip_ptr = UnsafeMutablePointer<CChar>(mutating: server_ip_nss.utf8String)
            registerCallback(cb: {
                message in DispatchQueue.main.async {
                    self.lastMessage = message
                }
            })
            micro_main(server_ip_ptr, Int32(usiServerPort)!, globalCallback);
        }) {
            Text("RUN")
        }
        Text(lastMessage).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
