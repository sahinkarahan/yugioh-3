//
//  NetworkManager.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://db.ygoprodeck.com/api/v7/cardinfo.php"
    
    private init() {}

    func getFrameworks() async throws -> [Framework] {
        
       guard let url = URL(string: NetworkManager.baseURL) else {
           throw APError.invalidURL
       }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(FrameworkResponse.self, from: data).data
            } catch {
                throw APError.invalidData
            }
        }

    
    func downloadImage(fromURLString urlString: String, complated: @escaping (UIImage?) -> Void ){
        let cacheKey = NSString(string: urlString)
        
    
        if let image = cache.object(forKey: cacheKey) {
            complated(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            complated(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                complated(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            complated(image)
        }
        
        task.resume()
    }
}
