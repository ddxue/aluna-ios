//
//  Team.swift
//  Konstruu
//
//  Created by Al Yuen on 4/11/17.
//  Copyright © 2017 Frog and Code. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseStorage

class Team: CustomStringConvertible {
    
    var reference: FIRDatabaseReference!
    var profileImageReference: FIRStorageReference!
    var key: String!
    var name: String!
    var open: Bool = true
    var challengeKey: String!
    var userKeys: [String] = []
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self.key = key
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let open = dictionary["open"] as? Bool {
            self.open = open
        }
        
        if let challengeKey = dictionary["challengeKey"] as? String {
            self.challengeKey = challengeKey
        }
        
        if let userKeysDictionary = dictionary["userKeys"] as? Dictionary<String, AnyObject> {
            self.userKeys = Array(userKeysDictionary.keys)
        }
        
        self.reference = API.teamsReference.child(self.key)
        self.profileImageReference = API.teamImagesReference.child(self.key)
    }
    
    func getProfileImage(completed: ((UIImage?) -> Void)?) {
        profileImageReference.data(withMaxSize: 1 * 1024 * 1024, completion: { data, error in
            if error != nil || data == nil {
                print("error in downloading team profile image:\n\(String(describing:error))")
                completed?(nil)
            } else {
                completed?(UIImage(data: data!))
            }
        })
    }
    
    func updateProfileImage(to imageData: Data, completed: ((FIRStorageMetadata?, Error?) -> Void)?) {
        profileImageReference.put(imageData, metadata: nil, completion: completed)
    }
    
    func addUser(_ user: User) {
        userKeys.append(user.key)
        reference.child("userKeys").child(user.key).setValue(true)
        
        user.teamKeys.append(key)
        user.reference.child("teamKeys").child(key).setValue(true)
    }
    
    func markAsOpen() {
        open = true
        reference.child("open").setValue(true)
    }
    
    func markAsClosed() {
        open = false
        reference.child("open").setValue(false)
    }
    
    var description: String {
        let data = [
            "key": key,
            "name": name,
            "open": String(describing: open),
            "challengeKey": challengeKey,
            "userKeys": String(describing: userKeys)
        ]
        return String(describing: data)
    }
}
