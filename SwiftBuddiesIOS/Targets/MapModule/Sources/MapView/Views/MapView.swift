import SwiftUI
import MapKit
import Design
import SwiftData

public struct MapView: View {
    
    @StateObject var vm = MapViewModel()
    
    @Query private var items: [EventModel]
    @State private var selectedItems: [EventModel] = []

    public init() {
        
    }
    
    public var body: some View {
        
        NavigationView{
            ZStack {
                MapLayer
                .bottomSheet(
                    presentationDetents: [.large, .fraction(0.2), .fraction(0.4), .fraction(0.5), .fraction(0.9), .medium],
                    detentSelection: $vm.selectedDetent,
                    isPresented: $vm.categoryModalShown,
                    sheetCornerRadius: 12,
                    interactiveDismissDisabled: false) {
                        CategoryPicker(selectedCategory: $vm.selectedCategory) {
                            
                        }
                    } onDismiss: {
                        selectedItems.removeAll()
                        for item in items {
                            if vm.selectedCategory == item.category {
                                selectedItems.append(item)
                            }
                        }
                        print("selected items count: \(selectedItems.count)")
                        for item in selectedItems {
                            print("Category: \(item.category)")
                            print("Latitude: \(item.latitude)")
                            print("Longitude: \(item.longitude)")
                            if let firstItem = items.first {
                                vm.setMapRegion(to: firstItem)
                            }
                        }
                    }
                    
                if !vm.categoryModalShown {
                    VStack {
                        Spacer()
                        HStack{
                            seeLocationsButton
                            createEventButton
                                .padding()
                        }
                    }
                }
                
            }
            
            
        }
        
    }
}

#Preview {
    MapView()
}


// MARK: View extensions for mapView
extension MapView {
    
    // Core Dataya Location kaydedebilirsem. Bu haritayı o lokasyonlarla başlatacağım ver her category için farklı bir pin designi olcak.
    private var MapLayer: some View {
        Map(coordinateRegion: $vm.region, annotationItems: selectedItems) { item in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)) {
                CustomAnnotationView()
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.setMapRegion(to: item)
                    }
            }
        }
        .mapControls {
            Spacer()
            MapUserLocationButton()
            MapPitchToggle()
        }
        .padding(.top, 50)
        .onAppear{
            CLLocationManager().requestWhenInUseAuthorization()
        }
        .ignoresSafeArea()
    }
    
    private var seeLocationsButton: some View {
        Button(action: {
            vm.categoryModalShown.toggle()
        }) {
            Text("See Locations")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding()
    }
    
    private var createEventButton: some View {
        NavigationLink(destination: NewEventView()) {
            Text("Create Event")
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
        }
        
        
    }
    
}