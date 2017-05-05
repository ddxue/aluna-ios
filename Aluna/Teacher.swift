//
//  Teacher.swift
//  Aluna
//
//  Created by David Xue on 5/4/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

class Teacher: CustomStringConvertible {
  
  var reference: FIRDatabaseReference!
  var profileImageReference: FIRStorageReference!
  
  var key: String!
  var name: String!
  var username: String!
  var students: [String] = []
  var photoURL: URL?
  
  init(key: String, dictionary: Dictionary<String, AnyObject>) {
    self.key = key
    
    if let name = dictionary["name"] as? String {
      self.name = name
    }
    
    if let username = dictionary["username"] as? String {
      self.username = username
    }
    
    if let studentsDictionary = dictionary["students"] as? Dictionary<String, AnyObject> {
      self.students = self.students + Array(studentsDictionary.keys)
    }
    
    if let photoURL = dictionary["photoURL"] as? String {
      self.photoURL = URL(string: photoURL)
    }
    
    self.reference = API.teachersReference.child(self.key)
//    self.profileImageReference = API.teacherImagesReference.child(self.key)
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
  
  var description: String {
    get {
    let data = [
      "key": key,
      "name": name,
      "username": username,
      "students": String(describing: students),
      "photoURL": String(describing: photoURL)
    ]
    return String(describing: data)
    }
  }
  
  // reference: https://firebase.google.com/docs/storage/ios/upload-files
  func updateProfileImage(to imageData: Data, completed: ((FIRStorageMetadata?, Error?) -> Void)?) {
    profileImageReference.put(imageData, metadata: nil, completion: completed)
  }
  
  
  //
  //    func getTeams(completed: (([Team]) -> Void)?) {
  //        API.getTeamsInList(teamKeys: teamKeys, index: 0, teams: [], completed: completed)
  //    }
  //
  //
  //
  //    func addSkill(_ skill: String) {
  //        self.skills.append(skill)
  //        reference.child("skills").child(skill).setValue(true)
  //        API.skillsReference.child(skill).child(key).setValue(true)
  //    }
  //
  //    func removeSkill(_ skill: String) {
  //        if let index = skills.index(of: skill) {
  //            skills.remove(at: index)
  //        }
  //        reference.child("skills").child(skill).removeValue()
  //        API.skillsReference.child(skill).child(key).removeValue()
  //    }
  //
  //    func addBadge(_ badge: String) {
  //        self.badges.append(badge)
  //        reference.child("badges").child(badge).setValue(true)
  //    }
  //
  //    var description: String { get {
  //        let data = [
  //            "key": key,
  //            "name": name,
  //            "desc": desc,
  //            "photoURL": String(describing: photoURL),
  //            "email": email,
  //            "skills": String(describing: skills),
  //            "badges": String(describing: badges),
  //            "teamKeys": String(describing: teamKeys)
  //        ]
  //        return String(describing: data)
  //    } }
}
