import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    });

    console.log(mapboxgl.accessToken); // Pour déboguer
    // Ajouter le contrôle de recherche sur la carte
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));


    // Gestionnaire pour charger dynamiquement les données
    this.map.on('moveend', this.loadDynamicData.bind(this));
  }

  loadDynamicData() {
    const bounds = this.map.getBounds();
    const ne = bounds.getNorthEast();
    const sw = bounds.getSouthWest();

    // Vérifiez que les coordonnées sont définies
    if (this.areCoordinatesValid(ne) && this.areCoordinatesValid(sw)) {
      this.fetchParksData(bounds);
    }
  }

  areCoordinatesValid(coords) {
    return coords.lat !== undefined && coords.lng !== undefined;
  }


  fetchParksData(bounds) {
    const ne = bounds.getNorthEast();
    const sw = bounds.getSouthWest();
    // Utilisez `lng` pour obtenir la longitude de l'objet Mapbox et passez-la comme `ne_lon` et `sw_lon` dans l'URL
    const url = `/parks/fetch?ne_lat=${ne.lat}&ne_lon=${ne.lng}&sw_lat=${sw.lat}&sw_lon=${sw.lng}`;
    console.log('Fetching parks data from URL:', url); // Affiche l'URL

    fetch(url)
      .then(response => {
        if (!response.ok) {
          throw new Error('Réponse réseau non OK');
        }
        return response.json();
      })
      .then(data => {
        console.log('Data received:', data); // Affiche les données reçues
        this.addMarkers(data.elements);
      })
      .catch(error => console.error("Erreur de fetch :", error));
  }




  // Méthode pour ajouter des marqueurs à la carte basée sur les données récupérées
  addMarkers(markersData) {
    // Vérifiez si markersData est défini et est un tableau avant de continuer
    if (!Array.isArray(markersData)) {
      console.error("Invalid markersData: Expected an array", markersData);
      return;
    }

    markersData.forEach((marker) => {
      // Pour l'API Overpass, les propriétés sont typiquement `lat` et `lon`
      const lat = marker.lat; // Ou marker["lat"] si vous préférez cette syntaxe
      const lon = marker.lon; // Attention : c'est `lon`, pas `lng`!

      // Ajoutez une vérification pour s'assurer que lat et lon sont des nombres valides
      if (typeof lat !== 'number' || isNaN(lat) || typeof lon !== 'number' || isNaN(lon)) {
        console.error("Invalid marker coordinates", marker);
        return; // Ne créez pas de marqueur si les coordonnées sont invalides
      }

      // Créez le contenu HTML du popup en fonction des données disponibles
      const infoWindowHtml = `<h3>${marker.tags?.name || "Parc"}</h3>`;

      // Créer et ajouter le marqueur sur la carte avec le popup
      const popup = new mapboxgl.Popup().setHTML(infoWindowHtml);
      new mapboxgl.Marker({ color: '#EF476F' })
        .setLngLat([lon, lat]) // Utilisez `lon` ici
        .setPopup(popup)
        .addTo(this.map);
    });

    // Ajuster la vue de la carte pour inclure tous les marqueurs
    this.#fitMapToMarkers(markersData);
  }

  #fitMapToMarkers(markersData) {
    const bounds = new mapboxgl.LngLatBounds();
    markersData.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }
}
