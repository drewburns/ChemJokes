//
//  ViewController.swift
//  ChemJokes
//
//  Created by Andrew Burns on 1/9/16.
//  Copyright © 2016 Andrew Burns. All rights reserved.
//

import UIKit
import QuartzCore
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var calendarView: UIView! {
        didSet {
            calendarView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var jokeLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        jokeLabel.textColor = UIColor.whiteColor()
        contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)

        
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
        let day = components.day
        dateLabel.text = String(day)
        monthLabel.text = String(date.month)
        

        
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedObjectContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName("Joke", inManagedObjectContext: managedObjectContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if let last = result.last as? Joke {
                jokeLabel.text = last.text
            }
        } catch {
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "teacher")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    


}


extension NSDate {
    var month: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.stringFromDate(self)
    }
    var hour0x: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh"
        return dateFormatter.stringFromDate(self)
    }
    var minute0x: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "mm"
        return dateFormatter.stringFromDate(self)
    }
}


//let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//
//let managedObjectContext = appDelegate.managedObjectContext
//let fetchRequest = NSFetchRequest()
//
//// Create Entity Description
//let entityDescription = NSEntityDescription.entityForName("ToDoItem", inManagedObjectContext: managedObjectContext)
//
//// Configure Fetch Request
//fetchRequest.entity = entityDescription
//
//do {
//    let result = try managedObjectContext.executeFetchRequest(fetchRequest)
//    for res in result {
//        toDoItems.append([res as! ToDoItem])
//    }
//} catch {
//    let fetchError = error as! NSError
//    print(fetchError)
//}

//let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//let managedObjectContext = appDelegate.managedObjectContext
//let newitem = NSEntityDescription.insertNewObjectForEntityForName("ToDoItem", inManagedObjectContext: managedObjectContext) as! ToDoItem
//newitem.title = titleTextField.text
//newitem.info = infoTextField.text
////        let date = NSDate()
////        let formatter = NSDateFormatter()
////        formatter.timeStyle = .ShortStyle
//newitem.date = datePicker.date
//let selectedValue = placeData[placePicker.selectedRowInComponent(0)]
//newitem.place = selectedValue
//
//
//do {
//    try managedObjectContext.save()
//} catch {
//    fatalError("Failure to save context: \(error)")
//}