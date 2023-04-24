# Emoji Memory Game - ReadMe
This is a project I completed for the CS193p course at Stanford University. The project aimed to teach SwiftUI and Swift, along with industry practices.

# Technical Skills Demonstrated
* Proficiency in Swift, the primary programming language for iOS development
* Understanding of SwiftUI, Apple's modern UI framework for iOS development
* Knowledge of Model-View-Controller (MVC) architecture
* Familiarity with the ObservableObject protocol in SwiftUI
* Experience working with classes and structs in Swift
* Utilization of core SwiftUI concepts such as views, modifiers, and state
* Understanding of the importance of good UI/UX design
* Ability to create custom views and layouts using SwiftUI's GeometryReader and LazyVGrid
* Understanding of the purpose and implementation of extensions in Swift
* Ability to write clean, well-structured, and maintainable code

# Code Structure
The project is structured into four files:

EmojiMemoryGame.swift
This file contains the EmojiMemoryGame class, which conforms to the ObservableObject protocol. It is responsible for holding the game state and exposing the necessary methods for modifying the game state.

MemorizeApp.swift
This file contains the MemorizeApp struct, which conforms to the App protocol. It is responsible for initializing the EmojiMemoryGame instance and setting up the initial view of the application.

EmojiMemoryGameView.swift
This file contains the EmojiMemoryGameView struct, which conforms to the View protocol. It is responsible for rendering the game board, updating the view based on changes to the game state, and providing the necessary user interaction.

CardView.swift
This file contains the CardView struct, which conforms to the View protocol. It is responsible for rendering a single card on the game board and updating its state based on changes to the game state.

# Project Structure
The project follows a simple structure where each file is responsible for a specific part of the application. The use of classes and structs helps to organize the code and separate the concerns of the application. The implementation of the Model-View-Controller (MVC) architecture is evident in the use of EmojiMemoryGame as the model, EmojiMemoryGameView as the view, and the choose function as the controller, which updates the game state.

# Conclusion
This project demonstrates my ability to work with Swift and SwiftUI to create a simple yet engaging iOS application. It showcases my understanding of fundamental concepts such as views, modifiers, and state in SwiftUI, as well as the importance of clean code structure and good UI/UX design. I look forward to applying my skills and knowledge to more complex iOS applications in the future.
