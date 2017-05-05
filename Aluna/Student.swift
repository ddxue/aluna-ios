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
  var parent1_contact: String?
  var parent2_contact: String?
  var interests: [String] = []
  var academicGoals: [String] = []
  var socialGoals: [String] = []
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
    
    if let parent1_contact = dictionary["parent1_contact"] as? String {
      self.parent1_contact = parent1_contact
    }
    
    if let parent2_contact = dictionary["parent2_contact"] as? String {
      self.parent2_contact = parent2_contact
    }
    
    if let interestsDictionary = dictionary["interests"] as? Dictionary<String, AnyObject> {
      self.interests = self.interests + Array(interestsDictionary.keys)
    }
    
    if let academicGoalsDictionary = dictionary["academic_goals"] as? Dictionary<String, AnyObject> {
      self.academicGoals = self.academicGoals + Array(academicGoalsDictionary.keys)
    }
    
    if let socialGoalsDictionary = dictionary["social_goals"] as? Dictionary<String, AnyObject> {
      self.socialGoals = self.socialGoals + Array(socialGoalsDictionary.keys)
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
            "parent1_contact": parent1_contact,
            "parent2_contact": parent2_contact,
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
