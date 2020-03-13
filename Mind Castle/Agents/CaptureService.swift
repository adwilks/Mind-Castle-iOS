//
//  TagBuffer.swift
//  Mind Castle
//
//  Created by Adrien Wilkins on 2019/09/02.
//  Copyright © 2019 Adrien Wilkins. All rights reserved.
//

import Foundation

class CaptureService {
    var inTagChain = false
    // Should be able to set up the tag list before creating
    let tagList = ["/","#"]
    var tagCount = -1
    var tokenCount = -1
    
    func processCapture (_ rawCapture: String) -> Capture{
        let localCapture = Capture()
        
        
        var tokenList = parseLineForTags(rawCapture)
        
        localCapture.title = "Something" //TODO: Fix title generator
        localCapture.tags = parseLineForTags(rawCapture)
        
        
        // MARK: changed the captures tag datatype from string? to [string]? TEST THIS
        return localCapture
    }
    
    func scanToNextToken(_ capture: String) -> String.Index {
        return capture.firstIndex(of: "/") ?? capture.endIndex
    }
    
    /*
     Function: extractSectionals
     Parameters: rawCapture: The raw contents of a textfield capture
     Returns: [String: String] : A dictionary of each sectional where the key is the node title and the value is the content
     
     */
    func extractSectionals (_ rawCapture: String) -> [String: String] {
        //TODO: Use a regular expression to capture the content between tokens
        // TODO: Add ability for parser to move up in directory
        // TODO: Add ability for parser to append to content in higher directory
        
        var sections = [String :String]()
        // TODO: What if text comes before the /?
        var remainingStr = rawCapture
        var token = ""
        var tokenIndex : String.Index
        var contentIndex : String.Index
        while(!remainingStr.isEmpty) {
            // Create a token index range for us to store as the token and remove from capture
            tokenIndex = remainingStr.firstIndex(of: "/") ?? remainingStr.endIndex //This reads either the first location of the / token or the end of the capture
            contentIndex = remainingStr.firstIndex(of: "\n") ?? remainingStr.endIndex
            var tokenRange = tokenIndex..<contentIndex
            // We add the tokens here so that we end up with a growing directory.. /first token/second/etc
            token.append(String(remainingStr[tokenRange]))
            remainingStr.removeSubrange(tokenRange)
            // Create a content range and remove from capture

            var contentRange = remainingStr.startIndex..<scanToNextToken(remainingStr)
            var content = String(remainingStr[contentRange])
        
            remainingStr.removeSubrange(contentRange)
            
            sections[token] = content
        }
        return sections
    }
    
    
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
                return recordedTags
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
