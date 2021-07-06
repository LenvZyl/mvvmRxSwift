
import Foundation
import RxSwift

final class RestaurantListViewModel {
    let title = "Restaurants"
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModel() -> Observable<[RestaurantViewModel]>{
        restaurantService.fetchRestaurants().map { $0.map {
                RestaurantViewModel(restaurant: $0)
            }
        }
    }
}
