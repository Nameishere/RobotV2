// ===== MAIN PARAMETERS =====
// Motor body dimensions
motor_outer_dia = 20.10;
motor_length = 25;
motor_flat_width = 15.10;
 
// Shaft dimensions
shaft_main_dia = 6.15;
shaft_main_length = 1.70;
shaft_extension_dia = 2;
shaft_extension_length = 38;
shaft_extension_pos = -9.4;

// Top connector dimensions
top_connector_dia = 10;
top_connector_height = 2.30;
top_connector_cube_size = 10;
top_connector_offset = 4;

// Tab dimensions
tab_width = 8.5;
tab_thickness = 1.5;
tab_height = 4;

// Rendering quality
$fn = 100;

// ===== MAIN ASSEMBLY =====
module F130Motor(){
    motor_body();
    translate([0, 0, motor_length]) top_connector();
    translate([0, 0, -shaft_main_length]) shaft_assembly();
    mounting_tab();
}

F130Motor();
// ===== MODULES =====

// Motor body - cylindrical with flat side
module motor_body() {
    intersection() {
        centered_cube(100, motor_flat_width, 100);
        cylinder(motor_length, motor_outer_dia/2, motor_outer_dia/2);
    }
}

// Top connector with D-shaft cutout
module top_connector() {
    intersection() {
        translate([0, top_connector_dia/2 - top_connector_offset, 0]) {
            centered_cube(top_connector_cube_size, top_connector_cube_size, top_connector_cube_size); 
        }
        cylinder(top_connector_height, top_connector_dia/2, top_connector_dia/2);
    }
}

// Shaft assembly (main shaft + extension)
module shaft_assembly() {
    // Main shaft section
    cylinder(shaft_main_length, shaft_main_dia/2, shaft_main_dia/2);
    
    // Extended thin shaft
    translate([0, 0, shaft_extension_pos+ shaft_main_length]) {
        cylinder(shaft_extension_length, shaft_extension_dia/2, shaft_extension_dia/2);
    }
}

// Mounting tab on the side
module mounting_tab() {
    translate([-tab_width/2, motor_flat_width/2, motor_length - tab_height]) {
        cube([tab_width, tab_thickness, tab_height]);
    }
}

// Utility: Centered cube
module centered_cube(x, y, z) {
    translate([-x/2, -y/2, -z/2]) {
        cube([x, y, z]);
    }
}