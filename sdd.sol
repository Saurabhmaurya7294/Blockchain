// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TravelVerification {
    // Struct to store geotagged data
    struct Geotag {
        string gpsCoordinates; // Latitude and Longitude
        string timestamp;      // Time of geotagging
        address user;          // User's Ethereum address
    }

    // Mapping to associate Ethereum addresses with geotagged data
    mapping(address => Geotag) public geotags;

    // Event emitted when data is stored
    event DataStored(address indexed user, string gpsCoordinates, string timestamp);

    // Function to store geotagged data
    function storeData(string memory _gpsCoordinates, string memory _timestamp) public {
        // Store the geotag data in the mapping
        geotags[msg.sender] = Geotag(_gpsCoordinates, _timestamp, msg.sender);

        // Emit the event
        emit DataStored(msg.sender, _gpsCoordinates, _timestamp);
    }

    // Function to retrieve geotagged data
    function retrieveData(address user) public view returns (string memory, string memory, address) {
        Geotag memory geotag = geotags[user];
        return (geotag.gpsCoordinates, geotag.timestamp, geotag.user);
    }
}
