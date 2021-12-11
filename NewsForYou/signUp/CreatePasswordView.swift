import Foundation
import SwiftUI

struct PasswordView : View {
    
    @State var password : String = ""
    
    @State var tag : Int?
    
    @State var showAlert : Bool = false
    
    var body: some View {
            VStack{
                Text("Welcome to NewsForYou")
                    .font(.title)
                    .padding(.bottom, 15)
                Text("Please, create your password to sign up to the app.")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.body)
                
                TextField("Create password...", text: $password)
                    .padding()
                    .frame(height: 50, alignment: .center)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.vertical)
                
                Button("Get all actual news"){
                    if (isValidPassword(text: password) && password.count > 5) {
                        
                        tag = 1
                        
                    } else {
                        showAlert = true
                    }
                }
                
                .foregroundColor(.black)
                .padding()
                .frame(width: 250, height: 50, alignment: .center)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                
                NavigationLink("", destination: NewsMainView(), tag: 1, selection: $tag)
                
            }.padding()
                .alert(isPresented: $showAlert ,
                       content: {
                    Alert(title: Text("Tvoe Moe"),
                          message: Text("Your password contains wrong symbols. \nMake sure your password consists of only letters and numbers."),
                          dismissButton: .default(Text("OK")))})
        }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
