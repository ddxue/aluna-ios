//
//  User.swift
//  Konstruu
//
//  Created by Al Yuen on 4/11/17.
//  Copyright © 2017 Frog and Code. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

class Student: CustomStringConvertible {
  
  var reference: FIRDatabaseReference!
  var profileImageReference: FIRStorageReference!
  
  var key: String!
  
  var name: String!
  var dateOfBirth: String!
  var parent1_contact: String!
  var parent2_contact: String!
  var interests: String!
  var academicGoals: String!
  var socialGoals: String!
  var photoURL: URL?
  
  //    var name: String!
  //    var desc: String?
  //    var email: String?
  //    var skills: [String] = []
  //    var badges: [String] = []
  //    var teamKeys: [String] = []
  
  init(key: String, dictionary: Dictionary<String, AnyObject>) {
    self.key = key
    
    if let name = dictionary["name"] as? String {
      self.name = name
    }
    
    if let dateOfBirth = dictionary["dateOfBirth"] as? String {
      self.dateOfBirth = dateOfBirth
    }
    
    if let parent1_contact = dictionary["parent1_contact"]! as? String {
      self.parent1_contact = parent1_contact
    }

    if let parent2_contact = dictionary["parent2_contact"] as? String {
      self.parent2_contact = parent2_contact
    }
    
    if let interestsDictionary = dictionary["interests"] as? String {
      self.interests = interestsDictionary
    }
    
    if let academicGoalsDictionary = dictionary["academicGoals"] as? String {
      self.academicGoals = academicGoalsDictionary
    }
    
    if let socialGoalsDictionary = dictionary["socialGoals"] as? String {
      self.socialGoals = socialGoalsDictionary
    }
    
    if let photoURL = dictionary["photoURL"] as? String {
      self.photoURL = URL(string: photoURL)
    }
    
    self.reference = API.studentsReference.child(self.key)
    self.profileImageReference = API.studentImagesReference.child(self.key)
  }
  
  // reference: https://firebase.google.com/docs/storage/ios/download-files
  func getProfileImage(completed: ((UIImage?) -> Void)?) {
      profileImageReference.data(withMaxSize: 1 * 1024 * 1024, completion: { data, error in
          if error != nil || data == nil {
              print("error in downloading user profile image:\n\(String(describing:error))")
              completed?(nil)
          } else {
              completed?(UIImage(data: data!))
          }
      })
  }
  var description: String { get {
        let data = [
            "key": key,
            "name": name,
            "photoURL": String(describing: photoURL),
            "parent1_contact": String(describing: parent1_contact),
            "parent2_contact": String(describing: parent2_contact),
            "interests": String(describing: interests),
            "academicGoals": String(describing: academicGoals),
            "socialGoals": String(describing: socialGoals)
        ]
        return String(describing: data)
    } }
  
  // reference: https://firebase.google.com/docs/storage/ios/upload-files
  func updateProfileImage(to imageData: Data, completed: ((FIRStorageMetadata?, Error?) -> Void)?) {
      profileImageReference.put(imageData, metadata: nil, completion: completed)
  }

}
