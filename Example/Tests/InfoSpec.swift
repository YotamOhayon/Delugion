// https://github.com/Quick/Quick

import Quick
import Nimble
import Himotoki
@testable import Delugion

class InfotSpec: QuickSpec {
    
    override func spec() {
        
        let networkManager = NetworkManagerMock()
        var delugion: DelugionService!
        
        beforeEach {
            delugion = Delugion(networkManager: networkManager,
                                hostname: "asdf",
                                port: 8112)
        }
        
        describe("info") {
            
            it("fails when json cannot be parsed") {
                
                networkManager.file = "InvalidJson"
                
                delugion.updateUI(filterByState: nil) {
                    switch $0 {
                    case .error(_):
                        break
                    case .valid(_):
                        fail("received valid when expected error")
                    }
                }
                
            }
            
            it("returns .notAuthenticated when not calling connect") {
                
                networkManager.file = "NotAuthenticated"
                
                delugion.updateUI(filterByState: nil) {
                    switch $0 {
                    case .error(let error):
                        expect(error).toNot(beNil())
                        break
                    case .valid(_):
                        fail("received valid when expected error")
                    }
                }
                
            }
            
        }
        
    }
    
}
