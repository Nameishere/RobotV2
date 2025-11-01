// KY-040 Rotary Encoder Module Model
// All measurements in millimeters
$fn = 50; // Resolution for circles

module ky040() {
    // PCB dimensions
    pcb_width = 26.5;
    pcb_depth = 19;
    pcb_thickness = 1.6;
    
    // PCB with mounting holes
    difference() {
        // Main PCB body
        color("green", 0.9)
        cube([pcb_width, pcb_depth, pcb_thickness]);
        
        // Mounting holes (2.5mm diameter)
        hole_diameter = 2.5;
        hole_offset_x = 2.5;
        hole_offset_y = 2.5;
        
        translate([hole_offset_x, hole_offset_y, -0.5])
            cylinder(h = pcb_thickness + 1, d = hole_diameter);
        
        translate([pcb_width - hole_offset_x, hole_offset_y, -0.5])
            cylinder(h = pcb_thickness + 1, d = hole_diameter);
    }
    
    // Rotary encoder body
    encoder_x = pcb_width / 2;
    encoder_y = pcb_depth / 2 + 1;
    
    translate([encoder_x, encoder_y, pcb_thickness]) {
        // Cubic base
        color("silver", 0.8)
        translate([-6.25, -6.25, 0])
            cube([12.5, 12.5, 7]);
        
        // Encoder shaft
        color("silver", 0.9)
        translate([0, 0, 7])
            cylinder(h = 15, d = 6);
        
        // Shaft flat (D-shaft)
        color("silver", 0.9)
        translate([0, 0, 7])
            difference() {
                cylinder(h = 15, d = 6);
                translate([2.5, -3, -0.5])
                    cube([2, 6, 16]);
            }
        
        // Threaded bushing
        color("silver", 0.7)
        translate([0, 0, -2])
            cylinder(h = 2, d = 7);
    }
    
    // Pin headers (5 pins)
    pin_spacing = 2.54;
    pin_start_y = (pcb_depth - (4 * pin_spacing)) / 2;
    pin_x = pcb_width - 2;
    
    for (i = [0:4]) {
        translate([pin_x, pin_start_y + i * pin_spacing, -2.5]) {
            // Pin below PCB
            color("gold", 0.9)
            cylinder(h = 2.5, d = 0.6);
            
            // Pin above PCB
            translate([0, 0, 2.5])
            color("black", 0.9)
            cube([2.5, pin_spacing * 0.8, pcb_thickness], center = true);
        }
    }
    
    // Small components on PCB (resistors/capacitors)
    for (i = [0:2]) {
        translate([7 + i * 4, 14, pcb_thickness]) {
            color("black", 0.8)
            cube([3, 1.5, 1.2]);
        }
    }
}

module knob() {
    color("black", 0.9) {
        cylinder(h = 10, d = 15);
        translate([0, 0, 10])
            cylinder(h = 3, d1 = 15, d2 = 13);
        // Indicator line
        translate([0, 5, 10])
            color("white")
            cube([1, 2, 3.5], center = true);
    }
}

module Ky040Mount(showpins = true) {
    // PCB dimensions
    pcb_width = 26.5;
    pcb_depth = 19;
    pcb_thickness = 1.6;
    
    // Mount parameters
    base_thickness = 3;
    wall_height = 8;
    wall_thickness = 2;
    clearance = 0.3; // For easier fitting
    
    // Mounting post parameters
    post_height = 3;
    post_outer_diameter = 4.5;
    post_inner_diameter = 2.2; // Slightly smaller than 2.5mm hole for press fit
    
    // Mounting hole positions
    hole_offset_x = 4.5;
    hole_offset_y = 16.5;
    difference() {
    difference() {
        union() {
            // Base plate
            color("lightblue", 0.8)
            cube([pcb_width + wall_thickness * 2, 
                  pcb_depth + wall_thickness * 2, 
                  base_thickness]);
            
            // Mounting posts
            translate([wall_thickness + hole_offset_x, 
                      wall_thickness + hole_offset_y, 
                      base_thickness]) {
                color("lightblue", 0.8)
                cylinder(h = post_height, d = post_outer_diameter);
            }
            
            translate([wall_thickness + pcb_width - hole_offset_x, 
                      wall_thickness + hole_offset_y, 
                      base_thickness]) {
                color("lightblue", 0.8)
                cylinder(h = post_height, d = post_outer_diameter);
            }
            
            // Right wall 
            translate([pcb_width + wall_thickness -1, wall_thickness, 0])
                color("lightblue", 0.8)
                cube([wall_thickness + 1, pcb_depth, base_thickness + wall_height]);

            
            // Bottom wall (where pins are NOT located)
            translate([0, 0, 0])
                color("lightblue", 0.8)
                cube([pcb_width + wall_thickness * 2, wall_thickness+ 1, base_thickness + wall_height]);
        }
        
        // Screw holes in mounting posts (optional for M2 screws)
        translate([wall_thickness + hole_offset_x, 
                  wall_thickness + hole_offset_y, 
                  -0.5]) {
            cylinder(h = base_thickness + post_height + 1, d = post_inner_diameter);
        }
        
        translate([wall_thickness + pcb_width - hole_offset_x, 
                  wall_thickness + hole_offset_y, 
                  -0.5]) {
            cylinder(h = base_thickness + post_height + 1, d = post_inner_diameter);
                      
        }
    }
    translate([wall_thickness, wall_thickness, base_thickness + post_height]){
    cube([pcb_width,pcb_depth + 1,pcb_thickness + 0.25]);
    }
    }
    
    if (showpins){
        mountingPins();
    }
    
    module mountingPins(){
        
                translate([-(wall_thickness + hole_offset_x), 
                  wall_thickness + hole_offset_y, 
                  -0.5]) {
            cylinder(h = base_thickness + post_height + 1, d = post_inner_diameter-0.1);
                                  cylinder(h = 1, d = post_outer_diameter);
        }

        translate([-(wall_thickness + pcb_width - hole_offset_x), 
                  wall_thickness + hole_offset_y, 
                  -0.5]) {
            cylinder(h = base_thickness + post_height + 1, d = post_inner_diameter-0.1);
            cylinder(h = 1, d = post_outer_diameter);
                      
        }
}

}


// Render the mount
Ky040Mount();


//display mounting pins
//mountingPins();

// Render the KY-040 module positioned on the mount
//translate([26.5+2, 20, 6])
//    rotate([0,0,180]){
//    ky040();
//    }

// Add knob for visualization
//translate([15.25, 12.5, 30.6])
//    knob();