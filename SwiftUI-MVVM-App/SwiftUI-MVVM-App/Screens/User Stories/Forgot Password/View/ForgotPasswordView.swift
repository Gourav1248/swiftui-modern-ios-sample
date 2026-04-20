//
//  ForgotPasswordView.swift
//  Squilio-iOS
//
//  Created by Gourav Joshi on 03/02/26.
//

import SwiftUI

struct ForgotPasswordView: View {
  
  @State private var tfEmail: String = ""
  @StateObject private var forgotViewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
  @State private var isNavigateBack: Bool = false
    var body: some View {
      
      ZStack {
        Color("AppVoilet")
          .ignoresSafeArea()
        VStack {
          NavigationBarView
          TopView
          Spacer().frame(height: 25)
          ForgotPasswordCardView
          Spacer()
        }
      }
      .navigationDestination(isPresented: $isNavigateBack) {
        LoginView()
      }
      .navigationBarBackButtonHidden(true)
    }
  
  
  var TopView: some View {
    VStack {
      Spacer().frame(height: 50)
      Image("lock-icon")
        .frame(width: 50, height: 50)
      Spacer().frame(height: 20)
      Text("Forgot your password?")
        .padding(.horizontal)
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.white)
      Spacer().frame(height: 15)
      Text("No worries — we’ve got your tail. Enter your email to get a reset code")
        .font(.footnote)
        
        .padding(.horizontal)
        .foregroundColor(.white)
    }
    .padding(.bottom, 25)
  }
  
  var ForgotPasswordCardView: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 32)
        .fill(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 4)
      
      VStack(spacing: 2) {
        emailFieldView
        Spacer()
        btnForgotPasswordView
        bottomView
      }
      .padding(.top, 50)
      .padding(.horizontal)
    }
    .ignoresSafeArea()
  }
  
  var NavigationBarView: some View {
    HStack {
      BackButton()
        Text("Forgot Password")
          .foregroundColor(.white)
          .fontWeight(.bold)
          .font(.headline)
      Spacer()
      
    }
    .padding()
  }
  
  
  private var emailFieldView: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Email")
        .font(.subheadline)
      
      TextField("Enter Email Address", text: $tfEmail)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
  }
  
  private var btnForgotPasswordView: some View {
      Button(action: { 
        if checkValidation().count > 0 {
          AlertManager.shared.show(title: "Alert", message: checkValidation())
        } else {
          let request = ForgotPasswordRequest(email: tfEmail)
          forgotViewModel.forgotPasswordDelegate = self
          Task {
            await forgotViewModel.forgotPasswordRequest(requestParams: request)
          }
          
        }
      }
      ) {
        Text("Forgot Password")
          .foregroundColor(.white)
          .frame(maxWidth: .infinity, maxHeight: 52)
          .background(Color("AppVoilet"))
          .cornerRadius(26)
      }    
  }
  
  private var bottomView: some View {
    HStack {
      Text("Still Stuck?")
        .font(.footnote)
        .foregroundColor(Color("AppDarkGrey"))
      Button { 
        
      } label: { 
        Text("Contact Support")
          .foregroundColor(Color("AppVoilet"))
          .font(.footnote)
      }
    }
    .padding(.top, 30)
    .padding(.bottom, 20)
  }
  
  func checkValidation() -> String {
    var strMsg = ""
    if tfEmail.count == 0 {
      strMsg = "Please enter email address"
    } else if !tfEmail.contains("@") {
      strMsg = "Please enter valid email address"
    }
    return strMsg
  }
}

extension ForgotPasswordView: ForgotPasswordProtocol {
  func didUpdateForgotPasswordResponse(response: ForgotPasswordResponse) {
    AlertManager.shared.show(title: "Alert", message: "Password request sent")
    isNavigateBack = true
  }
}

