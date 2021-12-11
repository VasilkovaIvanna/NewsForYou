import SwiftUI

struct NewsMainView : View {
    
    @ObservedObject var viewModel = NewsViewModel()
        
    var body: some View {
        VStack(){
            Text("News for You")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 5)
            Divider()
                .padding(.bottom)
            
            if viewModel.isLoading {
                ProgressView().navigationBarBackButtonHidden(true)
            }
            
            NewsList(newsList: viewModel.filterArticles())
            
        }.onLoad {
            viewModel.requestNews()
        }
        .searchable(text: $viewModel.searchText)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
