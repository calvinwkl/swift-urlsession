//: Playground - noun: a place where people can play

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

if let url = URL.with(string: "photos/random") {
    var urlRequest = URLRequest(url: url)
    urlRequest.setValue("Client-ID YOUR_ACCESS_KEY", forHTTPHeaderField: "Authorization")
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if let data = data {
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
        }
    }.resume()
}

