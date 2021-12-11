import SwiftUI
import Foundation


struct LaunchView : View {
    
    @State var email : String = ""
    
    @State var tag : Int?
    
    @State var showAlert : Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Welcome to NewsForYou")
                    .font(.title)
                    .padding(.bottom, 15)
                Text("Please, enter your email to sign up to the app.")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.body)
                
                TextField("Enter email...", text: $email)
                    .padding()
                    .frame(height: 50, alignment: .center)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.vertical)
                
                Button("Continue") {
                    if isValidEmail(email) {
                        
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
                
                NavigationLink("", destination: PasswordView(), tag: 1, selection: $tag)
                
            }.padding()
                .alert(isPresented: $showAlert ,
                       content: {
                    Alert(title: Text("Tvoe Moe"),
                          message: Text("Your e-mail is invalid. Please, make sure it’s correct."),
                          dismissButton: .default(Text("OK")))})
        }
    }
}


