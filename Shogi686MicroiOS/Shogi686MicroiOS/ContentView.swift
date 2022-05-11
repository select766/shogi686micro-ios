//
//  ContentView.swift
//  Shogi686MicroiOS
//
//  Created by Masatoshi Hidaka on 2022/05/11.
//

import SwiftUI

struct ContentView: View {
    @State var usiServerIpAddress = "127.0.0.1"

    var body: some View {
        TextField("USI IP", text: $usiServerIpAddress).keyboardType(.asciiCapable).disableAutocorrection(true).frame(width: 200.0, height: 20.0)
        Button(action: {
            let server_ip_nss = usiServerIpAddress as NSString
            let server_ip_ptr = UnsafeMutablePointer<CChar>(mutating: server_ip_nss.utf8String)
            micro_main(server_ip_ptr);
        }) {
            Text("RUN")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
