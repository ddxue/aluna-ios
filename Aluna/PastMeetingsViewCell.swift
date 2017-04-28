//
//  PastMeetingsViewCell.swift
//  Aluna
//
//  Created by Jack Gartland on 4/16/17.
//  Copyright © 2017 Aluna. All rights reserved.
//

import UIKit

class PastMeetingsViewCell: UITableViewCell {
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var playAudio: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        topicLabel?.text = "Academics"
        placeLabel?.text = "Classroom"
        nextLabel?.text = "2 Weeks"
        dateLabel?.text = "4/16/17"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playRecording() {
        //connec to backend to get audio
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
