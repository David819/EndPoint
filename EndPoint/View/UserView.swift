//
//  UserView.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import SwiftUI

struct UserView: View {
    // MARK: - PROPERTY

    var userModel: UserModel?
    
    // MARK: - BODY
    
    var body: some View {
        ForEach((self.userModel?.get()) ?? [], id: \.self) { one in
            HStack(alignment: .bottom) {
                Text("\(one["key"]!): ")
                    .frame(width: 80, alignment: .leading)
                Text("\(one["value"]!)")
            }
        }
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
