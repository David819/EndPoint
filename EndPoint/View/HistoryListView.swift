//
//  HistoryListView.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import SwiftUI

struct HistoryListView: View {
    
    // MARK: - PROPERTY
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: EPdata.entity(), sortDescriptors: [NSSortDescriptor(key: "timeInterval", ascending: false)]) var records: FetchedResults<EPdata>
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(records) { rcd in
                    NavigationLink(destination: HistoryDetailView(timeStamp: rcd.wrappedTimeInterval, jsonData: rcd.wrappedJSONData)) {
                        Text(rcd.wrappedTimeInterval)
                    }
                }
            }
                .navigationBarTitle(Text("History"), displayMode: .inline)
        }
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView()
    }
}
