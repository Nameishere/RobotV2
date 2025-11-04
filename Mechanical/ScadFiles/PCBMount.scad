
$fn = 100; // Resolution for circles






module PCBMount(pcb_width=10, pcb_depth=10,pcb_thickness=1.6, pcbmounting_holes, leftWall, rightWall, frontWall, backWall,pcb_mounting_holes  ){
    // Mount parameters
    base_thickness = 3;
    wall_height = 8;
    wall_thickness = 2;
    clearance = 0.3; // For easier fitting
    
    // Mounting post parameters
    post_height = 3;
    post_outer_diameter = 4.5;
    post_inner_diameter = 2.2; // Slightly smaller than 2.5mm hole for press fit
   
     
    difference() {
    difference() {
        union() {
            
            for (hole = pcb_mounting_holes){
                translate([wall_thickness  + hole[0],wall_thickness + 1 + hole[1],base_thickness]){
                cylinder(h = post_height,d = post_outer_diameter);
                }
                
            }
            
            // Base plate
            color("lightblue", 0.8)
            cube([pcb_width + wall_thickness * 2, 
                  pcb_depth + wall_thickness * 2, 
                  base_thickness]);
            if (rightWall){
            // Right wall 
            translate([pcb_width + wall_thickness -1, wall_thickness, 0])
                color("lightblue", 0.8)
                cube([wall_thickness + 1, pcb_depth, base_thickness + wall_height]);
            }
            
            
            if (leftWall){
            // Left wall 
            translate([0, wall_thickness, 0])
                color("lightblue", 0.8)
                cube([wall_thickness + 1, pcb_depth, base_thickness + wall_height]);
            }

            if (frontWall){
            // front wall
            translate([0, 0, 0])
                color("lightblue", 0.8)
                cube([pcb_width + wall_thickness * 2, wall_thickness+ 1, base_thickness + wall_height]);
            }
                
            if (backWall){
                        // back wall
            translate([0, pcb_depth + wall_thickness -1, 0])
                color("lightblue", 0.8)
                cube([pcb_width + wall_thickness * 2, wall_thickness+ 1, base_thickness + wall_height]);
            }

        }
           union(){
                        for (hole = pcb_mounting_holes){
                translate([wall_thickness  + hole[0],wall_thickness + 1 + hole[1],-0.1]){
                cylinder(h = base_thickness + wall_height +0.2,d = post_inner_diameter);
                }
                
            }
        }
    }
    translate([wall_thickness, wall_thickness, base_thickness + post_height]){
    cube([pcb_width,pcb_depth + 1,pcb_thickness + 0.25]);
    }
    }
   
}