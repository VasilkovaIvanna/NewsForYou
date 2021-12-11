import Foundation

class NewsViewModel : NetworkProtocol, ObservableObject{
    
    @Published var storedArticles : [Articles] = []
    
    @Published var isLoading : Bool = false
    
    @Published var searchText: String = ""
    
    var service : NewsService!
    
    init(){
        service = NewsService(delegate: self)
    }
    
    func filterArticles() -> [Articles] {
        
        if self.searchText.isEmpty {
            return self.storedArticles
        } else {
            return self.storedArticles.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
        }
        
    }
    
    func onRecievedArticles(articles: [Articles]) {
        
        DispatchQueue.main.async {
            
            self.isLoading = false
            
            self.storedArticles = articles
                        
        }
    }
    
    
    func requestNews(){
        self.isLoading = true
        service.getNews()
    }
    
    func handleError(error: Error) {}
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?) {
        
        if error != nil {
            return
        }
        
        guard let response1 = response as? HTTPURLResponse else { return }
        
        if response1.statusCode == 200 {
            guard let data = data else { return }
            do {
                let decodedNews = try JSONDecoder().decode(NewsResponse.self, from: data)
                let news = decodedNews
                if let articles = news.articles {
                    onRecievedArticles(articles: articles)
                }
            }
            catch {
                self.handleError(error: error)
                return
            }
        }
    }
}
