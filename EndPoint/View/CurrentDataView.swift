//
//  CurrentDataView.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import SwiftUI
import CoreData

struct CurrentDataView: View {
    
    // MARK: - PROPERTY
    
    private var apiService = APIService()
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: EPdata.entity(), sortDescriptors: [NSSortDescriptor(key: "timeInterval", ascending: false)]) var records: FetchedResults<EPdata>
    
    var lastData: (timeStamp: String, user: UserModel?) {
        guard records.isEmpty == false, let jsonData = records.first!.jsonData else {
            return ("no history data, fetch data in 5s", nil)
        }
        do {
            let user = try JSONDecoder().decode(UserModel.self, from: jsonData)
            return (records.first!.wrappedTimeInterval, user)
        } catch let err {
            print(err.localizedDescription)
            return ("no history data, fetch data in 5s", nil)
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                Text(lastData.timeStamp)
                    .listRowBackground(Color(.systemGray2))
                UserView(userModel: lastData.user)
            }
            .navigationBarTitle(Text("/users/defunkt"), displayMode: .inline)
        }
        .onAppear {
            apiService.start()
        }
    }
}

struct CurrentDataView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDataView()
    }
}
