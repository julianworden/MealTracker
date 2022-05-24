//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Julian Worden on 5/24/22.
//

import UIKit

class FoodTableViewController: UITableViewController {

    let breakfastFoods = [
        Food(name: "Eggs", description: "Come from chickens"),
        Food(name: "Toast", description: "Made with toaster"),
        Food(name: "Fruits", description: "Healthy stuff")
    ]

    let lunchFoods = [
        Food(name: "Hoagie", description: "Don't like them, I think"),
        Food(name: "Grilled Cheese", description: "Starbucks ones suck"),
        Food(name: "Quesadilla", description: "Mexican")
    ]

    let dinnerFoods = [
        Food(name: "Shrimp Scampi", description: "Craving it"),
        Food(name: "Mac & Cheese", description: "Pasta with cheese"),
        Food(name: "Lobster", description: "Good as hell")
    ]

    var meals: [Meal] {
        let breakfast = Meal(name: "Breakfast", food: breakfastFoods)
        let lunch = Meal(name: "Lunch", food: lunchFoods)
        let dinner = Meal(name: "Dinner", food: dinnerFoods)

        let mealsArray = [breakfast, lunch, dinner]
        return mealsArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = "\(food.name)"
        content.secondaryText = "\(food.description)"
        cell.contentConfiguration = content

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

}
