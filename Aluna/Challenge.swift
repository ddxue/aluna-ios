//
//  Challenge.swift
//  Konstruu
//
//  Created by Al Yuen on 4/11/17.
//  Copyright © 2017 Frog and Code. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Challenge: CustomStringConvertible {
    
    var reference: FIRDatabaseReference!
    var key: String!
    var title: String!
    var desc: String!
    var teamKeys: [String] = []
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self.key = key
        
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        
        if let desc = dictionary["desc"] as? String {
            self.desc = desc
        }
        
        if let teamKeysDictionary = dictionary["teamKeys"] as? Dictionary<String, AnyObject> {
            self.teamKeys = Array(teamKeysDictionary.keys)
        }
        
        self.reference = API.challengesReference.child(self.key)
    }
    
    func getTeams(completed: (([Team]) -> Void)?) {
        API.getTeamsInList(teamKeys: teamKeys, index: 0, teams: [], completed: completed)
    }
    
    func updateDescription(to desc: String) {
        self.desc = desc
        reference.child("desc").setValue(desc)
    }
    
    func addTeam(_ team: Team) {
        teamKeys.append(team.key)
        reference.child("teamKeys").child(team.key).setValue(true)
        
        team.challengeKey = key
        team.reference.child("challengeKey").setValue(key)
    }
    
    var description: String {
        let data = [
            "key": key,
            "title": title,
            "desc": desc,
            "teamKeys": String(describing: teamKeys)
        ]
        return String(describing: data)
    }
}
