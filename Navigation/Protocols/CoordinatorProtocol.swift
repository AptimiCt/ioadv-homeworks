//
//
// CoordinatorProtocol.swift
// Navigation
//
// Created by Александр Востриков
//
    

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
}
