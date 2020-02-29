//
//  Ledger.swift
//  Mind Castle
//
//  Created by Adrien Wilkins on 2020/01/30.
//  Copyright © 2020 Adrien Wilkins. All rights reserved.
//
/*
 Ledger is a note generating interface designed to allow
 a user the ability to quickly "capture" notes, pictures,
 drawings, audio... into a node. The ledger supports parsing
 of a shorthand and GUI note generation options.
 It is arguably the more "Hardcore" side of mind castle:
 Think VIM eMACs for notes, with macros, auto view constructors, etc.
 */
import SwiftUI


/* */
struct Ledger: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Capture.getAllCaptures()) var captures:FetchedResults<Capture>
    @State private var newCaptureTitle = ""
    @State private var newCaptureContent = ""
    
    var body: some View {
        List {
            Section(header: Text("New Capture!")) {
                VStack {
                    TextField("Capture title", text: self.$newCaptureTitle)
                    HStack{
                        TextField("Capture Contents", text: self.$newCaptureContent)
                            .multilineTextAlignment(.leading)
                            
                            
                        Button(action: {
                            //Pull the input from the text field and commit to coredata context
                            let capture = Capture(context: self.managedObjectContext)
                            capture.title = self.newCaptureTitle
                            
                            capture.content = self.newCaptureContent
                            capture.createdOn = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            self.newCaptureTitle = ""
                            self.newCaptureContent = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }

                }
            }
            Section(header: Text("Latest Captures")) {
                    ForEach(self.captures) {capture in
                        CaptureView(title: capture.title!, tags: "Generic Tag", content: capture.content!) //TODO: Don't force unwrap here
                        
                    }.onDelete {indexSet in
                        let deleteItem = self.captures[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
        }
    
    }

}

func extractCaptureFields(node: Capture) -> [String: String] {
    var captureItems = [String : String]()
    captureItems = ["title": "", "tags":"", "content":""]
    
   
    
    return captureItems
}


struct Ledger_Previews: PreviewProvider {
    static var previews: some View {
        Ledger()
    }
}
