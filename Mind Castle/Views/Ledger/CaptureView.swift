//
//  CaptureView.swift
//  Mind Castle
//
//  Created by Adrien Wilkins on 2020/02/01.
//  Copyright © 2020 Adrien Wilkins. All rights reserved.
//

import SwiftUI

struct CaptureView: View {
     var title: String = ""
    //var createdOn:String = ""
    var tags: String = ""
    var content: String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(tags)
                    .font(.caption)
                Text(content)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    
                
            }
        }
    }
}

struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureView(title: "Awesome Note", tags: "#Awesome #Project #beautiful", content: "The general theme is to uncouple every component as much as possible. Nodes can be as verbose as desired, though the general use case is to expose as much of the data in a node as possible by keeping captures somewhat brief. Though this is the topic of the philosophy of mind note, it is germane to the engineering considerations.")
    }
}
