//
//  Model.swift
//  TaskTracker
//
//  Created by Egor Dadugin on 06.03.2021.
//

import Foundation
import CoreData

var container: NSPersistentContainer! = NSPersistentContainer(name: "TaskTracker")
var taskPredicate: NSPredicate?
var Tasks:[Task] = []


func saveContext(){
    if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
    } catch {
                print("An error occurred while saving: \(error)")
            }
    }
}

func loadSavedData() {
    let request = Task.createFetchRequest()
    let sort = NSSortDescriptor(key: "date", ascending: false)
    request.sortDescriptors = [sort]
    request.predicate = taskPredicate
    do {
        Tasks = try container.viewContext.fetch(request)
        print("Got \(Tasks.count) tasks")
    } catch {
        print("Fetch failed")
    }
}

func deleteTask(index: Int){
    container.viewContext.delete(Tasks[index])
    Tasks.remove(at: index)
    saveContext()
}

func createTask(name: String, date: Date, note: String){
    let newTask = Task(context: container.viewContext)
    newTask.name = name
    newTask.date = date
    newTask.isDone = false
    newTask.note = note
    Tasks.append(newTask)
    saveContext()
}

func formatDate(date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter.string(from: date)
}
