//
//  Recap.swift
//  Aluna
//
//  Created by Jack Gartland on 5/4/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class Recap: CustomStringConvertible {
    
    var reference: FIRDatabaseReference!
    
    var key: String!
    var recapNotes: String!
    var topics: NSArray!
    var location: String?
    var audio: String?
    
//    “recaps”: {
//      “studentID”: [“2017.04.24” : {
//          “recap notes”: “”
//          “topics” : []
//          “location” : “”
//          “audio” : "audioID"
//      }, ... ]
//     }
//}

    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self.key = key
        
        if let recapNotes = dictionary["recapNotes"] as? String {
            self.recapNotes = recapNotes
        }
        
        if let topics = dictionary["topics"] as? NSArray {
            self.topics = topics
        }
        
        if let location = dictionary["location"] as? String {
            self.location = location
        }
        
        if let audio = dictionary["audio"] as? String {
            self.audio = audio
        }
        
        self.reference = API.recapsReference.child(self.key)
    }
    
    var description: String { get {
        let data = [
            "key": key,
            "recapNotes": recapNotes,
            "topics": String(describing: topics),
            "location": location,
            "audio": audio
        ]
        return String(describing: data)
        } }
    
    
    
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
