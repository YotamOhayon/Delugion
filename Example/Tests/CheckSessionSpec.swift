//
//  CheckSessionSpec.swift
//  Delugion_Tests
//
//  Created by Yotam Ohayon on 18/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Himotoki
@testable import Delugion

class CheckSessionSpec: QuickSpec {
    
    override func spec() {
        
        let networkManager = NetworkManagerMock()
        var delugion: DelugionService!
        
        beforeEach {
            delugion = Delugion(networkManager: networkManager,
                                hostname: "hostname",
                                port: 8112)
        }
        
        describe("checkSession") {
            
            it("returns the false when needed") {
                
                networkManager.file = "CheckSessionResultFalse"
                
                var result: Bool?
                delugion.checkSession {
                    switch $0 {
                    case .error(_):
                        result = false
                    case .valid(let r):
                        result = r
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result) == false
                
            }
            
            it("returns the true when needed") {
                
                networkManager.file = "CheckSessionResultTrue"
                
                var result: Bool?
                delugion.checkSession {
                    switch $0 {
                    case .error(_):
                        result = false
                    case .valid(let r):
                        result = r
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result) == true
                
            }
            
        }
        
    }
    
}
