import XCTest
@testable import NewsForYou

class PasswordValidationTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testPasswordValidationOnValidPasswords() throws {
        let password  = "P@55W1rd"
        
        XCTAssertTrue(isValidPassword(text: password))
    }
    
    func testPasswordValidationFailsOnShortPasswords() throws {
        let password  = "P@55W0r"
        
        XCTAssertFalse(isValidPassword(text: password))
    }
    
    func testPasswordValidationFailsOnNoDigits() throws {
        let password  = "P@ssWord"
        
        XCTAssertFalse(isValidPassword(text: password))
    }
    
    func testPasswordValidationFailsOnNoSpecialCharacters() throws {
        let password  = "Pa55Word"
        
        XCTAssertFalse(isValidPassword(text: password))
    }
    
    func testPasswordValidationFailsOnNoCapitalLetters() throws {
        let password  = "p@55w0rd"
        
        XCTAssertFalse(isValidPassword(text: password))
    }
    
    func testPasswordValidationFailsOnNoLowercaseLetters() throws {
        let password  = "P@55W0RD"
        
        XCTAssertFalse(isValidPassword(text: password))
    }
    
    

    
    
    
    
}
