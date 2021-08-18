//
//  SubView.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI
import CoreData

struct SubView: View {
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NewRed") as Any]
        }
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Subject.entity(), sortDescriptors: [], predicate: NSPredicate(format: "status != %@", Status.completed.rawValue))

    var subjects: FetchedResults<Subject>
    
    @State var showSubjectSheet = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Text(" ")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color("Background"))
                    .edgesIgnoringSafeArea(.all)
            ScrollView {
                ForEach(subjects) { subject in
                    ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("Background"))
                        .frame(width: 343, height: 140)
                        .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                    VStack {
                        VStack() {
                            Text("\(subject.subjectType) - \(subject.cabinetNumber) кб.")
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.5725490196, blue: 0.5725490196, alpha: 1)))
                                .padding()
                                .frame(width: 343, height: 30)
                            Text("\(subject.teacherName) , \(subject.typeofLesson)")
                                .fontWeight(.light)
                                .font(.system(size: 16))
                                .foregroundColor(Color(#colorLiteral(red: 0.6392156863, green: 0.6941176471, blue: 0.7764705882, alpha: 1)))
                                .frame(width: 343, height: 30)
                        }
                        Spacer()
                        Button(action: {
                            updateSubject(subject: subject)
                        }) {
                            Text(subject.subjectStatus == .pending ? "На занятии" : "Закончено")
                                .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                        }
                    }
                        .frame(height: 50)
                }
                    .padding()
            .frame(maxWidth: .infinity)
                }
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(subjects[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    
            }
                .navigationTitle("Сегодня")
            
                .navigationBarItems(trailing: Button(action: {
                    showSubjectSheet = true
                }, label: {
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                        .frame(width: 45, height: 45)
                        .background(Color("Background"))
                        .clipShape(Circle())
                        .shadow(color: Color("LightShadow"), radius: 6, x: -3, y: -3)
                        .shadow(color: Color("DarkShadow"), radius: 6, x: 3, y: 3)
                        .imageScale(.large)
                    
                }))
                .sheet(isPresented: $showSubjectSheet) {
                    SubjectSheet()
                }
        }
        }
    }
    
    func updateSubject(subject: Subject) {
        let newStatus = subject.subjectStatus == .pending ? Status.preparing : .completed
        viewContext.performAndWait {
            subject.subjectStatus = newStatus
            try? viewContext.save()
        }
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
