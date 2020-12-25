//
//  APIService.swift
//  EndPoint
//
//  Created by David on 12/25/20.
//

import Foundation

let token = "22dcd832a13dfaec475a3ab063140cf9dd504ab1"
let urlStr = "https://api.github.com/users/defunkt?access_token="
let productURL = URL(string: urlStr + token)!

var df: DateFormatter {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return df
}

class APIService {
    
    // MARK: - PROPERTY
    
    let viewContext = PersistenceController.shared.container.viewContext
    private var distapchTimer: DispatchSourceTimer?
    
    // MARK: - FUNCTION
    
    func start() {
        self.distapchTimer = DispatchSource.makeTimerSource()
        self.distapchTimer?.schedule(deadline: .now() + 5, repeating: 5)
        self.distapchTimer?.setEventHandler(handler: {
            self.fetch()
        })
        self.distapchTimer?.resume()
    }
    
    func fetch() {
        let req = URLRequest(url: productURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        URLSession.shared.dataTask(with: req) { [weak self] (data, resp, err) in
            if let data = data {
                DispatchQueue.main.async {
                    let ti = Date().timeIntervalSince1970
                    print("got data timeStamp \(ti)")
                    do {
                        _ = try JSONDecoder().decode(UserModel.self, from: data)
                        self?.save(interval: ti, jsonData: data)
                    } catch let err {
                        print(err.localizedDescription)
                    }
                }
            }
        }.resume()
    }
    
    private func save(interval: TimeInterval, jsonData: Data) {
        let epdata = EPdata(context: viewContext)
        epdata.timeInterval = interval
        epdata.jsonData = jsonData
        
        do {
            try viewContext.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
}
