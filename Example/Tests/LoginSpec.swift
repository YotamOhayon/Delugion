import Quick
import Nimble
import Himotoki
@testable import Delugion

class LoginSpec: QuickSpec {
    
    override func spec() {
        
        let networkManager = NetworkManagerMock()
        var delugion: DelugionService!
        
        beforeEach {
            delugion = Delugion(networkManager: networkManager,
                                hostname: "asdf",
                                port: 8112)
        }
        
        describe("login") {
            
            it("fails if no arguments were sent to the server") {
                
                networkManager.file = "LoginNoPassword"
                
                var result: Bool?
                delugion.login(withPassword: "Y6412257") {
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
            
            it("fails if server returns false") {
                
                networkManager.file = "LoginFalse"
                
                var result: Bool?
                delugion.login(withPassword: "Y6412257") {
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
            
            it("returns .valid if server returns result: true") {
                
                networkManager.file = "LoginTrue"
                
                var result: Bool?
                delugion.login(withPassword: "Y6412257") {
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
            
        }
        
    }
    
}
