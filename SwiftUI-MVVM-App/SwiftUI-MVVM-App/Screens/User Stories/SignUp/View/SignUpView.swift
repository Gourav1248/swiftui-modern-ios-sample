import SwiftUI

struct SignUpView: View {

   @StateObject private var viewModel = SignUpViewModel()
   @State private var tfGivenName: String = ""
   @State private var tfFamilyName: String = ""
   @State private var tfEmail: String = ""
   @State private var tfPhoneNo: String = ""
   @State private var tfPassword: String = ""
   @State private var tfConfirmPassword: String = ""
   @State private var isAgree: Bool = Bool()

   var body: some View {

      ScrollView {

         VStack(alignment: .leading, spacing: 20) {

            Text("Create Account")
               .font(.system(size: 28, weight: .bold))
               .foregroundColor(Color("AppVoilet"))
               .padding(.bottom, 10)

            // Given Name
            FormFieldView(
               title: "Given Name",
               placeholder: "Enter given name",
               text: $tfGivenName
            )

            // Family Name
            FormFieldView(
               title: "Family Name",
               placeholder: "Enter family name",
               text: $tfFamilyName
            )

            // Email
            FormFieldView(
               title: "Email Address",
               placeholder: "Enter email",
               text: $tfEmail
            )

            // Phone
            FormFieldView(
               title: "Phone Number",
               placeholder: "Enter phone number",
               text: $tfPhoneNo
            )

            // Password
            SecureFormFieldView(
               title: "Password",
               placeholder: "Enter password",
               text: $tfPassword
            )

            // Confirm Password
            SecureFormFieldView(
               title: "Confirm Password",
               placeholder: "Re-enter password",
               text: $tfConfirmPassword
            )

            // Terms Checkbox
            HStack(spacing: 10) {

               Button {
                  if !isAgree {
                     isAgree = true
                  } else {
                     isAgree = false
                  }


               } label: {

                  Image(systemName: isAgree ? "checkmark.square.fill" : "square")
                     .font(.system(size: 20))
                     .foregroundColor(.blue)
               }

               Text("I agree to Terms & Conditions")
                  .font(.system(size: 14))
                  .foregroundColor(Color("AppVoilet"))

               Spacer()
            }
            .padding(.top, 10)

            // Signup Button
            Button {


               if checkValidations().count > 0 {
                  AlertManager.shared.show(title: "Alert", message: checkValidations())
               } else {
                  let request = SignUpRequestParams(username: tfGivenName + " " + tfFamilyName, email: tfEmail, password: tfPassword, phoneNumber: tfPhoneNo, givenName: tfGivenName, familyName: tfFamilyName)
                  Task {
                     await viewModel.userCreationRequest(params: request)
                  }
               }

            } label: {

               Text("Sign Up")
                  .frame(maxWidth: .infinity)
                  .padding()
                  .background(Color.blue)
                  .foregroundColor(.white)
                  .cornerRadius(10)
            }
            .padding(.top, 10)

         }
         .padding()
      }
      .background(Color.white)
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(Color.white, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
   }


   struct FormFieldView: View {

      var title: String
      var placeholder: String
      @Binding var text: String

      var body: some View {

         VStack(alignment: .leading, spacing: 8) {

            Text(title)
               .font(.subheadline)
               .foregroundColor(Color("AppBlack"))

            TextField("", text: $text, prompt: Text(placeholder).foregroundColor(.black.opacity(0.6)))
               .foregroundColor(Color("AppBlack"))
               .padding()
               .background(Color.gray.opacity(0.1))
               .cornerRadius(12)
         }
      }
   }

   struct SecureFormFieldView: View {

      var title: String
      var placeholder: String
      @Binding var text: String

      var body: some View {

         VStack(alignment: .leading, spacing: 8) {

            Text(title)
               .font(.subheadline)
               .foregroundColor(Color("AppBlack"))

            SecureField(placeholder, text: $text)
               .foregroundColor(Color("AppBlack"))
               .padding()
               .background(Color.gray.opacity(0.1))
               .cornerRadius(12)
         }
      }
   }

   func checkValidations() -> String {
      var strMsg = ""
      if tfGivenName.isEmpty {
         strMsg = "Please enter the given name"
      } else if tfFamilyName.isEmpty {
         strMsg  = "Please enter family name"
      } else if tfEmail.isEmpty {
         strMsg = "Please enter the email address"
      } else if !ValidationHelper.isValidEmail(tfEmail) {
         strMsg = "Please enter the valid email"
      } else if tfPhoneNo.isEmpty {
         strMsg = "PLease enter phone no"
      } else if tfPassword.isEmpty {
         strMsg = "Please enter password"
      } else if tfPassword.count < 8 {
         strMsg = "Plassword must be atleast 8 characters"
      } else if tfConfirmPassword.isEmpty {
         strMsg = "Please enter confirm password"
      } else if tfConfirmPassword != tfPassword {
         strMsg = "Passwords don't matched"
      } else if !isAgree {
         strMsg = "Please agree to terms and conditions"
      }

      return strMsg
   }
}

struct SignUpView_Previews: PreviewProvider {
   static var previews: some View {
      SignUpView()
   }
}
