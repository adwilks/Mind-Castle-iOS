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
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(tags)
                    .font(.caption)
            }
        }
    }
}

struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureView()
    }
}
