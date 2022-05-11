//
//  ContentView.swift
//  Shogi686MicroiOS
//
//  Created by Masatoshi Hidaka on 2022/05/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            micro_main();
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
