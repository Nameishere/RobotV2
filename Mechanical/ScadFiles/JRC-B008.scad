// JRC-B008 USB-C Female Receptacle Connector
// Dimensions based on standard USB-C receptacle specifications

$fn = 50; // Smoothness of curves

module usb_c_receptacle() {
    difference() {
        // Main body shell
        union() {
            // Outer metal housing
            color("silver")
            translate([0, 0, 0])
            cube([9, 7.5, 3.2], center=true);
            
            // Mounting tabs on sides
            color("silver") {
                translate([-4.5, 0, -0.8])
                cube([1, 8.5, 1.6], center=true);
                
                translate([4.5, 0, -0.8])
                cube([1, 8.5, 1.6], center=true);
            }
            
            // PCB mounting legs
            color("silver") {
                translate([-3.5, -5, -2.4])
                cube([0.8, 2, 1.6], center=true);
                
                translate([3.5, -5, -2.4])
                cube([0.8, 2, 1.6], center=true);
            }
        }
        
        // Main cavity for USB-C plug
        translate([0, 1, 0])
        cube([9.2, 7, 2.7], center=true);
        
        // Front opening
        translate([0, 5, 0])
        cube([9.2, 4, 2.7], center=true);
    }
    
    // Inner plastic insulator
    color("white")
    translate([0, 0.5, 0])
    difference() {
        cube([7, 5.5, 2.0], center=true);
        
        // Center slot for tongue
        translate([0, 1, 0])
        cube([4, 4, 1.2], center=true);
    }
    
    // Metal tongue with pins
    color("gold")
    translate([0, 0.5, 0])
    difference() {
        cube([3.8, 5, 0.8], center=true);
        
        // Pin holes/slots (simplified representation)
        for(i = [-1.5:0.5:1.5]) {
            translate([i, 0, 0])
            cube([0.2, 6, 0.6], center=true);
        }
    }
    
    // Contact pins on top
    color("gold")
    for(i = [-3, -2, -1, 0, 1, 2, 3]) {
        translate([i*0.8, 2, 0.9])
        cube([0.3, 3, 0.2], center=true);
    }
    
    // Contact pins on bottom
    color("gold")
    for(i = [-3, -2, -1, 0, 1, 2, 3]) {
        translate([i*0.8, 2, -0.9])
        cube([0.3, 3, 0.2], center=true);
    }
}

// Render the connector
usb_c_receptacle();

// Optional: Add a base plate to represent PCB
color("green", 0.7)
translate([0, -5, -3.8])
cube([20, 2, 1.6], center=true);

// Add alignment helper
// Uncomment to see dimensions
/*
color("red")
translate([0, -10, 0])
text("USB-C JRC-B008", size=2, halign="center");
*/