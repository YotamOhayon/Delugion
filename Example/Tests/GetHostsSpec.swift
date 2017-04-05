//
//  GetHostsSpec.swift
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

class GetHostsSpec: QuickSpec {
    
    override func spec() {
        
        let networkManager = NetworkManagerMock()
        var delugion: DelugionService!
        
        beforeEach {
            delugion = Delugion(networkManager: networkManager,
                                hostname: "asdf",
                                port: 8112)
        }
        
        describe("getHosts") {
            
            it("returns an error when not authenticated") {
                
                networkManager.file = "NotAuthenticated"
                
                var result: Bool?
                delugion.getHosts {
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
                
                networkManager.file = "GetHostsValidHost"
                
                var result: [Host]?
                delugion.getHosts {
                    switch $0 {
                    case .error(_):
                        fail("returned an error")
                    case .valid(let array):
                        result = array
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result?.count) == 1
                guard let host = result?.first else {
                    fail()
                    return
                }
                expect(host.hash) == "9d7827e0d8c5146a5618ec253944d9d38a3f8f40"
                expect(host.hostname) == "127.0.0.1"
                expect(host.port) == 58846
                expect(host.status) == "Offline"
                expect(host.version).to(beNil())
                
            }
            
            it("returns a correctly parsed array of two hosts") {
                
                networkManager.file = "GetHostsTwoValidHosts"
                
                var result: [Host]?
                delugion.getHosts {
                    switch $0 {
                    case .error(_):
                        fail("returned an error")
                    case .valid(let array):
                        result = array
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result?.count) == 2
                guard let firstHost = result?.first else {
                    fail()
                    return
                }
                expect(firstHost.hash) == "9d7827e0d8c5146a5618ec253944d9d38a3f8f40"
                expect(firstHost.hostname) == "127.0.0.1"
                expect(firstHost.port) == 58846
                expect(firstHost.status) == "Offline"
                expect(firstHost.version).to(beNil())
                
                guard let secondHost = result?.last else {
                    fail()
                    return
                }
                expect(secondHost.hash) == "snb23lkjsdvlkj2349sdhjksdln234sdfsdwmnfc"
                expect(secondHost.hostname) == "10.0.0.1"
                expect(secondHost.port) == 58846
                expect(secondHost.status) == "Online"
                expect(secondHost.version).to(beNil())
                
            }
            
        }
        
    }
    
}
