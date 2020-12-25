//
//  ContentView.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - BODY
    
    var body: some View {
        TabView {
            CurrentDataView()
                .tabItem {
                    VStack {
                        Image(systemName: "doc.plaintext.fill")
                        Text("Current")
                    }
                }
            HistoryListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tray.full.fill")
                        Text("History")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
