# swiftui-modern-ios-sample
SwiftUI-based iOS application demonstrating MVVM architecture, async/await networking, and unit testing using XCTest.

A modern iOS sample application built using SwiftUI and MVVM architecture, demonstrating scalable networking, async/await concurrency, and clean code practices.

This project showcases how to design a modular and maintainable iOS application with a clear separation of concerns.

## 🚀 Features

- SwiftUI-based UI implementation  
- MVVM architecture  
- Async/Await-based networking  
- Modular WebService layer  
- Environment-based API configuration  
- Login/Signup flow  
- Error handling and response validation  
- Protocol-based communication  
- Codable-based data models

## 🏗 Architecture

The project follows MVVM (Model-View-ViewModel) architecture:

- View → SwiftUI screens handling UI  
- ViewModel → Business logic and API calls  
- Model → Codable data models  

### Networking Layer

- Centralized WebService  
- Generic API handling using Decodable  
- Async/Await for modern concurrency  

### Design Principles

- Separation of concerns  
- Reusability  
- Clean and maintainable code

## 🌐 Networking

- Async/Await based API calls  
- Centralized WebService for GET/POST  
- Status code handling  
- Custom error handling  
- Header management for API requests

## 📁 Project Structure

- Views → SwiftUI UI screens  
- ViewModels → Business logic  
- Models → Request/Response models  
- Services → API & networking layer  
- Utilities → Helpers and error handling  

## 🔐 Security

API base URL and tokens are not included in this repository for security reasons.

Please configure your own API endpoints before running the project.

## ▶️ How to Run

1. Clone the repository  
2. Open in Xcode  
3. Configure API base URL  
4. Build and run  

## 📌 Future Improvements

- Unit testing using XCTest  
- Dependency Injection improvements  
- SwiftUI state management enhancements  
- Clean Architecture / MVVM-C  

---

This project was built as part of exploring modern iOS development practices including SwiftUI, async/await, and scalable architecture design.
