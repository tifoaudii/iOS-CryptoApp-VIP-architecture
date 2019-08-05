//
//  ProfileWorker.swift
//  CleanSwift
//
//  Created by Tifo Audi Alif Putra on 31/07/19.
//  Copyright © 2019 own. All rights reserved.
//

import UIKit



struct ProfileWorker {
    
    //MARK: - Helper Function Here
    func getProfileDetail(completion: @escaping (_ profile: ProfileModel)-> Void) {
        let profile = ProfileModel()
        guard let data = self.dataFromFile("ServerData") else {
            return
        }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let body = json["data"] as? [String: Any] {
                profile.fullName = body["fullName"] as? String
                profile.pictureUrl = body["pictureUrl"] as? String
                profile.about = body["about"] as? String
                profile.email = body["email"] as? String
                
                if let friends = body["friends"] as? [[String: Any]] {
                    profile.friends = friends.map { Friend(json: $0) }
                }
                
                if let profileAttributes = body["profileAttributes"] as? [[String: Any]] {
                    profile.profileAttributes = profileAttributes.map { Attribute(json: $0) }
                }
                completion(profile)
            }
        } catch {
            print("Error deserializing JSON: \(error)")
        }
    }
    
    func dataFromFile(_ filename: String) -> Data? {
        @objc class TestClass: NSObject { }
        
        let bundle = Bundle(for: TestClass.self)
        if let path = bundle.path(forResource: filename, ofType: "json") {
            return (try? Data(contentsOf: URL(fileURLWithPath: path)))
        }
        return nil
    }
}


