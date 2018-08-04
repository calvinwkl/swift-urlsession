//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

if let url = URL(string: "https://api.myjson.com/bins/yfua8") {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
        }
    }.resume()
}

struct Response: Codable { // or Decodable
    let foo: String
}

if let url = URL(string: "https://api.myjson.com/bins/yfua8") {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            do {
                let res = try JSONDecoder().decode(Response.self, from: data)
                print(res.foo)                
            } catch let error {
                print(error)
            }
        }
    }.resume()
}

