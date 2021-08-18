//
//  SubjectSheet.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI

struct SubjectSheet: View {
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    let subjectTypes = ["Мат. анализ", "Паралл. програмирование", "Инф. Менеджмент", "Теория Управления", "Кибернетика","Математическое и прогр. обеспечение","БЖД","ОХТ","НИР","ПАХТ","Компьютерная безопасность","ЗИС","ТПХП","Практика", ]
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment (\.presentationMode) var presentationMode
    
    @State var selectedSubjectIndex = 1
    @State var typeofLesson = ""
    @State var cabinetNumber = ""
    @State var teacherName = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                Text(" ")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color("Background"))
                    .edgesIgnoringSafeArea(.all)
            Form {
                Section(header: Text("Выбор предмета")) {
                    Picker(selection: $selectedSubjectIndex, label: Text("Тип предмета")) {
                        ForEach(0 ..< subjectTypes.count) {
                                Text(self.subjectTypes[$0]).tag($0)
                        }
                    }
                    TextField("Тип занятия", text: $typeofLesson)
                        .keyboardType(.default)
                }
                Section(header: Text("Кабинет")) {
                    TextField("Номер кабинета", text: $cabinetNumber)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Преподаватель")) {
                    TextField("Имя преподавателя", text: $teacherName)
                        .keyboardType(.default)
                    
                }
                
                Button(action: {
                    guard self.typeofLesson != "" else {return}
                    let newSubject = Subject(context: viewContext)
                    newSubject.subjectType = self.subjectTypes[self.selectedSubjectIndex]
                    newSubject.subjectStatus = .pending
                    newSubject.typeofLesson = self.typeofLesson
                    newSubject.cabinetNumber = self.cabinetNumber
                    newSubject.teacherName = self.teacherName
                    newSubject.id = UUID()
                    do {
                        try viewContext.save()
                        print("Предмет добавлен.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Добавить предмет")
                        .foregroundColor(Color(#colorLiteral(red: 0.5411764706, green: 0.6745098039, blue: 0.6666666667, alpha: 1)))
                }
            }
                .navigationTitle("Сегодня")
        }

        }
}
}

struct SubjectSheet_Previews: PreviewProvider {
    static var previews: some View {
        SubjectSheet()
    }
}
