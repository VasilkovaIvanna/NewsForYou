import XCTest
@testable import NewsForYou

class NewsResponseTests: XCTestCase {
    
    let nsm = NewsViewModel()

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testOnRecievedEmptyData() throws {
        nsm.handleResponse(data: Data(), response: nil, error: nil)
    }
    
    func testOnRecievedBadStatus() throws {
        
        let response = HTTPURLResponse(url: URL(string: "localhost")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        nsm.handleResponse(data: nil, response: response, error: nil)
    }
    
    func testOnRecievedExtraFields() throws {
        
        let json = ["source": ["id": "", "name" : ""],
                    "title" : "",
                    "author": "",
                    "description": "",
                    "url": "",
                    "urlToImage": "",
                    "publishedAt": "",
                    "content" : "",
                    "extraField" : ""] as [String : Any]
        
        let encodedJson = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        
        let response = HTTPURLResponse(url: URL(string: "localhost")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        nsm.handleResponse(data: encodedJson, response: response, error: nil)
    }
    
    
    func testOnRecievedResponseWithoutOptionalFields() throws {
                
        let json = ["source": ["id": "", "name" : ""],
                    "title" : "",
                    "author": "",
                    "description": "",
                    "url": "",
                    "content" : ""] as [String : Any]
        
        let encodedJson = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        
        let response = HTTPURLResponse(url: URL(string: "localhost")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        nsm.handleResponse(data: encodedJson, response: response, error: nil)
    }

    
    func testOnRecievedResponseWithoutRequeredFields() throws {
                
        let json = ["source": ["id": "", "name" : ""],
                    "author": "",
                    "description": "",
                    "url": "",
                    "urlToImage": "",
                    "publishedAt": "",
                    "content" : ""] as [String : Any]
        
        let encodedJson = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        
        let response = HTTPURLResponse(url: URL(string: "localhost")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        nsm.handleResponse(data: encodedJson, response: response, error: nil)
    }

}
