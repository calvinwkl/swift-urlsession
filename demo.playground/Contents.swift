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


