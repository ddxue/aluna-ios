//
//  CreateStudents.swift
//  Aluna
//
//  Created by Jack Gartland on 5/7/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation

class CreateStudents {
    class func addStudents() {
        ///*// CODE TO CREATE STUDENTS IN BACK END.  REMOVE AFTER FIRST RUN \\
        let studentIDs = ["0001", "0002", "0003", "0004"]
        
        //STUDENT 1
        let interests1 = ["hiking", "biking", "swimming"]
        let academicGoals1 = ["improve reading", "improve writing"]
        let socialGoals1 = ["make more friends", "talk with teacher"]
        let parent1_contact1 = [
            "name" : "Suzie",
            "phoneNumber" : "555-555-5555"
        ]
        let studentInfo1 = [
            "key" : "0001",
            "name" : "Jack",
            "photoURL": "http://www.firebase.com/this_is_URL_1",
            "parent1_contact": String(describing: parent1_contact1),
            "parent2_contact": String(describing: parent1_contact1),
            "interests": String(describing: interests1),
            "academicGoals": String(describing: academicGoals1),
            "socialGoals": String(describing: socialGoals1)
        ]
        
        //STUDENT 2
        let interests2 = ["walking", "running", "math"]
        let academicGoals2 = ["do more math", "learn to read"]
        let socialGoals2 = ["become comfortable making presentations", "meet friends"]
        let parent1_contact2 = [
            "name" : "Bill",
            "phoneNumber" : "555-555-5555"
        ]
        let studentInfo2 = [
            "key" : "0002",
            "name" : "David",
            "photoURL": "http://www.firebase.com/this_is_URL_2",
            "parent1_contact": String(describing: parent1_contact2),
            "parent2_contact": String(describing: parent1_contact2),
            "interests": String(describing: interests2),
            "academicGoals": String(describing: academicGoals2),
            "socialGoals": String(describing: socialGoals2)
        ]
        
        //STUDENT 3
        let interests3 = ["studying", "reading", "watching tv"]
        let academicGoals3 = ["I have no goals"]
        let socialGoals3 = ["Play outside at recess", "meet friends"]
        let parent1_contact3 = [
            "name" : "Sally",
            "phoneNumber" : "555-555-5555"
        ]
        let studentInfo3 = [
            "key" : "0003",
            "name" : "Chase",
            "photoURL": "http://www.firebase.com/this_is_URL_3",
            "parent1_contact": String(describing: parent1_contact3),
            "parent2_contact": String(describing: parent1_contact3),
            "interests": String(describing: interests3),
            "academicGoals": String(describing: academicGoals3),
            "socialGoals": String(describing: socialGoals3)
        ]
        
        //STUDENT 4
        let interests4 = ["playing video games", "exercizing"]
        let academicGoals4 = ["improve at everything"]
        let socialGoals4 = ["get a girlfriend"]
        let parent1_contact4 = [
            "name" : "Bobby",
            "phoneNumber" : "555-555-5555"
        ]
        let studentInfo4 = [
            "key" : "0004",
            "name" : "Alex",
            "photoURL": "http://www.firebase.com/this_is_URL_4",
            "parent1_contact": String(describing: parent1_contact4),
            "parent2_contact": String(describing: parent1_contact4),
            "interests": String(describing: interests4),
            "academicGoals": String(describing: academicGoals4),
            "socialGoals": String(describing: socialGoals4)
        ]
        
        let studentInfos = [studentInfo1, studentInfo2, studentInfo3, studentInfo4]
        
        for index in 0...3 {
            API.createStudentWithKey(studentIDs[index], studentInfo: studentInfos[index] as Dictionary<String, AnyObject>)
        }
    }

    //*/
}
