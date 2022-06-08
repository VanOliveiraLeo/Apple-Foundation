import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State var modal = false
    
    
    @Binding var annotations: [Place]
    
    var body: some View {
        
        ScrollView{
            VStack{
                ZStack{
                    
                    Text("Mapa de risco")
                        .offset(x: 2, y: 14)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .heavy, design: .default))
                        .frame(width: UIScreen.main.bounds.size.width, height: 20, alignment: .center)
                    
                    HStack{
                        
                        
                        Spacer()
                        
                        Button {
                            modal = true
                        } label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .offset(y: 4)
                        }
                        .padding()
                        
                    }
                    .frame(width: UIScreen.main.bounds.size.width, height: 30)
                    .offset(y: 10)
                    
                }
                .frame(width: UIScreen.main.bounds.size.width, height: 80)
                .background(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                
                VStack{
                    Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: annotations){
                        place in
                        MapAnnotation(coordinate: place.coordinate){
                            ZStack {
                                let size = viewModel.circleSize()
                                
                                Circle()
                                    .foregroundColor(Color.init(red: 255/255, green: 255/255, blue: 0/255, opacity: 0.5))
                                    .frame(width: size.0, height: size.1)
                                
                                Image(systemName: "mappin.and.ellipse")
                                    .rotationEffect(Angle(degrees: 0))
                                    .foregroundColor(.red)
                                
                            }
                            
                        }
                    }
                    //                .onReceive(viewModel.region) { region in
                    //                    print(region.span)
                    //                }
                    .accentColor(Color.green)
                    .onAppear{
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                    
                    
                    //                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    //                    .accentColor(Color.green)
                    //                    .onAppear {
                    //                        viewModel.checkIfLocationServicesIsEnabled()
                    //                    }
                    
                    
                }
                .offset(y: -8)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 160)
                
                
                
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.init(red: 235/255, green: 235/255, blue: 235/255))
        .sheet(isPresented: $modal) {
            ModalCadastro()
            //            VStack{
            //                Text("Fechar")
            //                    .background(.green)
            //                    .font(.system(size: 30))
            //                    .onTapGesture {
            //                        modal = false
            //                    }
            //            }
            
            
        }
        
        
        
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(annotations: .constant([]))
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -3.71839, longitude: -38.5434), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else{
            print("Show an alert")
        }
    }
    
    func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
            var alerta: some View{
                return VStack{
                    
                }
                .frame(width: 200, height: 200)
            }
            Alert(title: Text("teste"), message: Text("Testando"), dismissButton: .default(Text("pronto")))
        case .denied:
            Alert(title: Text("teste"), message: Text("Testando"), dismissButton: .default(Text("pronto")))
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08))
        @unknown default:
            break
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func circleSize() -> (Double, Double) {
        if region.span.latitudeDelta <= 0.06 && region.span.longitudeDelta <= 0.04{
            
            switch (region.span.latitudeDelta, region.span.longitudeDelta) {
            case (0.04...0.05, 0.02...0.03):
                return (15.0,15.0)
            case (0.03...0.04, 0.02...0.03):
                return (15.0,15.0)
            case (0.03...0.04, 0.01...0.02):
                return (20.0,20.0)
            case (0.02...0.03, 0.01...0.02):
                return (25.0,25.0)
            case (0.01...0.02, 0.01...0.02):
                return (25.0,25.0)
            case (0.01...0.02, 0.009...0.01):
                return (28.0,28.0)
            case (0.01...0.02, 0.009...0.01):
                return (28.0,28.0)
            case (0.01...0.02, 0.008...0.009):
                return (29.0,29.0)
            case (0.01...0.02, 0.007...0.008):
                return (30.0,30.0)
            case (0.01...0.02, 0.006...0.007):
                return (31.0,31.0)
            case (0.01...0.02, 0.005...0.006):
                return (31.0,31.0)
            case (0.009...0.01, 0.005...0.006):
                return (33.0,33.0)
            case (0.009...0.01, 0.004...0.005):
                return (35.0,35.0)
            case (0.006...0.009, 0.004...0.005):
                return (42.0,42.0)
            case (0.006...0.009, 0.005...0.006):
                return (42.0,42.0)
            case (0.006...0.009, 0.003...0.004):
                return (42.0,42.0)
            case (0.001...0.006, 0.001...0.004):
                return (100.0,100.0)
                
            default:
                if (region.span.latitudeDelta, region.span.longitudeDelta) >= (0.05, 0.02){
                    return (12.0,12.0)
                }else{
                    return (150.0,150.0)
                }
            }
        }else{
            return(10.0,10.0)
            
        }
        
    }
    //    let searchVC = UISearchController(searchResultsController: ResultsCViewController())
    
}

struct ModalCadastro: View {
    @State var search = ""
    var body: some View {
        NavigationView {
            VStack{
                Text("CADASTRO")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.black)
            }
            
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100)
    }
    
}
