//
//  LoginView.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 07/01/26.
//

import SwiftUI

struct LoginView: View {

  
  @State private var tfEmail: String = ""
  @State private var tfPassword: String = ""
  
  @State private var isNavigateForgotPassword: Bool = false
  @State private var isNavigateSignUpView: Bool = false
   @State private var isNavigateToHomeTab: Bool = false
  @StateObject private var loginViewModel = LoginViewModel()
   @State private var selectedTab: Tab = .home
   @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
  
  var body: some View {
     NavigationStack {
        ZStack {
           Color("AppLavender")
              .ignoresSafeArea()
           VStack(spacing: 0) {
              HeaderView
              loginCardView

           }
        }
        .navigationDestination(isPresented: $isNavigateForgotPassword) {
           ForgotPasswordView()
        }
        .navigationDestination(isPresented: $isNavigateSignUpView, destination: {
           SignUpView()
        })
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
     }

      
      .ignoresSafeArea()


    
  }
  
  
  //MARK: Header View
  private var HeaderView: some View {
    VStack(spacing: 12) {
      Image("login-logo-icon")
        .resizable()
        .renderingMode(.template)   // 🔑 
        .foregroundColor(.white) 
        .scaledToFit()
        .frame(width: 60)
        
      
      Text("Login")
        .padding(.leading, 2)
        .padding(.trailing, 2)
        .font(AppFont.title)
        .bold()
        .foregroundColor(.black)
      
      Text("Enter your details")
        .padding(.leading, 5)
        .padding(.trailing, 5)
        .font(AppFont.heading)
        .foregroundColor(.black)
    }
    .padding(.top, 90)
    .padding(.bottom, 40)
  }
  
  
  private var loginCardView: some View {
    GeometryReader { geo in
      ScrollView(showsIndicators: false) {
        VStack(spacing: 20) {
          FormFieldView(title: "Email", placeholder: "Enter email address", text: $tfEmail)
          SecureFormFieldView(title: "Password", placeholder: "Enter password", text: $tfPassword)
          forgotPasswordView
          loginButtonView
          dividerView
          socialLoginView
          bottomTextView
        }
        .padding(.top, 50)
        .padding(.horizontal)
        .padding(.bottom)
        .frame(minHeight: geo.size.height, alignment: .top)
      }
      .background(Color.white)
      .cornerRadius(32, corners: [.topLeft, .topRight])
    }
  }
  
  private var emailFieldView: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Email")
        .font(.subheadline)
        .foregroundColor(Color("AppBlack"))
      
      TextField("Enter Email Address", text: $tfEmail)
          
        .foregroundColor(Color("AppBlack"))
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
  }
  
  private var forgotPasswordView: some View {
    VStack(alignment: .leading, spacing: 10) {

      HStack {
        Spacer(minLength: 5)
        Button("Forgot Password?") {
          isNavigateForgotPassword = true
        }
        .font(AppFont.caption)
        .foregroundColor(Color("AppVoilet"))

      }
    }
  }
  
  private var loginButtonView: some View {
    GeometryReader { geo in
      Button(action: {
        
        if checkValidation().count > 0 {
          AlertManager.shared.show(title: "Alert", message: checkValidation())
        } else {
          let loginRequest = LoginRequest(identifier: tfEmail, password: tfPassword)
          dPrint("loginRequest = \(loginRequest)")
          loginViewModel.userResponseDelegate = self
          Task {
            await loginViewModel.loginRequest(params: loginRequest)
          }
        }
        
      }) {
        Text("Login")
          .foregroundColor(.white)
          .font(.headline)
          .frame(width: geo.size.width, height: 52)
          .background(Color("AppVoilet"))
          .cornerRadius(26)
      }
    }
    .frame(height: 52) // 👈 REQUIRED

  }
  
  
  private var dividerView: some View {
    HStack{
      Rectangle().frame(height: 1.0).foregroundColor(.gray.opacity(0.5))
      Text("OR")
      Rectangle().frame(height: 1.0).foregroundColor(.gray.opacity(0.5))
    }
  }
  
  private var socialLoginView: some View {
    HStack(spacing: 20) {
      socialButton(imageName: "icn_google_login") { 
        //google login action
      }
      socialButton(imageName: "icn_facebook_login") { 
        //google login action
      }
      socialButton(imageName: "icn_apple_login") { 
        //google login action
      }
    }
  }
  
  private func socialButton(
    imageName: String,
    action: @escaping () -> Void
  ) -> some View {
    
    Button(action: action) {
      Image(imageName)
        .resizable()
        .scaledToFit()
        .frame(width: 28, height: 28)
        .padding()
        .frame(width: 100, height: 70)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
    }
  }
  
  private var bottomTextView: some View {
    HStack(spacing: 6) {
      Text("New User?")
        .font(.subheadline)
        .foregroundColor(Color("AppText"))
      Button { 
        
      } label: { 
         Button("SignUp") {
            isNavigateSignUpView = true
         }
         .font(.footnote)
         .foregroundColor(Color("AppVoilet"))
      }

    }
    .foregroundColor(Color("AppVoilet"))  }
  
  
  private func checkValidation() -> String {
    var strMsg: String = ""
    if tfEmail.count == 0 {
      strMsg = "Please enter email address"
    } else if !tfEmail.contains("@") {
      strMsg = "Please enter valid email address"
    } else if tfPassword.count == 0 {
      strMsg = "Please enter the password"
    } else if tfPassword.count < 6 {
      strMsg = "Password must be at least 6 characters"
    }
    
    return strMsg
  }
}

extension LoginView: UserCreationDelegate {
  func fetchUserData(user: UserCreationDataResponse) {
    print("fetchUserData user = \(user.user)")

     isLoggedIn = true

     DispatchQueue.main.async {
        self.isNavigateToHomeTab = true
     }
  }
}





struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    return Path(path.cgPath)
  }
}

extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}



struct LoginView_Previews: PreviewProvider {
   static var previews: some View {
      LoginView()
   }
}

