module TopMotorMount(){
    difference(){
        union(){
            cylinder(15, 11,11);
            translate([0,0,12]) {
                intersection(){
                    difference(){
                        cylinder(6,11,12);
                        translate([0,0,3]){
                            cylinder(2, 11,11);
                        }
                        translate([0,0,5]){
                            cylinder(1.1, 10,11);
                        }
                    }
                    translate([-4.5,-50,0]){
                        cube([9,100,100]);
                    }
                }

            }
        }
        
        
        translate([0,0,1
        ]){
            cylinder(30,10,10);
        }
        translate([0,0,-1]){
                cylinder(15, 3.5,3.5, $fn = 100);
        }
        translate([7.5,-11,-1]){
            cube([8, 22,20]);
        }
        rotate([0,0,180]){
            translate([7.5,-11,-1]){
                cube([8, 22,20]);
            }
        }
    }
}

TopMotorMount();