//: ## Using URLSession to retrieve JSON in Swift
//:
//: ### 1. [Getting Started](https://medium.com/p/d929f3a49c67/)
//:
//: ### 2. [With Unsplash API](https://medium.com/p/4b9fee472f08/)


import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    private static var baseUrl: String {
        return "https://api.unsplash.com/"
    }
    
    static func with(string: String) -> URL? {
        return URL(string: "\(baseUrl)\(string)")
    }
}

// retrive a random photo

struct URLs: Decodable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct Image: Decodable {
    let id: String
    let width: Int
    let height: Int
    let likes: Int
    let color: String
    let urls: URLs
    let keyNotExist: String?
}

if let url = URL.with(string: "photos/random") {
    var urlRequest = URLRequest(url: url)
    urlRequest.setValue("Client-ID YOUR_ACCESS_KEY", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if let data = data {
            do {
                let image = try JSONDecoder().decode(Image.self, from: data)
                print(image)
            } catch let error {
                print(error)
            }
        }
    }.resume()
}

if let url = URL.with(string: "photos/random?count=2") {
    var urlRequest = URLRequest(url: url)
    urlRequest.setValue("Client-ID YOUR_ACCESS_KEY", forHTTPHeaderField: "Authorization")
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if let data = data {
            do {
                let images = try JSONDecoder().decode([Image].self, from: data)
                print(images)
            } catch let error {
                print(error)
            }
        }
    }.resume()
}
