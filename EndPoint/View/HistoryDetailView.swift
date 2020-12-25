//
//  HistoryDetailView.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import SwiftUI

struct HistoryDetailView: View {
    // MARK: - PROPERTY
    
    private var timeStamp: String
    private var jsonData: Data?
    private var userModel: UserModel?
    
    // MARK: - FUNCTION
    
    init(timeStamp: String, jsonData: Data?) {
        self.timeStamp = timeStamp
        guard let jd = jsonData else {  return }
        self.jsonData = jsonData
        do {
            try userModel = JSONDecoder().decode(UserModel.self, from: jd)
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        List {
            UserView(userModel: self.userModel)
        }
            .navigationBarTitle(Text(timeStamp), displayMode: .inline)
    }
}

//struct HistoryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryDetailView()
//    }
//}
