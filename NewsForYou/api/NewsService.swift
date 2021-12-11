import Foundation
import SwiftUI

protocol NetworkProtocol{
    func handleResponse(data: Data?, response: URLResponse?, error: Error?)
}

class NewsService {
    
    var delegate : NetworkProtocol
    
    init(delegate : NetworkProtocol){
        self.delegate = delegate
    }
    
    func getNews(){
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2021-12-04&sortBy=popularity&apiKey=decb98b24f1e44009167622f06690ea8&pageSize=10") else { fatalError("Missing URL") }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: delegate.handleResponse)
        
        dataTask.resume()
    }
}

