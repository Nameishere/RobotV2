// ===== MOTOR PARAMETERS (from your model) =====
motor_outer_dia = 20.10;
motor_length = 25;
motor_flat_width = 15.10;
shaft_extension_dia = 2;
tab_width = 8.5;
tab_thickness = 1.5;
tab_height = 4;

// ===== MOUNT PARAMETERS =====
// Base plate
base_length = 40;
base_width = 30;
base_thickness = 3;

// Motor cradle
cradle_wall_thickness = 2.5;
cradle_height = 15; // Height of cradle walls
motor_clearance = 0.3; // Clearance around motor

// Shaft clearance hole
shaft_hole_dia = 8; // Larger hole for shaft clearance

// Mounting holes
mount_hole_dia = 3.2; // M3 screw holes
mount_hole_positions = [
    [-base_length/2 + 6, base_width/2 - 6],
    [base_length/2 - 6, base_width/2 - 6],
    [-base_length/2 + 6, -base_width/2 + 6],
    [base_length/2 - 6, -base_width/2 + 6]
];

// Tab slot
tab_slot_width = tab_width + 0.4;
tab_slot_depth = tab_thickness + 0.3;
tab_slot_height = tab_height + 0.5;

$fn = 60;

// ===== MAIN ASSEMBLY =====
motor_mount();

// ===== MODULES =====
module motor_mount() {
    difference() {
        union() {
            // Base plate
            translate([-base_length/2, -base_width/2, 0]) {
                cube([base_length, base_width, base_thickness]);
            }
            
            // Motor cradle
            motor_cradle();
        }
        
        // Motor cavity (with flat side)
        translate([0, 0, base_thickness]) {
            motor_cavity();
        }
        
        // Tab slot
        translate([0, 0, base_thickness + cradle_height - tab_slot_height]) {
            tab_slot();
        }
        
        // Shaft clearance hole
        translate([0, 0, -0.1]) {
            cylinder(h = base_thickness + 0.2, d = shaft_hole_dia);
        }
        
        // Mounting holes
        for (pos = mount_hole_positions) {
            translate([pos[0], pos[1], -0.1]) {
                cylinder(h = base_thickness + 0.2, d = mount_hole_dia);
            }
        }
    }
}

module motor_cradle() {
    difference() {
        // Outer cylinder
        translate([0, 0, base_thickness]) {
            intersection() {
                centered_cube(100, motor_flat_width + 2*cradle_wall_thickness, 100);
                cylinder(h = cradle_height, d = motor_outer_dia + 2*cradle_wall_thickness);
            }
        }
        
        // Remove top to create open cradle
        translate([0, 0, base_thickness + cradle_height/2]) {
            centered_cube(motor_outer_dia + 2*cradle_wall_thickness + 1, 100, cradle_height + 1);
        }
    }
}

module motor_cavity() {
    intersection() {
        centered_cube(100, motor_flat_width + motor_clearance, 100);
        cylinder(h = cradle_height + 1, d = motor_outer_dia + motor_clearance);
    }
}

module tab_slot() {
    translate([-tab_slot_width/2, motor_flat_width/2 + motor_clearance/2, 0]) {
        cube([tab_slot_width, tab_slot_depth + 1, tab_slot_height + 1]);
    }
}

// Utility: Centered cube
module centered_cube(x, y, z) {
    translate([-x/2, -y/2, 0]) {
        cube([x, y, z]);
    }
}