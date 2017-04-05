//
//  NetworkManagerMock.swift
//  Delugion
//
//  Created by Yotam Ohayon on 16/04/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
@testable import Delugion

class NetworkManagerMock: SendsRequests {
    
    var file: String?
    
    var timeoutIntervalForRequest: TimeInterval {
        get { return 5 }
        set { return }
    }
    
    func sendRequest(command: DelugeCommand,
                     completion: @escaping ([String: Any]?) -> Swift.Void) {
        
        guard let file = self.file else {
            return
        }
        
        let jsonData = json(from: file) as? [String: Any]
        completion(jsonData)
        
    }
    
}

fileprivate extension NetworkManagerMock {
    
    func json(from path: String) -> Any? {
        
        let bundle = Bundle(for: type(of: self))
        guard let filePath = bundle.path(forResource: path, ofType: "json"),
            let data = NSData(contentsOfFile: filePath),
            let json = try? JSONSerialization.jsonObject(with: data as Data,
                                                         options: JSONSerialization.ReadingOptions.allowFragments)
            else {
                return nil
        }
        
        return json
        
    }
    
}
