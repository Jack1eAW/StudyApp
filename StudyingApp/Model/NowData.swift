//
//  NowData.swift
//  StudyingApp
//
//  Created by Aleksandr Chebotarev on 11.06.2021.
//

import SwiftUI
import Foundation

struct Now: Identifiable {
    var id = UUID().uuidString
    var title: String
}

var Today_items = [
    Now(title: "Математический анализ"),
    Now(title: "Программирование"),
    Now(title: "История"),
    Now(title: "Безопасность жизни деятельности"),
    Now(title: "Параллельное программирование"),
    Now(title: "Инф. менеджмент"),
    Now(title: "Теория управления"),
    Now(title: "Кибернетика"),
    Now(title: "Математ. и прогр. обеспечение"),
    Now(title: "ОХТ"),
    Now(title: "ПАХТ"),
    Now(title: "ТПХП"),
    Now(title: "ЗИС"),
    Now(title: "Компьютерная безопасность"),
    Now(title: "Физика"),
    Now(title: "Органическая химия"),
    Now(title: "Неорганическая химия"),
    Now(title: "Физическая химия"),
]
