//
//  API.swift
//  Aluna
//
//  Created by Jack Gartland on 4/27/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class API {
    /* Database Structure:
     {
     “students”: {
        “studentID”: {
            “Name”: ""
            “dateOfBirth”:
            “parent1_contactInfo”:
            “parent2_contactInfo”:
            “Interests”: [“interest1”, “interest2”, ...]
            “academicGoals”:[]
            “socialGoals”:[]
            “profileURL”: "imageID"
        },
     }
     
     “recaps”: {
        “studentID”: [“2017.04.24”: {
           “recap notes”: “”
           “topics” : []
           “location” : “”
           “audio” : "audioID"
           }, ... ]
        }
     }
     
     “teachers”:  {
        “teacherID”: {
          “username”: “teacher@email.com”
          “name”:
          “students”: [“studentID_1”, “studentID_2”, ...]
         }
     }
     
     “meetings”: {
        “teacherID”: [studentID, ...],
     }
     
     “dailyDose” : {
        “Message” : “”
     }
 */
    
    /* Cloud Storage Structure:
     {
        "studentImages": {
            "studentID": file
        },
        "recapAudio": {
            "audioID": file
        }
     }
*/
    
    static let databaseReference: FIRDatabaseReference = FIRDatabase.database().reference()
    static let studentsReference = databaseReference.child("students")
    static let recapsReference = databaseReference.child("recaps")
    static let teachersReference = databaseReference.child("teachers")
    static let meetingsReference = databaseReference.child("meetings")
    static let dailyDoseReference = databaseReference.child("dailyDose")
    
    static let storage = FIRStorage.storage()
    static let storageReference = storage.reference()
    static let studentImagesReference = storageReference.child("studentImages")
    static let teacherImageReference = storageReference.child("teacherImage")
    static let recapAudioReference = storageReference.child("recapAudio")
    
    class func getStudentWithKey(_ key: String, completed: ((Student?) -> Void)?) {
        studentsReference.child(key).observeSingleEvent(of: .value, with: { snapshot in
            var student: Student?
            
            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                student = Student(key: key, dictionary: dictionary)
            }
            
            completed?(student)
        })
    }
    
    class func getTeacherWithKey(_ key: String, completed: ((Teacher?) -> Void)?) {
        teachersReference.child(key).observeSingleEvent(of: .value, with: { snapshot in
            var teacher: Teacher?
            
            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                teacher = Teacher(key: key, dictionary: dictionary)
            }
            
            completed?(teacher)
        })
    }
    
    class func getRecapWithStudentID(_ studentID: String, completed: ((Recap?) -> Void)?) {
        recapsReference.child(studentID).observeSingleEvent(of: .value, with: { snapshot in
//            var recap: Recap?
//            
//            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
////                recap = Recap(key: key, dictionary: dictionary)
//            }
//            
//            completed?(recap)
        })
    }
    
    class func getMeetingsForTeacher(_ teacherID: String, completed: ((NSArray?) -> Void)?) {
        meetingsReference.child(teacherID).observeSingleEvent(of: .value, with: { snapshot in
//            var meetings: NSArray?
//          
//            if let dictionary = snapshot.value as? NSArray {
//                meetings
//            }
          
//            completed?(meetings)
        })
    }
    
    
    class func getDailyDose() {
        dailyDoseReference.child("Message").observeSingleEvent(of: .value, with: { snapshot in
//            var message: String?
//            
//            if let message = snapshot.value as? String {
//                return message;
//            }
        })
    }

}
