//
//  TagBuffer.swift
//  Mind Castle
//
//  Created by Adrien Wilkins on 2019/09/02.
//  Copyright © 2019 Adrien Wilkins. All rights reserved.
//

import Foundation

class TagAgent {
    var inTagChain = false
    // Should be able to set up the tag list before creating
    let tagList = ["#/","#"]
    var tagCount = -1
    var tokenCount = -1
    
    /* Function parseLineForTags
     Parameters: line: String: A line of text which may or may not contain tags
     Returns: [String]
     parseLineForTags parses a line for captures and tags. Captures are themselves JSONified objects
     (while in memory) so that they can be easily manipulated before CRUD operations to the Db.
     Tags are carried by the capture object which contains it. */
    func parseLineForTags (_ line: String) -> [String]{
        var recordedTags = [String]()
        
        for ch in line {
            // Continue until a new line is reached
            if ch == "\n" {
                break
            }
            if self.tagList.contains("\(ch)"){
                // If the tag chain is false create a new tag
                if self.inTagChain == false {
                    recordedTags.append("\(ch)")
                    self.tagCount += 1
                } else {
                   recordedTags[self.tagCount].append(ch)
                }
            } else {
                
                self.inTagChain = false
                if self.tagCount >= 0 {
               
                recordedTags[self.tagCount].append(ch)
                }
            }
        }
        return recordedTags
    }
    

    

    
}
