import SwiftUI
import Foundation

func isValidPassword(text : String) -> Bool{
    
    let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$"
    let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
    return passwordPred.evaluate(with: text)

}

func isValidEmail(_ email: String) -> Bool {
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

