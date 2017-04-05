//
//  GetHostStatusSpec.swift
//  Delugion_Tests
//
//  Created by Yotam Ohayon on 19/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Himotoki
@testable import Delugion

class GetHostStatusSpec: QuickSpec {
    
    override func spec() {
        
        let networkManager = NetworkManagerMock()
        var delugion: DelugionService!
        
        beforeEach {
            delugion = Delugion(networkManager: networkManager,
                                hostname: "asdf",
                                port: 8112)
        }
        
        describe("getHostStatus") {
            
            it("returns an error when not authenticated") {
                
                networkManager.file = "NotAuthenticated"
                
                var result: Bool?
                delugion.getHostStatus(hash: "") {
                    switch $0 {
                    case .error(_):
                        result = false
                    case .valid(_):
                        result = true
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result) == false
                
            }
            
            it("returns a correctly parsed host") {
                
                networkManager.file = "GetHostStatusValidHost"
                
                var result: Host?
                delugion.getHostStatus(hash: "asdfasdfsdaf") {
                    switch $0 {
                    case .error(_):
                        fail("returned an error")
                    case .valid(let host):
                        result = host
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result?.hash) == "9d7827e0d8c5146a5618ec253944d9d38a3f8f40"
                expect(result?.hostname) == "127.0.0.1"
                expect(result?.port) == 58846
                expect(result?.status) == "Connected"
                expect(result?.version) == "1.3.12"
                
            }
            
        }
        
    }
    
}
