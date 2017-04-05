//
//  ConnectedSpec.swift
//  Delugion_Tests
//
//  Created by Yotam Ohayon on 20/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Himotoki
@testable import Delugion

class ConnectedSpec: QuickSpec {
    
    override func spec() {
        
        let networkManager = NetworkManagerMock()
        var delugion: DelugionService!
        
        beforeEach {
            delugion = Delugion(networkManager: networkManager,
                                hostname: "asdf",
                                port: 8112)
        }
        
        describe("connected") {
            
            it("fails if connected returns true") {
                
                networkManager.file = "ConnectedTrue"
                
                var result: Bool?
                delugion.connected {
                    switch $0 {
                    case .error(_):
                        result = false
                    case .valid(let isValid):
                        result = isValid
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result) == true
                
            }
            
            it("fails if connected returns false") {
                
                networkManager.file = "ConnectedFalse"
                
                var result: Bool?
                delugion.connected {
                    switch $0 {
                    case .error(_):
                        result = false
                    case .valid(let isValid):
                        result = isValid
                    }
                }
                expect(result).toEventuallyNot(beNil())
                expect(result) == false
                
            }
            
        }
        
    }
    
}
